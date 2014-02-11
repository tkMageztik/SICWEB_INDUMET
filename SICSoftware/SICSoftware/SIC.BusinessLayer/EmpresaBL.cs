using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using SIC.DataLayer;

namespace SIC.BusinessLayer
{
    public class EmpresaBL
    {
        public List<SIC_T_EMP_DIRECCION> ListarDireccionEmpresa()
        {
            return new EmpresaDA().ListarDireccionEmpresa();
        }

        public SIC_T_EMP_DIRECCION ObtenerDireccionEmpresa(int id)
        {
            return new EmpresaDA().ObtenerDireccionEmpresa(id);
        }

        public SIC_T_EMPRESA ObtenerDatosEmpresa()
        {
            return new EmpresaDA().ObtenerDatosEmpresa();
        }
    }
}
