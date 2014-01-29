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
        public List<SIC_T_ITEM_ALMACEN> ListarItemAlmacen(int? idAlmacen, string codigo, string descripcion, int? idFamilia, int? idSubFamilia)
        {
            return new ItemAlmacenDA().ListarItemAlmacen(idAlmacen, codigo, descripcion, idFamilia, idSubFamilia);
        }
    }
}
