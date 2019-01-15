using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using iTextSharp.text.pdf;
using iTextSharp.text;
using System.Web;

namespace SIC.UserLayer
{
    public class MyPageEventHandler : PdfPageEventHelper
    {
        /*
         * We use a __single__ Image instance that's assigned __once__;
         * the image bytes added **ONCE** to the PDF file. If you create 
         * separate Image instances in OnEndPage()/OnEndPage(), for example,
         * you'll end up with a much bigger file size.
         */
        public Image ImageHeader { get; set; }
        PdfTemplate total;
        protected BaseFont helv;
        private bool settingFont = false;

        public String strPalabraArrendamiento { get; set; }
        public String strNomComercial { get; set; }
        public String strNroContrato { get; set; }
        //public override void OnEndPage(PdfWriter writer, Document document)
        //{
        //    // cell height 
        //    float cellHeight = document.BottomMargin;
        //    // PDF document size      
        //    Rectangle page = document.PageSize;


        //    // create two column table
        //    PdfPTable head = new PdfPTable(2);
        //    head.TotalWidth = page.Width;
        //    ImageHeader.ScaleAbsolute(40f, 30f);
        //    // add image; PdfPCell() overload sizes image to fit cell
        //    PdfPCell c = new PdfPCell(ImageHeader, false);
        //    c.HorizontalAlignment = Element.ALIGN_LEFT;
        //    c.FixedHeight = cellHeight;
        //    c.Border = PdfPCell.NO_BORDER;
        //    head.AddCell(c);

        //    // add the header text
        //    c = new PdfPCell(new Phrase(
        //       writer.PageNumber.ToString(),
        //      new Font(Font.COURIER, 8)
        //    ));
        //    c.Border = PdfPCell.NO_BORDER;
        //    c.VerticalAlignment = Element.ALIGN_BOTTOM;
        //    c.HorizontalAlignment = Element.ALIGN_RIGHT;
        //    c.FixedHeight = cellHeight;
        //    head.AddCell(c);


        //    // add the header text
        //    c = new PdfPCell(new Phrase(
        //      DateTime.UtcNow.ToString("yyyy-MM-dd HH:mm:ss") + " GMT",
        //      new Font(Font.COURIER, 8)
        //    ));
        //    c.Border = PdfPCell.NO_BORDER;
        //    c.VerticalAlignment = Element.ALIGN_BOTTOM;
        //    c.HorizontalAlignment = Element.ALIGN_RIGHT;
        //    c.FixedHeight = cellHeight;
        //    head.AddCell(c);

        //    // since the table header is implemented using a PdfPTable, we call
        //    // WriteSelectedRows(), which requires absolute positions!
        //    head.WriteSelectedRows(
        //      0, -1,  // first/last row; -1 flags all write all rows
        //      0,      // left offset
        //        // ** bottom** yPos of the table
        //      page.Height - cellHeight + head.TotalHeight,
        //      writer.DirectContent
        //    );


        //}
        public override void OnOpenDocument(PdfWriter writer, Document document)
        {
            total = writer.DirectContent.CreateTemplate(50, 50);
            total.BoundingBox = new Rectangle(-20, -20, 50, 50);

            helv = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.WINANSI, BaseFont.NOT_EMBEDDED);
        }

        public override void OnEndPage(PdfWriter writer, Document doc)
        {


            Font font = FontFactory.GetFont("Arial", 6, iTextSharp.text.Font.NORMAL, BaseColor.BLACK);
            //tbl footer
            PdfPTable footerTbl = new PdfPTable(3);
            float[] widths = new float[] { 33.3f, 33.4f, 33.3f };
            footerTbl.SetWidths(widths);
            footerTbl.TotalWidth = doc.PageSize.Width - 60f;


            footerTbl.HorizontalAlignment = Element.ALIGN_CENTER;

            //img footer
            ImageHeader = iTextSharp.text.Image.GetInstance(HttpContext.Current.Server.MapPath("/Imagenes/logo_indumet.png"));
            ImageHeader.ScaleAbsolute(30f, 20f);

            PdfPCell cell = new PdfPCell(ImageHeader, false);
            cell.HorizontalAlignment = Element.ALIGN_LEFT;
            cell.Border = 0;
            cell.PaddingLeft = 10f;
            footerTbl.AddCell(cell);


            List lst = new List();

            ListItem lstItem = new ListItem(new Chunk("Contrato de Arrendamiento", font));
            lstItem.Alignment = Element.ALIGN_CENTER;
            lst.Add(lstItem);

            lstItem = new ListItem(new Chunk("Nombre Comercial", font));
            lstItem.Alignment = Element.ALIGN_CENTER;
            lst.Add(lstItem);

            lstItem = new ListItem(new Chunk("Contrato de Arrendamiento", font));
            lstItem.Alignment = Element.ALIGN_CENTER;
            lst.Add(lstItem);

            PdfPTable tablaDatos = new PdfPTable(1);

            float[] widthsDatos = new float[] { 20 };
            tablaDatos.TotalWidth = 200f;
            tablaDatos.LockedWidth = true;
            tablaDatos.DefaultCell.Border = Rectangle.NO_BORDER;
            tablaDatos.HorizontalAlignment = Element.ALIGN_CENTER;

            tablaDatos.SetWidths(widthsDatos);

            tablaDatos.AddCell(new Paragraph("INDUMET GRUPO ORTIZ S.A.C. - RUC:20550768471 / Tlf:(01) 456-7230", font) { Alignment = Element.ALIGN_CENTER });
            //tablaDatos.AddCell(new Paragraph(strNomComercial, font) { Alignment = Element.ALIGN_CENTER });
            //tablaDatos.AddCell(new Paragraph(strNroContrato, font) { Alignment = Element.ALIGN_CENTER });

            PdfPCell cellDatos = new PdfPCell(tablaDatos);
            cellDatos.HorizontalAlignment = Element.ALIGN_CENTER;
            cellDatos.PaddingLeft = 40f;
            cellDatos.Border = 0;
            footerTbl.AddCell(cellDatos);



            //PdfPCell cellImg = new PdfPCell(ImageHeader, false);
            //cellImg.HorizontalAlignment = Element.ALIGN_LEFT;
            //cellImg.Border = 0;
            //footerTbl.AddCell(cellImg);


            //page number
            Chunk myFooter = new Chunk("Página " + (doc.PageNumber) + " de ", font);
            PdfPCell footer = new PdfPCell(new Phrase(myFooter));
            footer.PaddingLeft = 80f;
            footer.Border = Rectangle.NO_BORDER;
            footer.HorizontalAlignment = Element.ALIGN_CENTER;
            footerTbl.AddCell(footer);
            float textBase = doc.Bottom;
            //this is for the position of the footer ... im my case is "+80"
            writer.DirectContent.AddTemplate(total, doc.Right - 25, textBase - 3);
            footerTbl.WriteSelectedRows(0, -1, 30, (doc.BottomMargin + 5), writer.DirectContent);




            //PdfContentByte cb = writer.DirectContent;
            //cb.SaveState();
            ////string text = "Page " + writer.PageNumber + " of ";
            //float textBase = doc.Bottom;
            //float textSize = 12; //helv.GetWidthPoint(text, 12);
            //cb.BeginText();
            //cb.SetFontAndSize(helv, 12);

            //float adjust = helv.GetWidthPoint("-100", 12);
            //cb.SetTextMatrix(doc.Right - textSize - adjust, textBase);
            //cb.EndText();
            //cb.AddTemplate(total, doc.Right - adjust, textBase);
            //cb.RestoreState();
        }

        public override void OnCloseDocument(PdfWriter writer, Document document)
        {
            total.BeginText();
            total.SetFontAndSize(helv, 6);
            total.SetTextMatrix(0, 0);
            int pageNumber = writer.PageNumber - 1;
            total.ShowText(Convert.ToString(pageNumber));
            total.EndText();
        }


    }
}
