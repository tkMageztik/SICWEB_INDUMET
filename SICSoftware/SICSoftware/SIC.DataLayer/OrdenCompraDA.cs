﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;

namespace SIC.DataLayer
{
    public class OrdenCompraDA
    {
        /// <summary>
        /// Lista las ordenes de compra, incluye data del proveedor
        /// </summary>
        /// <returns>Lista de ordenes de compra.</returns>
        public List<SIC_T_ORDEN_DE_COMPRA> ListarOrdenDeCompra()
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_ORDEN_DE_COMPRA
                                    .Include("SIC_T_PROVEEDOR")
                            select x).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }   
        }

        /// <summary>
        /// Obtiene la orden de compra por id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public SIC_T_ORDEN_DE_COMPRA ObtenerOrdenCompra(int id)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_ORDEN_DE_COMPRA
                                        .Include("SIC_T_ORDEN_DE_COMPRA_DET.SIC_T_ITEM")
                                        .Include("SIC_T_PROVEEDOR")
                            where x.odc_c_iid == id && x.ocd_c_bactivo == true
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
        /// <param name="_pSIC_T_ORDEN_DE_COMPRA">Orden de compra</param>
        /// <returns><c>True</c> si se inserto correctamente</returns>
        public bool InsertarOrdenCompra(SIC_T_ORDEN_DE_COMPRA _pSIC_T_ORDEN_DE_COMPRA)
        {
            try
            {

                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    foreach (var item in _pSIC_T_ORDEN_DE_COMPRA.SIC_T_ORDEN_DE_COMPRA_DET)
                    {
                        item.ocd_c_iitemid = item.SIC_T_ITEM.itm_c_iid;
                        item.SIC_T_ITEM = null;                        
                        //contexto.Attach(item.SIC_T_ITEM);
                    }
                    contexto.AddToSIC_T_ORDEN_DE_COMPRA(_pSIC_T_ORDEN_DE_COMPRA);                    
                    contexto.SaveChanges();
                    return true;
                }
            }
            catch (Exception ex)
            {
                throw;
            }  
        }

        public bool InsertarOrdenCompra(SIC_T_ORDEN_DE_COMPRA _pSIC_T_ORDEN_DE_COMPRA,
                                        List<SIC_T_ORDEN_DE_COMPRA_DET> _pSIC_T_ORDEN_DE_COMPRA_DET)
        {
            try
            {

                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    _pSIC_T_ORDEN_DE_COMPRA.SIC_T_ORDEN_DE_COMPRA_DET =
                        new System.Data.Objects.DataClasses.EntityCollection<SIC_T_ORDEN_DE_COMPRA_DET>();
                    foreach (var item in _pSIC_T_ORDEN_DE_COMPRA_DET)
                    {
                        item.ocd_c_iitemid = item.SIC_T_ITEM.itm_c_iid;
                        item.SIC_T_ITEM = null;
                        _pSIC_T_ORDEN_DE_COMPRA.SIC_T_ORDEN_DE_COMPRA_DET.Add(item);
                    }
                    contexto.AddToSIC_T_ORDEN_DE_COMPRA(_pSIC_T_ORDEN_DE_COMPRA);
                    contexto.SaveChanges();
                    return true;
                }
            }
            catch (Exception ex)
            {
                throw;
            }  
        }

        public bool ModificarOrdenCompra(SIC_T_ORDEN_DE_COMPRA _pSIC_T_ORDEN_DE_COMPRA)
        {
            try
            {

                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    SIC_T_ORDEN_DE_COMPRA oc = (from x in contexto.SIC_T_ORDEN_DE_COMPRA
                                                        .Include("SIC_T_ORDEN_DE_COMPRA_DET")
                                                where x.odc_c_iid == _pSIC_T_ORDEN_DE_COMPRA.odc_c_iid                                                    
                                                select x).FirstOrDefault();

                    // Necesitamos comprarar y eliminar
                    List<SIC_T_ORDEN_DE_COMPRA_DET> eliminar = new List<SIC_T_ORDEN_DE_COMPRA_DET>();
                    List<SIC_T_ORDEN_DE_COMPRA_DET> agregar = new List<SIC_T_ORDEN_DE_COMPRA_DET>();
                    foreach (var detalle in oc.SIC_T_ORDEN_DE_COMPRA_DET)
                    {
                        // Si no existe, lo borro de al bd
                        var encontrado = _pSIC_T_ORDEN_DE_COMPRA.SIC_T_ORDEN_DE_COMPRA_DET.FirstOrDefault(x => x.odc_det_c_iid == detalle.odc_det_c_iid);
                        if (encontrado ==null)
                        {
                            eliminar.Add(detalle);
                        }
                        else
                        {
                            contexto.ApplyCurrentValues("SICDBWEBEntities.SIC_T_ORDEN_DE_COMPRA_DET", encontrado);
                        }
                    }

                    foreach (var detalle in _pSIC_T_ORDEN_DE_COMPRA.SIC_T_ORDEN_DE_COMPRA_DET)
                    {
                        if (detalle.odc_c_iid == 0)
                        {
                            agregar.Add(detalle);
                        }
                        else
                        {

                        }
                    }

                    foreach (var detalle in eliminar)
                    {
                        contexto.SIC_T_ORDEN_DE_COMPRA_DET.Attach(detalle);
                        contexto.SIC_T_ORDEN_DE_COMPRA_DET.DeleteObject(detalle);
                    }                   

                    contexto.ApplyCurrentValues("SICDBWEBEntities.SIC_T_ORDEN_DE_COMPRA", _pSIC_T_ORDEN_DE_COMPRA);

                    foreach (var detalle in agregar)
                    {
                        detalle.ocd_c_iitemid = detalle.SIC_T_ITEM.itm_c_iid;
                        detalle.SIC_T_ITEM = null;      
                        oc.SIC_T_ORDEN_DE_COMPRA_DET.Add(detalle);                         
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


        public bool ModificarOrdenCompra(SIC_T_ORDEN_DE_COMPRA _pSIC_T_ORDEN_DE_COMPRA,
                     List<SIC_T_ORDEN_DE_COMPRA_DET> _pSIC_T_ORDEN_DE_COMPRA_DET_Add)
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

    }
}