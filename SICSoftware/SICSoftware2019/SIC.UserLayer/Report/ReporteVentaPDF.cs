using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PdfRpt.Core.Contracts;
using SIC.EntityLayer;
using PdfRpt.FluentInterface;

namespace SIC.UserLayer.Report
{
    public class ReporteVentaPDF
    {
        public IPdfReportData CreatePdfReport(List<SIC_T_VENTA> listaVenta, System.IO.Stream stream )
        {
            return new PdfReport().DocumentPreferences(doc =>
            {
                doc.RunDirection(PdfRunDirection.LeftToRight);
                doc.Orientation(PageOrientation.Portrait);
                doc.PageSize(PdfPageSize.A4);
                doc.DocumentMetadata(new DocumentMetadata { Author = "Natcom Systems", Application = "SIC", Keywords = "Reporte.", Subject = "Ventas", Title = "Reporte de Ventas" });

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
                    defaultHeader.Message("Reporte Ventas");
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
                dataSource.StronglyTypedList(listaVenta);
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
                    column.PropertyName<SIC_T_VENTA>(x => x.SIC_T_CLIENTE.cli_c_vraz_soc);
                    column.CellsHorizontalAlignment(HorizontalAlignment.Center);
                    column.IsVisible(true);
                    column.Order(1);
                    column.Width(2);
                    column.HeaderCell("Razón Social");
                });

                columns.AddColumn(column =>
                {
                    column.PropertyName<SIC_T_VENTA>(x => x.SIC_T_CLIENTE.cli_c_vdoc_id);
                    column.CellsHorizontalAlignment(HorizontalAlignment.Center);
                    column.IsVisible(true);
                    column.Order(1);
                    column.Width(2);
                    column.HeaderCell("RUC");
                });

                columns.AddColumn(column =>
                {
                    column.PropertyName<SIC_T_VENTA>(x => x.FechaString);
                    column.CellsHorizontalAlignment(HorizontalAlignment.Center);
                    column.IsVisible(true);
                    column.Order(1);
                    column.Width(1);
                    column.HeaderCell("Fecha");
                });

                columns.AddColumn(column =>
                {
                    column.PropertyName<SIC_T_VENTA>(x => x.ven_c_vdescmoneda);
                    column.CellsHorizontalAlignment(HorizontalAlignment.Center);
                    column.IsVisible(true);
                    column.Order(1);
                    column.Width(1);
                    column.HeaderCell("Moneda");
                });
                
                columns.AddColumn(column =>
                {
                    column.PropertyName<SIC_T_VENTA>(x => x.ven_c_etotal);
                    column.CellsHorizontalAlignment(HorizontalAlignment.Center);
                    column.IsVisible(true);
                    column.Order(1);
                    column.Width(1);
                    column.HeaderCell("Total");
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