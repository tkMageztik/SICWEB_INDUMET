using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SIC.UserLayer.Interfaces.Movimientos
{
    public class DatosItemAlmacen
    {
        public int idAlmacen { get; set; }
        public int idItem { get; set; }
        public decimal stock { get; set; }
    }
}