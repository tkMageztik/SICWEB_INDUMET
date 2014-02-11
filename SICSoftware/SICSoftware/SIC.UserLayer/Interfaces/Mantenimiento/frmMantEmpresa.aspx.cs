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
        private void GuarderNuevoCentroCosto()
        {
            SIC_T_EMP_CENTRO_COSTO centroCosto;
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

        

    }
}