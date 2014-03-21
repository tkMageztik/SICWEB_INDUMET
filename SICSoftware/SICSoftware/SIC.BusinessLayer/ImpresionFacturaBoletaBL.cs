using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using SIC.DataLayer;
using SIC.BusinessLayer.Print;

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

        public void ImprimirFactura(int id, string nombreImpresora)
        {
            BoletaFacturaDA bfDA = new BoletaFacturaDA();
            SIC_T_FACTURA factura =  bfDA.ObtenerFactura(id);
            if (factura != null)
            {
                factura.fac_c_bimpreso = true;
                ImpresionFacturaSimple ipf = new ImpresionFacturaSimple();
                ipf.Imprimir(factura, nombreImpresora);
                bfDA.ModificarFactura(factura);                
            }        
        }

        public void ImprimirVariasFacturas(List<int> listaId, string nombreImpresora)
        {
            BoletaFacturaDA bfDA = new BoletaFacturaDA();
            List<SIC_T_FACTURA> listaFactura = new List<SIC_T_FACTURA>();
            foreach (int id in listaId)
            {
                SIC_T_FACTURA factura = bfDA.ObtenerFactura(id);
                if (factura != null)
                {
                    factura.fac_c_bimpreso = true;
                    
                    listaFactura.Add(factura);
                    
                    bfDA.ModificarFactura(factura);
                }
                ImpresionFacturaSimple ipf = new ImpresionFacturaSimple();
                ipf.ImprimirVarios(listaFactura, nombreImpresora);
            }
            
        }

        public void ImprimirBoleta(int id, string nombreImpresora)
        {
            BoletaFacturaDA bfDA = new BoletaFacturaDA();
            SIC_T_BOLETA boleta = bfDA.ObtenerBoleta(id);
            if (boleta != null)
            {
                boleta.bol_c_bimpreso = true;
                ImpresionBoletaSimple ipf = new ImpresionBoletaSimple();
                ipf.Imprimir(boleta, nombreImpresora);
                bfDA.ModificarBoleta(boleta);
                // Impresion
            }
        }
    }
}