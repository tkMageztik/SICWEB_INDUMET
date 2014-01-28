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

        public List<SIC_T_ITEM> ListarItems(string codigo, string descripcion, int? idSubFamilia)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_ITEM
                            .Include("SIC_T_ITEM_SUB_FAMILIA")
                            where x.itm_c_bactivo == true
                              && (codigo == string.Empty || x.itm_c_ccodigo.Contains(codigo))
                              && (descripcion == string.Empty || x.itm_c_vdescripcion.Contains(descripcion) )
                              && (!idSubFamilia.HasValue || x.itm_c_isf_iid == idSubFamilia.Value) 

                            select x).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

       
       

        /// <summary>
        /// Inserta el item en la base de datos.
        /// </summary>
        /// <param name="_pSIC_T_ITEM">El item a insertar.</param>
        /// <exception cref="System.ArgumentException">Lanzado cuando el código ya existe en la base de datos.</exception>
        /// <exception cref="Syste.Data.OptimisticConcurrencyException">Lanzado cuando ocurre una excepción de 
        /// EntityFramework al guardar el contexto.</exception>
        /// <returns></returns>
        public bool InsertarItem(SIC_T_ITEM _pSIC_T_ITEM)
        {
            try
            {
                
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    int count = (from x in contexto.SIC_T_ITEM
                                 where x.itm_c_ccodigo.Equals(_pSIC_T_ITEM.itm_c_ccodigo)
                                 select x).ToList().Count;

                    if (count > 0)
                    {
                        throw new ArgumentException("No se puede ingresar un código duplicado.");
                    }


                    _pSIC_T_ITEM.itm_c_bactivo = true;
                    contexto.AddToSIC_T_ITEM(_pSIC_T_ITEM);                    
                    contexto.SaveChanges();
                    return true;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
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
                    throw;
                }
            }
        }

        public SIC_T_ITEM ObtenerItemPorId(int id)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                return (from x in contexto.SIC_T_ITEM
                            .Include("SIC_T_ITEM_SUB_FAMILIA")
                        where x.itm_c_iid == id && x.itm_c_bactivo 
                        select x).FirstOrDefault();
            }
        }

        public SIC_T_ITEM ObtenerItemPorIdNoContext(int id)
        {            
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                contexto.SIC_T_ITEM.MergeOption = System.Data.Objects.MergeOption.NoTracking;
                var item = (from x in contexto.SIC_T_ITEM
                        where x.itm_c_iid == id && x.itm_c_bactivo == true
                        select x).FirstOrDefault();
                return item;
            }
        }

        public bool DeshabilitarItem(int id)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                SIC_T_ITEM varItem = (from x in contexto.SIC_T_ITEM
                                      where x.itm_c_iid == id
                                      select x).FirstOrDefault();
                if (varItem != null)
                {
                    varItem.itm_c_bactivo = false;
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

        public List<SIC_T_ITEM_FAMILIA> ListarFamiliaItem()
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_ITEM_FAMILIA
                                .Include("SIC_T_ITEM_SUB_FAMILIA")
                            where x.ifm_c_bactivo
                            select x).ToList();
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public List<SIC_T_ITEM_SUB_FAMILIA> ListarSubFamiliaItem(int idFamilia)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_ITEM_SUB_FAMILIA
                            where x.isf_c_bactivo && x.isf_c_ifm_iid == idFamilia
                            select x).ToList();
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        #endregion

    }
}
