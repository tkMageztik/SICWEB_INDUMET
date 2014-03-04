using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

namespace SIC.UserLayer
{
    public class Configuracion
    {
        public static string NombreImpresora
        {
            get
            {
                return ConfigurationManager.AppSettings["PrinterName"];
            }
        }
    }
}