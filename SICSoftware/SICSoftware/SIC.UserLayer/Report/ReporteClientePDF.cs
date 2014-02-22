using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PdfRpt.Core.Contracts;
using PdfRpt.FluentInterface;
using SIC.EntityLayer;

namespace ReportImpl
{
    public class ReporteClientePDF
    {
        public IPdfReportData CreatePdfReport(List<SIC_T_CLIENTE> listaCliente, System.IO.Stream stream )
        {
            return new PdfReport().DocumentPreferences(doc =>
            {
                doc.RunDirection(PdfRunDirection.LeftToRight);
                doc.Orientation(PageOrientation.Portrait);
                doc.PageSize(PdfPageSize.A4);
                doc.DocumentMetadata(new DocumentMetadata { Author = "Natcom Systems", Application = "SIC", Keywords = "Reporte.", Subject = "Clientes", Title = "Reporte de Clientes" });
                
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
                    defaultHeader.Message("Reporte Cliente.");                    
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
                dataSource.StronglyTypedList(listaCliente);
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
                    column.PropertyName<SIC_T_CLIENTE>(x => x.cli_c_vdoc_id);
                    column.CellsHorizontalAlignment(HorizontalAlignment.Center);
                    column.IsVisible(true);
                    column.Order(1);
                    column.Width(2);
                    column.HeaderCell("RUC");
                });

                columns.AddColumn(column =>
                {
                    column.PropertyName<SIC_T_CLIENTE>(x => x.cli_c_vraz_soc);
                    column.CellsHorizontalAlignment(HorizontalAlignment.Center);
                    column.IsVisible(true);
                    column.Order(2);
                    column.Width(3);
                    column.HeaderCell("Razón Social");
                });

                columns.AddColumn(column =>
                {
                    column.PropertyName<SIC_T_CLIENTE>(x => x.cli_c_vrubro);
                    column.CellsHorizontalAlignment(HorizontalAlignment.Center);
                    column.IsVisible(true);
                    column.Order(3);
                    column.Width(2);
                    column.HeaderCell("Rubro");
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