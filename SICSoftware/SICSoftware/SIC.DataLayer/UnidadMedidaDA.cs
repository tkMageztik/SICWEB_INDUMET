using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;

namespace SIC.DataLayer
{
    public class UnidadMedidaDA
    {
        /// <summary>
        /// Obtiene la lista de unidades de medida desde la base de datos.
        /// </summary>
        /// <returns>Lista de unidades</returns>
        public List<SIC_T_UNIDAD_MEDIDA> ListarUnidadMedida()
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                return (from x in contexto.SIC_T_UNIDAD_MEDIDA
                        where x.und_c_bactivo
                        select x).ToList();
            }
            
        }

        /// <summary>
        /// Agrega la unidad de medida a la base de datos.
        /// </summary>
        /// <param name="unidadMedida">Unidad de medida</param>
        public void AgregarUnidadMedida(SIC_T_UNIDAD_MEDIDA unidadMedida)
        {
            if (unidadMedida == null)
            {
                throw new ArgumentException("El parametro unidadMedida no puede ser nulo.");
            }

            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                unidadMedida.und_c_bactivo = true;
                contexto.AddToSIC_T_UNIDAD_MEDIDA(unidadMedida);
                contexto.SaveChanges();
            }
        }
    }
}
