using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

namespace SIC.UserLayer
{
    public class Configuracion
    {

        public static bool EsServidorImpresion
        {
            get
            {
                bool value = false;
                if (Boolean.TryParse(ConfigurationManager.AppSettings["PrintServer"], out value))
                {
                    return value;
                }
                else
                {
                    return false;
                }
            }
        }
    }
}