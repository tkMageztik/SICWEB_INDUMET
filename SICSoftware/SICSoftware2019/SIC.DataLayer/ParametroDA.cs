using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;

namespace SIC.DataLayer
{
    public class ParametroDA{

        public List<SIC_T_PARAMETRO_DET> ListarParametros(int _pIdParametro)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_PARAMETRO_DET
                            where x.par_c_iid == _pIdParametro
                            select x).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}
