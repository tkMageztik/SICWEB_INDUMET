using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using iTextSharp.text;
using System.IO;
using iTextSharp.text.pdf;
using SIC.EntityLayer;

namespace SIC.UserLayer
{
    public static class PdfOrdenCompra
    {
        public static void init(SIC_T_ORDEN_DE_COMPRA ordenCompra)
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

            t.AddCell(new PdfPCell(new Phrase("ORDEN DE COMPRA #" + ordenCompra.odc_c_vcodigo, fontTitulo)) { Colspan = 4 });

            t.AddCell(Celdas(3));

            t.AddCell(Celdas(20));

            t.AddCell(new PdfPCell(new Phrase("Datos del Proveedor", fontSubtitulo)) { Colspan = 2 });

            t.AddCell(Celdas(6));

            t.AddCell(new PdfPCell(new Phrase("Fecha de Emisión")));
            t.AddCell(new PdfPCell(new Phrase("19/02/2014")));

            t.AddCell(new PdfPCell(new Phrase("PROVEEDOR", fontPropiedad)));
            t.AddCell(new PdfPCell(new Phrase(ordenCompra.SIC_T_CLIENTE.cli_c_vraz_soc, fontInfo)) { Colspan = 7 });
            t.AddCell(new PdfPCell(new Phrase("RUC", fontPropiedad)));
            t.AddCell(new PdfPCell(new Phrase(ordenCompra.SIC_T_CLIENTE.cli_c_vdoc_id, fontInfo)));

            t.AddCell(new PdfPCell(new Phrase("Att.", fontPropiedad)));
            t.AddCell(new PdfPCell(new Phrase("", fontInfo)) { Colspan = 4 });

            t.AddCell(new PdfPCell(new Phrase("DIRECCIÓN", fontPropiedad)));
            t.AddCell(new PdfPCell(new Phrase("", fontInfo)) { Colspan = 4 });

            t.AddCell(new PdfPCell(new Phrase("Att.", fontPropiedad)));
            t.AddCell(new PdfPCell(new Phrase("TULA QUIÑONES", fontInfo)) { Colspan = 4 });

            t.AddCell(new PdfPCell(new Phrase("TELÉFONO", fontPropiedad)));
            t.AddCell(new PdfPCell(new Phrase("", fontInfo)) { Colspan = 2 });

            t.AddCell(new PdfPCell(new Phrase("FAX", fontPropiedad)));
            t.AddCell(new PdfPCell(new Phrase("", fontInfo)));

            t.AddCell(new PdfPCell(new Phrase("FORMULADO POR", fontPropiedad)));
            t.AddCell(new PdfPCell(new Phrase("")) { Colspan = 4 });


            t.AddCell(Celdas(t));


            t.AddCell(new PdfPCell(new Phrase("Datos Generales")) { Colspan = 2 });
            t.AddCell(Celdas(8));

            t.AddCell(new PdfPCell(new Phrase("FECHA ENTREGA")));
            t.AddCell(new PdfPCell(new Phrase(ordenCompra.odc_c_zfechaentrega_ini.ToString("dd/MM/yyyy") + " al  " 
                                            + ordenCompra.odc_c_zfechaentrega_fin.ToString("dd/MM/yyyy"))) { Colspan = 4 });

            t.AddCell(new PdfPCell(new Phrase("CLASE DE O/C")));
            t.AddCell(new PdfPCell(new Phrase(ordenCompra.odc_c_clase_des)) { Colspan = 4 });

            t.AddCell(new PdfPCell(new Phrase("FECHA ENTREGA")));
            t.AddCell(new PdfPCell(new Phrase("19/02/2014 al 25/02/2014")) { Colspan = 4 });

            t.AddCell(new PdfPCell(new Phrase("CLASE DE O/C")));
            t.AddCell(new PdfPCell(new Phrase("Compra Hilo Crudo Sin Requerimientos")) { Colspan = 4 });

            t.AddCell(new PdfPCell(new Phrase("COND. PAGO")));
            t.AddCell(new PdfPCell(new Phrase("19/02/2014 al 25/02/2014")) { Colspan = 4 });

            t.AddCell(new PdfPCell(new Phrase("LUGAR ENTREGA")));
            t.AddCell(new PdfPCell(new Phrase("")) { Colspan = 4 });

            t.AddCell(new PdfPCell(new Phrase("PROCESO")));
            t.AddCell(new PdfPCell(new Phrase("")) { Colspan = 4 });

            t.AddCell(new PdfPCell(new Phrase("GRUPO REQUERIDO")));
            t.AddCell(new PdfPCell(new Phrase("")) { Colspan = 4 });


            t.AddCell(Celdas(t));

            //aquí el detalle de OC


            t.AddCell(Celdas(t));


            t.AddCell(Celdas(t, "DOLARES AMERICANOS"));


            t.AddCell(Celdas(t));

            t.AddCell(new PdfPCell(new Phrase("OP")));
            t.AddCell(new PdfPCell(new Phrase("")) { Colspan = 5 });

            t.AddCell(new PdfPCell(new Phrase("")));
            t.AddCell(new PdfPCell(new Phrase("VALOR VTA.")));
            t.AddCell(new PdfPCell(new Phrase(ordenCompra.odc_c_esubtotal.ToString())) { Colspan = 2 });


            t.AddCell(new PdfPCell(new Phrase("")) { Colspan = 6 });
            t.AddCell(new PdfPCell(new Phrase("")));
            t.AddCell(new PdfPCell(new Phrase("I.G.V.")));
            t.AddCell(new PdfPCell(new Phrase(ordenCompra.odc_c_eigvcal.ToString())) { Colspan = 2 });


            t.AddCell(new PdfPCell(new Phrase("")) { Colspan = 6 });
            t.AddCell(new PdfPCell(new Phrase("")));
            t.AddCell(new PdfPCell(new Phrase("PERCEPCIÓN")));
            t.AddCell(new PdfPCell(new Phrase(ordenCompra.odc_c_epercepcioncal.ToString())) { Colspan = 2 });

            t.AddCell(new PdfPCell(new Phrase("")) { Colspan = 6 });
            t.AddCell(new PdfPCell(new Phrase("")));
            t.AddCell(new PdfPCell(new Phrase("TOTAL")));
            t.AddCell(new PdfPCell(new Phrase(ordenCompra.odc_c_etotal.ToString())) { Colspan = 2 });

            t.AddCell(Celdas(t));

            t.AddCell(Celdas(t, "OBSERVACIÓN"));

            t.AddCell(Celdas(t));

            t.AddCell(Celdas(t, ordenCompra.odc_c_vobservacion));

            t.AddCell(Celdas(t));


            t.AddCell(new PdfPCell(new Phrase("VoBo Gerencia")));
            t.AddCell(new PdfPCell(new Phrase(" ")) { Colspan = 4 });

            t.AddCell(new PdfPCell(new Phrase("VoBo Emisor")));
            t.AddCell(new PdfPCell(new Phrase(" ")) { Colspan = 4 });

            t.AddCell(Celdas(t));


            //t.AddCell(Celdas(t, "NOTAS:"));
            //List listNotas = new List(List.UNORDERED, 15f);
            //listNotas.PreSymbol = "-";


            //listNotas.Add(new ListItem("Despachar solo cantidades solicitadas. No se aceptan excesos."));
            //listNotas.Add(new ListItem("Recoger O/C original y al despachar la mercaderia, adjuntar fotocopia autenticada de la misma, indicando en ella el N° de entrega correspondiente"));
            //listNotas.Add(new ListItem("Enviar la factura maximo a los 3 dias de haber entregado cada guia"));
            //listNotas.Add(new ListItem("Los pagos se realizarán a nombre de la razón social que fugura en la Factura y en la Orden de Compra"));



            t.AddCell(Celdas(t));
            t.AddCell(Celdas(t));

            //t.AddCell(Celdas(t, "SUMIT SAC - RUC:20431991960 / Direccion:Calle A Mz.B Lote 8-D Zona Industrial Bocanegra-Callao / Tlf:574-7272 / Fax:484-5589"));            

            doc.Add(t);


            //PdfPTable t2 = new PdfPTable(10);
            ////t2.WidthPercentage = 80;
            //t2.AddCell(new PdfPCell(new Paragraph("carajo...")));
            //t2.AddCell(new PdfPCell(new Paragraph("carajo...")));
            //t2.AddCell(new PdfPCell(new Paragraph("carajo...")));
            //t2.AddCell(new PdfPCell(new Paragraph("carajo...")));
            //t2.AddCell(new PdfPCell(new Paragraph("carajo...")));
            //t2.AddCell(new PdfPCell(new Paragraph("carajo...")));
            //t2.AddCell(new PdfPCell(new Paragraph("carajo...")));
            //t2.AddCell(new PdfPCell(new Paragraph("carajo...")));
            //t2.AddCell(new PdfPCell(new Paragraph("carajo...")));
            //t2.AddCell(new PdfPCell(new Paragraph("carajo...")));

            //doc.Add(t2);


            doc.Close();

            if (memStream != null)
            {
                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.AppendHeader("Content-Disposition", "Attachment; filename=ORDEN_DE_COMPRA.pdf");
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