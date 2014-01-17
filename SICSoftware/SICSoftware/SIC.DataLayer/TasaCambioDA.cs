using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;

namespace SIC.DataLayer
{
    public class TasaCambioDA
    {
        public SIC_T_TASA_CAMBIO ObtenerTasaCambio(DateTime fecha)
        {
            try
            {                
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    var result =  from x in contexto.SIC_T_TASA_CAMBIO
                            where x.tsc_c_dinicio < fecha
                            select x;
                    if (result.Count() > 0)
                    {
                        return result.First();
                    }
                    else
                    {
                        return null;
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
