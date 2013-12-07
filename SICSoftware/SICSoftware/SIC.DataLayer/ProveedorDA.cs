using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;

namespace SIC.DataLayer
{
    public class ProveedorDA
    {
        public List<SIC_T_PROVEEDOR> ListarProveedores()
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_PROVEEDOR
                            select x).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
