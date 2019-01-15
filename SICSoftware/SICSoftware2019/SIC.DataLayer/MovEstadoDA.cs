using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using System.Data;

namespace SIC.DataLayer
{
    public class MovEstadoDA
    {
        public List<SIC_T_MOV_ESTADO> ListarEstadoMovimiento()
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                return (from x in contexto.SIC_T_MOV_ESTADO
                        select x).ToList();
            }
        }
    }
}
