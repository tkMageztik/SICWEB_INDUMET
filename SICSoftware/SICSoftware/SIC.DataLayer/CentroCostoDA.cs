using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;

namespace SIC.DataLayer
{
    public class CentroCostoDA
    {
        public List<SIC_T_EMP_CENTRO_COSTO> ListarCentroCosto()
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_EMP_CENTRO_COSTO
                            where x.emp_cst_c_bactivo == true
                            select x).ToList();
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}
