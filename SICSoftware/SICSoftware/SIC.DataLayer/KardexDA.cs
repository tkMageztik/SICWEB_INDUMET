using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using System.Data.Objects;

namespace SIC.DataLayer
{
    public class KardexDA
    {
        public List<KardexDetalle> ObtenerKardex(DateTime? fechaInicio, DateTime? fechaFin, int? idAlmacen, int? idItem)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                contexto.ContextOptions.LazyLoadingEnabled = false;

                List<KardexDetalle> listaEntrada = this.ObtenerKardexEntrada(fechaInicio, fechaFin, idAlmacen, idItem, contexto);
                List<KardexDetalle> listaSalida = this.ObtenerKardexSalida(fechaInicio, fechaFin, idAlmacen, idItem, contexto);

                foreach (KardexDetalle det in listaSalida)
                {
                    KardexDetalle encontrado = listaEntrada.FirstOrDefault(x => x.Fecha == det.Fecha
                                                    && x.SIC_T_ALMACEN.alm_c_iid == det.SIC_T_ALMACEN.alm_c_iid
                                                    && x.SIC_T_ITEM.itm_c_iid == det.SIC_T_ITEM.itm_c_iid);
                    if (encontrado != null)
                    {
                        encontrado.SalidaCantidad = det.SalidaCantidad;
                        encontrado.SalidaPrecio = det.SalidaPrecio;
                    }
                    else
                    {
                        listaEntrada.Add(det);
                    }
                }

                return listaEntrada.OrderBy(x => x.Fecha).ToList();
            }
        }

        private List<KardexDetalle> ObtenerKardexEntrada(DateTime? fechaInicio, DateTime? fechaFin, int? idAlmacen, int? idItem, SICDBWEBEntities contexto)
        {
            List<KardexDetalle> listaCompra = (from x in contexto.SIC_T_MOVIMIENTO_ENTRADA_DETALLE
                                                    .Include("SIC_T_MOVIMIENTO_ENTRADA.SIC_T_ALMACEN")
                                                    .Include("SIC_T_ORDEN_DE_COMPRA_DET.SIC_T_ITEM")
                                               where (fechaInicio == null || x.SIC_T_MOVIMIENTO_ENTRADA.mve_c_zfecharegistro >= fechaInicio)
                                                && (fechaFin == null || (x.SIC_T_MOVIMIENTO_ENTRADA.mve_c_zfecharegistro.Year <= fechaFin.Value.Year
                                                     && x.SIC_T_MOVIMIENTO_ENTRADA.mve_c_zfecharegistro.Month <= fechaFin.Value.Month
                                                     && x.SIC_T_MOVIMIENTO_ENTRADA.mve_c_zfecharegistro.Day <= fechaFin.Value.Day))
                                                && (idItem == null || idItem == x.SIC_T_ORDEN_DE_COMPRA_DET.odc_c_iitemid)
                                                && (idAlmacen == null || idAlmacen == x.SIC_T_MOVIMIENTO_ENTRADA.mve_c_iidalmacen)
                                                && x.SIC_T_MOVIMIENTO_ENTRADA.mve_c_iestado == 3 // ??
                                               group x by new
                                               {
                                                   Fecha = EntityFunctions.TruncateTime(x.SIC_T_MOVIMIENTO_ENTRADA.mve_c_zfecharegistro),
                                                   Item = x.SIC_T_ORDEN_DE_COMPRA_DET.SIC_T_ITEM,
                                                   Almacen = x.SIC_T_MOVIMIENTO_ENTRADA.SIC_T_ALMACEN,
                                               } into y
                                               select new KardexDetalle
                                               {
                                                   SIC_T_ITEM = y.Key.Item,
                                                   Fecha = y.Key.Fecha.Value,
                                                   SIC_T_ALMACEN = y.Key.Almacen,
                                                   EntradaCantidad = y.Sum(x => x.mve_c_ecant_recibida),
                                                   EntradaPrecio = y.Average(x => x.SIC_T_ORDEN_DE_COMPRA_DET.odc_c_epreciounit),
                                               }).ToList();
            return listaCompra;                        
        }

        private List<KardexDetalle> ObtenerKardexSalida(DateTime? fechaInicio, DateTime? fechaFin, int? idAlmacen, int? idItem, SICDBWEBEntities contexto)
        {
            List<KardexDetalle> listaVenta = (from x in contexto.SIC_T_MOVIMIENTO_SALIDA_DETALLE
                                                    .Include("SIC_T_MOVIMIENTO_SALIDA.SIC_T_VENTA.SIC_T_VENTA_DETALLE")
                                                    .Include("SIC_T_ITEM")
                                                    .Include("SIC_T_ALMACEN")
                                              where (fechaInicio == null || x.SIC_T_MOVIMIENTO_SALIDA.mvs_c_zfecharegistro >= fechaInicio)
                                                      && (fechaFin == null || (x.SIC_T_MOVIMIENTO_SALIDA.mvs_c_zfecharegistro.Year <= fechaFin.Value.Year
                                                           && x.SIC_T_MOVIMIENTO_SALIDA.mvs_c_zfecharegistro.Month <= fechaFin.Value.Month
                                                           && x.SIC_T_MOVIMIENTO_SALIDA.mvs_c_zfecharegistro.Day <= fechaFin.Value.Day))
                                                    && (idItem == null || idItem == x.itm_c_iid)
                                                    && (idAlmacen == null || idAlmacen == x.alm_c_iid)
                                                    && x.SIC_T_MOVIMIENTO_SALIDA.mov_estado_iid == 3 // ??
                                              group x by new
                                              {
                                                  Fecha = EntityFunctions.TruncateTime(x.SIC_T_MOVIMIENTO_SALIDA.mvs_c_zfecharegistro),
                                                  x.SIC_T_ITEM,
                                                  x.SIC_T_ALMACEN,
                                              } into y
                                              select new KardexDetalle
                                              {
                                                  SIC_T_ITEM = y.Key.SIC_T_ITEM,
                                                  Fecha = y.Key.Fecha.Value,
                                                  SIC_T_ALMACEN = y.Key.SIC_T_ALMACEN,
                                                  SalidaCantidad = y.Average(x => x.mvs_det_c_ecant),
                                                  SalidaPrecio = y.Average(x => x.SIC_T_MOVIMIENTO_SALIDA.SIC_T_VENTA != null ?
                                                        x.SIC_T_MOVIMIENTO_SALIDA.SIC_T_VENTA
                                                        .SIC_T_VENTA_DETALLE.FirstOrDefault(z => z.SIC_T_ALMACEN.alm_c_iid == x.alm_c_iid
                                                                                            && z.ven_det_c_iitemid == x.itm_c_iid).ven_det_c_epreciounit
                                                                                            :
                                                                                            0),
                                              }).ToList();
            return listaVenta;
        }
    }
}
