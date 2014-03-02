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

        private SIC_T_MOVIMIENTO_SALIDA MovSalModificar
        {
            get { return ViewState["vsMovSalModificar"] as SIC_T_MOVIMIENTO_SALIDA; }
            set { ViewState["vsMovSalModificar"] = value; }
        }

        private TipoOperacion EscenarioMovSal
        {
            get { return (TipoOperacion)ViewState["vsEscenarioMovSal"]; }
            set { ViewState["vsEscenarioMovSal"] = value; }
        }

        private List<SIC_T_ITEM_ALMACEN> ItemsAlmacenSeleccionados
        {
            get { return ViewState["vsItemsAlmacenSeleccionados"] as List<SIC_T_ITEM_ALMACEN>; }
            set { ViewState["vsItemsAlmacenSeleccionados"] = value; }
        }

        private List<SIC_T_ITEM_ALMACEN> ItemsAlmacenEncontrados
        {
            get { return ViewState["vsItemsAlmacenEncontrados"] as List<SIC_T_ITEM_ALMACEN>; }
            set { ViewState["vsItemsAlmacenEncontrados"] = value; }
        }

        #region Eventos
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ListarMovimientoSalida();
                this.ListarTipoMovimiento();
                this.ListarFiltroFamilia();
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
            this.ListarMovimientoSalida();
        }

        protected void btnRegerserVenta_Click(object sender, EventArgs e)
        {
            this.RegresarDesdeVenta();
        }

        protected void gvListaMovSal_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = (int) gvListaMovSal.DataKeys[gvListaMovSal.SelectedIndex].Value;
            this.MostrarModificarMovimiento(id);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (this.EscenarioMovSal == TipoOperacion.Creacion)
            {
                this.IngresarMovimientoSalida();
            }
            else if (this.EscenarioMovSal == TipoOperacion.Modificacion)
            {
                this.ModificarMovimeintoEntrada();
            }
        }

        protected void cboTipoMovimiento_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.CambioTipoMovimiento();
        }

        protected void btnBuscarItems_Click(object sender, EventArgs e)
        {
            this.MostrarSeleccionItems();
        }

        protected void cboFiltroFamilia_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.ListarFiltroSubFamilia();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.RegresarHastaListaMovSal();
        }

        protected void btnRegresarDesdeItems_Click(object sender, EventArgs e)
        {
            this.RegresarDesdeListaItems();
        }

        #endregion

        /// <summary>
        /// Regresa a la vista Nuevo/Edicion desde la lista items.
        /// Se prodecederá a updatear la lista de items seleccionados.
        /// </summary>
        private void RegresarDesdeListaItems()
        {
            this.ActualizarListaItemsPreliminar();
            MovimientoSalidaBL mvsBL = new MovimientoSalidaBL();
            if (this.EscenarioMovSal == TipoOperacion.Creacion)
            {
                mvsBL.ActualizarListaItems(this.MovSalNuevo, this.ItemsAlmacenEncontrados);
                this.gvItemsSeleccionados.DataSource = MovSalNuevo.SIC_T_MOVIMIENTO_SALIDA_DETALLE;
                this.gvItemsSeleccionados.DataBind();
            }
            else if (this.EscenarioMovSal == TipoOperacion.Modificacion)
            {
                mvsBL.ActualizarListaItems(this.MovSalModificar, this.ItemsAlmacenEncontrados);
                this.gvItemsSeleccionados.DataSource = MovSalModificar.SIC_T_MOVIMIENTO_SALIDA_DETALLE;
                this.gvItemsSeleccionados.DataBind();
            }           

            mvMovSalida.SetActiveView(vwNuevoMovimiento);
            upGeneral.Update();
        }

        
        /// <summary>
        /// Actualiza la lista preliminar de items seleccionados.
        /// </summary>
        private void ActualizarListaItemsPreliminar()
        {
            var listaEncontrada = this.ItemsAlmacenEncontrados;

            List<SIC_T_ITEM_ALMACEN> list;
            if (ItemsAlmacenSeleccionados != null)
            {
                list = ItemsAlmacenSeleccionados;
            }
            else
            {
                list = new List<SIC_T_ITEM_ALMACEN>();
            }

            foreach (GridViewRow row in gvListaItem.Rows)
            {
                CheckBox chk = (CheckBox)row.FindControl("chkSelect");
                int idItemAlmacen = int.Parse(gvListaItem.DataKeys[row.RowIndex].Value.ToString());
                var itemSeleccionado = listaEncontrada.Find(x => x.itm_alm_c_iid == idItemAlmacen);
                if (chk.Checked)
                {
                    if (!list.Any(x => x.itm_alm_c_iid == idItemAlmacen))
                    {
                        list.Add(itemSeleccionado);
                    }
                }
                else
                {
                    list.RemoveAll(x => x.itm_alm_c_iid == idItemAlmacen);
                }
            }
        }

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
        /// Cambia la interfaz de acuerdo al movimiento seleccionado, ademas limpia la interfaz
        /// y los datos
        /// </summary>
        private void CambioTipoMovimiento()
        {
            if (cboTipoMovimiento.SelectedValue == ((int)TipoMovimientoSalida.VENTA).ToString())
            {
                pnlDatosSalVenta.Visible = true;
                this.btnBuscarItems.Visible = false;
            }
            else
            {
                pnlDatosSalVenta.Visible = false;
                this.btnBuscarItems.Visible = true;
            }
            if (this.EscenarioMovSal == TipoOperacion.Creacion)
            {
                this.LimpiarVistaNuevo();
                this.MovSalNuevo.SIC_T_CLIENTE = null;
                this.MovSalNuevo.SIC_T_VENTA = null;
            }
            else if (this.EscenarioMovSal == TipoOperacion.Modificacion)
            {
                this.LimpiarVistaNuevo();
                this.MovSalModificar.SIC_T_CLIENTE = null;
                this.MovSalModificar.SIC_T_VENTA = null;
            }

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
            gvListaMovSal.DataSource = mvsBL.ListarMovimientoSalida(txtFiltroRuc.Text,txtFiltroRS.Text,fi,ff);
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
            cboTipoMovimiento.DataSource = mvsBL.ListarTipoMovimientoSalida();
            cboTipoMovimiento.DataTextField = "par_det_c_vdesc";
            cboTipoMovimiento.DataValueField = "par_det_c_iid";
            cboTipoMovimiento.DataBind();
            updTipoMov.Update();
        }

        /// <summary>
        /// Lista almacenes.
        /// </summary>
        private void ListarFiltroAlmacen()
        {
            MovimientoSalidaBL mvsBL = new MovimientoSalidaBL();
            cboFiltroAlmacen.Items.Clear();
            cboFiltroAlmacen.Items.Add(new ListItem("-- Seleccionar --", "-1"));
            cboFiltroAlmacen.DataSource = mvsBL.ListaAlmacen();
            cboFiltroAlmacen.DataTextField = "alm_c_vdesc";
            cboFiltroAlmacen.DataValueField = "alm_c_iid";
            cboFiltroAlmacen.DataBind();
        }

        /// <summary>
        /// Lista las familias de items
        /// </summary>
        private void ListarFiltroFamilia()
        {
            MovimientoSalidaBL movSal = new MovimientoSalidaBL();
            cboFiltroFamilia.DataSource = movSal.ListarFamiliaItem();
            cboFiltroFamilia.DataTextField = "ifm_c_des";
            cboFiltroFamilia.DataValueField = "ifm_c_iid";
            cboFiltroFamilia.DataBind();
        }

        /// <summary>
        /// Lista las subfamilias de los items de acuerdo a la familia seleccionada.
        /// </summary>
        private void ListarFiltroSubFamilia()
        {
            int idFamilia;
            MovimientoSalidaBL movSal = new MovimientoSalidaBL();
            if (cboFiltroFamilia.SelectedIndex > 0 && int.TryParse(cboFiltroFamilia.SelectedValue, out idFamilia) && idFamilia > 0)
            {
                cboFiltroSubFamilia.Enabled = true;
                cboFiltroSubFamilia.Items.Clear();
                cboFiltroSubFamilia.Items.Add(new ListItem("-- Seleccionar --", "-1"));
                cboFiltroSubFamilia.DataSource = movSal.ListarSubFamiliaItem(idFamilia);
                cboFiltroSubFamilia.DataTextField = "isf_c_vdesc";
                cboFiltroSubFamilia.DataValueField = "isf_c_iid";
                cboFiltroSubFamilia.DataBind();
            }
            else
            {
                cboFiltroSubFamilia.DataSource = null;
                cboFiltroSubFamilia.Enabled = false;
                cboFiltroSubFamilia.Items.Clear();
                cboFiltroSubFamilia.Items.Add(new ListItem("-- Seleccionar --", "-1"));
                cboFiltroSubFamilia.DataBind();
            }
            this.upGeneral.Update();
        }

        /// <summary>
        /// Limpia los datos de la vista <c>vwNuevoMovimiento</c>
        /// </summary>
        private void LimpiarVistaNuevo()
        {
            this.txtRUCCli.Text = string.Empty;
            this.txtRSCli.Text = string.Empty;
            this.txtFechaVenta.Text = string.Empty;
            //this.txtFechaFactura.Text = string.Empty;
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
            this.cboTipoMovimiento.Enabled = true;
            this.cboTipoMovimiento.SelectedIndex = 0;
            this.pnlDatosSalVenta.Visible = true;
            this.btnBuscarItems.Visible = false;
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
        private void MostrarModificarMovimiento(int id)
        {
            this.EscenarioMovSal = TipoOperacion.Modificacion;
            this.btnBuscarVenta.Enabled = false;
            this.btnBuscarVenta.Visible = false;
            this.txtObs.ReadOnly = true;
            this.btnGuardar.Visible = false;
            this.btnGuardar.Enabled = false;
            this.cboTipoMovimiento.Enabled = false;
            this.lblAccion.Text = "VER";
            this.mvMovSalida.SetActiveView(this.vwNuevoMovimiento);
            MovimientoSalidaBL mvsBL = new MovimientoSalidaBL();
            this.MovSalModificar = mvsBL.ObtenerMovimientoSalida(id);

            cboTipoMovimiento.ClearSelection();
            var seleccion = cboTipoMovimiento.Items.FindByText(MovSalModificar.mvs_c_vdestiposalida);
            if (seleccion != null)
            {
                seleccion.Selected = true;
            }

            this.CambioTipoMovimiento();
            this.gvItemsSeleccionados.DataSource = MovSalModificar.SIC_T_MOVIMIENTO_SALIDA_DETALLE;
            if (MovSalModificar.SIC_T_VENTA != null)
            {
                txtFechaVenta.Text = MovSalModificar.SIC_T_VENTA.ven_c_zfecha.ToString("dd/MM/yyyy");
            }
            if (MovSalModificar.SIC_T_CLIENTE != null)
            {
                txtRUCCli.Text = MovSalModificar.SIC_T_CLIENTE.cli_c_vdoc_id;
                txtRSCli.Text = MovSalModificar.SIC_T_CLIENTE.cli_c_vraz_soc;
            }

            this.mvMovSalida.SetActiveView(vwNuevoMovimiento);
        }

        private void MostrarSeleccionItems()
        {
            this.ListarItem();
            this.mvMovSalida.SetActiveView(vwListaItem);
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
            mvsBL.GenerarDetalleMoviminetoSalida(MovSalNuevo, venta);
            this.gvItemsSeleccionados.DataSource = this.MovSalNuevo.SIC_T_MOVIMIENTO_SALIDA_DETALLE;
            this.gvItemsSeleccionados.DataBind();

            this.mvMovSalida.SetActiveView(this.vwNuevoMovimiento);
            upGeneral.Update();
        }

        private void IngresarMovimientoSalida()
        {
            MovimientoSalidaBL mvsBL = new MovimientoSalidaBL();
            var movSal = MovSalNuevo;
            movSal.mvs_c_itiposalida = int.Parse(cboTipoMovimiento.SelectedValue);
            movSal.mvs_c_vdestiposalida = cboTipoMovimiento.SelectedItem.Text;
            movSal.mov_estado_iid = 2;
            movSal.mvs_c_zfecharegistro = DateTime.Now;
            movSal.mvs_c_vobservacion = txtObs.Text;

            for (int i = 0; i < gvItemsSeleccionados.Rows.Count; i++)
            {
                TextBox txtCantidad = (TextBox)gvItemsSeleccionados.Rows[i].FindControl("txtCantidad");
                decimal cantidadNueva = 0;
                if (decimal.TryParse(txtCantidad.Text, out cantidadNueva) && cantidadNueva >= 0)
                {
                    int itemId = (int)gvItemsSeleccionados.DataKeys[i].Values["itm_c_iid"];
                    int almId = (int)gvItemsSeleccionados.DataKeys[i].Values["alm_c_iid"];
                    foreach (var item in movSal.SIC_T_MOVIMIENTO_SALIDA_DETALLE)
                    {
                        if (item.itm_c_iid == itemId && item.alm_c_iid == almId )
                        {
                            item.mvs_det_c_ecant = cantidadNueva;
                            break;
                        }
                    }
                }
                else
                {
                    txtCantidad.Text = "0";
                }
            }

            try
            {
                mvsBL.IngresarMovimientoSalida(this.MovSalNuevo);
                Mensaje("Movimiento de Salida ingresado con éxito.", "~/Imagenes/correcto.png");
                this.mvMovSalida.SetActiveView(vwListaMovimiento);
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

        private void ModificarMovimeintoSalida()
        {
            MovimientoSalidaBL mvsBL = new MovimientoSalidaBL();
            var movSal = MovSalModificar;
            movSal.mov_estado_iid = 2;
            movSal.mvs_c_itiposalida = int.Parse(cboTipoMovimiento.SelectedValue);
            movSal.mvs_c_vdestiposalida = cboTipoMovimiento.SelectedItem.Text;
            movSal.mov_estado_iid = 2;
            movSal.mvs_c_vobservacion = txtObs.Text;

            for (int i = 0; i < gvItemsSeleccionados.Rows.Count; i++)
            {
                TextBox txtCantidad = (TextBox)gvItemsSeleccionados.Rows[i].FindControl("txtCantidad");
                decimal cantidadNueva = 0;
                if (decimal.TryParse(txtCantidad.Text, out cantidadNueva) && cantidadNueva >= 0)
                {
                    int itemId = (int)gvItemsSeleccionados.DataKeys[i].Values["itm_c_iid"];
                    int almId = (int)gvItemsSeleccionados.DataKeys[i].Values["alm_c_iid"];
                    foreach (var item in movSal.SIC_T_MOVIMIENTO_SALIDA_DETALLE)
                    {
                        if (item.itm_c_iid == itemId && item.alm_c_iid == almId)
                        {
                            item.mvs_det_c_ecant = cantidadNueva;
                            break;
                        }
                    }
                }
                else
                {
                    txtCantidad.Text = "0";
                }
            }

            try
            {
                mvsBL.ModificarMovimientoSalida(this.MovSalModificar);
                Mensaje("Movimiento de Salida ingresado con éxito.", "~/Imagenes/correcto.png");
                this.mvMovSalida.SetActiveView(vwListaMovimiento);
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

        protected void btnFiltrarItems_Click(object sender, EventArgs e)
        {
            this.ListarItem();
        }


        /// <summary>
        /// Carga la lista de items para la busqueda tomando en consideración los filtros.
        /// </summary>
        private void ListarItem()
        {
            MovimientoSalidaBL mvsBL = new MovimientoSalidaBL();
            int id = -1;
            int[] idAlmacen = { -1 };
            var listaIdAlmacen = new List<int>();
            if (int.TryParse(cboFiltroAlmacen.SelectedValue, out id) && id != -1)
            {
                listaIdAlmacen.Add(id);
            }
            else
            {
                var lista = mvsBL.ListaAlmacen();
                foreach (var itemLista in lista)
                {
                    listaIdAlmacen.Add(itemLista.alm_c_iid);
                }                
            }

            int? idFamilia = null;
            int? idSubFamilia = null;
            if (int.TryParse(cboFiltroFamilia.SelectedValue, out id) && id != -1)
            {
                idFamilia = id;
            }

            if (int.TryParse(cboFiltroSubFamilia.SelectedValue, out id) && id != -1)
            {
                idSubFamilia = id;
            }

            this.ItemsAlmacenEncontrados = mvsBL.ListarItemAlmacen(txtFiltroCodigo.Text.Trim(), txtFiltroDescr.Text.Trim(),
                idFamilia, idSubFamilia, listaIdAlmacen.ToArray());
            gvListaItem.DataSource = ItemsAlmacenEncontrados;
            gvListaItem.DataBind();
        }

        

        private void RegresarHastaListaMovSal()
        {
            this.MovSalNuevo = null;
            this.MovSalModificar = null;
            this.mvMovSalida.SetActiveView(vwListaMovimiento);
        }

        protected void gvListaItem_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            List<SIC_T_ITEM_ALMACEN> list = ItemsAlmacenSeleccionados;
            if (e.Row.RowType == DataControlRowType.DataRow && list != null)
            {
                int itemId = (int)gvListaItem.DataKeys[e.Row.RowIndex].Values["itm_c_iid"];
                int almacenID = (int)gvListaItem.DataKeys[e.Row.RowIndex].Values["alm_c_iid"];
                if (list.Any(x => x.itm_c_iid == itemId && x.alm_c_iid == almacenID))
                {
                    CheckBox chk = (CheckBox)e.Row.FindControl("chkSelect");
                    chk.Checked = true;
                }
            }
        }

        protected void gvItemsSeleccionados_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            TextBox txtCantidad = (TextBox)e.Row.FindControl("txtCantidad");
            if (txtCantidad != null)
            {
                if (this.cboTipoMovimiento.SelectedValue == "27")
                {
                    txtCantidad.Enabled = false;
                }
                else
                {
                    txtCantidad.Enabled = true;
                }
            }
        }



    }
}