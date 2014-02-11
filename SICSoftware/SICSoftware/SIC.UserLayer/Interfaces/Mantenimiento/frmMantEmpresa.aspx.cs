using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIC.BusinessLayer;

namespace SIC.UserLayer.Interfaces.Mantenimiento
{
    public partial class frmMantEmpresa : System.Web.UI.Page
    {
        private EmpresaBL _empresa = null;
        private CentroCostoBL _centroCosto = null;

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