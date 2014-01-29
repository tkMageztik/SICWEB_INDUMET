using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;

namespace SIC.DataLayer
{
    public class MovimientoEntradaDA
    {
        public List<SIC_T_MOVIMIENTO_ENTRADA> ObtenerMovimientoEntrada()
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_MOVIMIENTO_ENTRADA
                             .Include("SIC_T_ORDEN_DE_COMPRA")
                             .Include("SIC_T_ORDEN_DE_COMPRA.SIC_T_CLIENTE")
                             .Include("SIC_T_MOVIMIENTO_ENTRADA_DETALLE")
                            where x.mve_c_bactivo == true
                            select x).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<SIC_T_MOVIMIENTO_ENTRADA> ObtenerMovimientoEntrada(String ruc, String razonSocial, 
                                                DateTime? inicio, DateTime? fin)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_MOVIMIENTO_ENTRADA
                             .Include("SIC_T_ORDEN_DE_COMPRA")
                             .Include("SIC_T_ORDEN_DE_COMPRA.SIC_T_CLIENTE")
                             .Include("SIC_T_MOVIMIENTO_ENTRADA_DETALLE")
                            where x.mve_c_bactivo == true 
                                && (ruc== null || ruc==string.Empty || 
                                            (x.SIC_T_ORDEN_DE_COMPRA != null && x.SIC_T_ORDEN_DE_COMPRA.SIC_T_CLIENTE!=null
                                            && x.SIC_T_ORDEN_DE_COMPRA.SIC_T_CLIENTE.cli_c_vdoc_id.Contains(ruc)))
                                && (razonSocial == null || razonSocial == string.Empty ||
                                            (x.SIC_T_ORDEN_DE_COMPRA != null && x.SIC_T_ORDEN_DE_COMPRA.SIC_T_CLIENTE!=null
                                            && x.SIC_T_ORDEN_DE_COMPRA.SIC_T_CLIENTE.cli_c_vraz_soc.Contains(razonSocial)))
                                && (inicio==null || x.mve_c_zfecharegistro >= inicio)
                                && (fin == null || (x.mve_c_zfecharegistro.Year <= fin.Value.Year
                                                 && x.mve_c_zfecharegistro.Month <= fin.Value.Month
                                                 && x.mve_c_zfecharegistro.Day <= fin.Value.Day)) 
                            select x).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<SIC_T_MOV_ESTADO> ObtenerMovimientoEstados()
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_MOV_ESTADO
                            select x).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public SIC_T_MOVIMIENTO_ENTRADA ObtenerMovimientoEntradaPorId(int id)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_MOVIMIENTO_ENTRADA
                             .Include("SIC_T_MOVIMIENTO_ENTRADA_DETALLE")
                             .Include("SIC_T_MOVIMIENTO_ENTRADA_DETALLE.SIC_T_ORDEN_DE_COMPRA_DET")
                             .Include("SIC_T_ALMACEN")
                             .Include("SIC_T_ORDEN_DE_COMPRA")
                             .Include("SIC_T_ORDEN_DE_COMPRA.SIC_T_CLIENTE")
                            where x.mve_c_bactivo == true && x.mve_c_iid == id
                            select x).FirstOrDefault();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public bool InsertarMovimientoEntrada(SIC_T_MOVIMIENTO_ENTRADA _pSIC_T_MOVIMIENTO_ENTRADA)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    // Si el estado es cerrado (3), se debe guardar  el itemalmacen
                    if (_pSIC_T_MOVIMIENTO_ENTRADA.mve_c_iestado == 3) // Cerrado, esto es proceso de negocio como hacerlo dedse afuera?
                    {
                        ItemAlmacenDA iada = new ItemAlmacenDA();
                        foreach (var item in _pSIC_T_MOVIMIENTO_ENTRADA.SIC_T_MOVIMIENTO_ENTRADA_DETALLE)
                        {
                            iada.ModificarItemAlmacen(contexto, item.SIC_T_ORDEN_DE_COMPRA_DET.odc_c_iitemid,
                                _pSIC_T_MOVIMIENTO_ENTRADA.mve_c_iidalmacen, item.mve_c_ecant_recibida);
                        }
                        _pSIC_T_MOVIMIENTO_ENTRADA.mve_c_bingresado = true;
                    }

                    foreach (var item in _pSIC_T_MOVIMIENTO_ENTRADA.SIC_T_MOVIMIENTO_ENTRADA_DETALLE)
                    {
                        item.mve_c_iocdet_id = item.SIC_T_ORDEN_DE_COMPRA_DET.odc_det_c_iid;
                        item.SIC_T_ORDEN_DE_COMPRA_DET = null;
                    }

                    _pSIC_T_MOVIMIENTO_ENTRADA.mve_c_bactivo = true;
                    _pSIC_T_MOVIMIENTO_ENTRADA.mve_c_ioc_id = _pSIC_T_MOVIMIENTO_ENTRADA.SIC_T_ORDEN_DE_COMPRA.odc_c_iid;
                    _pSIC_T_MOVIMIENTO_ENTRADA.SIC_T_ORDEN_DE_COMPRA = null;
                    _pSIC_T_MOVIMIENTO_ENTRADA.mve_c_bingresado = false;

                   
                    contexto.AddToSIC_T_MOVIMIENTO_ENTRADA(_pSIC_T_MOVIMIENTO_ENTRADA);                    

                    contexto.SaveChanges();
                    return true;                        
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public bool ModificarMovimientoEntrada(SIC_T_MOVIMIENTO_ENTRADA _pSIC_T_MOVIMIENTO_ENTRADA)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    var original = (from x in contexto.SIC_T_MOVIMIENTO_ENTRADA
                             .Include("SIC_T_MOVIMIENTO_ENTRADA_DETALLE")
                                    where x.mve_c_bactivo == true && x.mve_c_iid == _pSIC_T_MOVIMIENTO_ENTRADA.mve_c_iid
                            select x).FirstOrDefault();

                    // Si el estado es cerrado (3), se debe guardar  el itemalmacen
                    if (!_pSIC_T_MOVIMIENTO_ENTRADA.mve_c_bingresado && _pSIC_T_MOVIMIENTO_ENTRADA.mve_c_iestado == 3) // Cerrado, esto es proceso de negocio como hacerlo dedse afuera?
                    {
                        ItemAlmacenDA iada = new ItemAlmacenDA();
                        foreach (var item in _pSIC_T_MOVIMIENTO_ENTRADA.SIC_T_MOVIMIENTO_ENTRADA_DETALLE)
                        {
                            iada.ModificarItemAlmacen(contexto, item.SIC_T_ORDEN_DE_COMPRA_DET.odc_c_iitemid,
                                _pSIC_T_MOVIMIENTO_ENTRADA.mve_c_iidalmacen, item.mve_c_ecant_recibida);
                        }
                        _pSIC_T_MOVIMIENTO_ENTRADA.mve_c_bingresado = true;
                    }

                    foreach (var item in _pSIC_T_MOVIMIENTO_ENTRADA.SIC_T_MOVIMIENTO_ENTRADA_DETALLE)
                    {
                        if (item.SIC_T_ORDEN_DE_COMPRA_DET != null)
                        {
                            item.mve_c_iocdet_id = item.SIC_T_ORDEN_DE_COMPRA_DET.odc_det_c_iid;
                            item.SIC_T_ORDEN_DE_COMPRA_DET = null;
                        }
                    }

                    foreach (var itemEl in _pSIC_T_MOVIMIENTO_ENTRADA.SIC_T_MOVIMIENTO_ENTRADA_DETALLE)
                    {
                        if (_pSIC_T_MOVIMIENTO_ENTRADA.mve_c_ioc_id != original.mve_c_ioc_id)
                        {
                            contexto.SIC_T_MOVIMIENTO_ENTRADA_DETALLE.Attach(itemEl);
                            contexto.SIC_T_MOVIMIENTO_ENTRADA_DETALLE.DeleteObject(itemEl);
                        }
                        else
                        {
                            contexto.ApplyCurrentValues("SICDBWEBEntities.SIC_T_MOVIMIENTO_ENTRADA_DETALLE", itemEl);
                        }
                    }

                    _pSIC_T_MOVIMIENTO_ENTRADA.mve_c_ioc_id = _pSIC_T_MOVIMIENTO_ENTRADA.SIC_T_ORDEN_DE_COMPRA.odc_c_iid;
                    _pSIC_T_MOVIMIENTO_ENTRADA.SIC_T_ORDEN_DE_COMPRA = null;


                    contexto.ApplyCurrentValues("SICDBWEBEntities.SIC_T_MOVIMIENTO_ENTRADA", _pSIC_T_MOVIMIENTO_ENTRADA);
                    contexto.SaveChanges();

                    return true;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
