using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using SIC.BusinessLayer;
using SIC.EntityLayer;
using SIC.UserLayer.Report;

namespace SIC.UserLayer.Interfaces.Reporte
{
    public partial class frmReporteVenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region Eventos
        protected void gvListaVenta_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvListaVenta.PageIndex = e.NewPageIndex;
            ListarVentas();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            ListarVentas();
        }

        protected void btnReporte_Click(object sender, EventArgs e)
        {
            GenerarReporte();
        }
        #endregion

        /// <summary>
        /// Carga la lista de Ventas
        /// </summary>
        private void ListarVentas()
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
            gvListaVenta.DataSource = new VentaBL().ListarVentas(txtFiltroRuc.Text, txtFiltroRS.Text, fi, ff);
            gvListaVenta.DataBind();
            upGeneral.Update();
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
            List<SIC_T_VENTA> listaVentas = new VentaBL().ListarVentasReporte(txtFiltroRuc.Text, txtFiltroRS.Text, fi, ff);


            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.AppendHeader("Content-Disposition", "Attachment; filename=Reporte_Venta.pdf");
            HttpContext.Current.Response.ContentType = "application/pdf";
            new ReporteVentaPDF().CreatePdfReport(listaVentas, HttpContext.Current.Response.OutputStream);
            HttpContext.Current.Response.OutputStream.Flush();
            HttpContext.Current.Response.End();
            upGeneral.Update();
        }
    }
}