using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIC.BusinessLayer;
using System.Globalization;
using SIC.EntityLayer;
using SIC.Data;

namespace SIC.UserLayer.Interfaces.Compras
{
    public partial class frmMovSalida : System.Web.UI.Page
    {
        private SIC_T_MOVIMIENTO_SALIDA MovSalNuevo
        {
            get { return ViewState["vsMovSalNuevo"] as SIC_T_MOVIMIENTO_SALIDA; }
            set { ViewState["vsMovSalNuevo"] = value; }
        }

        private SIC_T_MOVIMIENTO_SALIDA MovSalVer
        {
            get { return ViewState["vsMovSalVer"] as SIC_T_MOVIMIENTO_SALIDA; }
            set { ViewState["vsMovSalVer"] = value; }
        }

        private TipoOperacion EscenarioMovSal
        {
            get { return (TipoOperacion)ViewState["vsEscenarioMovSal"]; }
            set { ViewState["vsEscenarioMovSal"] = value; }
        }

        #region Eventos
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ListarMovimientoSalida();
                this.ListarTipoMovimiento();
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            this.MostarNuevoMovimiento();
        }

        protected void btnSeleccionarVenta_Click(object sender, EventArgs e)
        {
            this.MostrarVentas();
        }

        protected void gvListaVenta_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvListaVenta.PageIndex = e.NewPageIndex;
            ListarVentas();
        }

        protected void gvListaVenta_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = (int) gvListaVenta.DataKeys[gvListaVenta.SelectedIndex].Value;
            this.SeleccionarVenta(id);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.ListarVentas();
        }

        protected void btnRegerserVenta_Click(object sender, EventArgs e)
        {
            this.RegresarDesdeVenta();
        }

        protected void gvListaMovSal_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = (int) gvListaMovSal.DataKeys[gvListaMovSal.SelectedIndex].Value;
            this.MostrarVerMovimiento(id);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            this.IngresarMovimientoSalida();
        }

        #endregion

        /// <summary>
        /// Obtiene la lista de ventas de acuerdo a los filtros.
        /// </summary>
        private void ListarVentas()
        {
            VentaBL ventaBL = new VentaBL();
            DateTime inicio, fin;
            DateTime? fi = null, ff = null;
            if (DateTime.TryParseExact(txtFiltroVenDesde.Text, "dd/MM/yyyy", new CultureInfo("en-US"), DateTimeStyles.None, out inicio))
            {
                fi = inicio;
            }

            if (DateTime.TryParseExact(txtFiltroVenHasta.Text, "dd/MM/yyyy", new CultureInfo("en-US"), DateTimeStyles.None, out fin))
            {
                ff = fin;
            }

            gvListaVenta.DataSource = ventaBL.ListarVentas(txtFiltroVenRuc.Text, txtFiltroVenRS.Text, fi, ff);
            gvListaVenta.DataBind();
            upGeneral.Update();
        }

        /// <summary>
        /// Obtiene la lista de movimientos de salida de acuerdo a los filtros.
        /// </summary>
        private void ListarMovimientoSalida()
        {
            DateTime inicio, fin;
            DateTime? fi = null, ff = null;
            if (DateTime.TryParseExact(txtFiltroFecIni.Text, "dd/MM/yyyy", new CultureInfo("en-US"), DateTimeStyles.None, out inicio))
            {
                fi = inicio;
            }

            if (DateTime.TryParseExact(txtFiltroFecFin.Text, "dd/MM/yyyy", new CultureInfo("en-US"), DateTimeStyles.None, out fin))
            {
                ff = fin;
            }

            MovimientoSalidaBL mvsBL = new MovimientoSalidaBL();
            gvListaMovSal.DataSource = mvsBL.ListarMovimientoSalida(txtFiltroRuc.Text,txtFiltroRS.Text,inicio,fin);
            gvListaMovSal.DataBind();
            upGvLista.Update();
        }

        /// <summary>
        /// Listar Tipo Movimiento
        /// </summary>
        private void ListarTipoMovimiento()
        {
            MovimientoSalidaBL mvsBL = new MovimientoSalidaBL();
            cboTipoMovimiento.Items.Clear();
            cboTipoMovimiento.Items.Add(new ListItem("-- Seleccione -- ","-1"));
            cboTipoMovimiento.DataSource = mvsBL.ListarTipoMovimientoSalida();
            cboTipoMovimiento.DataBind();
            updTipoMov.Update();
        }

        /// <summary>
        /// Limpia los datos de la vista <c>vwNuevoMovimiento</c>
        /// </summary>
        private void LimpiarVistaNuevo()
        {
            this.txtRUCCli.Text = string.Empty;
            this.txtRSCli.Text = string.Empty;
            this.txtFechaVenta.Text = string.Empty;
            this.txtFechaFactura.Text = string.Empty;
            this.txtObs.Text = string.Empty;
            this.gvItemsSeleccionados.DataSource = null;
            this.gvItemsSeleccionados.DataBind();            
        }

        

        /// <summary>
        /// Muestra la vista <c>vwNuevoMovimiento</c> con los controles
        /// seteados para ingresar un nuevo movimiento.
        /// </summary>
        private void MostarNuevoMovimiento()
        {
            this.EscenarioMovSal = TipoOperacion.Creacion;
            this.btnBuscarVenta.Enabled = true;
            this.btnBuscarVenta.Visible = true;
            this.txtObs.ReadOnly = false;
            this.btnGuardar.Visible = true;
            this.btnGuardar.Enabled = true;
            this.lblAccion.Text = "NUEVO";
            this.mvMovSalida.SetActiveView(this.vwNuevoMovimiento);
            this.LimpiarVistaNuevo();
            this.MovSalNuevo = new SIC_T_MOVIMIENTO_SALIDA();
            this.upGeneral.Update();
        }

        /// <summary>
        /// Muestra la vista <c>vwNuevoMovimiento</c> con los controles
        /// modificados para mostrar el movimiento
        /// </summary>
        private void MostrarVerMovimiento(int id)
        {
            this.EscenarioMovSal = TipoOperacion.Listar;
            this.btnBuscarVenta.Enabled = false;
            this.btnBuscarVenta.Visible = false;
            this.txtObs.ReadOnly = true;
            this.btnGuardar.Visible = false;
            this.btnGuardar.Enabled = false;
            this.lblAccion.Text = "VER";
            this.mvMovSalida.SetActiveView(this.vwNuevoMovimiento);
            MovimientoSalidaBL mvsBL = new MovimientoSalidaBL();
            this.MovSalNuevo = mvsBL.ObtenerMovimientoSalida(id);
            this.LimpiarVistaNuevo();
        }

        /// <summary>
        /// Muestra la vista <c>vwVenta</c>.
        /// </summary>
        private void MostrarVentas()
        {
            this.mvMovSalida.SetActiveView(this.vwVenta);
            this.ListarVentas();
            upGeneral.Update();
        }

        /// <summary>
        /// Regresa desde la pantalla venta hasta la pantalla Nuevo Movimiento
        /// </summary>
        private void RegresarDesdeVenta()
        {
            this.mvMovSalida.SetActiveView(this.vwNuevoMovimiento);
            this.upGeneral.Update();            
        }

        /// <summary>
        /// Obtiene una venta de acuerdo a su id y regresa a la pantalla de movimiento salida.
        /// </summary>
        /// <param name="idVenta">Id de la venta seleccionada.</param>
        private void SeleccionarVenta(int idVenta)
        {
            MovimientoSalidaBL mvsBL = new MovimientoSalidaBL();
            SIC_T_VENTA venta = mvsBL.ObtenerVenta(idVenta);
            txtFechaVenta.Text = venta.ven_c_zfecha.ToString("dd/MM/yyyy");
            txtRUCCli.Text = venta.SIC_T_CLIENTE.cli_c_vdoc_id;
            txtRSCli.Text = venta.SIC_T_CLIENTE.cli_c_vraz_soc;
            MovSalNuevo.cli_c_vdoc_id = venta.SIC_T_CLIENTE.cli_c_vdoc_id;
            MovSalNuevo.SIC_T_CLIENTE = venta.SIC_T_CLIENTE;
            MovSalNuevo.ven_c_iid = venta.ven_c_iid;
            MovSalNuevo.SIC_T_VENTA = venta;
            var res = mvsBL.GenerarDetalleMoviminetoSalida(venta);
            foreach(var detalle in res)
            {
                this.MovSalNuevo.SIC_T_MOVIMIENTO_SALIDA_DETALLE.Clear();
                this.MovSalNuevo.SIC_T_MOVIMIENTO_SALIDA_DETALLE.Add(detalle);
            }

            this.gvItemsSeleccionados.DataSource = this.MovSalNuevo.SIC_T_MOVIMIENTO_SALIDA_DETALLE;
            this.gvItemsSeleccionados.DataBind();

            this.mvMovSalida.SetActiveView(this.vwNuevoMovimiento);
            upGeneral.Update();
        }

        private void IngresarMovimientoSalida()
        {
            MovimientoSalidaBL mvsBL = new MovimientoSalidaBL();
            MovSalNuevo.mvs_c_itiposalida = 27;
            MovSalNuevo.mvs_c_vdestiposalida = "VENTA";
            MovSalNuevo.mov_estado_iid = 2;
            MovSalNuevo.mvs_c_zfecharegistro = DateTime.Now;
            MovSalNuevo.mvs_c_vobservacion = txtObs.Text;

            try
            {
                mvsBL.IngresarMovimientoSalida(this.MovSalNuevo);
                Mensaje("Movimiento de Salida ingresado con éxito.", "~/Imagenes/correcto.png");
            }
            catch (Exception ex)
            {
#if DEBUG
                SIC.Data.ExceptionTrace.Write(ex);
                String mensajeError = "Error Fatal : \n" + ex.Message;
                if (ex.InnerException != null)
                {
                    mensajeError += "\n" + ex.InnerException != null ? ex.InnerException.Message : string.Empty;
                }

                Mensaje(mensajeError, "~/Imagenes/warning.png");
#else
                SIC.Data.ExceptionTrace.Write(ex);
                Mensaje("Error en el proceso, se ha guardado la traza de la excepción..", "~/Imagenes/warning.png");
#endif
            }
        }

        private void Mensaje(string mensaje, string ruta)
        {
            divPopUpMsg.Attributes["Class"] = "PopupMostrar";
            ucMensaje.Visible = true;
            ucMensaje.Mensaje = mensaje;
            ucMensaje.Ruta = ruta;
            ucMensaje.EnableModelDialog(true);
            upGeneral.Update();
            return;
        }

    }
}