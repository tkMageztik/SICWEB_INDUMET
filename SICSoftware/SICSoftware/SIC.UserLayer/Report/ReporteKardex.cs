using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PdfRpt.Core.Contracts;
using PdfRpt.FluentInterface;
using SIC.EntityLayer;

namespace ReportImpl
{
    public class ReporteKardex
    {
        public IPdfReportData CreatePdfReport(List<KardexDetalle> listaKardex, System.IO.Stream stream )
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
                dataSource.StronglyTypedList(listaKardex);
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
                    column.PropertyName<KardexDetalle>(x => x.SIC_T_ITEM.itm_c_vdescripcion);
                    column.CellsHorizontalAlignment(HorizontalAlignment.Center);
                    column.IsVisible(true);
                    column.Order(2);
                    column.Width(1);
                    column.HeaderCell("Item");
                });

                columns.AddColumn(column =>
                {
                    column.PropertyName<KardexDetalle>(x => x.SIC_T_ALMACEN.alm_c_vdesc);
                    column.CellsHorizontalAlignment(HorizontalAlignment.Center);
                    column.IsVisible(true);
                    column.Order(2);
                    column.Width(1);
                    column.HeaderCell("Almacen");
                });

                columns.AddColumn(column =>
                {
                    column.PropertyName<KardexDetalle>(x => x.EntradaCantidad);
                    column.CellsHorizontalAlignment(HorizontalAlignment.Center);
                    column.IsVisible(true);
                    column.Order(2);
                    column.Width(1);
                    column.HeaderCell("Entrada - Cantidad");
                });

                columns.AddColumn(column =>
                {
                    column.PropertyName<KardexDetalle>(x => x.EntradaPrecio);
                    column.CellsHorizontalAlignment(HorizontalAlignment.Center);
                    column.IsVisible(true);
                    column.Order(2);
                    column.Width(1);
                    column.HeaderCell("Entrada - Precio");
                });

                columns.AddColumn(column =>
                {
                    column.PropertyName<KardexDetalle>(x => x.EntradaTotal);
                    column.CellsHorizontalAlignment(HorizontalAlignment.Center);
                    column.IsVisible(true);
                    column.Order(2);
                    column.Width(1);
                    column.HeaderCell("Entrada - Total");
                });

                columns.AddColumn(column =>
                {
                    column.PropertyName<KardexDetalle>(x => x.SalidaCantidad);
                    column.CellsHorizontalAlignment(HorizontalAlignment.Center);
                    column.IsVisible(true);
                    column.Order(2);
                    column.Width(1);
                    column.HeaderCell("Salida - Cantidad");
                });

                columns.AddColumn(column =>
                {
                    column.PropertyName<KardexDetalle>(x => x.SalidaCantidad);
                    column.CellsHorizontalAlignment(HorizontalAlignment.Center);
                    column.IsVisible(true);
                    column.Order(2);
                    column.Width(1);
                    column.HeaderCell("Salida - Cantidad");
                });

                columns.AddColumn(column =>
                {
                    column.PropertyName<KardexDetalle>(x => x.SalidaTotal);
                    column.CellsHorizontalAlignment(HorizontalAlignment.Center);
                    column.IsVisible(true);
                    column.Order(2);
                    column.Width(1);
                    column.HeaderCell("Salida - Total");
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