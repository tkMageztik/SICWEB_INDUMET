using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using SIC.DataLayer;

namespace SIC.BusinessLayer
{
    public class TasaCambioBL
    {
        public SIC_T_TASA_CAMBIO ObtenerTasaCambio(DateTime fecha)
        {
            return new TasaCambioDA().ObtenerTasaCambio(fecha);
        }
    }
}