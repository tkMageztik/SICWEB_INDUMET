using SIC.EntityLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIC.DataLayer
{
    public class ZonaRepartoDA
    {
        public List<SIC_T_ZONA_REPARTO> ListarZonaReparto()
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_ZONA_REPARTO
                            select x).ToList();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
