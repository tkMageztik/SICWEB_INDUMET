using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


namespace SIC.BusinessLayer
{
    /// <summary>
    /// Representa la clase que controla el proceso de negocio de la facturacion automatica
    /// </summary>
    [Serializable]
    public class FacturacionAutomaticaBL
    {
        /// <summary>
        /// Lista una colleción de meses del año actual
        /// </summary>
        /// <returns>Lista de meses del año actual.</returns>
        public List<DateTime> ObtenerListaPeriodo()
        {
            var listado = new List<DateTime>();
            for (int i = 1; i <= 12; i++)
            {
                listado.Add(new DateTime(DateTime.Now.Year, i, 1));
            }
            return listado;
        }

        

    }

    
}
