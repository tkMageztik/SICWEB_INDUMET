using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIC.BusinessLayer;
using ReportImpl;

namespace SIC.UserLayer.Interfaces.Facturacion
{
    public partial class frmFactManual : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //pdf.init();
            ClienteBL clienteBL = new ClienteBL();
            var listado = clienteBL.ListarClientes("", "");

            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.AppendHeader("Content-Disposition", "Attachment; filename=Reporte_Cliente.pdf");
            HttpContext.Current.Response.ContentType = "application/pdf";
            var reporte = new ReporteClientePDF().CreatePdfReport(listado, HttpContext.Current.Response.OutputStream);
            //reporte.
            HttpContext.Current.Response.OutputStream.Flush();
            HttpContext.Current.Response.End();
        }
    }
}