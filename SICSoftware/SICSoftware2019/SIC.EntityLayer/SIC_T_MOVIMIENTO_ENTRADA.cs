using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIC.EntityLayer
{
    public partial class SIC_T_MOVIMIENTO_ENTRADA
    {
        public void CalcularCantidadAtendida(SIC_T_ORDEN_DE_COMPRA ordenCompra)
        {
            foreach (var detMov in this.SIC_T_MOVIMIENTO_ENTRADA_DETALLE)
            {
                var listaMovEntradaDetalle = ordenCompra.SIC_T_MOVIMIENTO_ENTRADA
                        .Where(x => x.mve_c_iestado != 4) // Solo los Movimientos NO anulados (estado 4)
                        .SelectMany(mve => mve.SIC_T_MOVIMIENTO_ENTRADA_DETALLE) // Busca
                        .Where(mved => mved.mve_c_iid != this.mve_c_iid // Donde la id del movimiento no sea la misma.
                                    && detMov.mve_c_iocdet_id == mved.mve_c_iocdet_id); // y el detalle de movimiento corresponde al mismo item(detalleoc)
                detMov.CantidadAtendida = listaMovEntradaDetalle.Sum(x => x.mve_c_ecant_recibida); // La cantidad antendida hasta ahora (sin incluir el movimeinto actual)
                detMov.MaximoAtender = detMov.mve_c_ecant_pedida + obtenerMaximoAtender(detMov.mve_c_ecant_pedida);
            }
        }
        private decimal obtenerMaximoAtender(decimal cantPedida)
        {
            return Math.Round(cantPedida / 5);
        }
    }



    public partial class SIC_T_MOVIMIENTO_ENTRADA_DETALLE
    {
        public decimal CantidadAtendida { get; set; }
        public decimal MaximoAtender { get; set; }
    }
}
