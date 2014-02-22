using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIC.BusinessLayer;
using SIC.UIGeneral;
using System.Text;
using System.IO;

namespace SIC.UserLayer.Interfaces.Almacen
{
    public partial class frmAlmacenes : System.Web.UI.Page
    {
        ItemAlmacenBL _itemAlmacenBL = null;
        AlmacenBL _almacenBL = null;
        ItemBL _itemBL = null;

        public frmAlmacenes()
        {
            _itemAlmacenBL = new ItemAlmacenBL();
            _almacenBL = new AlmacenBL();
            _itemBL = new ItemBL();

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ListarAlmacenes();
                this.ListarFamilia();
                this.ListarSubfamilia();
                this.ListarItemsAlmacen();
            }
        }

        private void ListarItemsAlmacen()
        {
            gvItemsAlmacen.DataSource = _itemAlmacenBL.ListarItemAlmacen(txtCodItem.Text, txtDescItem.Text,
                Convert.ToInt32(cboFamilia.SelectedValue) != 0 ? Convert.ToInt32(cboFamilia.SelectedValue) : (int?)null,
                Convert.ToInt32(cboSubFamilia.SelectedValue) != 0 ? Convert.ToInt32(cboSubFamilia.SelectedValue) : (int?)null, new int[1] { Convert.ToInt32(cboAlmacen.SelectedValue) });
            gvItemsAlmacen.DataBind();

        }

        private void ListarFamilia()
        {
            UIPage.Fill(_itemBL.ListarFamiliaItem(), "ifm_c_iid", "ifm_c_des", cboFamilia, "-- SELECCIONE --", "0");
        }
        private void ListarSubfamilia()
        {
            UIPage.Fill(_itemBL.ListarSubFamiliaItem(Convert.ToInt32(cboFamilia.SelectedValue)), "isf_c_iid", "isf_c_vdesc",
                cboSubFamilia, "-- SELECCIONE --", "0");
        }

        private void ListarAlmacenes()
        {
            UIPage.Fill(_almacenBL.ObtenerAlmacenes(), "alm_c_iid", "alm_c_vdesc", cboAlmacen, string.Empty, string.Empty);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.ListarItemsAlmacen();
        }

        protected void cboFamilia_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.ListarSubfamilia();
        }

        protected void btExportar_Click(object sender, EventArgs e)
        {
            try
            {
                string style = @"<style> .text { mso-number-format:\@; } </script> ";
                Response.ClearContent();
                Response.Cache.SetCacheability(HttpCacheability.Private);
                Response.AddHeader("content-disposition", "attachment; filename=test.xls");
                Response.ContentType = "application/excel";
                //controla las tildes la ñ y caracteres
                Response.ContentEncoding = Encoding.Default;
                Response.Charset = "ISO 8859-1";
                StringWriter sw = new StringWriter();
                HtmlTextWriter htw = new HtmlTextWriter(sw);
                gvItemsAlmacen.RenderControl(htw);

                Response.Write(style);
                Response.Write(sw.ToString());

                Response.End();

                /*ExcelPackage pck = new ExcelPackage();
                var ws = pck.Workbook.Worksheets.Add("Sample1");

                ws.Cells["A1"].Value = "Sample 1";
                ws.Cells["A1"].Style.Font.Bold = true;
                var shape = ws.Drawings.AddShape("Shape1", eShapeStyle.Rect);
                shape.SetPosition(50, 200);
                shape.SetSize(200, 100);
                shape.Text = "Sample 1 saves to the Response.OutputStream";

                Response.ClearContent();
                Response.Cache.SetCacheability(HttpCacheability.Private);

                Response.AddHeader("content-disposition", "attachment;  filename=Sample1.xlsx");
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

                Response.ContentEncoding = Encoding.Default;
                Response.Charset = "ISO 8859-1";

                pck.SaveAs(Response.OutputStream);
                Response.End();*/
            }
            catch (Exception ex)
            {
                //en c# web lo mensajes en pantalla hay que realizarlos con javascript, en c# windform son por defecto asi            
                string script = @"<script language = ""JavaScript"">alert('Filtre más la informacion por que se sobrepaso de los 65.536 registros del excel');</script>";
                ClientScript.RegisterStartupScript(typeof(Page), "Alerta", script);
                return;
            }
        }
    }
}