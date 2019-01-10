using SIC.EntityLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.DataLayer;

namespace SIC.BusinessLayer
{
    public class ZonaRepartoBL
    {
        public List<SIC_T_ZONA_REPARTO> ListarCentroCosto()
        {
            return new ZonaRepartoDA().ListarZonaReparto();
        }
    }
}
