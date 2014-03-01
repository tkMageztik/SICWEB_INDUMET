using System;
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

        public List<SIC_T_VENTA> ListarVentas(string ruc, string razonSocial, DateTime? inicio, DateTime? fin)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_VENTA
                                    .Include("SIC_T_CLIENTE")
                            where x.ven_c_bactivo == true
                                && x.ven_c_iestado != 3
                                && (ruc== null || ruc==string.Empty || 
                                            (x.SIC_T_CLIENTE!=null
                                            && x.SIC_T_CLIENTE.cli_c_vdoc_id.Contains(ruc)))
                                && (razonSocial == null || razonSocial == string.Empty ||
                                            (x.SIC_T_CLIENTE!=null
                                            && x.SIC_T_CLIENTE.cli_c_vraz_soc.Contains(razonSocial)))
                                && (inicio==null || x.ven_c_zfecha >= inicio)
                                && (fin==null || (x.ven_c_zfecha.Year <= fin.Value.Year 
                                                 && x.ven_c_zfecha.Month <= fin.Value.Month 
                                                 && x.ven_c_zfecha.Day <= fin.Value.Day)) 
                            select x).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }   
        }

        /// <summary>
        /// Lista las ventas registradas en el sistema que correspondan 
        /// a un año, mes y tengan un estado especifico.
        /// </summary>
        /// <param name="year">El año de la venta.</param>
        /// <param name="month">El mes de la venta.</param>
        /// <param name="estado">El estado de la venta.</param>
        /// <returns>Listado de ventas filtrado de acuerdo a los parámetros.</returns>
        public List<SIC_T_VENTA> ListarVentas(int year, int month, int estado)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                return (from x in contexto.SIC_T_VENTA
                                    .Include("SIC_T_CLIENTE")
                        where x.ven_c_bactivo == true
                            && x.ven_c_iestado == estado
                            && x.ven_c_zfecha.Year == year
                            && x.ven_c_zfecha.Month == month
                        select x).ToList();
            }
        }

        public List<SIC_T_VENTA> ListarOrdenDeCompraEstado(int estado)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Obtiene la venta por id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public SIC_T_VENTA ObtenerVenta(int id)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    contexto.SIC_T_VENTA.MergeOption = System.Data.Objects.MergeOption.NoTracking;
                    return (from x in contexto.SIC_T_VENTA
                                        .Include("SIC_T_VENTA_DETALLE.SIC_T_ITEM")
                                        .Include("SIC_T_VENTA_DETALLE.SIC_T_ALMACEN")
                                        .Include("SIC_T_CLIENTE.SIC_T_CLI_DIRECCION")
                                        .Include("SIC_T_EMP_CENTRO_COSTO")                                        
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
        public bool InsertarVenta(SIC_T_VENTA _pSIC_T_VENTA)
        {
            try
            {

                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    foreach (var item in _pSIC_T_VENTA.SIC_T_VENTA_DETALLE)
                    {
                        item.ven_det_c_iitemid = item.SIC_T_ITEM.itm_c_iid;
                        item.SIC_T_ITEM = null;
                        item.ven_det_c_iidalmacen = item.SIC_T_ALMACEN.alm_c_iid;
                        item.SIC_T_ALMACEN = null;
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

        public bool ModificarVenta(SIC_T_VENTA _pSIC_T_VENTA)
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

                    foreach (var detalle in agregar)
                    {
                        detalle.ven_det_c_iitemid = detalle.SIC_T_ITEM.itm_c_iid;
                        detalle.SIC_T_ITEM = null;
                        detalle.ven_c_iid  = detalle.SIC_T_VENTA.ven_c_iid;
                        detalle.SIC_T_VENTA = null;
                        detalle.ven_det_c_iidalmacen = detalle.SIC_T_ALMACEN.alm_c_iid;
                        detalle.SIC_T_ALMACEN = null;
                        ven.SIC_T_VENTA_DETALLE.Add(detalle);
                    }

                    contexto.ApplyCurrentValues("SICDBWEBEntities.SIC_T_VENTA", _pSIC_T_VENTA);



                    contexto.SaveChanges();
                    return true;
                }
            }
            catch (Exception ex)
            {
                throw;
            }      
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
                    varItem.ven_c_iestado = 3;
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

        public List<SIC_T_VEN_ESTADO> ListarEstadoVenta()
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_VEN_ESTADO
                            select x).ToList();
                }
            }
            catch
            {
                throw;
            }
        }


    }
    
}
