using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SIC.EntityLayer;
using SIC.DataLayer;

namespace SIC.BusinessLayer
{
    public class UbigeoBL
    {
        public List<SIC_T_DEPARTAMENTO> ListarDepartamentos()
        {
            return new UbigeoDA().ListarDepatamentos();
        }
        public List<SIC_T_PROVINCIA> ListarProvincias(string _pstrdepa_c_ccod)
        {
            return new UbigeoDA().ListarProvincias(_pstrdepa_c_ccod);
        }
        public List<SIC_T_DISTRITO> ListarDistritos(string _pstrprov_c_ccod)
        {
            return new UbigeoDA().ListarDistritos(_pstrprov_c_ccod);
        }
        public SIC_T_DISTRITO BuscarDistrito(string _strdist_c_ccod_ubig)
        {
            return new UbigeoDA().BuscarDistrito(_strdist_c_ccod_ubig);
        }
        public SIC_T_PROVINCIA BuscarProvincia(string _strprov_c_ccod)
        {
            return new UbigeoDA().BuscarProvincia(_strprov_c_ccod);
        }
        public SIC_T_DEPARTAMENTO BuscarDepartamento(string _strdepa_c_ccod)
        {
            return new UbigeoDA().BuscarDepartamento(_strdepa_c_ccod);
        }
        public bool RegistrarNombreComercial(SIC_T_NOMB_COM _nombre)
        {
            return new ClienteDA().RegistrarNombreComercial(_nombre);
        }
    }
}
