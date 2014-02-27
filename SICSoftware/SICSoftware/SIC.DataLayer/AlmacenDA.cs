using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;

namespace SIC.DataLayer
{
    public class AlmacenDA
    {
        public List<SIC_T_ALMACEN> ObtenerAlmacenes()
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_ALMACEN
                            where x.alm_c_bactivo == true
                            select x).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }


        public List<SIC_T_ALMACEN> ListaAlmacenCentroCosto(int idCentroCosto)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    var resultado = (from x in contexto.SIC_T_ALMACEN_CENTRO_COSTO
                                        .Include("SIC_T_ALMACEN")
                                     where x.alm_cst_c_iid_centro_costo == idCentroCosto
                                     select x.SIC_T_ALMACEN).ToList();
                    return resultado;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public SIC_T_ALMACEN ObtenerPorId(int id)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_ALMACEN
                            where x.alm_c_bactivo == true && x.alm_c_iid == id
                            select x).SingleOrDefault();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public SIC_T_ALMACEN ObtenerPorIdNoContext(int id)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    var item = (from x in contexto.SIC_T_ALMACEN
                            where x.alm_c_bactivo == true && x.alm_c_iid == id
                            select x).SingleOrDefault();
                    contexto.Detach(item);
                    return item;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }       
    }
}
