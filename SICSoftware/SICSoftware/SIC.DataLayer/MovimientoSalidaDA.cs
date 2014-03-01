﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;

namespace SIC.DataLayer
{
    public class MovimientoSalidaDA
    {
        /// <summary>
        /// Obtiene una lista de movimientos de salida desde el contexto de acuerdo
        /// a los parametros ingresados.
        /// </summary>
        /// <param name="ruc">El ruc de la empresa.</param>
        /// <param name="razonSocial">La razón social de la empresa.</param>
        /// <param name="inicio">La fecha de inicio.</param>
        /// <param name="fin">La fecha fin.</param>
        /// <returns>Lista de <c>SIC_T_MOVIMIENTO_SALIDA</c></returns>
        public List<SIC_T_MOVIMIENTO_SALIDA> ListarMovimientoSalida(string ruc, string razonSocial,
                                                                    DateTime? inicio, DateTime? fin)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {               
                return (from x in contexto.SIC_T_MOVIMIENTO_SALIDA
                                 .Include("SIC_T_CLIENTE")
                        where x.mvs_c_bactivo == true
                                & (ruc == null || ruc == string.Empty || x.SIC_T_CLIENTE.cli_c_vdoc_id.Contains(ruc))  
                                & (razonSocial == null || razonSocial == string.Empty 
                                                       || x.SIC_T_CLIENTE.cli_c_vraz_soc.Contains(razonSocial))
                                & (inicio == null || x.mvs_c_zfecharegistro >= inicio)
                                & (fin == null || (x.mvs_c_zfecharegistro.Year <= fin.Value.Year
                                                 && x.mvs_c_zfecharegistro.Month <= fin.Value.Month
                                                 && x.mvs_c_zfecharegistro.Day <= fin.Value.Day))
                        select x).ToList();
            }
        }

        public List<SIC_T_MOV_ESTADO> ObtenerMovimientoEstados()
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_MOV_ESTADO
                            //where x.mov_c_bactivo == true
                            select x).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public SIC_T_MOVIMIENTO_SALIDA ObtenerMovimientoSalidaPorId(int id)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_MOVIMIENTO_SALIDA
                             .Include("SIC_T_MOVIMIENTO_SALIDA_DETALLE")
                             .Include("SIC_T_CLIENTE")
                            where x.mvs_c_iid == id && x.mvs_c_bactivo == true
                            select x).FirstOrDefault();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public bool InsertarMovimientoSalida(SIC_T_MOVIMIENTO_SALIDA _pSIC_T_MOVIMIENTO_SALIDA)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {

                    // Si el estado es cerrado (3), se debe guardar  el itemalmacen
                    //if (_pSIC_T_MOVIMIENTO_SALIDA.mve_c_iestado == 3) // Cerrado, esto es proceso de negocio como hacerlo dedse afuera?
                    //{
                    //    ItemAlmacenDA iada = new ItemAlmacenDA();
                    //    foreach (var item in _pSIC_T_MOVIMIENTO_SALIDA.SIC_T_MOVIMIENTO_SALIDA_DETALLE)
                    //    {
                    //        iada.ModificarItemAlmacen(contexto, item.itm_c_iid,
                    //            item.alm_c_iid, item.mvs_det_c_ecant);
                    //    }
                    //    _pSIC_T_MOVIMIENTO_SALIDA.mvs_c_bingresado = true;
                    //}

                    foreach (var item in _pSIC_T_MOVIMIENTO_SALIDA.SIC_T_MOVIMIENTO_SALIDA_DETALLE)
                    {
                        item.itm_c_iid = item.SIC_T_ITEM.itm_c_iid;
                        item.SIC_T_ITEM = null;
                    }

                    _pSIC_T_MOVIMIENTO_SALIDA.mvs_c_bactivo = true;
                    contexto.AddToSIC_T_MOVIMIENTO_SALIDA(_pSIC_T_MOVIMIENTO_SALIDA);
                    contexto.SaveChanges();
                    return true;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public bool ModificarMovimientSalida(SIC_T_MOVIMIENTO_SALIDA _pSIC_T_MOVIMIENTO_SALIDA)
        {       
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                SIC_T_MOVIMIENTO_SALIDA sal = (from x in contexto.SIC_T_MOVIMIENTO_SALIDA
                                                    .Include("SIC_T_MOVIMIENTO_SALIDA_DETALLE")
                                                where x.mvs_c_iid == _pSIC_T_MOVIMIENTO_SALIDA.mvs_c_iid
                                                select x).FirstOrDefault();

                // Si el estado es cerrado (3), se debe guardar  el itemalmacen
                //if (_pSIC_T_MOVIMIENTO_SALIDA.mve_c_iestado == 3) // Cerrado, esto es proceso de negocio como hacerlo dedse afuera?
                //{
                //    ItemAlmacenDA iada = new ItemAlmacenDA();
                //    foreach (var item in _pSIC_T_MOVIMIENTO_SALIDA.SIC_T_MOVIMIENTO_SALIDA_DETALLE)
                //    {
                //        iada.ModificarItemAlmacen(contexto, item.itm_c_iid,
                //            item.alm_c_iid, item.mvs_det_c_ecant);
                //    }
                //    _pSIC_T_MOVIMIENTO_SALIDA.mvs_c_bingresado = true;
                //}

                // Necesitamos comprarar y eliminar
                List<SIC_T_MOVIMIENTO_SALIDA_DETALLE> eliminar = new List<SIC_T_MOVIMIENTO_SALIDA_DETALLE>();
                List<SIC_T_MOVIMIENTO_SALIDA_DETALLE> agregar = new List<SIC_T_MOVIMIENTO_SALIDA_DETALLE>();
                foreach (var detalle in sal.SIC_T_MOVIMIENTO_SALIDA_DETALLE)
                {
                    // Si no existe, lo borro de al bd
                    var encontrado = _pSIC_T_MOVIMIENTO_SALIDA.SIC_T_MOVIMIENTO_SALIDA_DETALLE.FirstOrDefault(x => x.mvs_det_c_iid == detalle.mvs_det_c_iid);
                    if (encontrado == null)
                    {
                        eliminar.Add(detalle);
                    }
                    else
                    {
                        contexto.ApplyCurrentValues("SICDBWEBEntities.SIC_T_MOVIMIENTO_SALIDA_DETALLE", encontrado);
                    }
                }

                foreach (var detalle in _pSIC_T_MOVIMIENTO_SALIDA.SIC_T_MOVIMIENTO_SALIDA_DETALLE)
                {
                    if (detalle.mvs_c_iid == 0)
                    {
                        agregar.Add(detalle);
                    }
                    else
                    {

                    }
                }

                foreach (var detalle in eliminar)
                {
                    contexto.SIC_T_MOVIMIENTO_SALIDA_DETALLE.Attach(detalle);
                    contexto.SIC_T_MOVIMIENTO_SALIDA_DETALLE.DeleteObject(detalle);
                }

                contexto.ApplyCurrentValues("SICDBWEBEntities.SIC_T_MOVIMIENTO_SALIDA", _pSIC_T_MOVIMIENTO_SALIDA);

                foreach (var detalle in agregar)
                {
                    detalle.itm_c_iid = detalle.SIC_T_ITEM.itm_c_iid;
                    detalle.SIC_T_ITEM = null;
                    sal.SIC_T_MOVIMIENTO_SALIDA_DETALLE.Add(detalle);
                }
                contexto.SaveChanges();
                return true;
            }            
        }
    }
}
