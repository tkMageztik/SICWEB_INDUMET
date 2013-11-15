using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Objects;
using SIC.EntityLayer;
using System.Data;

namespace SIC.DataLayer
{
    public class UsuarioDA
    {
        public bool ObtenerUsuarioxNombre(string usurio)
        {
            bool Existe = false;
            try
            {
                SIC_T_USUARIO mUsuario = null;
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    mUsuario = (from u in contexto.SIC_T_USUARIO where u.usu_c_nombre.Equals(usurio) && u.usu_c_bactivo.Equals(1) select u).FirstOrDefault();

                    if (mUsuario != null) {
                        Existe = true;
                    }
                }
            }
            catch (Exception)
            {
                Existe = false;
            }

            return Existe;
        }

        public SIC_T_USUARIO Login(string clave)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from u in contexto.SIC_T_USUARIO where u.usu_c_clave.Equals(clave) && u.usu_c_bactivo.Equals(1) select u).FirstOrDefault();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
    }


}
