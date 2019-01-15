using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using SIC.DataLayer;

namespace SIC.BusinessLayer
{
    public class ItemAlmacenBL
    {
        public List<SIC_T_ITEM_ALMACEN> ListarItemAlmacen(string codigo, string descripcion, int? idFamilia, int? idSubFamilia, params int[] idAlmacen)
        {
            return new ItemAlmacenDA().ListarItemAlmacen(codigo, descripcion, idFamilia, idSubFamilia, idAlmacen);
        }

        public decimal ObtenerStockItemAlmacen(int idAlmacen, int idItem)
        {
            return new ItemAlmacenDA().ObtenerStockItemAlmacen(idAlmacen, idItem);
        }
    }
}
