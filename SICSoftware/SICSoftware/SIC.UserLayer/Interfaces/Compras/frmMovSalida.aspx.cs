using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIC.BusinessLayer;
using System.Globalization;
using SIC.EntityLayer;

namespace SIC.UserLayer.Interfaces.Compras
{
    public partial class frmMovSalida : System.Web.UI.Page
    {
        private SIC_T_MOVIMIENTO_SALIDA MovSalNuevo
        {
            get { return ViewState["vsMovSalNuevo"] as SIC_T_MOVIMIENTO_SALIDA; }
            set { ViewState["vsMovSalNuevo"] = value; }
        }

        #region Eventos
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ListarMovimientoSalida();
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
        /// Muestra la vista <c>vwNuevoMovimiento</c>.
        /// </summary>
        private void MostarNuevoMovimiento()
        {
            this.mvMovSalida.SetActiveView(this.vwNuevoMovimiento);
            this.LimpiarVistaNuevo();
            this.MovSalNuevo = new SIC_T_MOVIMIENTO_SALIDA();
            this.upGeneral.Update();
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
    }
}