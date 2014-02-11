using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIC.BusinessLayer;
using SIC.EntityLayer;

namespace SIC.UserLayer.Interfaces.Mantenimiento
{
    public partial class frmMantEmpresa : System.Web.UI.Page
    {
        private EmpresaBL _empresa = null;
        private CentroCostoBL _centroCosto = null;

        private SIC_T_EMP_CENTRO_COSTO CentroCostoModificar
        {
            get { return ViewState["vsCentroCosto"] as SIC_T_EMP_CENTRO_COSTO; }
            set { ViewState["vsCentroCosto"] = value; }
        }

        #region Eventos
        public frmMantEmpresa()
        {
            _empresa = new EmpresaBL();
            _centroCosto = new CentroCostoBL();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.ObtenerDatosEmpresa();
                this.ListarCentroCosto();
                this.ListarLocal();
            }
        }

        protected void btnAgregarCentroCosto_Click(object sender, EventArgs e)
        {
            this.MostrarNuevoCentroCosto();
        }

        protected void btnCancelarCCN_Click(object sender, EventArgs e)
        {
            this.RegresarDesdeNuevoCentroCosto();
        }

        protected void gvCentroCosto_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int ccId = (int)this.gvCentroCosto.DataKeys[e.NewEditIndex].Value;
            e.NewEditIndex = -1;
            this.gvCentroCosto.EditIndex = -1;
            this.ListarCentroCosto();
            this.MostrarModificarCentroCosto(ccId);
        }

        protected void btnCancelarCCE_Click(object sender, EventArgs e)
        {
            this.RegresarDesdeModificarCentroCosto();
        }

        protected void btnGuardarCCE_Click(object sender, EventArgs e)
        {
            this.ModificarCentroCosto();
        }

        #endregion

        #region Manejo de Vistas
        
        protected void btnGuardarCCN_Click(object sender, EventArgs e)
        {
            this.GuarderNuevoCentroCosto();
        }
        #endregion

        #region Nuevo Centro de Costo

        private void MostrarNuevoCentroCosto()
        {
            this.LimpiarNuevoCentroCosto();
            this.mvCliente.SetActiveView(vwCentroCostoNuevo);
            this.upGeneral.Update();
        }

        private bool ValidarDatosNuevoCentroCosto()
        {
            if (txtDescripcionCCN.Text.Trim().Length <= 0)
            {
                Mensaje("Debe ingresar el nombre del centro de costo.", "../Imagenes/warning.png");
                return false;
            }
            else if (txtSerBoletaN.Text.Trim().Length <= 0)
            {
                Mensaje("Debe ingresar la serie de boleta del centro de costo.", "../Imagenes/warning.png");
                return false;
            }
            else if (txtSerFacturaN.Text.Trim().Length <= 0)
            {
                Mensaje("Debe ingresar el serie de factura del centro de costo.", "../Imagenes/warning.png");
                return false;
            }
            else
            {
                return true;
            }
        }

        private void GuarderNuevoCentroCosto()
        {
            if (!this.ValidarDatosNuevoCentroCosto())
            {
                return;
            }

            SIC_T_EMP_CENTRO_COSTO centroCosto = new SIC_T_EMP_CENTRO_COSTO();
            centroCosto.emp_cst_c_vserieboleta = txtSerBoletaN.Text;
            centroCosto.emp_cst_c_vseriefactura = txtSerFacturaN.Text;
            centroCosto.emp_cst_c_vdesc = txtDescripcionCCN.Text;

            try
            {
                _centroCosto.IngresarCentroCosto(centroCosto);
                Mensaje("Ingresado con éxito", "../Imagenes/correcto.png");
                this.mvCliente.SetActiveView(vwEmpresa);
                this.ListarCentroCosto();
                this.upGeneral.Update();
            }
            catch (Exception ex)
            {
#if DEBUG
                String mensajeError = "Error Fatal : \n" + ex.Message;
                if (ex.InnerException != null)
                {
                    mensajeError += "\n" + ex.InnerException != null ? ex.InnerException.Message : string.Empty;
                }
                
                Mensaje(mensajeError, "../Imagenes/warning.png");
#else
                Mensaje("Error en el proceso.", "../Imagenes/warning.png");
#endif
            }
        }

        private void LimpiarNuevoCentroCosto()
        {
            this.txtDescripcionCCN.Text = string.Empty;
            this.txtSerBoletaN.Text = string.Empty;
            this.txtSerFacturaN.Text = string.Empty;
        }

        private void RegresarDesdeNuevoCentroCosto()
        {
            this.mvCliente.SetActiveView(vwEmpresa);
            this.upGeneral.Update();
        }

        #endregion

        #region Editar Centro de Costo
        
        private void MostrarModificarCentroCosto(int idCentroCosto)
        {
            this.LimpiarModificarCentroCosto();            
            var centroCosto = _centroCosto.ObtenerCentroCosto(idCentroCosto);
            if(centroCosto== null)
            {
                // TODO: ERROR
                return;
            }

            this.CentroCostoModificar = centroCosto;
            this.txtDescripcionCCE.Text = centroCosto.emp_cst_c_vdesc;
            this.txtSerBoletaE.Text = centroCosto.emp_cst_c_vserieboleta;
            this.txtSerFacturaE.Text = centroCosto.emp_cst_c_vseriefactura;
            this.mvCliente.SetActiveView(vwCentroCostoEditar);
            this.upGeneral.Update();
        }

        private void LimpiarModificarCentroCosto()
        {
            this.txtDescripcionCCE.Text = string.Empty;
            this.txtSerBoletaE.Text = string.Empty;
            this.txtSerFacturaE.Text = string.Empty;
        }


        private bool ValidarDatosModificarCentroCosto()
        {
            if (txtDescripcionCCE.Text.Trim().Length <= 0)
            {
                Mensaje("Debe ingresar el nombre del centro de costo.", "../Imagenes/warning.png");
                return false;
            }
            else if (txtSerBoletaE.Text.Trim().Length <= 0)
            {
                Mensaje("Debe ingresar la serie de boleta del centro de costo.", "../Imagenes/warning.png");
                return false;
            }
            else if (txtSerFacturaE.Text.Trim().Length <= 0)
            {
                Mensaje("Debe ingresar el serie de factura del centro de costo.", "../Imagenes/warning.png");
                return false;
            }
            else
            {
                return true;
            }
        }

        private void ModificarCentroCosto()
        {
            if (this.CentroCostoModificar == null)
            {
                return;
            }

            if (!ValidarDatosModificarCentroCosto())
            {
                return;
            }

            var centroCosto = this.CentroCostoModificar;
            centroCosto.emp_cst_c_vdesc = txtDescripcionCCE.Text;

            try
            {
                _centroCosto.ModificarCentroCosto(centroCosto);
                Mensaje("Modificado con éxito", "../Imagenes/correcto.png");
                this.mvCliente.SetActiveView(vwEmpresa);
                this.ListarCentroCosto();
                this.upGeneral.Update();
            }
            catch (Exception ex)
            {
#if DEBUG
                String mensajeError = "Error Fatal : \n" + ex.Message;
                if (ex.InnerException != null)
                {
                    mensajeError += "\n" + ex.InnerException != null ? ex.InnerException.Message : string.Empty;
                }

                Mensaje(mensajeError, "../Imagenes/warning.png");
#else
                Mensaje("Error en el proceso.", "../Imagenes/warning.png");
#endif
            }
        }

        private void RegresarDesdeModificarCentroCosto()
        {
            this.mvCliente.SetActiveView(vwEmpresa);
            this.upGeneral.Update();
        }

        #endregion

        private void ObtenerDatosEmpresa()
        {
            var empresa = _empresa.ObtenerDatosEmpresa();
            this.txtRUC.Text = empresa.emp_c_vruc;
            this.txtRazonSocial.Text = empresa.emp_c_vrazonsocial;
        }

        private void ListarCentroCosto()
        {
            this.gvCentroCosto.DataSource = _centroCosto.ListarCentroCosto();
            this.gvCentroCosto.DataBind();
        }

        private void ListarLocal()
        {
            this.gvLocal.DataSource = _empresa.ListarDireccionEmpresa();
            this.gvLocal.DataBind();
        }

        private void Mensaje(string mensaje, string ruta)
        {
            divPopUpMsg.Attributes["Class"] = "PopupMostrar";
            ucMensaje.Visible = true;
            ucMensaje.Mensaje = mensaje;
            ucMensaje.Ruta = ruta;
            ucMensaje.EnableModelDialog(true);
            upMensaje.Update();
            return;
        }



 



    }
}