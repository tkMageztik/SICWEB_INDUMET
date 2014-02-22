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
    public partial class FrmReporteCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FiltrarCliente();
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            FiltrarCliente();
        }

        protected void btnReporte_Click(object sender, EventArgs e)
        {
            ObtenerReporteCliente();
        }

        private void FiltrarCliente()
        {
            ClienteBL clienteBL = new ClienteBL();
            gvLista.DataSource = clienteBL.ListarClientes(
            new SIC_T_CLIENTE() { cli_c_vraz_soc = txtFiltroRazonSocial.Text, cli_c_vdoc_id = txtRuc.Text });
            gvLista.DataBind();
            upGeneral.Update();
        }

        private void ObtenerReporteCliente()
        {
            ClienteBL clienteBL = new ClienteBL();
            var listado = clienteBL.ListarClientes(txtFiltroRazonSocial.Text, txtRuc.Text);

            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.AppendHeader("Content-Disposition", "Attachment; filename=Reporte_Cliente.pdf");
            HttpContext.Current.Response.ContentType = "application/pdf";
            new ReporteClientePDF().CreatePdfReport(listado, HttpContext.Current.Response.OutputStream);
            HttpContext.Current.Response.OutputStream.Flush();
            HttpContext.Current.Response.End();
            upGeneral.Update();
        }


    }
}