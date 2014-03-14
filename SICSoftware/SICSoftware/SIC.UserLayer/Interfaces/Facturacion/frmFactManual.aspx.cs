using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIC.BusinessLayer;
using ReportImpl;
using SIC.UserLayer.pdfs;
using System.Text;
using System.Runtime.InteropServices;

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
            HttpContext.Current.Response.OutputStream.Flush();
            HttpContext.Current.Response.End();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            old();            
        }

        private char charESC = '\u001b';
        private char charESC = '\u001b';
        private char charESC = '\u001b';
        
        private void old()
        {
            StringBuilder sb = new StringBuilder();
            
        }

        private void NewWay()
        {
            StringBuilder sb = new StringBuilder();
            Char FF = Convert.ToChar(0x0C);
            // Primeras 3 lineas
            sb.Append("\n");
            sb.Append("\n");
            sb.Append("\n");

            // Cabecera
            sb.Append("____Fecha va aqui" + "\n");
            sb.Append("\n");
            sb.Append("______Señores va aqui.".PadRight(52, '_') + "\n");
            sb.Append("______Dirección va aqui.".PadRight(52, '_') + "\n");

            // 
            sb.Append("\n");
            sb.Append("\n");
            //sb.Append("\n");


            // Cuerpo
            for (int i = 0; i < 12; i++)
            {
                sb.Append("0000".PadRight(6, '_')
                        + " "
                        + "100".PadRight(4, '_')
                        + " "
                        + "Descripción super laaarga, con varios datos".PadLeft(49, '_')
                        + " "
                        + "412.02".PadRight(8, '_')
                        + " "
                        + "41202.00".PadRight(8, '_') + "\n");
            }

            sb.Append("___ Cincuenta y Cinco con Cinco y Cinco.".PadRight(44, '_').PadRight(70, ' ')
                    + "SUBTOTAL"
                    + "\n");
            sb.Append("\n");
            sb.Append("".PadRight(70, '_') + "IGV" + "\n");
            sb.Append("\n");
            sb.Append("".PadRight(70, '_') + "TOT" + "\n");
            sb.Append('\u000C');

            RawPrinterHelper.SendStringToPrinter("EPSON LX Series 1 (80)", sb.ToString());              
        }       
    }
}