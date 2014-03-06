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
        public List<SIC_T_FACTURA> ListarFactura(int? numDesde, int? numHasta, bool? impreso, string ruc)
        {
            return new BoletaFacturaDA().ListarFactura(numDesde,numHasta, impreso, ruc);
        }

        /// <summary>
        /// Obtiene una lista de boletas.
        /// </summary>
        /// <returns>Lista de SIC_T_BOLETA</returns>
        public List<SIC_T_BOLETA> ListarBoleta(int? numDesde, int? numHasta, bool? impreso, string ruc)
        {
            return new BoletaFacturaDA().ListarBoleta(numDesde, numHasta, impreso, ruc); ;
        }

        public void ImprimirFactura(int id)
        {
            BoletaFacturaDA bfDA = new BoletaFacturaDA();
            SIC_T_FACTURA factura =  bfDA.ObtenerFactura(id);
            if (factura != null)
            {
                factura.fac_c_bimpreso = true;
                bfDA.ModificarFactura(factura);
                // Impresion
            }
        }

        private void EnviarImpresion(SIC_T_FACTURA factura, string nombreImpresora)
        {

        }

        public void ImprimirBoleta(int id)
        {
            BoletaFacturaDA bfDA = new BoletaFacturaDA();
            SIC_T_BOLETA boleta = bfDA.ObtenerBoleta(id);
            if (boleta != null)
            {
                boleta.bol_c_bimpreso = true;
                bfDA.ModificarBoleta(boleta);
                // Impresion
            }
        }
    }
}
