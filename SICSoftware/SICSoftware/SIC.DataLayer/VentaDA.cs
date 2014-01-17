﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using System.Data;

namespace SIC.DataLayer
{
    public class VentaDA
    {
        
        public List<SIC_T_VENTA> ListarVentas()
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_VENTA
                                    .Include("SIC_T_CLIENTE")
                            where x.ven_c_bactivo == true
                            select x).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }   
        }

        public List<SIC_T_VENTA> ListarOrdenDeCompraEstado(int estado)
        {
            throw new NotImplementedException();
            //try
            //{
            //    using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            //    {
            //        return (from x in contexto.SIC_T_VENTA
            //                        .Include("SIC_T_CLIENTE")
            //                where x.ven_c_bactivo == true && x.ven_c_iestado == estado
            //                select x).ToList();
            //    }
            //}
            //catch (Exception)
            //{
            //    throw;
            //}
        }

        /// <summary>
        /// Obtiene la orden de compra por id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public SIC_T_VENTA ObtenerOrdenCompra(int id)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_VENTA
                                        .Include("SIC_T_VENTA_DETALLE.SIC_T_ITEM")
                                        .Include("SIC_T_CLIENTE")
                            where x.ven_c_iid == id && x.ven_c_bactivo == true
                            select x).SingleOrDefault();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        /// <summary>
        /// Inserta la orden de compra.
        /// </summary>
        /// <param name="_pSIC_T_VENTA">Orden de compra</param>
        /// <returns><c>True</c> si se inserto correctamente</returns>
        public bool InsertarOrdenCompra(SIC_T_VENTA _pSIC_T_VENTA)
        {
            try
            {

                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    foreach (var item in _pSIC_T_VENTA.SIC_T_VENTA_DETALLE)
                    {
                        item.ven_det_c_iitemid = item.SIC_T_ITEM.itm_c_iid;
                        item.SIC_T_ITEM = null;                        
                        //contexto.Attach(item.SIC_T_ITEM);
                    }
                    _pSIC_T_VENTA.ven_c_bactivo = true;
                    contexto.AddToSIC_T_VENTA(_pSIC_T_VENTA);                    
                    contexto.SaveChanges();
                    return true;
                }
            }
            catch (Exception ex)
            {
                throw;
            }  
        }

        public bool InsertarOrdenCompra(SIC_T_VENTA _pSIC_T_VENTA,
                                        List<SIC_T_VENTA_DETALLE> _pSIC_T_VENTA_DETALLE)
        {
            try
            {

                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    _pSIC_T_VENTA.SIC_T_VENTA_DETALLE =
                        new System.Data.Objects.DataClasses.EntityCollection<SIC_T_VENTA_DETALLE>();
                    foreach (var item in _pSIC_T_VENTA_DETALLE)
                    {
                        item.ven_det_c_iitemid = item.SIC_T_ITEM.itm_c_iid;
                        item.SIC_T_ITEM = null;
                        _pSIC_T_VENTA.SIC_T_VENTA_DETALLE.Add(item);
                    }
                    _pSIC_T_VENTA.ven_c_bactivo = true;
                    contexto.AddToSIC_T_VENTA(_pSIC_T_VENTA);
                    contexto.SaveChanges();
                    return true;
                }
            }
            catch (Exception ex)
            {
                throw;
            }  
        }

        public bool ModificarOrdenCompra(SIC_T_VENTA _pSIC_T_VENTA)
        {
            try
            {

                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    SIC_T_VENTA ven = (from x in contexto.SIC_T_VENTA
                                                        .Include("SIC_T_VENTA_DETALLE")
                                                where x.ven_c_iid == _pSIC_T_VENTA.ven_c_iid                                                    
                                                select x).FirstOrDefault();

                    // Necesitamos comprarar y eliminar
                    List<SIC_T_VENTA_DETALLE> eliminar = new List<SIC_T_VENTA_DETALLE>();
                    List<SIC_T_VENTA_DETALLE> agregar = new List<SIC_T_VENTA_DETALLE>();
                    foreach (var detalle in ven.SIC_T_VENTA_DETALLE)
                    {
                        // Si no existe, lo borro de al bd
                        var encontrado = _pSIC_T_VENTA.SIC_T_VENTA_DETALLE.FirstOrDefault(x => x.ven_det_c_iid == detalle.ven_det_c_iid);
                        if (encontrado ==null)
                        {
                            eliminar.Add(detalle);
                        }
                        else
                        {
                            contexto.ApplyCurrentValues("SICDBWEBEntities.SIC_T_VENTA_DETALLE", encontrado);
                        }
                    }

                    foreach (var detalle in _pSIC_T_VENTA.SIC_T_VENTA_DETALLE)
                    {
                        if (detalle.ven_c_iid == 0)
                        {
                            agregar.Add(detalle);
                        }
                        else
                        {

                        }
                    }

                    foreach (var detalle in eliminar)
                    {
                        contexto.SIC_T_VENTA_DETALLE.Attach(detalle);
                        contexto.SIC_T_VENTA_DETALLE.DeleteObject(detalle);
                    }                   

                    contexto.ApplyCurrentValues("SICDBWEBEntities.SIC_T_VENTA", _pSIC_T_VENTA);

                    foreach (var detalle in agregar)
                    {
                        detalle.ven_det_c_iitemid = detalle.SIC_T_ITEM.itm_c_iid;
                        detalle.SIC_T_ITEM = null;      
                        ven.SIC_T_VENTA_DETALLE.Add(detalle);                         
                    }

                    contexto.SaveChanges();
                    return true;
                }
            }
            catch (Exception ex)
            {
                throw;
            }      
        }


        public bool ModificarOrdenCompra(SIC_T_VENTA _pSIC_T_VENTA,
                     List<SIC_T_VENTA_DETALLE> _pSIC_T_VENTA_DETALLE_Add)
        {
            throw new NotImplementedException();
        }

        public List<SIC_T_ODC_ESTADO> ListarEstadosOrdenCompra()
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_ODC_ESTADO
                            select x).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }


        public bool DeshabilitarOrdenCompra(int id)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                SIC_T_VENTA varItem = (from x in contexto.SIC_T_VENTA
                                      where x.ven_c_iid == id
                                      select x).FirstOrDefault();
                if (varItem != null)
                {
                    varItem.ven_c_bactivo = false;
                }

                try
                {
                    contexto.SaveChanges();
                    return true;
                }
                catch (OptimisticConcurrencyException ex)
                {
                    throw;
                }
            }
        }
    }
    
}