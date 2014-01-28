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
                                where x.itm_alm_c_iid_alm == idAlmacen
                                    && x.itm_alm_c_iid_item == idItem
                                select x).FirstOrDefault();
            if (resultado == null)
            {
                var itemAlm = new SIC_T_ITEM_ALMACEN();
                itemAlm.itm_alm_c_iid_alm = idAlmacen;
                itemAlm.itm_alm_c_iid_item = idItem;
                itemAlm.itm_alm_c_ecantidad = cantidad;
                contexto.AddToSIC_T_ITEM_ALMACEN(itemAlm);
            }
            else
            {
                resultado.itm_alm_c_ecantidad += cantidad;
                contexto.ApplyCurrentValues("SICDBWEBEntities.SIC_T_ITEM_ALMACEN", resultado);
            }
        }

    }

    
}
