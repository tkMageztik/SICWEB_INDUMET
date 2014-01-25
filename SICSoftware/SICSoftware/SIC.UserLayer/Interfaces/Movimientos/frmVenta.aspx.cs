using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIC.BusinessLayer;
using SIC.Data;
using SIC.EntityLayer;
using System.Globalization;
using SIC.UserLayer.UserControl;

namespace SIC.UserLayer.Interfaces.Movimientos
{
    public partial class frmVenta : System.Web.UI.Page
    {
        #region DECLARACION DE VARIABLES
        private ParametroBL _parametro = null;
        private VentaBL _venta = null; 
        private ItemBL _item = null;
        private ClienteBL _cliente = null;
        private IgvBL _igv = null;
        private TasaCambioBL _tasaCambio = null;

        private TipoOperacion EscenarioVenta
        {
            get { return (TipoOperacion) ViewState["vsEscenarioVenta"] ; }
            set { ViewState["vsEscenarioVenta"] = value; }
        }

        private List<int> ItemsSeleccionadosPreliminar
        {
            get { return ViewState["ItemsSeleccionadosPreliminar"] as List<int>; }
            set { ViewState["ItemsSeleccionadosPreliminar"] = value; }
        }

        //private decimal percepcion
        //{
        //    get { return ViewState["Venpercepcion"] == null ? 0.0M : (decimal)ViewState["Venpercepcion"]; }
        //    set { ViewState["Venpercepcion"] = value; }
        //}

        private decimal igv
        {
            get { return ViewState["Venigv"] == null ? 0.0M : (decimal)ViewState["Venigv"]; }
            set { ViewState["Venigv"] = value; }
        }

        //private decimal percepcionmax
        //{
        //    get { return ViewState["Venpercepcionmax"] == null ? 0.0M : (decimal)ViewState["Venpercepcionmax"]; }
        //    set { ViewState["Venpercepcionmax"] = value; }
        //}

        private SIC_T_VENTA VentaSeleccionado
        {
            get { return ViewState["vsVentaSeleccionado"] as SIC_T_VENTA; }
            set { ViewState["vsVentaSeleccionado"] = value; }
        }

        private SIC_T_VENTA VentaNuevo
        {
            get { return ViewState["vsVentaNuevo"] as SIC_T_VENTA; }
            set { ViewState["vsVentaNuevo"] = value; }
        }

        private int VentaEliminar
        {
            get { return (int) (ViewState["vsVentaEliminar"]==null?-1:ViewState["vsVentaEliminar"]) ; }
            set { ViewState["vsVentaEliminar"] = value; }
        }

        private decimal TasaCambio
        {
            get { return (decimal)(ViewState["vsOCTC"] == null ? 1.0M : ViewState["vsOCTC"]); }
            set { ViewState["vsOCTC"] = value; }
        }

        #endregion

        #region Eventos
        public frmVenta()
        {
            _parametro = new ParametroBL();
            _item = new ItemBL();
            _venta = new VentaBL();
            _cliente = new ClienteBL();
            _igv = new IgvBL();
            _tasaCambio = new TasaCambioBL();
            EscenarioVenta = TipoOperacion.Ninguna;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.ListarComboMoneda();
                this.ListarComboMoneda();
                this.ListarItem();
                this.ListarClientes();
                this.ListarComboTipoDocumento();
                this.ListarVentas();
                gvItemsSeleccionados.DataSource = null;
                gvItemsSeleccionados.DataBind();
                this.ObtenerDatosImpuesto();
            }
            if (EscenarioVenta == TipoOperacion.Eliminacion)
            {
                SetearEliminar();
            }
            
        }

        protected void btnBuscarProveedor_Click(object sender, EventArgs e)
        {
            this.MostrarBusquedaProveedor();
        }


        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.CancelarNuevoEdicion();
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            this.MostrarNuevoVenta();
        }

        protected void btnBuscarItems_Click(object sender, EventArgs e)
        {
            this.MostrarBusquedaItem();
        }
        
        protected void btnBuscarItem_Click(object sender, EventArgs e)
        {
            this.ListarItem();
        }

        protected void gvListaItem_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.ActualizarListaItemsPreliminar();
            this.gvListaItem.PageIndex = e.NewPageIndex;
            this.ListarItem();            
        }

        protected void gvListaItem_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            List<int> list = ItemsSeleccionadosPreliminar;
            if (e.Row.RowType == DataControlRowType.DataRow && list != null) 
            { 
                var autoId = int.Parse(gvListaItem.DataKeys[e.Row.RowIndex].Value.ToString()); 
                if (list.Contains(autoId)) 
                { 
                    CheckBox chk = (CheckBox)e.Row.FindControl("chkSelect"); 
                    chk.Checked = true; 
                } 
            } 
        }

        protected void btnRegresarDesdeItems_Click(object sender, EventArgs e)
        {
            this.RegresarDesdeListaItems();
        }

        protected void gvCliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.SeleccionCliente();
        }
        
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (this.EscenarioVenta == TipoOperacion.Creacion)
            {
                this.IngresarVenta();
            }
            else if (this.EscenarioVenta == TipoOperacion.Modificacion)
            {
                this.ActualizarOC();
            }
        }

        protected void gvCliente_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCliente.PageIndex = e.NewPageIndex;
            this.ListarClientes();
        }

        protected void gvItemsSeleccionados_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvItemsSeleccionados.EditIndex = e.NewEditIndex;
            if (this.EscenarioVenta == TipoOperacion.Modificacion)
            {
                gvItemsSeleccionados.DataSource = VentaSeleccionado.SIC_T_VENTA_DETALLE;
                gvItemsSeleccionados.DataBind();
            }
            else if (this.EscenarioVenta == TipoOperacion.Creacion)
            {
                gvItemsSeleccionados.DataSource = VentaNuevo.SIC_T_VENTA_DETALLE;
                gvItemsSeleccionados.DataBind();
            }
        }

        protected void gvItemsSeleccionados_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvItemsSeleccionados.EditIndex = -1;
            if (this.EscenarioVenta == TipoOperacion.Modificacion)
            {
                gvItemsSeleccionados.DataSource = VentaSeleccionado.SIC_T_VENTA_DETALLE;
                gvItemsSeleccionados.DataBind();
            }
            else if (this.EscenarioVenta == TipoOperacion.Creacion)
            {
                gvItemsSeleccionados.DataSource = VentaNuevo.SIC_T_VENTA_DETALLE;
                gvItemsSeleccionados.DataBind();
            }

        }

        protected void gvItemsSeleccionados_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox txtCantidad = (TextBox)gvItemsSeleccionados.Rows[e.RowIndex].FindControl("txtCantidad");
            TextBox txtPrecio = (TextBox)gvItemsSeleccionados.Rows[e.RowIndex].FindControl("txtPrecio");
            decimal cantidadNueva, precioNuevo;
            if (decimal.TryParse(txtCantidad.Text, out cantidadNueva) && cantidadNueva > 0
                && decimal.TryParse(txtPrecio.Text, out precioNuevo) && precioNuevo > 0)
            {
                int itemId = (int)gvItemsSeleccionados.DataKeys[e.RowIndex].Value;

                if (this.EscenarioVenta == TipoOperacion.Modificacion)
                {
                    SIC_T_VENTA venta = this.VentaSeleccionado;
                    foreach (var item in venta.SIC_T_VENTA_DETALLE)
                    {
                        if (item.ven_det_c_iitemid== itemId)
                        {
                            item.ven_det_c_ecantidad = cantidadNueva;
                            item.ven_det_c_epreciounit = precioNuevo;
                            if (cboMoneda.SelectedIndex == 0)
                            {
                                item.precioUnitarioSoles = precioNuevo;
                            }
                            else
                            {
                                item.precioUnitarioSoles = precioNuevo * this.TasaCambio;
                                ;
                            }
                            item.ven_det_c_epreciototal = item.ven_det_c_epreciounit * cantidadNueva;
                            break;
                        }
                    }
                    this.RecalcularMontos(venta);
                    gvItemsSeleccionados.EditIndex = -1;
                    gvItemsSeleccionados.DataSource = venta.SIC_T_VENTA_DETALLE;
                    gvItemsSeleccionados.DataBind();
                }
                else if (this.EscenarioVenta == TipoOperacion.Creacion)
                {
                    SIC_T_VENTA ordenCompra = this.VentaNuevo;
                    foreach (var item in ordenCompra.SIC_T_VENTA_DETALLE)
                    {
                        if (item.ven_det_c_iitemid == itemId)
                        {
                            item.ven_det_c_ecantidad = cantidadNueva;
                            item.ven_det_c_epreciounit = item.SIC_T_ITEM.itm_c_dprecio_compra;
                            item.ven_det_c_epreciototal = item.ven_det_c_epreciounit * cantidadNueva;
                            break;
                        }
                    }
                    this.RecalcularMontos(ordenCompra);
                    gvItemsSeleccionados.EditIndex = -1;
                    gvItemsSeleccionados.DataSource = ordenCompra.SIC_T_VENTA_DETALLE;
                    gvItemsSeleccionados.DataBind();
                }
            }
            else
            {
                Mensaje("Debe ingresar un número entero válido mayor a 0.", "../Imagenes/warning.png");
                return;
            }
        }

        protected void gvListaVenta_RowEditing(object sender, GridViewEditEventArgs e)
        {
          
            int ocId = (int)this.gvListaVenta.DataKeys[e.NewEditIndex].Value;
            e.NewEditIndex = -1;
            this.gvListaItem.EditIndex = -1;
            this.ListarVentas();
            this.MostrarModificarVenta(ocId);            
        }

        protected void gvListaVenta_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            this.EscenarioVenta = TipoOperacion.Eliminacion;
            this.VentaEliminar = (int)this.gvListaVenta.DataKeys[e.RowIndex].Value;
            this.SetearEliminar();

            this.ucMensaje2.Show("¿Desea eliminar la Venta seleccionada?", null,
                                MensajeIcono.Alerta, MensajeBotones.AceptarCancelar);
        }

        private void SetearEliminar()
        {
            ResultadoMensajeHandler handler = null;
            handler = delegate(object s, ResMsjArgs e2)
            {
                if (e2.resultado == MensajeResultado.Aceptar)
                {
                    this.DeshabilitarOC(VentaEliminar);
                    this.ucMensaje2.ResultadoMensaje -= handler;
                }

                this.EscenarioVenta = TipoOperacion.Ninguna;
            };

            this.ucMensaje2.ResultadoMensaje += handler;
            
        }


        #endregion

        #region Metodos de Listado
        /// <summary>
        /// Carga el combo de Moneda.
        /// </summary>
        private void ListarComboMoneda()
        {
            cboMoneda.DataSource = _parametro.ListarParametros((int)TipoParametro.MONEDA);
            cboMoneda.DataTextField = "par_det_c_vdesc";
            cboMoneda.DataValueField = "par_det_c_iid";
            cboMoneda.DataBind();
        }

        /// <summary>
        /// Carga los combos de Estado.
        /// </summary>
        private void ListarComboTipoDocumento()
        {
            cboTipoDocumento.DataSource = _parametro.ListarParametros((int)TipoParametro.DOCUMENTO_VENTA);
            cboTipoDocumento.DataTextField = "par_det_c_vdesc";
            cboTipoDocumento.DataValueField = "par_det_c_iid";
            cboTipoDocumento.DataBind();
        }
        /// <summary>
        /// Carga la lista de Ordenes de Compra
        /// </summary>
        private void ListarVentas()
        {
            gvListaVenta.DataSource =  _venta.ListarVentas();
            gvListaVenta.DataBind();
        }

        /// <summary>
        /// Carga la lista de items para la busqueda tomando en consideración los filtros.
        /// </summary>
        private void ListarItem()
        {
            gvListaItem.DataSource = _item.ListarItems(txtFiltroCodigo.Text.Trim(), txtFiltroDescr.Text.Trim(), null);
            gvListaItem.DataBind();
        }


        private void ListarClientes()
        {
            gvCliente.DataSource = _cliente.ListarClientes();
            gvCliente.DataBind();
        }

        private void ObtenerDatosImpuesto()
        {
            //var listaPercepcion = this._parametro.ListarParametros((int)TipoParametro.PERCEPCION);

            var resultado = this._igv.ObtenerIgv(DateTime.Today);

            if (resultado != null && resultado.igv_c_eigv.HasValue)
            {
                this.igv = resultado.igv_c_eigv.Value;
            }
            else
            {
                this.igv = 0.18M;
            }

            //decimal prev, prev2;

            //if (listaPercepcion.Count == 2)
            //{
            //    prev = decimal.Parse(listaPercepcion[0].par_det_c_vcampo_1.ToString(), CultureInfo.InvariantCulture); 
            //    prev2 = decimal.Parse(listaPercepcion[1].par_det_c_vcampo_1.ToString(), CultureInfo.InvariantCulture); 

            //    if (prev > 1)
            //    {
            //        this.percepcionmax = prev;
            //        this.percepcion = prev2;
            //    }
            //    else
            //    {
            //        this.percepcion = prev;
            //        this.percepcionmax = prev2;
            //    }
            //}
            //else
            //{
            //    this.percepcionmax = 500M;
            //    this.percepcion = 0.02M;
            //}

        }

        public void MostrarDatosImpuestos()
        {
            if (this.EscenarioVenta == TipoOperacion.Creacion)
            {
                lblIGV.Text = this.VentaNuevo.ven_c_eigv * 100 + "%";
                //lblPercepcion.Text = this.VentaNuevo.ven_c_dpercepcion * 100 + "%";
            }
            else if (this.EscenarioVenta == TipoOperacion.Modificacion)
            {
                lblIGV.Text = this.VentaSeleccionado.ven_c_eigv * 100 + "%";
                //lblPercepcion.Text = this.VentaSeleccionado.ven_c_dpercepcion * 100 + "%";
            }            
        }

        #endregion

        private void ObtenerTasaCambio(DateTime fechaTC)
        {
            var value = this._tasaCambio.ObtenerTasaCambio(fechaTC);

            if (value != null && value.tsc_c_ecompra.HasValue)
            {
                this.TasaCambio = value.tsc_c_ecompra.Value;
            }
            lblTC.Text = value.tsc_c_ecompra.Value.ToString();
        }

        #region Metodos de Movimiento
        /// <summary>
        /// Inicializa y muestra la vista de Nueva Venta. 
        /// </summary>
        private void MostrarNuevoVenta()
        {
            this.VentaNuevo = new SIC_T_VENTA();
            this.VentaNuevo.SIC_T_VENTA_DETALLE = new System.Data.Objects.DataClasses.EntityCollection<SIC_T_VENTA_DETALLE>();
            this.VentaNuevo.ven_c_eigv = this.igv;
            //this.VentaNuevo.ven_c_dpercepcion = this.percepcion;
            this.VentaNuevo.ven_c_zfecha = DateTime.Now;
            this.lblFechaRegistro.Text = VentaNuevo.ven_c_zfecha.Value.ToString("dd/MM/yyyy");
            this.gvItemsSeleccionados.DataSource = this.VentaNuevo.SIC_T_VENTA_DETALLE;
            this.EscenarioVenta = TipoOperacion.Creacion;
            this.lblAccion.Text = "Nuevo";
            this.ItemsSeleccionadosPreliminar = new List<int>();
            this.ObtenerTasaCambio(VentaNuevo.ven_c_zfecha.Value);
            this.RecalcularMontos(this.VentaNuevo);
            this.mvOC.ActiveViewIndex = 1;
            this.MostrarDatosImpuestos();
            this.upGeneral.Update();
        }

        /// <summary>
        /// Inicializa y muestra la vista de Modificar Venta.
        /// </summary>
        private void MostrarModificarVenta(int id)
        {
            this.VentaSeleccionado = _venta.ObtenerOrdenCompra(id);
            this.gvItemsSeleccionados.DataSource = this.VentaSeleccionado.SIC_T_VENTA_DETALLE;
            this.gvItemsSeleccionados.DataBind();
            this.EscenarioVenta = TipoOperacion.Modificacion;
            this.VentaSeleccionado.ven_c_eigv = this.igv;
            //this.VentaSeleccionado.ven_c_dpercepcion = this.percepcion;
            this.lblFechaRegistro.Text = VentaSeleccionado.ven_c_zfecha.Value.ToString("dd/MM/yyyy");
            
            this.ItemsSeleccionadosPreliminar = new List<int>();
            foreach (var item in VentaSeleccionado.SIC_T_VENTA_DETALLE)
            {
                this.ItemsSeleccionadosPreliminar.Add(item.SIC_T_ITEM.itm_c_iid);
            }

            txtRSProv.Text = this.VentaSeleccionado.SIC_T_CLIENTE == null ? string.Empty : 
                                                                           this.VentaSeleccionado.SIC_T_CLIENTE.cli_c_vraz_soc;
            cboTipoDocumento.SelectedIndex = -1;

            var seleccion = cboTipoDocumento.Items.FindByText(VentaSeleccionado.ven_c_vdestipodoc);
            if (seleccion != null)
            {
                seleccion.Selected = true;
            }

            cboMoneda.SelectedIndex = -1;
            seleccion = cboMoneda.Items.FindByText(VentaSeleccionado.ven_c_vdescmoneda);
            if (seleccion != null)
            {
                seleccion.Selected = true;
            }
            this.ObtenerTasaCambio(VentaSeleccionado.ven_c_zfecha.Value);

            foreach (var item in VentaSeleccionado.SIC_T_VENTA_DETALLE)
            {
                item.codigoItem = item.SIC_T_ITEM.itm_c_ccodigo;
                item.descItem = item.SIC_T_ITEM.itm_c_vdescripcion;

                if (item.SIC_T_ITEM != null && item.SIC_T_ITEM.itm_c_dprecio_compra.HasValue)
                {
                    item.precioReferenciaSoles = item.SIC_T_ITEM.itm_c_dprecio_compra.Value;
                }
                else
                {
                    item.precioReferencia = 0;
                }

                if (cboMoneda.SelectedIndex == 0)
                {
                    item.precioReferencia = item.precioReferenciaSoles;
                    item.precioUnitarioSoles = item.ven_det_c_epreciounit.HasValue ? item.ven_det_c_epreciounit.Value : 0;
                }
                else
                {
                    item.precioReferencia = Math.Round(item.precioReferenciaSoles / this.TasaCambio, 2);
                    item.precioUnitarioSoles = item.ven_det_c_epreciounit.HasValue ?
                        Math.Round(item.ven_det_c_epreciounit.Value * this.TasaCambio, 2) : 0;
                }

            }

            this.gvItemsSeleccionados.DataSource = this.VentaSeleccionado.SIC_T_VENTA_DETALLE;
            this.gvItemsSeleccionados.DataBind();

            this.RecalcularMontos(this.VentaSeleccionado);
            this.MostrarDatosImpuestos();

            this.mvOC.ActiveViewIndex = 1;
            this.upGeneral.Update();
        }

        /// <summary>
        /// Regresa a la vista Nuevo/Edicion sin alterar su contenido
        /// ni el proceso actual.
        /// El contenido pudo haber sido alterado desde otra vista, 
        /// pero este metodo no modificará ningun dato de ella.
        /// </summary>
        private void RegresarNuevoEdicionOrdenCompra()
        {
            mvOC.ActiveViewIndex = 1;
            upGeneral.Update();
        }

        /// <summary>
        /// Inicializar y muestra la vista de busqueda de proveedor
        /// </summary>
        private void MostrarBusquedaProveedor()
        {
            mvOC.ActiveViewIndex = 3;
            upGeneral.Update();
        }

        /// <summary>
        /// Inicializa y muestra la vista de busqueda de items.
        /// </summary>
        private void MostrarBusquedaItem()
        {
            if (EscenarioVenta == TipoOperacion.Creacion || EscenarioVenta == TipoOperacion.Modificacion)
            {
                this.ListarItem();
                mvOC.ActiveViewIndex = 2;
                upGeneral.Update();
            }
            else
            {
                Mensaje("Operación no permitida.", "../Imagenes/warning.png");
            }
        }

        /// <summary>
        /// Regresa a la vista Nuevo/Edicion desde la lista items.
        /// Se prodecederá a updatear la lista de items seleccionados.
        /// </summary>
        private void RegresarDesdeListaItems()
        {
            this.ActualizarListaItemsPreliminar();
            if (this.EscenarioVenta == TipoOperacion.Creacion)
            {
                this.ActualizarListaItems(this.VentaNuevo);
                this.RecalcularMontos(this.VentaNuevo);
            }
            else if (this.EscenarioVenta == TipoOperacion.Modificacion)
            {
                this.ActualizarListaItems(this.VentaSeleccionado);
                this.RecalcularMontos(this.VentaSeleccionado);
            }

            mvOC.ActiveViewIndex = 1;
            upGeneral.Update();
        }

        private void RegresarDesdeCliente()
        {
            mvOC.ActiveViewIndex = 1;
            upGeneral.Update();
        }

        /// <summary>
        /// Cancela el proceso, limpia la vista Nuevo/Edicion
        /// y regresa a la vista de la tabla.
        /// </summary>
        private void CancelarNuevoEdicion()
        {
            this.Limpiar();
            this.ListarVentas();
            mvOC.ActiveViewIndex = 0;
            upGeneral.Update();
        }       

        #endregion

        #region Metodos del Proceso

        /// <summary>
        /// Actualiza la lista preliminar de items seleccionados.
        /// </summary>
        private void ActualizarListaItemsPreliminar()
        {
            List<int> list;
            if (ItemsSeleccionadosPreliminar != null)
            {
                list = ItemsSeleccionadosPreliminar;
            }
            else
            {
                list = new List<int>();
            }

            foreach (GridViewRow row in gvListaItem.Rows)
            {
                CheckBox chk = (CheckBox)row.FindControl("chkSelect");
                var selectedKey =
                int.Parse(gvListaItem.DataKeys[row.RowIndex].Value.ToString());
                if (chk.Checked)
                {
                    if (!list.Contains(selectedKey))
                    {
                        list.Add(selectedKey);
                    }
                }
                else
                {
                    if (list.Contains(selectedKey))
                    {
                        list.Remove(selectedKey);
                    }
                }
            } 
        }

        /// <summary>
        /// Actualiza la lista de items desde la lista preliminar
        /// </summary>
        private void ActualizarListaItems(SIC_T_VENTA venta)
        {
            if (venta == null)
            {
                return;
            }
            if (venta.SIC_T_VENTA_DETALLE == null)
            {
                venta.SIC_T_VENTA_DETALLE = new System.Data.Objects.DataClasses.EntityCollection<SIC_T_VENTA_DETALLE>();
            }

            List<int> listaPrel = this.ItemsSeleccionadosPreliminar;
            if(listaPrel == null)
            {
                return;
            }

            // Primero eliminamos todos los que no estan seleccionados           
            List<SIC_T_VENTA_DETALLE> remover = 
                venta.SIC_T_VENTA_DETALLE.Where(x => !listaPrel.Contains(x.ven_det_c_iitemid)).ToList();
            foreach (var item in remover)
            {
                venta.SIC_T_VENTA_DETALLE.Remove(item);
            }

            decimal precioReferencia, precioReferenciaSoles;

            // Ahora agregamos los nuevos
            foreach (int idItem in listaPrel)
            {
                if (!venta.SIC_T_VENTA_DETALLE.Where(x => x.ven_det_c_iitemid == idItem).Any())
                {
                    SIC_T_ITEM itemEncontrado = _item.ObtenerItemPorIdNoContext(idItem);
                    if (itemEncontrado.itm_c_dprecio_compra.HasValue)
                    {
                        precioReferencia = (cboMoneda.SelectedIndex == 0 ? itemEncontrado.itm_c_dprecio_compra.Value
                                                                        : Math.Round(itemEncontrado.itm_c_dprecio_compra.Value / this.TasaCambio));
                        precioReferenciaSoles = itemEncontrado.itm_c_dprecio_compra.Value;
                    }
                    else
                    {
                        precioReferencia = 0;
                        precioReferenciaSoles = 0;
                    }

                    SIC_T_VENTA_DETALLE nuevoDetalle = new SIC_T_VENTA_DETALLE();
                    nuevoDetalle.ven_det_c_ecantidad = 1;
                    nuevoDetalle.ven_det_c_iitemid = itemEncontrado.itm_c_iid;
                    nuevoDetalle.ven_det_c_epreciounit = itemEncontrado.itm_c_dprecio_venta;
                    nuevoDetalle.ven_det_c_epreciototal= itemEncontrado.itm_c_dprecio_venta;
                    nuevoDetalle.SIC_T_ITEM = itemEncontrado;
                    nuevoDetalle.precioReferencia = precioReferencia;
                    nuevoDetalle.precioReferenciaSoles = precioReferenciaSoles;
                    nuevoDetalle.precioUnitarioSoles = itemEncontrado.itm_c_dprecio_compra.HasValue ? itemEncontrado.itm_c_dprecio_compra.Value
                                                                                                          : 0;
                    nuevoDetalle.codigoItem = itemEncontrado.itm_c_ccodigo;
                    nuevoDetalle.descItem = itemEncontrado.itm_c_vdescripcion;

                    venta.SIC_T_VENTA_DETALLE.Add(nuevoDetalle);
                }
            }

            gvItemsSeleccionados.DataSource = venta.SIC_T_VENTA_DETALLE;
            gvItemsSeleccionados.DataBind();
        }

        /// <summary>
        /// Recalcula los montos de subtotal, igv, percepcion y total de la Venta.
        /// </summary>
        /// <param name="venta"></param>
        private void RecalcularMontos(SIC_T_VENTA venta)
        {
            decimal subTotal = 0M;
            String simbolo = "S/.";
            if (cboMoneda.SelectedIndex == 0) 
            {
                simbolo = "S/.";
            }
            else
            {
                simbolo = "US$";
            }

            foreach (var item in venta.SIC_T_VENTA_DETALLE)
            {
                if (item.ven_det_c_epreciototal.HasValue)
                {
                    subTotal += item.ven_det_c_epreciototal.Value;
                }
            }

            venta.ven_c_esubtotal = subTotal;
            venta.ven_c_eigv = this.igv;
            venta.ven_c_eigvcal = Math.Round(subTotal * venta.ven_c_eigv.Value , 2);
            //venta.ven_c_epercepcion = this.percepcion;

            //if (subTotal > this.percepcionmax)
            //{
            //    venta.odc_c_epercepcioncal = Math.Round(subTotal * venta.odc_c_epercepcion.Value / this.TasaCambio, 2);
            //}
            //else
            //{
            //    venta.odc_c_epercepcioncal = 0;
            //}

            venta.ven_c_etotal = venta.ven_c_esubtotal + venta.ven_c_eigvcal;
                                        //+ venta.odc_c_epercepcioncal;

            this.lblSubTotal.Text = simbolo + " " + venta.ven_c_esubtotal.Value.ToString("F2", CultureInfo.InvariantCulture);
            this.lblTotal.Text = simbolo + " " + venta.ven_c_etotal.Value.ToString("F2", CultureInfo.InvariantCulture);
            this.lblIGVCal.Text = simbolo + " " + venta.ven_c_eigvcal.Value.ToString("F2", CultureInfo.InvariantCulture);
            //this.lblPercepcionCal.Text = simbolo + " " + venta.ven_c_epercepcioncal.Value.ToString("F2", CultureInfo.InvariantCulture);
        }

        private void SeleccionCliente()
        {            
            String RUC = this.gvCliente.DataKeys[gvCliente.SelectedIndex].Value.ToString();
            if (EscenarioVenta == TipoOperacion.Modificacion)
            {
                this.VentaSeleccionado.ven_c_vdoccli_id = RUC;
            }
            else if (EscenarioVenta == TipoOperacion.Creacion)
            {
                this.VentaNuevo.ven_c_vdoccli_id = RUC;
            }

            if (gvCliente.Rows[gvCliente.SelectedIndex].Cells[1].Text != null)
            {
                txtRSProv.Text = gvCliente.Rows[gvCliente.SelectedIndex].Cells[1].Text;
            }

            mvOC.ActiveViewIndex = 1;
            upGeneral.Update();
        }

        
        private void IngresarVenta()
        {
            if (!VerificarDatosOC(this.VentaNuevo))
            {
                return;
            }

            var ven = this.VentaNuevo;
            ven.ven_c_zfecha = DateTime.Now;
            ven.ven_c_ymoneda = byte.Parse(this.cboMoneda.SelectedValue);
            ven.ven_c_vdescmoneda = this.cboMoneda.SelectedItem.Text.Trim();
            ven.ven_c_itipodoc= int.Parse(this.cboTipoDocumento.SelectedValue);
            ven.ven_c_vdestipodoc = this.cboTipoDocumento.SelectedItem.Text.Trim();

            try
            {
                if (_venta.InsertarOrdenCompra(this.VentaNuevo))
                {
                    Mensaje("Venta registrada con éxito", "../Imagenes/correcto.png");
                    this.Limpiar();
                    this.ListarVentas();
                    mvOC.ActiveViewIndex = 0;
                    upGeneral.Update();
                }
                else
                {
                    Mensaje("Error al realizar el proceso.", "../Imagenes/warning.png");
                }
            }
            catch (Exception ex)
            {
                Mensaje("Error al realizar el proceso.", "../Imagenes/warning.png");
            }
        }

        private void ActualizarOC()
        {
            if (!VerificarDatosOC(this.VentaSeleccionado))
            {
                return;
            }

            var ven = this.VentaSeleccionado;
            ven.ven_c_zfecha = DateTime.Now;
            ven.ven_c_ymoneda = byte.Parse(this.cboMoneda.SelectedValue);
            ven.ven_c_vdescmoneda = this.cboMoneda.SelectedItem.Text.Trim();
            ven.ven_c_itipodoc = int.Parse(this.cboTipoDocumento.SelectedValue);
            ven.ven_c_vdestipodoc = this.cboTipoDocumento.SelectedItem.Text.Trim();


            try
            {
                if (_venta.ModificarOrdenCompra(this.VentaSeleccionado))
                {
                    Mensaje("Venta modificada con éxito", "../Imagenes/correcto.png");
                    this.Limpiar();
                    this.ListarVentas();
                    mvOC.ActiveViewIndex = 0;
                    upGeneral.Update();
                }
                else
                {
                    Mensaje("Error al realizar el proceso.", "../Imagenes/warning.png");
                }
            }
            catch (Exception ex)
            {
                Mensaje("Error al realizar el proceso.", "../Imagenes/warning.png");
            }
        }

        /// <summary>
        /// Limpia 
        /// </summary>
        private void Limpiar()
        {
            this.VentaNuevo = null;
            this.VentaSeleccionado = null;
            this.EscenarioVenta = TipoOperacion.Ninguna;
            this.ItemsSeleccionadosPreliminar = null;
            this.txtRSProv.Text = string.Empty;
            this.cboMoneda.SelectedIndex = -1;
            this.cboTipoDocumento.SelectedIndex = -1;
            this.lblFechaRegistro.Text = string.Empty;
            this.gvItemsSeleccionados.DataSource = null;
            this.gvItemsSeleccionados.DataBind();
        }


        private bool VerificarDatosOC(SIC_T_VENTA ordenDeCompra)
        {
            if (ordenDeCompra == null)
            {
                Mensaje("Estado de la página no válido.", "../Imagenes/warning.png");
                return false;
            }
            else if (ordenDeCompra.ven_c_vdoccli_id == null || ordenDeCompra.ven_c_vdoccli_id == string.Empty)
            {
                Mensaje("Debe seleccionar un cliente.", "../Imagenes/warning.png");
                return false;
            }
            else if (cboTipoDocumento.SelectedIndex == -1)
            {
                Mensaje("Debe seleccionar un tipo documento.", "../Imagenes/warning.png");
                return false;
            }
            else if (cboMoneda.SelectedIndex == -1)
            {
                Mensaje("Debe seleccionar un tipo de Moneda.", "../Imagenes/warning.png");
                return false;
            }
            else if (ordenDeCompra.SIC_T_VENTA_DETALLE == null
                || ordenDeCompra.SIC_T_VENTA_DETALLE.Count == 0)
            {
                Mensaje("Debe seleccionar al menos un item.", "../Imagenes/warning.png");
                return false;
            }
            else
            {
                return true;
            }
        }

        private void DeshabilitarOC(int idOC)
        {
            
            try
            {
                if (this._venta.DeshabilitarOrdenCompra(idOC))
                {
                    Mensaje("Item Deshabilitado.", "../Imagenes/correcto.png");
                }
                else
                {
                    Mensaje("Error al realizar el proceso.", "../Imagenes/warning.png");
                }
            }
            catch (Exception)
            {
                Mensaje("Error al realizar el proceso.", "../Imagenes/warning.png");
            }

        
            this.ListarVentas();
            upGeneral.Update();
        }

        #endregion

        private void Mensaje(string mensaje, string ruta)
        {
            divPopUpMsg.Attributes["Class"] = "PopupMostrar";
            ucMensaje.Visible = true;
            ucMensaje.Mensaje = mensaje;
            ucMensaje.Ruta = ruta;
            ucMensaje.EnableModelDialog(true);
            return;
        }

        protected void gvListaVenta_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvListaVenta.PageIndex= e.NewPageIndex;
            ListarVentas();
        }

        protected void btnRegresarDesdeProveedor_Click(object sender, EventArgs e)
        {
            RegresarDesdeCliente();
        }

        protected void cboMoneda_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.EscenarioVenta == TipoOperacion.Creacion)
            {
                CambiarMonedaListaItem(this.VentaNuevo);
                this.RecalcularMontos(this.VentaNuevo);
                this.upGeneral.Update();
            }
            else if (this.EscenarioVenta == TipoOperacion.Modificacion)
            {
                CambiarMonedaListaItem(this.VentaSeleccionado);
                this.RecalcularMontos(this.VentaSeleccionado);
                this.upGeneral.Update();
            }
        }

        private void CambiarMonedaListaItem(SIC_T_VENTA venta)
        {
            bool bSoles = cboMoneda.SelectedIndex == 0;
            foreach (var item in venta.SIC_T_VENTA_DETALLE)
            {
                if (bSoles)
                {
                    item.ven_det_c_epreciounit = item.precioUnitarioSoles;
                    item.precioReferencia = item.precioReferenciaSoles;
                    item.ven_det_c_epreciototal = item.ven_det_c_epreciounit * item.ven_det_c_ecantidad;
                }
                else
                {
                    item.ven_det_c_epreciounit = Math.Round(item.precioUnitarioSoles / this.TasaCambio, 2);
                    item.precioReferencia = Math.Round(item.precioReferenciaSoles / this.TasaCambio, 2);
                    item.ven_det_c_epreciototal = item.ven_det_c_epreciounit * item.ven_det_c_ecantidad;
                }
            }

            gvItemsSeleccionados.DataSource = venta.SIC_T_VENTA_DETALLE;
            gvItemsSeleccionados.DataBind();
        }

        private void ObtenerTasaCambio()
        {
            if (cboMoneda.SelectedIndex == 0)
            {
                this.TasaCambio = 1.0M;
                lblTC.Text = "-";

            }
            else
            {
                var value = this._tasaCambio.ObtenerTasaCambio(DateTime.Today); ;

                if (value != null && value.tsc_c_ecompra.HasValue)
                {
                    this.TasaCambio = value.tsc_c_ecompra.Value;
                }
                lblTC.Text = value.tsc_c_ecompra.Value.ToString();
            }

        }

        protected void gvListaItem_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow &&
               (e.Row.RowState == DataControlRowState.Normal ||
                e.Row.RowState == DataControlRowState.Alternate))
            {
                CheckBox chkBxSelect = (CheckBox)e.Row.Cells[1].FindControl("chkSelect");
                CheckBox chkBxHeader = (CheckBox)this.gvListaItem.HeaderRow.FindControl("chkAll");
                chkBxSelect.Attributes["onclick"] = string.Format
                                                       (
                                                          "javascript:ChildClick(this,'{0}');",
                                                          chkBxHeader.ClientID
                                                       );
            }
        }

 



        

    }
}