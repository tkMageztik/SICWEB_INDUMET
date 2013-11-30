using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace SIC.UserLayer.Interfaces.Mantenimiento
{
    public partial class frmRegItem : System.Web.UI.Page
    {
        #region DECLARACION DE VARIABLES
        string ShowMessage;
        //private ItemBL _item = null;
        //private ParametroBL _parametro = null;
        //EvalCreditoBL _eCredi = new EvalCreditoBL();
        #endregion

        #region EVENTOS
        public frmRegItem()
        {
            //_item = new ItemBL();
            //_parametro = new ParametroBL();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.ListarItems();
            this.ListarUnidadMedida();       
        }

        #endregion

        private void ListarItems()
        {
            //_item.ListarItems()[0].itm_c_dpreci
            //gvListaItem.DataSource = _item.ListarItems();
            //gvListaItem.DataBind();
        }

        private void ListarUnidadMedida()
        {
            //cboUnidad.DataSource = _parametro.ListarParametros(1);
            //cboUnidad.DataTextField = "par_det_c_vdesc";
            //cboUnidad.DataValueField = "par_det_c_vcampo_1";
            //cboUnidad.DataBind();
        }
        
        protected void gvListaItem_RowEditing(object sender, GridViewEditEventArgs e)
        {
            mvItem.ActiveViewIndex = 1;
            upGeneral.Update();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            mvItem.ActiveViewIndex = 0;
            upGeneral.Update();
        }


        
    }
}