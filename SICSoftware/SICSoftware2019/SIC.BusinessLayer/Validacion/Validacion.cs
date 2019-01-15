using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIC.BusinessLayer.Validacion
{
    public class ResultadoValidacion
    {
        private string mensaje = null;

        public bool EsValido { get; private set; }
        public string Mensaje { get; private set; }

        public ResultadoValidacion(bool valido, string mensaje)
        {
            this.EsValido = valido;
            this.Mensaje = mensaje;
        }        
    }

}
