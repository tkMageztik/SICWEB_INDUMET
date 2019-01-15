using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIC.EntityLayer
{
    public class KardexDetalle
    {
        public SIC_T_ALMACEN SIC_T_ALMACEN { get; set; }
        public SIC_T_ITEM SIC_T_ITEM { get; set; }        
        public DateTime Fecha { get; set; }
        public decimal EntradaCantidad { get; set; }
        public decimal EntradaPrecio{ get; set; }
        public decimal EntradaTotal { get { return EntradaCantidad * EntradaPrecio; } }
        public decimal SalidaCantidad { get; set; }
        public decimal SalidaPrecio{ get; set; }
        public decimal SalidaTotal { get { return SalidaCantidad * SalidaPrecio; } }
    }
}
