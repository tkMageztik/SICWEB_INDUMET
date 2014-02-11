using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;

namespace SIC.DataLayer
{
    public class EmpresaDA
    {
        public List<SIC_T_EMP_DIRECCION> ListarDireccionEmpresa()
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_EMP_DIRECCION
                                .Include("SIC_T_EMP_CENTRO_COSTO")
                            where x.emp_dir_c_bactivo == true
                            select x).ToList();
                }
            }
            catch
            {
                throw;
            }

        }


        public SIC_T_EMP_DIRECCION ObtenerDireccionEmpresa(int id)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    var res =  (from x in contexto.SIC_T_EMP_DIRECCION
                            where x.emp_dir_c_bactivo == true && x.emp_dir_c_iid == id
                            select x);
                    if (res.Count() > 0)
                    {
                        return res.First();
                    }
                    else
                    {
                        return null;
                    }
                }
            }
            catch
            {
                throw;
            }

        }

        public SIC_T_EMPRESA ObtenerDatosEmpresa()
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    var res = (from x in contexto.SIC_T_EMPRESA                               
                               select x);
                    if (res.Count() > 0)
                    {
                        return res.First();
                    }
                    else
                    {
                        return null;
                    }
                }
            }
            catch
            {
                throw;
            }
        }
    }
}
