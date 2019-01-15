using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using iTextSharp.text;
using System.IO;
using iTextSharp.text.pdf;
using SIC.EntityLayer;

namespace SIC.UserLayer.pdfs
{
    public class PdfProduccion
    {
        public static void init(SIC_T_MOVIMIENTO_SALIDA movimientoSalida)
        {
            Document doc = new Document();
            MemoryStream memStream = new MemoryStream();
            PdfWriter pdf = PdfWriter.GetInstance(doc, memStream);

            doc.Open();

            iTextSharp.text.Font fontTitulo = FontFactory.GetFont("Calibri", 13, Font.BOLD, iTextSharp.text.BaseColor.BLACK);
            iTextSharp.text.Font fontSubtitulo = FontFactory.GetFont("Calibri", 10, Font.BOLD, iTextSharp.text.BaseColor.BLACK);
            iTextSharp.text.Font fontPropiedad = FontFactory.GetFont("Calibri", 9, Font.BOLD, iTextSharp.text.BaseColor.BLACK);
            iTextSharp.text.Font fontInfo = FontFactory.GetFont("Calibri", 11, iTextSharp.text.BaseColor.BLACK);

            PdfPTableHeader th = new PdfPTableHeader();
            PdfPTableBody tb = new PdfPTableBody();
            PdfPTableFooter tf = new PdfPTableFooter();

            PdfPTable t = new PdfPTable(new[] { 10f, 10f, 10f, 10f, 10f, 10f, 10f, 10f, 10f, 10f });
            t.WidthPercentage = 100;

            t.AddCell(Celdas(t));

            t.AddCell(Celdas(3));

            t.AddCell(new PdfPCell(new Phrase("SALIDA POR PRODUCCIÓN", fontTitulo)) { Colspan = 4 });

            t.AddCell(Celdas(3));

            t.AddCell(Celdas(20));

            t.AddCell(new PdfPCell(new Phrase("Código de Movimiento")) { Colspan = 3});
            t.AddCell(new PdfPCell(new Phrase(movimientoSalida.mvs_c_iid)));

            t.AddCell(new PdfPCell(new Phrase("Fecha de Emisión")) { Colspan = 2 });
            t.AddCell(new PdfPCell(new Phrase(movimientoSalida.mvs_c_zfecharegistro.ToString("dd/MM/yyyy"))) { Colspan = 2 });
            t.AddCell(Celdas(2));

            t.AddCell(Celdas(t));

            t.AddCell(new PdfPCell(new Phrase("Código")) { Colspan = 2 });
            t.AddCell(new PdfPCell(new Phrase("Descripción")) { Colspan = 4 });
            t.AddCell(new PdfPCell(new Phrase("Almacén")) { Colspan = 2 });
            t.AddCell(new PdfPCell(new Phrase("Cantidad")) { Colspan = 2 });

            foreach (var detalle in movimientoSalida.SIC_T_MOVIMIENTO_SALIDA_DETALLE)
            {
                t.AddCell(new PdfPCell(new Phrase(detalle.itm_c_iid.ToString())) { Colspan = 2 });
                t.AddCell(new PdfPCell(new Phrase(detalle.SIC_T_ITEM.itm_c_vdescripcion)) { Colspan = 4 });
                t.AddCell(new PdfPCell(new Phrase(detalle.SIC_T_ALMACEN.alm_c_vdesc)) { Colspan = 2 });
                t.AddCell(new PdfPCell(new Phrase(detalle.mvs_det_c_ecant.ToString())) { Colspan = 2 });
            }

            t.AddCell(Celdas(t));

            t.AddCell(new PdfPCell(new Phrase("Observación")) { Colspan = 2 });
            t.AddCell(Celdas(8));

            t.AddCell(new PdfPCell(new Phrase(movimientoSalida.mvs_c_vobservacion)) 
            { Colspan = 10, Rowspan = 3 });

            doc.Add(t);

            doc.Close();

            if (memStream != null)
            {
                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.AppendHeader("Content-Disposition", "Attachment; filename=MOVIMIENTO_PRODUCCION.pdf");
                HttpContext.Current.Response.ContentType = "application/pdf";
                HttpContext.Current.Response.OutputStream.Write(memStream.GetBuffer(), 0, memStream.GetBuffer().Length);
                HttpContext.Current.Response.OutputStream.Flush();
                memStream.Close();
                HttpContext.Current.Response.End();
            }
        }

        private static PdfPCell Celdas(PdfPTable pdfTable, string texto = " ")
        {
            return new PdfPCell(new Phrase(texto)) { Colspan = pdfTable.NumberOfColumns };
        }

        private static PdfPCell Celdas(int numeroDeColumnas, string texto = " ")
        {
            return new PdfPCell(new Phrase(texto)) { Colspan = numeroDeColumnas };
        }
    }
}