using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;
using System.Data;
using System.Data.Objects;
using SIC.EntityLayer;

namespace SIC.DataLayer
{
   public class UbigeoDA
    {
        public SIC_T_DEPARTAMENTO[] ListarDepatamentos()
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                return (from x in contexto.SIC_T_DEPARTAMENTO
                        select x).ToArray();
            }
        }

        public SIC_T_PROVINCIA[] ListarProvincias(string _pstrdepa_c_ccod)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                return (from x in contexto.SIC_T_PROVINCIA
                        where x.depa_c_ccod.Trim().Equals(_pstrdepa_c_ccod.Trim())
                        select x).ToArray();
            }
        }
        public SIC_T_DISTRITO[] ListarDistritos(string _pstrprov_c_ccod)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                return (from x in contexto.SIC_T_DISTRITO
                        where x.prov_c_ccod.Trim().Equals(_pstrprov_c_ccod.Trim())
                        select x).ToArray();
            }
        }
        public SIC_T_DISTRITO BuscarDistrito(string _strdist_c_ccod_ubig)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                return (from x in contexto.SIC_T_DISTRITO
                        where x.dist_c_ccod_ubig.Trim().Equals(_strdist_c_ccod_ubig.Trim())
                        select x).FirstOrDefault();
            }
        }
        public SIC_T_PROVINCIA BuscarProvincia(string _strprov_c_ccod)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                return (from x in contexto.SIC_T_PROVINCIA
                        where x.prov_c_ccod.Trim().Equals(_strprov_c_ccod.Trim())
                        select x).FirstOrDefault();
            }
        }
        public SIC_T_DEPARTAMENTO BuscarDepartamento(string _strdepa_c_ccod)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                return (from x in contexto.SIC_T_DEPARTAMENTO
                        where x.depa_c_ccod.Trim().Equals(_strdepa_c_ccod.Trim())
                        select x).FirstOrDefault();
            }
        }
    }
}
