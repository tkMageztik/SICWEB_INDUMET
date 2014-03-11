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

        public List<SIC_T_ITEM> ListarItems(string codigo, string descripcion, int? idFamilia, int? idSubFamilia)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_ITEM
                            .Include("SIC_T_ITEM_SUB_FAMILIA")
                            .Include("SIC_T_ITEM_SUB_FAMILIA.SIC_T_ITEM_FAMILIA")
                            where x.itm_c_bactivo == true
                              && (codigo == string.Empty || x.itm_c_ccodigo.Contains(codigo))
                              && (descripcion == string.Empty || x.itm_c_vdescripcion.Contains(descripcion))
                              && (idSubFamilia.HasValue ? x.isf_c_iid == idSubFamilia
                                                         : (!idFamilia.HasValue
                                                            || x.SIC_T_ITEM_SUB_FAMILIA.isf_c_ifm_iid == idFamilia.Value)
                                 )
                            orderby x.itm_c_vdescripcion ascending 
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
                    if (contexto.SIC_T_ITEM.Any(x => x.itm_c_ccodigo == _pSIC_T_ITEM.itm_c_ccodigo))
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
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    if (contexto.SIC_T_ITEM.Any(x
                        => x.itm_c_iid != _pSIC_T_ITEM.itm_c_iid && x.itm_c_ccodigo == _pSIC_T_ITEM.itm_c_ccodigo))
                    {
                        throw new ArgumentException("No se puede ingresar un código duplicado.");
                    }

                    SIC_T_ITEM varItem = (from x in contexto.SIC_T_ITEM
                                          where x.itm_c_iid == _pSIC_T_ITEM.itm_c_iid
                                          select x).FirstOrDefault();
                    contexto.ApplyCurrentValues("SICDBWEBEntities.SIC_T_ITEM", _pSIC_T_ITEM);
                    contexto.SaveChanges();
                    return true; // Nunca tira falso, bool no deberia ir. 
                }
            }
            catch
            {
                throw;
            }
        }

        public SIC_T_ITEM ObtenerItemPorId(int id)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                return (from x in contexto.SIC_T_ITEM
                            .Include("SIC_T_ITEM_SUB_FAMILIA")
                            .Include("SIC_T_ITEM_SUB_FAMILIA.SIC_T_ITEM_FAMILIA")
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
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    SIC_T_ITEM varItem = (from x in contexto.SIC_T_ITEM
                                          where x.itm_c_iid == id
                                          select x).FirstOrDefault();

                    if (contexto.SIC_T_ITEM_ALMACEN.Any(x => x.itm_c_iid == id && x.itm_alm_c_ecantidad != 0))
                    {
                        return false;
                        //throw new ArgumentException("No se puede eliminar un articulo que tenga stock diferente a 0");
                    }
                    else if (contexto.SIC_T_ORDEN_DE_COMPRA_DET.Any(x => x.odc_c_iitemid == id))
                    {
                        return false;
                        //throw new ArgumentException("No se puede eliminar un articulo que se encuentre registrado en una orden de compra.");
                    }

                    if (varItem != null)
                    {
                        varItem.itm_c_bactivo = false;
                    }

                    contexto.SaveChanges();
                    return true;

                }
            }
            catch (OptimisticConcurrencyException ex)
            {
                throw;
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
            catch
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

        public void AgregarFamilia(SIC_T_ITEM_FAMILIA _pSIC_T_ITEM_FAMILIA)
        {
            if (_pSIC_T_ITEM_FAMILIA == null)
            {
                throw new ArgumentException("El objeto familia no puede ser nulo");
            }
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    _pSIC_T_ITEM_FAMILIA.ifm_c_des = _pSIC_T_ITEM_FAMILIA.ifm_c_des.Trim();
                    _pSIC_T_ITEM_FAMILIA.ifm_c_bactivo = true;
                    var result = (from x in contexto.SIC_T_ITEM_FAMILIA
                                  where x.ifm_c_des == _pSIC_T_ITEM_FAMILIA.ifm_c_des
                                  select x).Count();
                    if (result > 0)
                    {
                        throw new ArgumentException("Nombre de Familia ya existe.");
                    }
                    else
                    {
                        contexto.AddToSIC_T_ITEM_FAMILIA(_pSIC_T_ITEM_FAMILIA);
                        contexto.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public void AgregarSubFamilia(SIC_T_ITEM_SUB_FAMILIA _pSIC_T_ITEM_SUB_FAMILIA)
        {
            if (_pSIC_T_ITEM_SUB_FAMILIA == null)
            {
                throw new ArgumentException("El objeto subfamilia no puede ser nulo");
            }
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    _pSIC_T_ITEM_SUB_FAMILIA.isf_c_vdesc = _pSIC_T_ITEM_SUB_FAMILIA.isf_c_vdesc.Trim();
                    _pSIC_T_ITEM_SUB_FAMILIA.isf_c_bactivo = true;
                    if (_pSIC_T_ITEM_SUB_FAMILIA.SIC_T_ITEM_FAMILIA != null)
                    {
                        _pSIC_T_ITEM_SUB_FAMILIA.isf_c_ifm_iid = _pSIC_T_ITEM_SUB_FAMILIA.SIC_T_ITEM_FAMILIA.ifm_c_iid;
                        _pSIC_T_ITEM_SUB_FAMILIA.SIC_T_ITEM_FAMILIA = null;
                    }

                    var result = (from x in contexto.SIC_T_ITEM_SUB_FAMILIA
                                  where x.isf_c_vdesc == _pSIC_T_ITEM_SUB_FAMILIA.isf_c_vdesc
                                  select x).Count();

                    if (result > 0)
                    {
                        throw new ArgumentException("Nombre de Familia ya existe.");
                    }
                    else
                    {
                        contexto.AddToSIC_T_ITEM_SUB_FAMILIA(_pSIC_T_ITEM_SUB_FAMILIA);
                        contexto.SaveChanges();
                    }
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
