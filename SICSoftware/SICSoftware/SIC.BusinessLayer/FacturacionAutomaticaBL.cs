using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using SIC.DataLayer;
using SIC.Data;
using System.Diagnostics;


namespace SIC.BusinessLayer
{
    /// <summary>
    /// Representa la clase que controla el proceso de negocio de la facturacion automatica
    /// </summary>
    public class FacturacionAutomaticaBL
    {
        /// <summary>
        /// Lista una colleción de meses del año actual
        /// </summary>
        /// <returns>Lista de meses del año actual.</returns>
        /// 
        public List<DateTime> ObtenerListaPeriodo()
        {
            var listado = new List<DateTime>();
            for (int i = 1; i <= 12; i++)
            {
                listado.Add(new DateTime(DateTime.Now.Year, i, 1));
            }
            return listado;
        }

        /// <summary>
        /// Obtiene la lista de Concepto
        /// </summary>
        /// <returns>Colleción con lista de conceptos</returns>
        public List<SIC_T_CONCEPTO> ObtenerListaConcepto()
        {
            ConceptoDA conceptoDA = new ConceptoDA();
            return conceptoDA.ListarConcepto();
        }

        /// <summary>
        /// Obtiene la lista de ventas por regularizar que pertenescan al mes y año ingresados.
        /// </summary>
        /// <param name="year">Año al que pertenece la venta.</param>
        /// <param name="month">Mes al que pertenece la venta.</param>
        /// <returns>Listado de ventas.</returns>
        public List<SIC_T_VENTA> ObtenerListaVentasPendientes(int year, int month)
        {
            return new VentaDA().ListarVentas(year, month, (int)EstadoVenta.POR_REGULARIZAR);
        }

        /// <summary>
        /// Obtiene la venta por id.
        /// </summary>
        /// <returns>Objeto venta.</returns>
        public SIC_T_VENTA ObtenerVenta(int id)
        {
            VentaDA ventaDA = new VentaDA();
            return ventaDA.ObtenerVenta(id);
        }

        /// <summary>
        /// Genera un objeto Factura a partir de una venta, no registra el resultado en la base de datos
        /// ni cambia el estado del objeto Venta ni obtiene la serie ni el numero para el documento.
        /// </summary>
        /// <param name="venta">Objeto venta que se procesará.</param>
        /// <returns>Objeto factura con detalle.</returns>
        public SIC_T_FACTURA GenerarFacturaDesdeVenta(SIC_T_VENTA venta)
        {
            if(venta==null)
            {
                throw new ArgumentException("El parametro venta no puede ser nulo");
            }
            else if (venta.ven_c_itipodoc != (int)TipoParametroDetalle.FACTURA)
            else if(venta.ven_c_itipodoc != (int)TipoParametro.FACTURA)
            {
                throw new ArgumentException("Solo se puede generar facturas de ventas que tengan como tipo documento Factura");
            }

            SIC_T_FACTURA factura = new SIC_T_FACTURA();
            factura.fac_c_zfecharegistro = DateTime.Today;
            factura.fac_c_serie = "000"; // TODO
            factura.fac_c_numero = 0; // TODO
            factura.fac_c_iventa = venta.ven_c_iid;
            factura.fac_c_eigv = venta.ven_c_eigv;
            factura.fac_c_imoneda = venta.ven_c_ymoneda;
            factura.fac_c_vdescmoneda = venta.ven_c_vdescmoneda;

            foreach (var ventaDetalle in venta.SIC_T_VENTA_DETALLE)
            {
                var busqueda = factura.SIC_T_FACTURA_DETALLE.FirstOrDefault(x => x.fac_det_c_iitem == ventaDetalle.ven_det_c_iitemid);
                if (busqueda == null)
                {
                    var nuevoDetalle = new SIC_T_FACTURA_DETALLE();
                    nuevoDetalle.fac_det_c_ecantidad = ventaDetalle.ven_det_c_ecantidad;
                    nuevoDetalle.fac_det_c_epreciounit = ventaDetalle.ven_det_c_epreciounit;
                    nuevoDetalle.fac_det_c_epreciotot = Decimal.Round(nuevoDetalle.fac_det_c_ecantidad * nuevoDetalle.fac_det_c_epreciounit, 2);
                    nuevoDetalle.fac_det_c_iitem = ventaDetalle.ven_det_c_iitemid;
                    nuevoDetalle.SIC_T_ITEM = ventaDetalle.SIC_T_ITEM;
                    factura.SIC_T_FACTURA_DETALLE.Add(nuevoDetalle);
                }
                else
                {
                    busqueda.fac_det_c_ecantidad += ventaDetalle.ven_det_c_ecantidad;
                    busqueda.fac_det_c_epreciotot = Decimal.Round(busqueda.fac_det_c_ecantidad * busqueda.fac_det_c_epreciounit, 2);
                }
            }

            factura.fac_c_esubtotal = factura.SIC_T_FACTURA_DETALLE.Select(x => x.fac_det_c_epreciotot).Sum();
            factura.fac_c_eigvcal = Decimal.Round(factura.fac_c_eigv * factura.fac_c_esubtotal, 2);
            factura.fac_c_etotal = factura.fac_c_esubtotal + factura.fac_c_eigvcal;
            return factura;
        }

        /// <summary>
        /// Genera un objeto Boleta a partir de una venta, no registra el resultado en la base de datos
        /// ni cambia el estado del objeto Venta ni obtiene la serie ni el numero para el documento.
        /// </summary>
        /// <param name="venta">Objeto venta que se procesará.</param>
        /// <returns>Objeto Boleta con detalle.</returns>
        public SIC_T_BOLETA GenerarBoletaDesdeVenta(SIC_T_VENTA venta)
        {
            if (venta == null)
            {
                throw new ArgumentException("El parametro venta no puede ser nulo");
            }
            else if(venta.ven_c_itipodoc != (int)TipoParametroDetalle.BOLETA)
            {
                throw new ArgumentException("Solo se puede generar facturas de ventas que tengan como tipo documento Factura");
            }

            SIC_T_BOLETA boleta = new SIC_T_BOLETA();
            boleta.bol_c_zfecharegistro = DateTime.Today;
            boleta.bol_c_serie = "000"; // TODO
            boleta.bol_c_numero = 0; // TODO
            boleta.bol_c_iventa = venta.ven_c_iid;
            boleta.bol_c_eigv = venta.ven_c_eigv;
            boleta.bol_c_imoneda = venta.ven_c_ymoneda;
            boleta.bol_c_vdescmoneda = venta.ven_c_vdescmoneda;

            int contador = 0;
            foreach (var ventaDetalle in venta.SIC_T_VENTA_DETALLE)
            {
                contador++;
                var busqueda = boleta.SIC_T_BOLETA_DETALLE.FirstOrDefault(x => x.bol_det_c_iitem == ventaDetalle.ven_det_c_iitemid);
                if (busqueda == null)
                {
                    var nuevoDetalle = new SIC_T_BOLETA_DETALLE();
                    nuevoDetalle.bol_det_c_ecantidad = ventaDetalle.ven_det_c_ecantidad;
                    nuevoDetalle.bol_det_c_epreciounit = ventaDetalle.ven_det_c_epreciounit;
                    nuevoDetalle.bol_det_c_epreciotot = Decimal.Round(nuevoDetalle.bol_det_c_ecantidad * nuevoDetalle.bol_det_c_epreciounit, 2);
                    nuevoDetalle.bol_det_c_iitem = ventaDetalle.ven_det_c_iitemid;
                    nuevoDetalle.SIC_T_ITEM = ventaDetalle.SIC_T_ITEM;
                    boleta.SIC_T_BOLETA_DETALLE.Add(nuevoDetalle);
                }
                else
                {
                    busqueda.bol_det_c_ecantidad += ventaDetalle.ven_det_c_ecantidad;
                    busqueda.bol_det_c_epreciotot = Decimal.Round(busqueda.bol_det_c_ecantidad * busqueda.bol_det_c_epreciounit, 2);
                }
            }

            boleta.bol_c_esubtotal = boleta.SIC_T_BOLETA_DETALLE.Select(x => x.bol_det_c_epreciotot).Sum();
            boleta.bol_c_eigvcal = Decimal.Round(boleta.bol_c_eigv * boleta.bol_c_esubtotal, 2);
            boleta.bol_c_etotal = boleta.bol_c_esubtotal + boleta.bol_c_eigvcal;
            return boleta;
        }
    }    
}