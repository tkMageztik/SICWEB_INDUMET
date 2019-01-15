using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;

namespace SIC.DataLayer
{
    /// <summary>
    /// Provee los metodos necsarios para accesar a los datos de la tabla SIC_T_CONCEPTO
    /// </summary>
    public class ConceptoDA
    {
        /// <summary>
        /// Lista los conceptos de la base de datos.
        /// </summary>
        /// <returns></returns>
        public List<SIC_T_CONCEPTO> ListarConcepto()
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                return (from x in contexto.SIC_T_CONCEPTO
                        select x).ToList();
            }
        }
    }
}
