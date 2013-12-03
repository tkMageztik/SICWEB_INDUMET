using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using System.Data;

namespace SIC.DataLayer
{
    public class ItemDA
    {

        #region "Métodos"

        public List<SIC_T_ITEM> ListarItems()
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {                    
                    return (from x in contexto.SIC_T_ITEM
                            select x).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public bool InsertarItem(SIC_T_ITEM _pSIC_T_ITEM)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    contexto.AddToSIC_T_ITEM(_pSIC_T_ITEM);                    
                    contexto.SaveChanges();
                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
            finally { }
        }

        public bool ModificarItem(SIC_T_ITEM _pSIC_T_ITEM)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                SIC_T_ITEM varItem = (from x in contexto.SIC_T_ITEM
                                      where x.itm_c_iid == _pSIC_T_ITEM.itm_c_iid
                                      select x).FirstOrDefault();

                contexto.ApplyCurrentValues("SICDBWEBEntities.SIC_T_ITEM", _pSIC_T_ITEM);
                try
                {
                    contexto.SaveChanges();
                    return true;
                }
                catch (OptimisticConcurrencyException ex)
                {
                    Console.Write(ex.Message);
                }
                return false;
            }
        }

        public SIC_T_ITEM ObtenerItemPorId(int id)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                return (from x in contexto.SIC_T_ITEM
                        where x.itm_c_iid == id
                        select x).FirstOrDefault();
            }
        }

        #endregion

    }
}
