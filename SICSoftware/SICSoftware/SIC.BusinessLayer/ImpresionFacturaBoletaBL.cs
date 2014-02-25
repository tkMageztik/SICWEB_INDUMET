using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using SIC.DataLayer;

namespace SIC.BusinessLayer
{
    /// <summary>
    /// Maneja el proceso de impresión de factura/boleta.
    /// </summary>
    public class ImpresionFacturaBoletaBL
    {
        /// <summary>
        /// Obtiene una lista de factura.
        /// </summary>
        /// <returns>Lista de SIC_T_FACTURA</returns>
        public List<SIC_T_FACTURA> ListarFactura()
        {
            return new BoletaFacturaDA().ListarFactura();
        }

        /// <summary>
        /// Obtiene una lista de boletas.
        /// </summary>
        /// <returns>Lista de SIC_T_BOLETA</returns>
        public List<SIC_T_BOLETA> ListarBoleta()
        {
            return new BoletaFacturaDA().ListarBoleta();
        }

        public void ImprimirFactura(int id)
        {

        }

        public void ImprimirBoleta(int id)
        {

        }
    }
}
