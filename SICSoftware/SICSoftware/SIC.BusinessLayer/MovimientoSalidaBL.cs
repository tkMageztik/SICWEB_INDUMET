﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using SIC.DataLayer;
using SIC.BusinessLayer.Validacion;
using SIC.Data;
using SIC.BusinessLayer.Print;

namespace SIC.BusinessLayer
{
    public class MovimientoSalidaBL
    {
        /// <summary>
        /// Obtiene una lista de movimientos de salida.
        /// </summary>
        /// <returns>Lista de SIC_T_MOVIMIENTO_SALIDA</returns>
        public List<SIC_T_MOVIMIENTO_SALIDA> ListarMovimientoSalida(DateTime? inicio, DateTime? fin, int? id)
        {
            return new MovimientoSalidaDA().ListarMovimientoSalida(inicio, fin, id);
        }

        /// <summary>
        /// Obtiene una lista de ventas de acuerdo a los parametros ingresados en estado FACTURADO
        /// </summary>
        /// <param name="ruc">El ruc del cliente.</param>
        /// <param name="razonSocial">La razón social del cliente.</param>
        /// <param name="inicio">La fecha inicial de busqueda</param>
        /// <param name="fin">La fecha final de busqueda</param>
        /// <returns>Lista de SIC_T_VENTA</returns>
        public List<SIC_T_VENTA> ListarVentas(string ruc, string razonSocial, DateTime? inicio, DateTime? fin)
        {
            return new VentaDA().ListarVentasEstado(ruc, razonSocial, inicio, fin, (int)EstadoVenta.FACTURADO);
        }

        /// <summary>
        /// Obtiene la lista de los tipos de movimiento de salida.
        /// </summary>
        /// <returns>Lista de <c>SIC_T_PARAMETRO_DET</c></returns>
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

        /// <summary>
        /// Actualiza la lista de detalle del movimiento de salida, dada una lista de SIC_T_ITEM_ALMACEN seleccionado.
        /// </summary>
        /// <param name="movSalida">Movimiento de salida a modificar.</param>
        /// <param name="listaPrel">Lista preliminar a ser usada como base para la modificación.</param>
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
            foreach (SIC_T_ITEM_ALMACEN itemAlm in listaPrel)
            {
                if (!movSalida.SIC_T_MOVIMIENTO_SALIDA_DETALLE.Where(x => x.alm_c_iid == itemAlm.alm_c_iid
                                                  && x.itm_c_iid == itemAlm.itm_c_iid).Any())
                {
                    SIC_T_MOVIMIENTO_SALIDA_DETALLE nuevoDetalle = new SIC_T_MOVIMIENTO_SALIDA_DETALLE();
                    nuevoDetalle.mvs_det_c_ecant = 1;
                    nuevoDetalle.itm_c_iid = itemAlm.itm_c_iid;
                    nuevoDetalle.alm_c_iid = itemAlm.alm_c_iid;
                    nuevoDetalle.SIC_T_ITEM = itemAlm.SIC_T_ITEM; 
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

        /// <summary>
        /// Modifica un movimiento de salida en el sistema.
        /// </summary>
        /// <param name="movSalida">El objeto <c>SIC_T_MOVIMIENTO_SALIDA</c> que se modificará</param>
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

        /// <summary>
        /// Cierra el movimiento de salida.
        /// </summary>
        /// <param name="movimientoSalida">Objeto movimiento salida a cerrar.</param>
        public void CerrarMovimientoSalida(SIC_T_MOVIMIENTO_SALIDA movimientoSalida)
        {
            movimientoSalida.mov_estado_iid = (int)EstadoMovimiento.CERRADO;
            MovimientoSalidaDA mvsDA = new MovimientoSalidaDA();
            mvsDA.ModificarMovimientSalida(movimientoSalida);
        }

        /// <summary>
        /// Anula un movimiento salida
        /// </summary>
        /// <param name="movimientoSalida">Objeto movimiento salida a anular.</param>
        public void AnularMovimientoSalida(SIC_T_MOVIMIENTO_SALIDA movimientoSalida)
        {
            movimientoSalida.mov_estado_iid = (int)EstadoMovimiento.ANULADO;
            MovimientoSalidaDA mvsDA = new MovimientoSalidaDA();
            mvsDA.ModificarMovimientSalida(movimientoSalida);
        }

        /// <summary>
        /// Lista los estados de movimiento.
        /// </summary>
        /// <returns>Lista de <c>SIC_T_MOV_ESTADO</c></returns>
        public List<SIC_T_MOV_ESTADO> ListarEstadoMovimiento()
        {
            return new MovEstadoDA().ListarEstadoMovimiento();
        }

        public bool PuedeImprimir(string printerName)
        {
            return printerName != null && printerName.Trim().Length > 0;
        }

        public void ImprimirMovimientoSalidaProduccion(SIC_T_MOVIMIENTO_SALIDA movimientoSalida, string printerName)
        {
            if (movimientoSalida == null)
            {
                throw new ArgumentException("El parametro movimientoSalida no puede ser nulo");
            }

            if (movimientoSalida.mvs_c_itiposalida != (int)TipoMovimientoSalida.PRODUCCION)
            {
                throw new ArgumentException("El movimiento de salida debe ser del tipo PRODUCCION");
            }

            if (!this.PuedeImprimir(printerName))
            {
                throw new ArgumentException("La aplicación no esta configurada para la impresión");
            }

            StringBuilder sb = new StringBuilder();
            sb.Append("\n");
            sb.Append("Salida por producción" + "\n");
            sb.Append("Código " + movimientoSalida.mvs_c_iid + "\n");
            sb.Append("Fecha " + movimientoSalida.mvs_c_zfecharegistro.ToString("dd/MM/yyyy") + "\n");
            sb.Append("\n");

            sb.Append("Código".PadRight(7));
            sb.Append("Desc.".PadRight(15));
            sb.Append("Cod Alm".PadRight(7));
            sb.Append("Cantidad".PadRight(5));
            sb.Append("\n");

            foreach (var detalle in movimientoSalida.SIC_T_MOVIMIENTO_SALIDA_DETALLE)
            {
                sb.Append(detalle.itm_c_iid.ToString().PadRight(6) + " ");
                sb.Append(detalle.SIC_T_ITEM.itm_c_vdescripcion.Length > 14 ?
                     detalle.SIC_T_ITEM.itm_c_vdescripcion.Substring(0, 14)
                   : detalle.SIC_T_ITEM.itm_c_vdescripcion.PadRight(14));
                sb.Append(" ");
                sb.Append(detalle.alm_c_iid.ToString().PadRight(6) + " ");
                sb.Append(detalle.mvs_det_c_ecant);
                sb.Append("\n");
            }

            sb.Append("\n");
            sb.Append(movimientoSalida.mvs_c_vobservacion);
            sb.Append("\n");
            sb.Append("\n");

            try
            {
                RawPrinterHelper.SendStringToPrinter(printerName, "\n" + sb.ToString());
            }
            catch (Exception ex)
            {
                // No se pudo imprimir?
            }
        }
    }    
}
