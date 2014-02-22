using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;

namespace SIC.DataLayer
{
    public class ItemAlmacenDA
    {       
        internal void ModificarItemAlmacen(SICDBWEBEntities contexto, int idItem, int idAlmacen, decimal cantidad)
        {
            // El proceso buscara si existe un item_almacen con los datos de item y almacen ingresados.
            // si lo encuentra actualizará la data, en caso contrario creará una nueva.            
            var resultado = (from x in contexto.SIC_T_ITEM_ALMACEN
                                where x.alm_c_iid == idAlmacen
                                    && x.itm_c_iid == idItem
                                select x).FirstOrDefault();
            if (resultado == null)
            {
                var itemAlm = new SIC_T_ITEM_ALMACEN();
                itemAlm.alm_c_iid = idAlmacen;
                itemAlm.itm_c_iid = idItem;
                itemAlm.itm_alm_c_ecantidad = cantidad;
                contexto.AddToSIC_T_ITEM_ALMACEN(itemAlm);
            }
            else
            {
                resultado.itm_alm_c_ecantidad += cantidad;
                contexto.ApplyCurrentValues("SICDBWEBEntities.SIC_T_ITEM_ALMACEN", resultado);
            }
        }

        public decimal ObtenerStockItemAlmacen(int idAlmacen, int idItem)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    var res = (from x in contexto.SIC_T_ITEM_ALMACEN                               
                                where x.alm_c_iid == idAlmacen && x.itm_c_iid == idItem
                                select x).ToList();
                    if(res.Count >0)
                    {
                        return res.First().itm_alm_c_ecantidad;
                    }
                    else
                    {
                        return 0;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<SIC_T_ITEM_ALMACEN> ListarItemAlmacen(string codigo, string descripcion, int? idFamilia, int? idSubFamilia, params int[] idAlmacen)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    contexto.SIC_T_ITEM_ALMACEN.MergeOption = System.Data.Objects.MergeOption.NoTracking;
                    var resultado = (from x in contexto.SIC_T_ITEM_ALMACEN
                                      .Include("SIC_T_ITEM")
                                      .Include("SIC_T_ALMACEN")
                                      .Include("SIC_T_ITEM.SIC_T_ITEM_SUB_FAMILIA")
                                      .Include("SIC_T_ITEM.SIC_T_ITEM_SUB_FAMILIA.SIC_T_ITEM_FAMILIA")
                                     where ( idAlmacen.Contains(x.alm_c_iid) )
                                        && (codigo == string.Empty || x.SIC_T_ITEM.itm_c_ccodigo.Contains(codigo))
                                        && (descripcion == string.Empty || x.SIC_T_ITEM.itm_c_vdescripcion.Contains(descripcion) )
                                        && ( idSubFamilia.HasValue ? x.SIC_T_ITEM.isf_c_iid == idSubFamilia 
                                                         : (!idFamilia.HasValue 
                                                            || x.SIC_T_ITEM.SIC_T_ITEM_SUB_FAMILIA.isf_c_ifm_iid == idFamilia.Value)
                                           )
                                      select x
                                     ).ToList();
                    return resultado;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }

    
}
