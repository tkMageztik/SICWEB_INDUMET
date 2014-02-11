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

        public void IngresarCentroCosto(SIC_T_EMP_CENTRO_COSTO _pSIC_T_EMP_CENTRO_COSTO)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    _pSIC_T_EMP_CENTRO_COSTO.emp_cst_c_bactivo = true;
                    _pSIC_T_EMP_CENTRO_COSTO.emp_cst_c_inumeroboleta = 1;
                    _pSIC_T_EMP_CENTRO_COSTO.emp_cst_c_inumerofact= 1;
                    contexto.AddToSIC_T_EMP_CENTRO_COSTO(_pSIC_T_EMP_CENTRO_COSTO);
                    contexto.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
