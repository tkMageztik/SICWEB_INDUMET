using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIC.BusinessLayer;
using System.Globalization;
using ReportImpl;

namespace SIC.UserLayer.Interfaces.Reporte
{
    public partial class frmKardex : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            ListarKardex();
        }

        protected void gvLista_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvLista.PageIndex = e.NewPageIndex;
            this.ListarKardex();
        }

        private void ListarKardex()
        {
            DateTime inicio, fin;
            DateTime? fi = null, ff = null;
            if (DateTime.TryParseExact(txtFiltroFecIni.Text, "dd/MM/yyyy", new CultureInfo("en-US"), DateTimeStyles.None, out inicio))
            {
                fi = inicio;
            }

            if (DateTime.TryParseExact(txtFiltroFecFin.Text, "dd/MM/yyyy", new CultureInfo("en-US"), DateTimeStyles.None, out fin))
            {
                ff = fin;
            }

            KardexBL kardexBL = new KardexBL();
            var lista = kardexBL.ObtenerKardex(fi, ff, null, null);
            gvLista.DataSource = lista;
            gvLista.DataBind();
            upGeneral.Update();
        }

        protected void btnReporte_Click(object sender, EventArgs e)
        {
            GenerarReporte();
        }

        private void GenerarReporte()
        {
            DateTime inicio, fin;
            DateTime? fi = null, ff = null;
            if (DateTime.TryParseExact(txtFiltroFecIni.Text, "dd/MM/yyyy", new CultureInfo("en-US"), DateTimeStyles.None, out inicio))
            {
                fi = inicio;
            }

            if (DateTime.TryParseExact(txtFiltroFecFin.Text, "dd/MM/yyyy", new CultureInfo("en-US"), DateTimeStyles.None, out fin))
            {
                ff = fin;
            }

            KardexBL kardexBL = new KardexBL();
            var lista = kardexBL.ObtenerKardex(fi, ff, null, null);
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.AppendHeader("Content-Disposition", "Attachment; filename=Reporte_Kardex.pdf");
            HttpContext.Current.Response.ContentType = "application/pdf";
            new ReporteKardex().CreatePdfReport(lista, HttpContext.Current.Response.OutputStream);
            HttpContext.Current.Response.OutputStream.Flush();
            HttpContext.Current.Response.End();
            upGeneral.Update();
        }
    }
}