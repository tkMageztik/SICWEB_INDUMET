using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIC.BusinessLayer;
using SIC.EntityLayer;
using ReportImpl;

namespace SIC.UserLayer.Interfaces.Reporte
{
    public partial class frmReporteItem : System.Web.UI.Page
    {
        private ItemBL itemBL = new ItemBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ListarFiltroFamilia();
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            this.ListarItems();
        }

        protected void cboFiltroFamilia_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.ListarFiltroSubFamilia();
            upGeneral.Update();
        }

        protected void btnReporte_Click(object sender, EventArgs e)
        {
            this.ObtenerReporteItem();
        }

        protected void gvListaItem_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvListaItem.PageIndex = e.NewPageIndex;
            ListarItems();
        }

        private void ObtenerReporteItem()
        {
            int id;
            int? idSubFamilia = null;
            int? idFamilia = null;
            if (int.TryParse(cboFiltroSubFamilia.SelectedItem.Value, out id) && id >= 0)
            {
                idSubFamilia = id;
            }
            if (int.TryParse(cboFiltroFamilia.SelectedItem.Value, out id) && id >= 0)
            {
                idFamilia = id;
            }

            List<SIC_T_ITEM> lstItem = new List<SIC_T_ITEM>();
            lstItem = this.itemBL.ListarItemsReporte(txtFiltroCodigo.Text.Trim(), txtFiltroDescr.Text.Trim(), idFamilia, idSubFamilia);

            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.AppendHeader("Content-Disposition", "Attachment; filename=Reporte_Item.pdf");
            HttpContext.Current.Response.ContentType = "application/pdf";
            new ReporteItemPDF().CreatePdfReport(lstItem, HttpContext.Current.Response.OutputStream);
            HttpContext.Current.Response.OutputStream.Flush();
            HttpContext.Current.Response.End();
            upGeneral.Update();
        }

        #region Listados
        /// <summary>
        /// Lista las familias de items
        /// </summary>
        private void ListarFiltroFamilia()
        {
            cboFiltroFamilia.Items.Clear();
            cboFiltroFamilia.Items.Add(new ListItem("-- Seleccionar --"));
            cboFiltroFamilia.DataSource = itemBL.ListarFamiliaItem();
            cboFiltroFamilia.DataTextField = "ifm_c_des";
            cboFiltroFamilia.DataValueField = "ifm_c_iid";
            cboFiltroFamilia.DataBind();
        }

        /// <summary>
        /// Obtiene la sub familia, depende de que familia se haya seleccionado
        /// </summary>
        private void ListarFiltroSubFamilia()
        {
            int idFamilia;
            if (cboFiltroFamilia.SelectedIndex > 0 && int.TryParse(cboFiltroFamilia.SelectedValue, out idFamilia) && idFamilia > 0)
            {
                // TODO: Revisar el selected index 0, deberia funcionar
                cboFiltroSubFamilia.Enabled = true;
                cboFiltroSubFamilia.Items.Clear();
                cboFiltroSubFamilia.Items.Add(new ListItem("-- Seleccionar --", "-1"));
                cboFiltroSubFamilia.DataSource = itemBL.ListarSubFamiliaItem(idFamilia);
                cboFiltroSubFamilia.DataTextField = "isf_c_vdesc";
                cboFiltroSubFamilia.DataValueField = "isf_c_iid";
                cboFiltroSubFamilia.DataBind();
            }
            else
            {
                cboFiltroSubFamilia.DataSource = null;
                cboFiltroSubFamilia.Enabled = false;
                cboFiltroSubFamilia.Items.Clear();
                cboFiltroSubFamilia.Items.Add(new ListItem("-- Seleccionar --", "-1"));
                cboFiltroSubFamilia.DataBind();
            }
            this.upGeneral.Update();
        }

        /// <summary>
        /// Muesta los items en el gridview de la página.
        /// </summary>
        private void ListarItems()
        {
            int id;
            int? idSubFamilia = null;
            int? idFamilia = null;
            if (int.TryParse(cboFiltroSubFamilia.SelectedItem.Value, out id) && id >= 0)
            {
                idSubFamilia = id;
            }
            if (int.TryParse(cboFiltroFamilia.SelectedItem.Value, out id) && id >= 0)
            {
                idFamilia = id;
            }

            List<SIC_T_ITEM> lstItem = new List<SIC_T_ITEM>();
            lstItem = this.itemBL.ListarItems(txtFiltroCodigo.Text.Trim(), txtFiltroDescr.Text.Trim(), idFamilia, idSubFamilia);

            gvListaItem.DataSource = lstItem;
            gvListaItem.DataBind();            
            upGeneral.Update();
        }
        #endregion



        


    }
}