﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIC.BusinessLayer;

namespace SIC.UserLayer.Interfaces.Facturacion
{
    public partial class frmFactImpresion : System.Web.UI.Page
    {

        #region Eventos
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //this.MostrarListaFactura();
                //this.MostrarListaBoleta();
            }
        }

        protected void gvListaFactura_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = (int)gvListaFactura.DataKeys[gvListaFactura.SelectedIndex].Value;
            this.ImprimirFactura(id);
        }
        
        protected void gvListaBoleta_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = (int)gvListaBoleta.DataKeys[gvListaBoleta.SelectedIndex].Value;
            this.ImprimirBoleta(id);
        }
        #endregion

        #region Metodos de Listado
        /// <summary>
        /// Muestra la lista de Factura en el datagrid
        /// </summary>
        private void MostrarListaFactura()
        {
            gvListaFactura.Visible = true;
            gvListaBoleta.Visible = false;
            ImpresionFacturaBoletaBL impresionBL = new ImpresionFacturaBoletaBL();
            int desde;
            int? numDesde = null;
            if (int.TryParse(txtNumDesde.Text.Trim(), out desde))
            {
                numDesde = desde;
            }

            int hasta;
            int? numHasta = null;
            if (int.TryParse(txtNumHasta.Text.Trim(), out hasta))
            {
                numHasta = hasta;
            }

            bool? impreso = null;
            if(cboEstado.SelectedIndex == 0)
            {
                impreso = null;
            }
            else if(cboEstado.SelectedIndex == 1)
            {
                impreso = false;
            }
            else 
            {
                impreso = true;
            }

            gvListaFactura.DataSource = impresionBL.ListarFactura(numDesde, numHasta, impreso,txtRucCliente.Text.Trim());
            gvListaFactura.DataBind();
            upListaFactura.Update();

        }

        /// <summary>
        /// Muestra la lista de Boletas en el datagrid
        /// </summary>
        private void MostrarListaBoleta()
        {
            gvListaFactura.Visible = false;
            gvListaBoleta.Visible = true;
            ImpresionFacturaBoletaBL impresionBL = new ImpresionFacturaBoletaBL();
            int desde;
            int? numDesde = null;
            if (int.TryParse(txtNumDesde.Text.Trim(), out desde))
            {
                numDesde = desde;
            }

            int hasta;
            int? numHasta = null;
            if (int.TryParse(txtNumHasta.Text.Trim(), out hasta))
            {
                numHasta = hasta;
            }

            bool? impreso = null;
            if (cboEstado.SelectedIndex == 0)
            {
                impreso = null;
            }
            else if (cboEstado.SelectedIndex == 1)
            {
                impreso = false;
            }
            else
            {
                impreso = true;
            }

            gvListaBoleta.DataSource = impresionBL.ListarBoleta(numDesde,numHasta,impreso,txtRucCliente.Text.Trim());
            gvListaBoleta.DataBind();

            upListaFactura.Update();
        }

        #endregion

        #region Proceso

        /// <summary>
        /// Imprime la factura y cambia su flag de impresion.
        /// </summary>
        /// <param name="idFactura">IdBoleta</param>
        private void ImprimirFactura(int idFactura)
        {
            ImpresionFacturaBoletaBL impresionBL = new ImpresionFacturaBoletaBL();
            if (Configuracion.EsServidorImpresion)
            {
                try
                {
                    impresionBL.ImprimirFactura(idFactura, new ImpresoraBL().ObtenerImpresoraDefecto());
                    Mensaje("Factura enviada para Impresión.", "~/Imagenes/correcto.png");
                }
                catch (Exception ex)
                {
#if DEBUG
                    SIC.Data.ExceptionTrace.Write(ex);
                    String mensajeError = "Error Fatal : \n" + ex.Message;
                    if (ex.InnerException != null)
                    {
                        mensajeError += "\n" + ex.InnerException.Message ;
                    }

                    Mensaje(mensajeError, "~/Imagenes/warning.png");
#else
                SIC.Data.ExceptionTrace.Write(ex);
                Mensaje("Error en el proceso, se ha guardado la traza de la excepción..", "~/Imagenes/warning.png");
#endif
                }      
            }
            else
            {
                this.Mensaje("No puede imprimir en el servidor actual.", "~/Imagenes/warning.png");
            }
                  
        }

        /// <summary>
        /// Imprime la boleta y cambia su flag de impresion
        /// </summary>
        /// <param name="idBoleta">IdFactura</param>
        private void ImprimirBoleta(int idBoleta)
        {
            ImpresionFacturaBoletaBL impresionBL = new ImpresionFacturaBoletaBL();
            if (Configuracion.EsServidorImpresion)
            {
                try
                {
                    impresionBL.ImprimirBoleta(idBoleta, new ImpresoraBL().ObtenerImpresoraDefecto());
                    Mensaje("Boleta enviada para Impresión.", "~/Imagenes/correcto.png");
                }
                catch (Exception ex)
                {
#if DEBUG
                    SIC.Data.ExceptionTrace.Write(ex);
                    String mensajeError = "Error Fatal : \n" + ex.Message;
                    if (ex.InnerException != null)
                    {
                        mensajeError += "\n" + ex.InnerException.Message ;
                    }

                    Mensaje(mensajeError, "~/Imagenes/warning.png");
#else
                SIC.Data.ExceptionTrace.Write(ex);
                    Mensaje("Error en el proceso, se ha guardado la traza de la excepción..", "~/Imagenes/warning.png");
#endif
                }               
            }
            else
            {
                this.Mensaje("No puede imprimir en el servidor actual.", "~/Imagenes/warning.png");
            }
        }

        #endregion

        private void Mensaje(string mensaje, string ruta)
        {
            divPopUpMsg.Attributes["Class"] = "PopupMostrar";
            ucMensaje.Visible = true;
            ucMensaje.Mensaje = mensaje;
            ucMensaje.Ruta = ruta;
            ucMensaje.EnableModelDialog(true);
            upGeneral.Update();
            return;
        }

        protected void cboDocumento_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboDocumento.SelectedIndex == 0)
            {                
                MostrarListaFactura();
            }
            else
            {                
                MostrarListaBoleta();
            }
        }

        protected void btnBuscarFactura_Click(object sender, EventArgs e)
        {
            if (cboDocumento.SelectedIndex == 0)
            {
                MostrarListaFactura();
            }
            else
            {
                MostrarListaBoleta();
            }
        }

        protected void gvListaFactura_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvListaFactura.PageIndex = e.NewPageIndex;
            MostrarListaFactura();
        }

        protected void gvListaBoleta_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvListaBoleta.PageIndex = e.NewPageIndex;
            MostrarListaBoleta();
        }

        
    }
}