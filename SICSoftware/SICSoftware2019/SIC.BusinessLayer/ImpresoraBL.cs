using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.DataLayer;

namespace SIC.BusinessLayer
{
    public class ImpresoraBL
    {
        public String ObtenerImpresoraDefecto()
        {
           return new ImpresoraDA().ObtenerImpresoraDefecto();
        }

        public void ActualizarImpresora(String rutaImpresora)
        {
            new ImpresoraDA().ActualizarImpresora(rutaImpresora);
        }
    }
}
