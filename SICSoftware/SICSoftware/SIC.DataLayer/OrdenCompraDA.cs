using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using System.Data;
using SIC.Data;

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
                                    .Include("SIC_T_CLIENTE")
                            where x.odc_c_bactivo == true
                            select x).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }   
        }

        /// <summary>
        /// Lista las ordenes de compra, incluye data del proveedor
        /// </summary>
        /// <returns>Lista de ordenes de compra.</returns>
        public List<SIC_T_ORDEN_DE_COMPRA> ListarOrdenDeCompra(byte? idMoneda, string idProveedor, int? idEstado)
        {
            //FILTROS DE LISTA DE ORDENES DE COMPRA (CODIGO CON LIKE %%,MONEDA, PROVEEDOR (EMPRESA), ESTADO)
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_ORDEN_DE_COMPRA
                                    .Include("SIC_T_CLIENTE")
                            where x.odc_c_bactivo == true &&
                                ( !idMoneda.HasValue || x.odc_c_ymoneda == idMoneda.Value) &&
                                ( idProveedor==null || x.odc_c_vdocprov_id.Contains(idProveedor)) &&
                                ( !idEstado.HasValue || x.odc_c_iestado == idEstado.Value)
                            select x).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public SIC_T_ORDEN_DE_COMPRA ObtenerORdenCompraPorCodigo(String codigo)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    var result = (from x in contexto.SIC_T_ORDEN_DE_COMPRA
                            where x.odc_c_bactivo == true && x.odc_c_vcodigo==codigo
                            select x);
                    if (result.Count() > 0)
                    {
                        return result.First();
                    }
                    else
                    {
                        return null;
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<SIC_T_ORDEN_DE_COMPRA> ListarOrdenDeCompraEstado(int estado)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_ORDEN_DE_COMPRA
                                    .Include("SIC_T_CLIENTE")
                            where x.odc_c_bactivo == true && x.odc_c_iestado == estado
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
                    var result = (from x in contexto.SIC_T_ORDEN_DE_COMPRA
                                        .Include("SIC_T_ORDEN_DE_COMPRA_DET.SIC_T_ITEM")
                                        .Include("SIC_T_CLIENTE")
                            where x.odc_c_iid == id && x.odc_c_bactivo == true
                            select x).SingleOrDefault();

                    return result;
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
        public SIC_T_ORDEN_DE_COMPRA ObtenerOrdenCompraNoContext(int id)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    contexto.SIC_T_ORDEN_DE_COMPRA.MergeOption = System.Data.Objects.MergeOption.NoTracking;
                    var result = (from x in contexto.SIC_T_ORDEN_DE_COMPRA
                                        .Include("SIC_T_CLIENTE")
                                        .Include("SIC_T_ORDEN_DE_COMPRA_DET.SIC_T_ITEM")                                        
                                  where x.odc_c_iid == id && x.odc_c_bactivo == true
                                  select x).SingleOrDefault();
                    SIC_T_CLIENTE cli = result.SIC_T_CLIENTE;
                    return result;
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
                        if (item.SIC_T_ITEM != null)
                        {
                            item.odc_c_iitemid = item.SIC_T_ITEM.itm_c_iid;
                            item.SIC_T_ITEM = null;         
                        }
                    }
                    _pSIC_T_ORDEN_DE_COMPRA.odc_c_bactivo = true;
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
                        item.odc_c_iitemid = item.SIC_T_ITEM.itm_c_iid;
                        item.SIC_T_ITEM = null;
                        _pSIC_T_ORDEN_DE_COMPRA.SIC_T_ORDEN_DE_COMPRA_DET.Add(item);
                    }
                    _pSIC_T_ORDEN_DE_COMPRA.odc_c_bactivo = true;
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
                        if(detalle.SIC_T_ITEM != null)
                        {
                            detalle.odc_c_iitemid = detalle.SIC_T_ITEM.itm_c_iid;
                            detalle.SIC_T_ITEM = null;    
                        }

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

        public List<SIC_T_ODC_CLASE> ListarClasesOrdenCompra()
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_ODC_CLASE
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
                SIC_T_ORDEN_DE_COMPRA varItem = (from x in contexto.SIC_T_ORDEN_DE_COMPRA
                                      where x.odc_c_iid == id
                                      select x).FirstOrDefault();
                if (varItem != null)
                {
                    varItem.odc_c_iestado = 5; // ANULADO
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
