using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using SIC.DataLayer;

namespace SIC.BusinessLayer
{
    public class UsuarioBL
    {
        public bool ObtenerUsuarioxNombre(string usurio)
        {
            return new UsuarioDA().ObtenerUsuarioxNombre(usurio);
        }

        public SIC_T_USUARIO Login(string clave)
        {
            return new UsuarioDA().Login(clave);
        }
    }
}
