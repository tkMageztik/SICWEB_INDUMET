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

        public List<SIC_T_ITEM> ListarItems(string codigo, string descripcion)
        {
            return new ItemDA().ListarItems(codigo,descripcion);
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

        public SIC_T_ITEM ObtenerItemPorIdNoContext(int id)
        {
            return new ItemDA().ObtenerItemPorIdNoContext(id);
        }

        public bool DeshabilitarItem(int id)
        {
            return new ItemDA().DeshabilitarItem(id);
        }

        public List<SIC_T_ITEM_FAMILIA> ListarFamiliaItem()
        {
            return new ItemDA().ListarFamiliaItem();
        }

        public List<SIC_T_ITEM_SUB_FAMILIA> ListarSubFamiliaItem(int idFamilia)
        {
            return new ItemDA().ListarSubFamiliaItem(idFamilia);
        }

        #endregion
    }
}
