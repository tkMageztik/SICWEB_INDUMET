using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;

namespace SIC.DataLayer
{
    public class OrdenCompraDA
    {
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

        public SIC_T_ORDEN_DE_COMPRA ObtenerOrdenCompra(int id)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_ORDEN_DE_COMPRA
                                        .Include("SIC_T_ORDEN_DE_COMPRA_DET")
                                        .Include("SIC_T_ITEM")
                                        .Include("SIC_T_PROVEEDOR")
                            where x.odc_c_iid == id
                            select x).SingleOrDefault();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

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

        public bool ModificarOrdenCompra(SIC_T_ORDEN_DE_COMPRA _pSIC_T_ORDEN_DE_COMPRA)
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
