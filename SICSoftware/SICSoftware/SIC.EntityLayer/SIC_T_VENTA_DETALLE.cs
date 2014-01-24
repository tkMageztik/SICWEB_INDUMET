using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIC.EntityLayer
{
    public partial class SIC_T_VENTA_DETALLE
    {
        public decimal precioReferencia { get; set; }
        public decimal precioReferenciaSoles { get; set; }
        public decimal precioUnitarioSoles { get; set; }
        public string codigoItem { get; set; }
        public string descItem { get; set; } 
    }
}
