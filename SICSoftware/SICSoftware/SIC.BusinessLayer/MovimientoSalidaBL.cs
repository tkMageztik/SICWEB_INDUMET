using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using SIC.DataLayer;
using SIC.BusinessLayer.Validacion;

namespace SIC.BusinessLayer
{
    public class MovimientoSalidaBL
    {
        /// <summary>
        /// Obtiene una lista de movimientos de salida.
        /// </summary>
        /// <returns>Lista de SIC_T_MOVIMIENTO_SALIDA</returns>
        public List<SIC_T_MOVIMIENTO_SALIDA> ListarMovimientoSalida(string ruc, string razonSocial,
                                                                    DateTime? inicio, DateTime? fin)
        {
            return new MovimientoSalidaDA().ListarMovimientoSalida(ruc, razonSocial, inicio, fin);
        }

        /// <summary>
        /// Obtiene una lista de ventas de acuerdo a los parametros ingresados
        /// </summary>
        /// <param name="ruc">El ruc del cliente.</param>
        /// <param name="razonSocial">La razón social del cliente.</param>
        /// <param name="inicio">La fecha inicial de busqueda</param>
        /// <param name="fin">La fecha final de busqueda</param>
        /// <returns>Lista de SIC_T_VENTA</returns>
        public List<SIC_T_VENTA> ListarVentas(string ruc, string razonSocial, DateTime? inicio, DateTime? fin)
        {
            return new VentaDA().ListarVentas(ruc, razonSocial, inicio, fin);
        }

        public List<SIC_T_PARAMETRO_DET> ListarTipoMovimientoSalida()
        {
            return new ParametroBL().ListarParametros((int)SIC.Data.TipoParametro.TIPO_SALIDA);
        }

        /// <summary>
        /// Obtiene una venta por id.
        /// </summary>
        /// <param name="idVenta">Id de la venta.</param>
        /// <returns>Objeto SIC_T_VENTA</returns>
        public SIC_T_VENTA ObtenerVenta(int idVenta)
        {
            return new VentaDA().ObtenerVenta(idVenta);
        }

        /// <summary>
        /// Obtiene una lista de Movimientos de salida nueva desde un objecto de venta
        /// </summary>
        /// <param name="venta">Venta que se procesará.</param>
        /// <returns>Lista instanciada de SIC_T_MOVIMIENTO_SALIDA</returns>
        public List<SIC_T_MOVIMIENTO_SALIDA_DETALLE> GenerarDetalleMoviminetoSalida(SIC_T_VENTA venta)
        {
            List<SIC_T_MOVIMIENTO_SALIDA_DETALLE> listaDetalle = new List<SIC_T_MOVIMIENTO_SALIDA_DETALLE>();
            foreach (SIC_T_VENTA_DETALLE venDet in venta.SIC_T_VENTA_DETALLE)
            {
                SIC_T_MOVIMIENTO_SALIDA_DETALLE mvsDet = new SIC_T_MOVIMIENTO_SALIDA_DETALLE();
                mvsDet.alm_c_iid = venDet.ven_det_c_iidalmacen;
                mvsDet.itm_c_iid = venDet.ven_det_c_iitemid;
                mvsDet.mvs_det_c_ecant = venDet.ven_det_c_ecantidad;
                mvsDet.SIC_T_ITEM = venDet.SIC_T_ITEM;
                mvsDet.SIC_T_ALMACEN = venDet.SIC_T_ALMACEN;
                listaDetalle.Add(mvsDet);
            }

            return listaDetalle;
        }

        /// <summary>
        /// Ingresa un nuevo movimiento de salida al sistema.
        /// </summary>
        /// <param name="movSalida">El objeto que se ingresará-</param>
        public void IngresarMovimientoSalida(SIC_T_MOVIMIENTO_SALIDA movSalida)
        {
            if (movSalida == null)
            {
                throw new ArgumentException("El argumento movSalida no puede ser nulo.");
            }

            MovimientoSalidaDA mvsDA = new MovimientoSalidaDA();
            mvsDA.InsertarMovimientoSalida(movSalida);
            
        }


        /// <summary>
        /// Obtiene un movimiento de salida.
        /// </summary>
        /// <param name="id">Id del movimiento de salida.</param>
        /// <returns>Objecto <c>SIC_T_MOVIMIENTO_SALIDA</c>.</returns>
        public SIC_T_MOVIMIENTO_SALIDA ObtenerMovimientoSalida(int id)
        {
            return new MovimientoSalidaDA().ObtenerMovimientoSalidaPorId(id);
        }
    }    
}
