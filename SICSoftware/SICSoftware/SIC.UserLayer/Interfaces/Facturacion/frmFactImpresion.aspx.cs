using System;
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
                this.MostrarListaFactura();
                this.MostrarListaBoleta();
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
            ImpresionFacturaBoletaBL impresionBL = new ImpresionFacturaBoletaBL();
            gvListaFactura.DataSource = impresionBL.ListarFactura();
            gvListaFactura.DataBind();
            upListaFactura.Update();
        }

        /// <summary>
        /// Muestra la lista de Boletas en el datagrid
        /// </summary>
        private void MostrarListaBoleta()
        {
            ImpresionFacturaBoletaBL impresionBL = new ImpresionFacturaBoletaBL();
            gvListaBoleta.DataSource = impresionBL.ListarBoleta();
            gvListaBoleta.DataBind();
            upListaBoleta.Update();
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
            try
            {
                impresionBL.ImprimirFactura(idFactura);
                Mensaje("Factura enviada para Impresión.", "~/Imagenes/correcto.png");
            }
            catch (Exception ex)
            {
#if DEBUG
            String mensajeError = "Error Fatal : \n" + ex.Message;
            if (ex.InnerException != null)
            {
                mensajeError += "\n" + ex.InnerException != null ? ex.InnerException.Message : string.Empty;
            }

            Mensaje(mensajeError, "~/Imagenes/warning.png");
#else
                    Mensaje("Error en el proceso.", "~/Imagenes/warning.png");
#endif
            }            
        }

        /// <summary>
        /// Imprime la boleta y cambia su flag de impresion
        /// </summary>
        /// <param name="idBoleta">IdFactura</param>
        private void ImprimirBoleta(int idBoleta)
        {
            ImpresionFacturaBoletaBL impresionBL = new ImpresionFacturaBoletaBL();
            try
            {
                impresionBL.ImprimirBoleta(idBoleta);
                Mensaje("Boleta enviada para Impresión.", "~/Imagenes/correcto.png");
            }
            catch(Exception ex)
            {
#if DEBUG
            String mensajeError = "Error Fatal : \n" + ex.Message;
            if (ex.InnerException != null)
            {
                mensajeError += "\n" + ex.InnerException != null ? ex.InnerException.Message : string.Empty;
            }

            Mensaje(mensajeError, "~/Imagenes/warning.png");
#else
                    Mensaje("Error en el proceso.", "~/Imagenes/warning.png");
#endif
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
    }
}