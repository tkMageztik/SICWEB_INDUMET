using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using SIC.DataLayer;

namespace SIC.BusinessLayer
{
    public class AlmacenBL
    {
        public List<SIC_T_ALMACEN> ObtenerAlmacenes()
        {
            return new AlmacenDA().ObtenerAlmacenes();
        }

        public SIC_T_ALMACEN ObtenerPorId(int id)
        {
            return new AlmacenDA().ObtenerPorId(id);
        }

        public SIC_T_ALMACEN ObtenerPorIdNoContext(int id)
        {
            return new AlmacenDA().ObtenerPorIdNoContext(id);
        }
    }
}
