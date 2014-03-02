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
        /// Actualiza la lista de detalle de un moviiento de salida de acuerdo a una venta ingresada
        /// </summary>
        /// <param name="mvs"></param>
        /// <param name="venta"></param>
        public void GenerarDetalleMoviminetoSalida(SIC_T_MOVIMIENTO_SALIDA mvs, SIC_T_VENTA venta)
        {
            mvs.SIC_T_MOVIMIENTO_SALIDA_DETALLE.Clear();            
            foreach (SIC_T_VENTA_DETALLE venDet in venta.SIC_T_VENTA_DETALLE)
            {
                SIC_T_MOVIMIENTO_SALIDA_DETALLE mvsDet = new SIC_T_MOVIMIENTO_SALIDA_DETALLE();
                mvsDet.alm_c_iid = venDet.ven_det_c_iidalmacen;
                mvsDet.itm_c_iid = venDet.ven_det_c_iitemid;
                mvsDet.mvs_det_c_ecant = venDet.ven_det_c_ecantidad;
                mvsDet.SIC_T_ITEM = venDet.SIC_T_ITEM;
                mvsDet.SIC_T_ALMACEN = venDet.SIC_T_ALMACEN;
                mvs.SIC_T_MOVIMIENTO_SALIDA_DETALLE.Add(mvsDet);
            }
        }

        public void ActualizarListaItems(SIC_T_MOVIMIENTO_SALIDA movSalida, List<SIC_T_ITEM_ALMACEN> listaPrel)
        {
            if (movSalida == null)
            {
                throw new ArgumentException("El parametro movSalida no debe ser nulo");
            }
            
            if (listaPrel == null)
            {
                throw new ArgumentException("El parametro listaPrel no debe ser nulo");
            }

            // Primero eliminamos todos los que no estan seleccionados           
            List<SIC_T_MOVIMIENTO_SALIDA_DETALLE> remover = new List<SIC_T_MOVIMIENTO_SALIDA_DETALLE>();
            foreach (var detalleSalida in movSalida.SIC_T_MOVIMIENTO_SALIDA_DETALLE)
            {
                bool rem = true;
                foreach (var itemalm in listaPrel)
                {
                    if (detalleSalida.alm_c_iid == itemalm.alm_c_iid && detalleSalida.itm_c_iid == itemalm.itm_c_iid)
                    {
                        rem = false;
                        break;
                    }
                }
                if (rem)
                {
                    remover.Add(detalleSalida);
                }
            }

            foreach (var detalleVenta in remover)
            {
                movSalida.SIC_T_MOVIMIENTO_SALIDA_DETALLE.Remove(detalleVenta);
            }

            // Ahora agregamos los nuevos
            foreach (var itemAlm in listaPrel)
            {
                if (!movSalida.SIC_T_MOVIMIENTO_SALIDA_DETALLE.Where(x => x.alm_c_iid == itemAlm.alm_c_iid
                                                  && x.itm_c_iid == itemAlm.itm_c_iid).Any())
                {
                    SIC_T_ITEM itemEncontrado = new ItemDA().ObtenerItemPorIdNoContext(itemAlm.itm_c_iid);
                    SIC_T_MOVIMIENTO_SALIDA_DETALLE nuevoDetalle = new SIC_T_MOVIMIENTO_SALIDA_DETALLE();
                    nuevoDetalle.mvs_det_c_ecant = 1;
                    nuevoDetalle.itm_c_iid = itemEncontrado.itm_c_iid;
                    nuevoDetalle.alm_c_iid = itemAlm.alm_c_iid;
                    nuevoDetalle.SIC_T_ITEM = itemEncontrado;
                    nuevoDetalle.SIC_T_ALMACEN = itemAlm.SIC_T_ALMACEN;
                    movSalida.SIC_T_MOVIMIENTO_SALIDA_DETALLE.Add(nuevoDetalle);
                }
            }
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

        public void ModificarMovimientoSalida(SIC_T_MOVIMIENTO_SALIDA movSalida)
        {
            if (movSalida == null)
            {
                throw new ArgumentException("El argumento movSalida no puede ser nulo.");
            }

            MovimientoSalidaDA mvsDA = new MovimientoSalidaDA();
            mvsDA.ModificarMovimientSalida(movSalida);
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

        /// <summary>
        /// Obtiene una lista de familias.
        /// </summary>
        /// <returns>Lista de <c>SIC_T_ITEM_FAMILIA</c></returns>
        public List<SIC_T_ITEM_FAMILIA> ListarFamiliaItem()
        {
            return new ItemDA().ListarFamiliaItem();
        }
        
        /// <summary>
        /// Obtiene una lista de sub familias basados en la familia.
        /// </summary>
        /// <param name="idFamilia">Id de la familia</param>
        /// <returns>Lista de <c>SIC_T_ITEM_SUB_FAMILIA</c></returns>
        public List<SIC_T_ITEM_SUB_FAMILIA> ListarSubFamiliaItem(int idFamilia)
        {
            return new ItemDA().ListarSubFamiliaItem(idFamilia);
        }

        /// <summary>
        /// Obtiene una lista de almacenes.
        /// </summary>
        /// <returns>Lista de <c>SIC_T_ALMACEN</c></returns>
        public List<SIC_T_ALMACEN> ListaAlmacen()
        {
            return new AlmacenDA().ListaAlmacen();
        }

        /// <summary>
        /// Obtiene una lista de itemsxalmacen bajo los filtros ingresados.
        /// </summary>
        /// <param name="codigo">Código del item.</param>
        /// <param name="descripcion">Descripción del item.</param>
        /// <param name="idFamilia">Familia</param>
        /// <param name="idSubFamilia">Sub Familia</param>
        /// <param name="idAlmacen">Almacen</param>
        /// <returns>Lista de items</returns>
        public List<SIC_T_ITEM_ALMACEN> ListarItemAlmacen(string codigo, string descripcion, int? idFamilia, int? idSubFamilia, params int[] idAlmacen)
        {
            return new ItemAlmacenDA().ListarItemAlmacen(codigo, descripcion, idFamilia, idSubFamilia, idAlmacen);
        }

    }    
}
