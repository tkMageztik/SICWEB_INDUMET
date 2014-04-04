using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PdfRpt.Core.Contracts;
using PdfRpt.FluentInterface;
using SIC.EntityLayer;

namespace ReportImpl
{
    public class ReporteItemPDF
    {
        public IPdfReportData CreatePdfReport(List<SIC_T_ITEM> listaItem, System.IO.Stream stream )
        {
            return new PdfReport().DocumentPreferences(doc =>
            {
                doc.RunDirection(PdfRunDirection.LeftToRight);
                doc.Orientation(PageOrientation.Portrait);
                doc.PageSize(PdfPageSize.A4);
                doc.DocumentMetadata(new DocumentMetadata { Author = "Natcom Systems", Application = "SIC", Keywords = "Reporte.", Subject = "Items", Title = "Reporte de Items" });
                
            })
            .PagesFooter(footer =>
            {
                footer.DefaultFooter(DateTime.Now.ToString("dd/MM/yyyy"));
            })
            .PagesHeader(header =>
            {
                header.DefaultHeader(defaultHeader =>
                {
                    defaultHeader.RunDirection(PdfRunDirection.LeftToRight);
                    defaultHeader.Message("Reporte Items");                    
                });                
            })
            .MainTableTemplate(template =>
            {
                template.BasicTemplate(BasicTemplate.CoverFieldTemplate);
            })
            .MainTablePreferences(table =>
            {
                table.ColumnsWidthsType(TableColumnWidthType.Relative);
                table.NumberOfDataRowsPerPage(25);
            })
            .MainTableDataSource(dataSource =>
            {
                dataSource.StronglyTypedList(listaItem);
            })
            //.MainTableSummarySettings(summarySettings =>
            //{
            //    summarySettings.OverallSummarySettings("Summary");
            //    summarySettings.PreviousPageSummarySettings("Previous Page Summary");
            //    summarySettings.PageSummarySettings("Page Summary");
            //})
            .MainTableColumns(columns =>
            {
                columns.AddColumn(column =>
                {
                    column.PropertyName("rowNo");                    
                    column.IsRowNumber(true);
                    column.CellsHorizontalAlignment(HorizontalAlignment.Center);
                    column.IsVisible(true);
                    column.Order(0);
                    column.Width(1);
                    column.HeaderCell("#");
                });

                columns.AddColumn(column =>
                {
                    column.PropertyName<SIC_T_ITEM>(x => x.itm_c_ccodigo);
                    column.CellsHorizontalAlignment(HorizontalAlignment.Center);
                    column.IsVisible(true);
                    column.Order(1);
                    column.Width(1);
                    column.HeaderCell("Código");
                });

                columns.AddColumn(column =>
                {
                    column.PropertyName<SIC_T_ITEM>(x => x.itm_c_vdescripcion);
                    column.CellsHorizontalAlignment(HorizontalAlignment.Center);
                    column.IsVisible(true);
                    column.Order(2);
                    column.Width(2);
                    column.HeaderCell("Descripción");
                });

                columns.AddColumn(column =>
                {
                    column.PropertyName<SIC_T_ITEM>(x => x.SIC_T_UNIDAD_MEDIDA.und_c_vdesc);
                    column.CellsHorizontalAlignment(HorizontalAlignment.Center);
                    column.IsVisible(true);
                    column.Order(3);
                    column.Width(1);
                    column.HeaderCell("Unidad de Medida");
                });

                columns.AddColumn(column =>
                {
                    column.PropertyName<SIC_T_ITEM>(x => x.itm_c_dprecio_compra);
                    column.CellsHorizontalAlignment(HorizontalAlignment.Center);
                    column.IsVisible(true);
                    column.Order(3);
                    column.Width(2);
                    column.HeaderCell("Precio de Compra");
                });

                columns.AddColumn(column =>
                {
                    column.PropertyName<SIC_T_ITEM>(x => x.itm_c_dprecio_venta);
                    column.CellsHorizontalAlignment(HorizontalAlignment.Center);
                    column.IsVisible(true);
                    column.Order(3);
                    column.Width(2);
                    column.HeaderCell("Precio de Venta");
                });
            })
            .MainTableEvents(events =>
            {
                events.DataSourceIsEmpty(message: "No existen datos.");
            })
            .Generate(data =>
                {
                    data.AsPdfStream(stream);
                }            
            )
            ;
        }
    }
}