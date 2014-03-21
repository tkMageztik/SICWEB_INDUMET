using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIC.EntityLayer
{
    public partial class SIC_T_VENTA
    {
        public String FechaString 
        {
            get
            {
                return this.ven_c_zfecha.ToString("dd/MM/yyyy");
            }            
        }
    }
}
