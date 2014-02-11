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

        public void IngresarCentroCosto(SIC_T_EMP_CENTRO_COSTO _pSIC_T_EMP_CENTRO_COSTO)
        {
            new CentroCostoDA().IngresarCentroCosto(_pSIC_T_EMP_CENTRO_COSTO);
        }

        public SIC_T_EMP_CENTRO_COSTO ObtenerCentroCosto(int idCentroCosto)
        {
            return new CentroCostoDA().ObtenerCentroCosto(idCentroCosto);
        }
    }
}
