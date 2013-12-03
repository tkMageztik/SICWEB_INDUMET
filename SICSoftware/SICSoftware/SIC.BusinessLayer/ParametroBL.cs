using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using SIC.DataLayer;

namespace SIC.BusinessLayer
{
    public class ParametroBL
    {

        public List<SIC_T_PARAMETRO_DET> ListarParametros(int _pIdParametro)
        {
            return new ParametroDA().ListarParametros(_pIdParametro);
        }
    }
}
