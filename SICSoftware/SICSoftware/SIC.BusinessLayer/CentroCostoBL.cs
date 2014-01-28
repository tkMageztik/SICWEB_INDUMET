using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using SIC.DataLayer;

namespace SIC.BusinessLayer
{
    public class CentroCostoBL
    {
        public List<SIC_T_EMP_CENTRO_COSTO> ListarCentroCosto()
        {
            return new CentroCostoDA().ListarCentroCosto();
        }
    }
}
