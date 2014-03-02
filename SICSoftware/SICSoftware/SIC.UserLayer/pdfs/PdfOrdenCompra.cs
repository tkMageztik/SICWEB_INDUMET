using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using iTextSharp.text;
using System.IO;
using iTextSharp.text.pdf;
using SIC.EntityLayer;
using SIC.Data;

namespace SIC.UserLayer
{
    public static class PdfOrdenCompra
    {
        public static void init(SIC_T_ORDEN_DE_COMPRA ordenCompra)
        {

            Document doc = new Document();
            MemoryStream memStream = new MemoryStream();
            PdfWriter pdf = PdfWriter.GetInstance(doc, memStream);
            pdf.PageEvent = new MyPageEventHandler();
            doc.Open();

            iTextSharp.text.Font fontTitulo = FontFactory.GetFont("Calibri", 12, Font.BOLD, iTextSharp.text.BaseColor.BLACK);
            iTextSharp.text.Font fontSubtitulo = FontFactory.GetFont("Calibri", 9, Font.BOLD, iTextSharp.text.BaseColor.BLACK);
            iTextSharp.text.Font fontPropiedad = FontFactory.GetFont("Calibri", 8, Font.BOLD, iTextSharp.text.BaseColor.BLACK);
            iTextSharp.text.Font fontInfo = FontFactory.GetFont("Calibri", 8, iTextSharp.text.BaseColor.BLACK);


            PdfPTableHeader th = new PdfPTableHeader();
            PdfPTableBody tb = new PdfPTableBody();
            PdfPTableFooter tf = new PdfPTableFooter();

            PdfPTable t = new PdfPTable(new[] { 10f, 10f, 10f, 10f, 10f, 10f, 10f, 10f, 10f, 10f });
            t.WidthPercentage = 100;

            t.AddCell(Celdas(t, border: Rectangle.NO_BORDER));

            t.AddCell(Celdas(2, border: Rectangle.NO_BORDER));

            t.AddCell(new PdfPCell(new Phrase("ORDEN DE COMPRA #" + ordenCompra.odc_c_cserie + " - " + ordenCompra.odc_c_vcodigo, fontTitulo)) { Colspan = 6, Border = Rectangle.NO_BORDER, HorizontalAlignment = Convert.ToInt32(eTextAlignment.Center) });

            t.AddCell(Celdas(2, border: Rectangle.NO_BORDER));

            t.AddCell(Celdas(10, border: Rectangle.NO_BORDER));

            t.AddCell(new PdfPCell(new Phrase("DATOS DEL PROVEEDOR", fontSubtitulo)) { Colspan = 6, Border = 0 });

            t.AddCell(new PdfPCell(new Phrase("FECHA DE EMISIÓN", fontSubtitulo)) { Colspan = 2, Border = 0, HorizontalAlignment = Convert.ToInt32(eTextAlignment.Right) });
            t.AddCell(new PdfPCell(new Phrase(String.Format("{0:dd/MM/yyyy}", ordenCompra.odc_c_zfechaemi), fontInfo)) { Colspan = 2, Border = Rectangle.NO_BORDER, HorizontalAlignment = Convert.ToInt32(eTextAlignment.Right) });


            t.AddCell(new PdfPCell(new Phrase("PROVEEDOR", fontPropiedad)) { Colspan = 2 });
            t.AddCell(new PdfPCell(new Phrase(ordenCompra.SIC_T_CLIENTE.cli_c_vraz_soc, fontInfo)) { Colspan = 5 });

            t.AddCell(new PdfPCell(new Phrase("RUC", fontPropiedad)));
            t.AddCell(new PdfPCell(new Phrase(ordenCompra.SIC_T_CLIENTE.cli_c_vdoc_id, fontInfo)) { Colspan = 2 });

            List<SIC_T_CLI_CONTACTO> lstProvContacto = ordenCompra.SIC_T_CLIENTE.SIC_T_CLI_CONTACTO.ToList<SIC_T_CLI_CONTACTO>();
            String provContacto = lstProvContacto[0].cli_contac_c_vape_pat + ", " + lstProvContacto[0].cli_contac_c_vnomb;

            t.AddCell(new PdfPCell(new Phrase("CONTACTO", fontPropiedad)));
            t.AddCell(new PdfPCell(new Phrase(provContacto, fontInfo)) { Colspan = 4 });

            SIC_T_CLI_DIRECCION cliDirec = ordenCompra.SIC_T_CLIENTE.SIC_T_CLI_DIRECCION.ToList<SIC_T_CLI_DIRECCION>()
                .Where(x => x.cli_direc_c_ctipo == Convert.ToInt32(TipoDirecCliente.FISCAL).ToString()).ToList()[0];

            String direc = "";
            if (cliDirec != null)
            {
                direc = cliDirec.cli_direc_c_vdirec + " " + cliDirec.SIC_T_DISTRITO.SIC_T_PROVINCIA.SIC_T_DEPARTAMENTO.depa_c_vnomb +
                    " " + cliDirec.SIC_T_DISTRITO.SIC_T_PROVINCIA.prov_c_vnomb + " " + cliDirec.SIC_T_DISTRITO.dist_c_vnomb;
            }

            t.AddCell(new PdfPCell(new Phrase("DIRECCIÓN", fontPropiedad)));
            t.AddCell(new PdfPCell(new Phrase(direc, fontInfo)) { Colspan = 4 });

            t.AddCell(new PdfPCell(new Phrase("TELÉFONO", fontPropiedad)));
            t.AddCell(new PdfPCell(new Phrase(ordenCompra.SIC_T_CLIENTE.cli_c_ctlf, fontInfo)) { Colspan = 2 });

            t.AddCell(new PdfPCell(new Phrase("FAX", fontPropiedad)));
            t.AddCell(new PdfPCell(new Phrase("", fontInfo)));

            t.AddCell(new PdfPCell(new Phrase("USUARIO", fontPropiedad)));
            t.AddCell(new PdfPCell(new Phrase(ordenCompra.odc_c_iid_usuario_creador, fontInfo)) { Colspan = 4 });


            t.AddCell(Celdas(t, border: Rectangle.NO_BORDER));

            t.AddCell(new PdfPCell(new Phrase("DATOS GENERALES", fontSubtitulo)) { Colspan = 2, Border = Rectangle.NO_BORDER });
            t.AddCell(Celdas(8, border: Rectangle.NO_BORDER));

            t.AddCell(new PdfPCell(new Phrase("FECHA ENTREGA", fontPropiedad)));
            t.AddCell(new PdfPCell(new Phrase(ordenCompra.odc_c_zfechaentrega_ini.ToString("dd/MM/yyyy") + " al  "
                                            + ordenCompra.odc_c_zfechaentrega_fin.ToString("dd/MM/yyyy"), fontInfo)) { Colspan = 4 });

            t.AddCell(new PdfPCell(new Phrase("CLASE DE O/C", fontPropiedad)));
            t.AddCell(new PdfPCell(new Phrase(ordenCompra.odc_c_clase_des, fontInfo)) { Colspan = 4 });


            t.AddCell(new PdfPCell(new Phrase("COND. PAGO", fontPropiedad)));
            t.AddCell(new PdfPCell(new Phrase("", fontInfo)) { Colspan = 4 });

            t.AddCell(new PdfPCell(new Phrase("LUGAR ENTREGA", fontPropiedad)));
            t.AddCell(new PdfPCell(new Phrase(ordenCompra.SIC_T_EMP_DIRECCION.emp_dir_c_vdireccion, fontInfo)) { Colspan = 4 });

            t.AddCell(new PdfPCell(new Phrase("PROCESO", fontPropiedad)));
            t.AddCell(new PdfPCell(new Phrase("", fontInfo)) { Colspan = 4 });

            t.AddCell(new PdfPCell(new Phrase("GRUPO REQUERIDO", fontPropiedad)));
            t.AddCell(new PdfPCell(new Phrase("", fontInfo)) { Colspan = 4 });


            t.AddCell(Celdas(t, border: Rectangle.NO_BORDER));

            //aquí el detalle de OC

            t.AddCell(new PdfPCell(new Phrase("DETALLE", fontSubtitulo)) { Colspan = 2, Border = Rectangle.NO_BORDER });
            t.AddCell(Celdas(8, border: Rectangle.NO_BORDER));

            t.AddCell(new PdfPCell(new Phrase("CANT. REQ.", fontPropiedad)) { HorizontalAlignment = Convert.ToInt32(eTextAlignment.Center) });
            t.AddCell(new PdfPCell(new Phrase("UNI. MEDIDA", fontPropiedad)) { HorizontalAlignment = Convert.ToInt32(eTextAlignment.Center) });
            t.AddCell(new PdfPCell(new Phrase("COD. ITEM", fontPropiedad)) { HorizontalAlignment = Convert.ToInt32(eTextAlignment.Center) });
            t.AddCell(new PdfPCell(new Phrase("DESCRIPCIÓN ITEM", fontPropiedad)) { Colspan = 4, HorizontalAlignment = Convert.ToInt32(eTextAlignment.Center) });
            t.AddCell(new PdfPCell(new Phrase("P.U.", fontPropiedad)) { HorizontalAlignment = Convert.ToInt32(eTextAlignment.Center) });
            t.AddCell(new PdfPCell(new Phrase("DSCTO", fontPropiedad)) { HorizontalAlignment = Convert.ToInt32(eTextAlignment.Center) });
            t.AddCell(new PdfPCell(new Phrase("TOTAL", fontPropiedad)) { HorizontalAlignment = Convert.ToInt32(eTextAlignment.Center) });


            foreach (SIC_T_ORDEN_DE_COMPRA_DET det in ordenCompra.SIC_T_ORDEN_DE_COMPRA_DET)
            {
                t.AddCell(new PdfPCell(new Phrase(String.Format("{0:0.00}", det.odc_c_ecantidad), fontInfo)) { HorizontalAlignment = Convert.ToInt32(eTextAlignment.Center) });
                t.AddCell(new PdfPCell(new Phrase(det.SIC_T_ITEM.SIC_T_UNIDAD_MEDIDA.und_c_vdesc, fontInfo)) { HorizontalAlignment = Convert.ToInt32(eTextAlignment.Center) });
                t.AddCell(new PdfPCell(new Phrase(det.SIC_T_ITEM.itm_c_ccodigo, fontInfo)));
                t.AddCell(new PdfPCell(new Phrase(det.SIC_T_ITEM.itm_c_vdescripcion, fontInfo)) { Colspan = 4 });
                t.AddCell(new PdfPCell(new Phrase(String.Format("{0:0,0.00}", det.odc_c_epreciounit), fontInfo)) { HorizontalAlignment = Convert.ToInt32(eTextAlignment.Right) });
                t.AddCell(new PdfPCell(new Phrase("0.00", fontInfo)) { HorizontalAlignment = Convert.ToInt32(eTextAlignment.Right) });
                t.AddCell(new PdfPCell(new Phrase(String.Format("{0:0,0.00}", det.odc_c_epreciototal), fontInfo)) { HorizontalAlignment = Convert.ToInt32(eTextAlignment.Right) });

            }

            t.AddCell(Celdas(t));

            t.AddCell(new PdfPCell(new Phrase("MONEDA", fontPropiedad)));
            t.AddCell(new PdfPCell(new Phrase(Enum.GetName(typeof(TipoMonedaDescripcion), ordenCompra.odc_c_ymoneda).Replace('_', ' ')
                , fontInfo)) { Colspan = 9 });
            //t.AddCell(Celdas(9));


            t.AddCell(Celdas(t));

            t.AddCell(new PdfPCell(new Phrase("OP", fontPropiedad)));

            t.AddCell(new PdfPCell(new Phrase("", fontInfo)) { Colspan = 5 });
            t.AddCell(new PdfPCell(new Phrase("VALOR VENTA", fontPropiedad)) { Colspan = 2 });
            t.AddCell(new PdfPCell(new Phrase(ordenCompra.odc_c_esubtotal.ToString(), fontInfo)) { Colspan = 2, HorizontalAlignment = Convert.ToInt32(eTextAlignment.Right) });


            t.AddCell(Celdas(6));
            t.AddCell(new PdfPCell(new Phrase("I.G.V.", fontPropiedad)) { Colspan = 2 });
            t.AddCell(new PdfPCell(new Phrase(ordenCompra.odc_c_eigvcal.ToString(), fontInfo)) { Colspan = 2, HorizontalAlignment = Convert.ToInt32(eTextAlignment.Right) });

            t.AddCell(Celdas(6));
            t.AddCell(new PdfPCell(new Phrase("PERCEPCIÓN", fontPropiedad)) { Colspan = 2 });
            t.AddCell(new PdfPCell(new Phrase(ordenCompra.odc_c_epercepcioncal.ToString(), fontInfo)) { Colspan = 2, HorizontalAlignment = Convert.ToInt32(eTextAlignment.Right) });

            t.AddCell(Celdas(6));
            t.AddCell(new PdfPCell(new Phrase("TOTAL", fontPropiedad)) { Colspan = 2 });
            t.AddCell(new PdfPCell(new Phrase(ordenCompra.odc_c_etotal.ToString(), fontInfo)) { Colspan = 2, HorizontalAlignment = Convert.ToInt32(eTextAlignment.Right) });

            t.AddCell(Celdas(t));

            t.AddCell(new PdfPCell(new Phrase("OBSERVACIÓN", fontPropiedad)) { Colspan = 10 });

            t.AddCell(Celdas(t));

            t.AddCell(Celdas(t, ordenCompra.odc_c_vobservacion));

            t.AddCell(Celdas(t));


            t.AddCell(new PdfPCell(new Phrase("VoBo Gerencia", fontPropiedad)) { Colspan = 2 });
            t.AddCell(new PdfPCell(new Phrase(" ")) { Colspan = 3 });

            t.AddCell(new PdfPCell(new Phrase("VoBo Emisor", fontPropiedad)) { Colspan = 2 });
            t.AddCell(new PdfPCell(new Phrase(" ")) { Colspan = 3 });

            t.AddCell(Celdas(t));



            t.AddCell(new PdfPCell(new Phrase("NOTAS", fontPropiedad)) { Colspan = 10, Border = Rectangle.NO_BORDER });
            List listNotas = new List(List.UNORDERED, 15f);
            listNotas.PreSymbol = "-";


            listNotas.Add(new ListItem("Despachar solo cantidades solicitadas. No se aceptan excesos.", fontInfo));
            listNotas.Add(new ListItem("Recoger O/C original y al despachar la mercaderia, adjuntar fotocopia autenticada de la misma, indicando en ella el N° de entrega correspondiente", fontInfo));
            listNotas.Add(new ListItem("Enviar la factura maximo a los 3 dias de haber entregado cada guia", fontInfo));
            listNotas.Add(new ListItem("Los pagos se realizarán a nombre de la razón social que fugura en la Factura y en la Orden de Compra", fontInfo));


            //t.AddCell(Celdas(t, "SUMIT SAC - RUC:20431991960 / Direccion:Calle A Mz.B Lote 8-D Zona Industrial Bocanegra-Callao / Tlf:574-7272 / Fax:484-5589"));            

            doc.Add(t);

            doc.Add(listNotas);

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

        private static PdfPCell Celdas(PdfPTable pdfTable, string texto = " ", int border = Rectangle.BOX)
        {
            return new PdfPCell(new Phrase(texto)) { Colspan = pdfTable.NumberOfColumns, Border = border };

        }

        private static PdfPCell Celdas(int numeroDeColumnas, string texto = " ", int border = Rectangle.BOX)
        {
            return new PdfPCell(new Phrase(texto)) { Colspan = numeroDeColumnas, Border = border };

        }

    }
}