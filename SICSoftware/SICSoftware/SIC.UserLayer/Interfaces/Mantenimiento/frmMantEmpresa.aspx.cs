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

        #endregion

        #region Manejo de Vistas
        private void MostrarNuevoCentroCosto()
        {
            this.mvCliente.SetActiveView(vwCentroCostoNuevo);
            this.upGeneral.Update();            
        }

        protected void btnGuardarCCN_Click(object sender, EventArgs e)
        {
            this.GuarderNuevoCentroCosto();
        }
        #endregion

        #region Nuevo Centro de Costo
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
            return;
        }

    }
}