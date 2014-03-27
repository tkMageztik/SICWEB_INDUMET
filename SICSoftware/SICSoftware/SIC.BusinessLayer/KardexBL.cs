using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using SIC.DataLayer;

namespace SIC.BusinessLayer
{
    public class KardexBL
    {
        public List<KardexDetalle> ObtenerKardex(DateTime? fechaInicio, DateTime? fechaFin, int? idAlmacen, int? idItem)
        {
            return new KardexDA().ObtenerKardex(fechaInicio, fechaFin, idAlmacen, idItem);
        }
    }
}
