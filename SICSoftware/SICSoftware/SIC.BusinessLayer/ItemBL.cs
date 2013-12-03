using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using SIC.DataLayer;

namespace SIC.BusinessLayer
{
    public class ItemBL
    {
        #region "METODOS"

        public List<SIC_T_ITEM> ListarItems()
        {
            return new ItemDA().ListarItems();
        }

        public bool InsertarItem(SIC_T_ITEM _pSIC_T_ITEM)
        {
            return new ItemDA().InsertarItem(_pSIC_T_ITEM);
        }

        public bool ModificarItem(SIC_T_ITEM _pSIC_T_ITEM)
        {
            return new ItemDA().ModificarItem(_pSIC_T_ITEM);
        }

        public SIC_T_ITEM ObtenerItemPorId(int id)
        {
            return new ItemDA().ObtenerItemPorId(id);
        }

        #endregion
    }
}
