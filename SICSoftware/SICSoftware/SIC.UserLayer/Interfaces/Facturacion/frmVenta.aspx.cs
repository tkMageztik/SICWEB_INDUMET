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
        private ItemAlmacenBL _itemAlmacen = null;
        private ClienteBL _cliente = null;
        private IgvBL _igv = null;
        private TasaCambioBL _tasaCambio = null;
        private CentroCostoBL _centroCosto = null;
        private AlmacenBL _almacen = null;

        private TipoOperacion EscenarioVenta
        {
            get { return (TipoOperacion) ViewState["vsEscenarioVenta"] ; }
            set { ViewState["vsEscenarioVenta"] = value; }
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

        private decimal igv
        {
            get { return ViewState["Venigv"] == null ? 0.0M : (decimal)ViewState["Venigv"]; }
            set { ViewState["Venigv"] = value; }
        }

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
            _itemAlmacen = new ItemAlmacenBL();
            _venta = new VentaBL();
            _cliente = new ClienteBL();
            _igv = new IgvBL();
            _tasaCambio = new TasaCambioBL();
            _centroCosto = new CentroCostoBL();
            _almacen = new AlmacenBL();
            EscenarioVenta = TipoOperacion.Ninguna;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.ListarComboMoneda();
                this.ListarComboMoneda();
                this.ListarClientes();
                this.ListarComboTipoDocumento();
                this.ListarVentas();
                this.ListarComboCentroCosto();
                this.ListarEstadoVenta();
                gvItemsSeleccionados.DataSource = null;
                gvItemsSeleccionados.DataBind();
                this.ObtenerDatosImpuesto();
            }

            if (EscenarioVenta == TipoOperacion.Eliminacion)
            {
                SetearEliminar();
            }            
        }

        protected void cboCentroCosto_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idCentro = -1;
            int.TryParse(cboCentroCosto.SelectedValue,out idCentro);
            if (this.EscenarioVenta == TipoOperacion.Creacion)
            {
                VentaNuevo.ven_c_icentrocosto = idCentro;
                VentaNuevo.SIC_T_VENTA_DETALLE.Clear();
                if (idCentro != -1)
                {
                    btnBuscarItems.Enabled = true;
                }
                else
                {
                    btnBuscarItems.Enabled = false;
                }
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
        
        protected void btnFiltrarItem_Click(object sender, EventArgs e)
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
            List<SIC_T_ITEM_ALMACEN> list = ItemsAlmacenSeleccionados;
            if (e.Row.RowType == DataControlRowType.DataRow && list != null) 
            {
                int itemId = (int)gvListaItem.DataKeys[e.Row.RowIndex].Values["itm_alm_c_iid_item"];
                int almacenID = (int)gvListaItem.DataKeys[e.Row.RowIndex].Values["itm_alm_c_iid_alm"];
                if (list.Any(x => x.itm_alm_c_iid_item == itemId && x.itm_alm_c_iid_alm == almacenID))
                {  
                    CheckBox chk = (CheckBox)e.Row.FindControl("chkSelect"); 
                    chk.Checked = true; 
                } 
            }
            //(item.ven_det_c_iitemid== itemId && item.ven_det_c_iidalmacen == almacenID)

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
                this.ActualizarVenta();
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
            if (decimal.TryParse(txtCantidad.Text, NumberStyles.Any, CultureInfo.InvariantCulture, out cantidadNueva) && cantidadNueva > 0
                && decimal.TryParse(txtPrecio.Text, NumberStyles.Any, CultureInfo.InvariantCulture, out precioNuevo) && precioNuevo > 0)
            {
                int itemId = (int)gvItemsSeleccionados.DataKeys[e.RowIndex].Values["ven_det_c_iitemid"];
                int almacenID = (int)gvItemsSeleccionados.DataKeys[e.RowIndex].Values["ven_det_c_iidalmacen"];

                if (this.EscenarioVenta == TipoOperacion.Modificacion)
                {
                    SIC_T_VENTA venta = this.VentaSeleccionado;

                    // Buscamos y editamos la cantidad, filtramos el item q viene del mismo almacen
                    foreach (var item in venta.SIC_T_VENTA_DETALLE)
                    {
                        if (item.ven_det_c_iitemid== itemId && item.ven_det_c_iidalmacen == almacenID)
                        {
                            item.ven_det_c_ecantidad = cantidadNueva;
                            item.ven_det_c_epreciototal = item.ven_det_c_epreciounit * cantidadNueva;
                            break;
                        }
                    }

                    // Buscamos y editamos le precio, filtramos los items que tengan la misma id
                    // ya que mas adelante se fuisionaran los items en un solo registro (detalle de boleta/factura), 
                    // se requiere que tengan el mismo precio unitario
                    foreach (var item in venta.SIC_T_VENTA_DETALLE)
                    {
                        if (item.ven_det_c_iitemid == itemId)
                        {
                            item.ven_det_c_epreciounit = precioNuevo;
                            if (cboMoneda.SelectedIndex == 0)
                            {
                                item.precioUnitarioSoles = precioNuevo;
                            }
                            else
                            {
                                item.precioUnitarioSoles = precioNuevo * this.TasaCambio;
                            }
                            item.ven_det_c_epreciototal = item.ven_det_c_epreciounit * cantidadNueva;
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
            var venta = _venta.ObtenerVenta(VentaEliminar);

            if(venta!=null && (venta.ven_c_iestado != 1)){
                this.Mensaje("Solo se puede eliminar ordenes de compra en estado POR REGULARIZAR.", "../Imagenes/warning.png");
                return;
            }
            this.SetearEliminar();
            this.ucMensaje2.Show("¿Desea anular la Venta seleccionada?", null,
                                MensajeIcono.Alerta, MensajeBotones.AceptarCancelar);
        }

        private void SetearEliminar()
        {
            ResultadoMensajeHandler handler = null;
            handler = delegate(object s, ResMsjArgs e2)
            {
                if (e2.resultado == MensajeResultado.Aceptar)
                {
                    this.DeshabilitarVenta(VentaEliminar);
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

        private void ListarComboCentroCosto()
        {
            cboCentroCosto.Items.Clear();
            cboCentroCosto.Items.Add(new ListItem("-- Seleccionar --", "-1"));
            cboCentroCosto.DataSource = _centroCosto.ListarCentroCosto();
            cboCentroCosto.DataTextField = "emp_cst_c_vdesc";
            cboCentroCosto.DataValueField = "emp_cst_c_int";
            cboCentroCosto.DataBind();
        }

        private void ListarEstadoVenta()
        {
            cboEstado.DataSource = _venta.ListarEstadoVenta();
            cboEstado.DataTextField = "ven_est_c_vdescripcion";
            cboEstado.DataValueField = "ven_est_c_iid";
            cboEstado.DataBind();
        }

        /// <summary>
        /// Carga la lista de Ventas
        /// </summary>
        private void ListarVentas()
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
            gvListaVenta.DataSource =  _venta.ListarVentas(txtFiltroRuc.Text,txtFiltroRS.Text, fi,ff);
            gvListaVenta.DataBind();
        }

        /// <summary>
        /// Carga la lista de items para la busqueda tomando en consideración los filtros.
        /// </summary>
        private void ListarItem()
        {
            int id = -1;
            int[] idAlmacen = {-1};
            var listaIdAlmacen = new List<int>();
            if (int.TryParse(cboFiltroAlmacen.SelectedValue, out id) && id != -1)
            {
                listaIdAlmacen.Add(id);
            }
            else
            {
                int idCentroCosto = -1;
                if(int.TryParse(cboCentroCosto.SelectedValue,out idCentroCosto) && idCentroCosto !=-1)  
                {
                    var lista = _almacen.ListaAlmacenCentroCosto(idCentroCosto);                    
                    foreach (var itemLista in lista)
                    {
                        listaIdAlmacen.Add(itemLista.alm_c_iid);
                    }
                }
            }


            this.ItemsAlmacenEncontrados = _itemAlmacen.ListarItemAlmacen(txtFiltroCodigo.Text.Trim(), txtFiltroDescr.Text.Trim(), null, null, listaIdAlmacen.ToArray());
            gvListaItem.DataSource = ItemsAlmacenEncontrados;
            gvListaItem.DataBind();
        }

        /// <summary>
        /// Lista las familias de items
        /// </summary>
        private void ListarFiltroFamilia()
        {
            cboFiltroFamilia.DataSource = _item.ListarFamiliaItem();
            cboFiltroFamilia.DataTextField = "ifm_c_des";
            cboFiltroFamilia.DataValueField = "ifm_c_iid";
            cboFiltroFamilia.DataBind();
        }

        /// <summary>
        /// Obtiene la sub familia, depende de que familia se haya seleccionado
        /// </summary>
        private void ListarFiltroSubFamilia()
        {
            int idFamilia;
            if (cboFiltroFamilia.SelectedIndex > 0 && int.TryParse(cboFiltroFamilia.SelectedValue, out idFamilia) && idFamilia > 0)
            {
                cboFiltroSubFamilia.Enabled = true;
                cboFiltroSubFamilia.Items.Clear();
                cboFiltroSubFamilia.Items.Add(new ListItem("-- Seleccionar --", "-1"));
                cboFiltroSubFamilia.DataSource = _item.ListarSubFamiliaItem(idFamilia);
                cboFiltroSubFamilia.DataTextField = "isf_c_des";
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

        private void ListarFiltroAlmacen()
        {
            int idCentroCosto = -1;
            if(int.TryParse(cboCentroCosto.SelectedValue,out idCentroCosto) && idCentroCosto !=-1)
            {
                cboFiltroAlmacen.Items.Clear();
                cboFiltroAlmacen.Items.Add(new ListItem("-- Seleccionar --", "-1"));
                cboFiltroAlmacen.DataSource = _almacen.ListaAlmacenCentroCosto(idCentroCosto);
                cboFiltroAlmacen.DataTextField = "alm_c_vdes";
                cboFiltroAlmacen.DataValueField = "alm_c_iid";
                cboFiltroAlmacen.DataBind();
            }
        }


        private void ListarClientes()
        {
            gvCliente.DataSource = _cliente.ListarClientes();
            gvCliente.DataBind();
        }

        private void ObtenerDatosImpuesto()
        {
            var resultado = this._igv.ObtenerIgv(DateTime.Today);
            if (resultado != null && resultado.igv_c_eigv.HasValue)
            {
                this.igv = resultado.igv_c_eigv.Value;
            }
            else
            {
                this.igv = 0.18M;
            }
        }

        public void MostrarDatosImpuestos()
        {
            if (this.EscenarioVenta == TipoOperacion.Creacion)
            {
                lblIGV.Text = this.VentaNuevo.ven_c_eigv * 100 + "%";
            }
            else if (this.EscenarioVenta == TipoOperacion.Modificacion)
            {
                lblIGV.Text = this.VentaSeleccionado.ven_c_eigv * 100 + "%";
            }            
        }

        #endregion

        private void ObtenerTasaCambio(DateTime fechaTC)
        {
            var value = this._tasaCambio.ObtenerTasaCambio(fechaTC);
            this.TasaCambio = value.tsc_c_ecompra;            
            lblTC.Text = "S/. " + value.tsc_c_ecompra.ToString("F4", CultureInfo.InvariantCulture);
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
            this.VentaNuevo.ven_c_zfecha = DateTime.Now;
            this.lblFechaRegistro.Text = VentaNuevo.ven_c_zfecha.ToString("dd/MM/yyyy");
            this.gvItemsSeleccionados.DataSource = this.VentaNuevo.SIC_T_VENTA_DETALLE;
            this.EscenarioVenta = TipoOperacion.Creacion;
            this.lblAccion.Text = "NUEVO";
            this.ItemsAlmacenSeleccionados = new List<SIC_T_ITEM_ALMACEN>();
            this.ObtenerTasaCambio(VentaNuevo.ven_c_zfecha);
            this.RecalcularMontos(this.VentaNuevo);
            this.mvOC.ActiveViewIndex = 1;
            this.MostrarDatosImpuestos();
            this.btnBuscarItems.Enabled = false;
            this.cboCentroCosto.Enabled = true;
            this.cboCentroCosto.ClearSelection();
            this.cboEstado.ClearSelection();
            this.upGeneral.Update();
        }

        /// <summary>
        /// Inicializa y muestra la vista de Modificar Venta.
        /// </summary>
        private void MostrarModificarVenta(int id)
        {
            this.VentaSeleccionado = _venta.ObtenerVenta(id);

            if (this.VentaSeleccionado.ven_c_iestado == (int)EstadoVenta.ANULADO || this.VentaSeleccionado.ven_c_iestado == (int)EstadoVenta.CERRADA)
            {
                Mensaje("Solo se puede editar Ventas de compra en estado planeado.", "../Imagenes/warning.png");
                upGeneral.Update();
                this.VentaSeleccionado = null;
                return;
            }

            this.gvItemsSeleccionados.DataSource = this.VentaSeleccionado.SIC_T_VENTA_DETALLE;
            this.gvItemsSeleccionados.DataBind();
            this.EscenarioVenta = TipoOperacion.Modificacion;
            this.lblAccion.Text = "MODIFICAR";
            this.VentaSeleccionado.ven_c_eigv = this.igv;
            this.lblFechaRegistro.Text = VentaSeleccionado.ven_c_zfecha.ToString("dd/MM/yyyy");            
            this.ItemsAlmacenSeleccionados = new List<SIC_T_ITEM_ALMACEN>();
            foreach (var item in VentaSeleccionado.SIC_T_VENTA_DETALLE)
            {                
                SIC_T_ITEM_ALMACEN itemAlmacen = new SIC_T_ITEM_ALMACEN();
                itemAlmacen.itm_alm_c_iid_alm = item.ven_det_c_iidalmacen;
                itemAlmacen.itm_alm_c_iid_item = item.ven_det_c_iitemid;
                itemAlmacen.SIC_T_ALMACEN = item.SIC_T_ALMACEN;
                this.ItemsAlmacenSeleccionados.Add(itemAlmacen);
            }

            txtRSProv.Text = this.VentaSeleccionado.SIC_T_CLIENTE == null ? string.Empty : 
                                                                           this.VentaSeleccionado.SIC_T_CLIENTE.cli_c_vraz_soc;
            txtRucProv.Text = this.VentaSeleccionado.SIC_T_CLIENTE == null ? string.Empty :
                                                                           this.VentaSeleccionado.SIC_T_CLIENTE.cli_c_vdoc_id;
            cboTipoDocumento.SelectedIndex = -1;
            var seleccion = cboTipoDocumento.Items.FindByText(VentaSeleccionado.ven_c_vdestipodoc);
            if (seleccion != null)
            {
                seleccion.Selected = true;
            }

            cboMoneda.ClearSelection();
            seleccion = cboMoneda.Items.FindByText(VentaSeleccionado.ven_c_vdescmoneda);
            
            if (seleccion != null)
            {
                seleccion.Selected = true;
            }

            this.ObtenerTasaCambio(VentaSeleccionado.ven_c_zfecha);
            foreach (var item in VentaSeleccionado.SIC_T_VENTA_DETALLE)
            {
                item.codigoItem = item.SIC_T_ITEM.itm_c_ccodigo;
                item.descItem = item.SIC_T_ITEM.itm_c_vdescripcion;
                if (item.SIC_T_ITEM != null)
                {
                    item.precioReferenciaSoles = item.SIC_T_ITEM.itm_c_dprecio_compra;
                }
                else
                {
                    item.precioReferencia = 0;
                }

                if (cboMoneda.SelectedIndex == 0)
                {
                    item.precioReferencia = item.precioReferenciaSoles;
                    item.precioUnitarioSoles = item.ven_det_c_epreciounit;
                }
                else
                {
                    item.precioReferencia = Math.Round(item.precioReferenciaSoles / this.TasaCambio, 2);
                    item.precioUnitarioSoles = Math.Round(item.ven_det_c_epreciounit * this.TasaCambio, 2);
                }
            }

            this.gvItemsSeleccionados.DataSource = this.VentaSeleccionado.SIC_T_VENTA_DETALLE;
            this.gvItemsSeleccionados.DataBind();
            this.cboCentroCosto.Enabled = false;
            this.cboCentroCosto.ClearSelection();
            seleccion = cboCentroCosto.Items.FindByText(VentaSeleccionado.SIC_T_EMP_CENTRO_COSTO.emp_cst_c_vdesc);
            if (seleccion != null)
            {
                seleccion.Selected = true;
                this.btnBuscarItems.Enabled = true;
            }
            else
            {
                this.btnBuscarItems.Enabled = false;
            }
            
            this.RecalcularMontos(this.VentaSeleccionado);
            this.MostrarDatosImpuestos();
            this.cboEstado.ClearSelection();
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
                this.ListarFiltroAlmacen();
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
                    if (!list.Any(x => x.itm_alm_c_iid == idItemAlmacen ))
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

            List<SIC_T_ITEM_ALMACEN> listaPrel = this.ItemsAlmacenSeleccionados;
            if(listaPrel == null)
            {
                return;
            }

            // Primero eliminamos todos los que no estan seleccionados           
            List<SIC_T_VENTA_DETALLE> remover = new List<SIC_T_VENTA_DETALLE>();
            foreach(var detalleVenta in venta.SIC_T_VENTA_DETALLE )
            {
                bool rem = true;
                foreach(var itemalm in listaPrel)
                {
                    if (detalleVenta.ven_det_c_iidalmacen == itemalm.itm_alm_c_iid_alm && detalleVenta.ven_det_c_iitemid == itemalm.itm_alm_c_iid_item)
                    {
                        rem = false;
                        break;
                    }
                }
                if (rem)
                {
                    remover.Add(detalleVenta);
                }
            }

            foreach (var detalleVenta in remover)
            {
                venta.SIC_T_VENTA_DETALLE.Remove(detalleVenta);
            }           

            decimal precioReferencia, precioReferenciaSoles;

            // Ahora agregamos los nuevos
            foreach (var itemAlm in listaPrel)
            {
                if (!venta.SIC_T_VENTA_DETALLE.Where(x => x.ven_det_c_iidalmacen == itemAlm.itm_alm_c_iid_alm 
                                                  && x.ven_det_c_iitemid == itemAlm.itm_alm_c_iid_item).Any())
                {
                    SIC_T_ITEM itemEncontrado = _item.ObtenerItemPorIdNoContext(itemAlm.itm_alm_c_iid_item);                    
                    precioReferencia = (cboMoneda.SelectedIndex == 0 ? itemEncontrado.itm_c_dprecio_venta
                                                                    : Math.Round(itemEncontrado.itm_c_dprecio_venta / this.TasaCambio));
                    precioReferenciaSoles = itemEncontrado.itm_c_dprecio_compra;
                    
                    SIC_T_VENTA_DETALLE nuevoDetalle = new SIC_T_VENTA_DETALLE();
                    nuevoDetalle.ven_det_c_ecantidad = 1;
                    nuevoDetalle.ven_det_c_iitemid = itemEncontrado.itm_c_iid;
                    nuevoDetalle.ven_det_c_epreciounit = itemEncontrado.itm_c_dprecio_venta;
                    nuevoDetalle.ven_det_c_epreciototal= itemEncontrado.itm_c_dprecio_venta;
                    nuevoDetalle.ven_det_c_iidalmacen = itemAlm.itm_alm_c_iid_alm;
                    nuevoDetalle.SIC_T_ITEM = itemEncontrado;
                    nuevoDetalle.SIC_T_ALMACEN = itemAlm.SIC_T_ALMACEN;
                    nuevoDetalle.precioReferencia = precioReferencia;
                    nuevoDetalle.precioReferenciaSoles = precioReferenciaSoles;
                    nuevoDetalle.precioUnitarioSoles = itemEncontrado.itm_c_dprecio_compra;
                    nuevoDetalle.codigoItem = itemEncontrado.itm_c_ccodigo;
                    nuevoDetalle.descItem = itemEncontrado.itm_c_vdescripcion;
                    nuevoDetalle.stockAlmacen = itemAlm.itm_alm_c_ecantidad;
                    venta.SIC_T_VENTA_DETALLE.Add(nuevoDetalle);
                }
            }

            gvItemsSeleccionados.DataSource = venta.SIC_T_VENTA_DETALLE;
            gvItemsSeleccionados.DataBind();
            upGeneral.Update();
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
                subTotal += item.ven_det_c_epreciototal;
            }

            venta.ven_c_esubtotal = subTotal;
            venta.ven_c_eigv = this.igv;
            venta.ven_c_eigvcal = Math.Round(subTotal * venta.ven_c_eigv , 2);

            venta.ven_c_etotal = venta.ven_c_esubtotal + venta.ven_c_eigvcal;

            this.lblSubTotal.Text = simbolo + " " + venta.ven_c_esubtotal.ToString("F2", CultureInfo.InvariantCulture);
            this.lblTotal.Text = simbolo + " " + venta.ven_c_etotal.ToString("F2", CultureInfo.InvariantCulture);
            this.lblIGVCal.Text = simbolo + " " + venta.ven_c_eigvcal.ToString("F2", CultureInfo.InvariantCulture);
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
                txtRucProv.Text = gvCliente.Rows[gvCliente.SelectedIndex].Cells[0].Text;
            }

            mvOC.ActiveViewIndex = 1;
            upGeneral.Update();
        }

        
        private void IngresarVenta()
        {
            if (!VerificarDatosVenta(this.VentaNuevo))
            {
                return;
            }

            var ven = this.VentaNuevo;
            ven.ven_c_zfecha = DateTime.Now;
            ven.ven_c_ymoneda = byte.Parse(this.cboMoneda.SelectedValue);
            ven.ven_c_vdescmoneda = this.cboMoneda.SelectedItem.Text.Trim();
            ven.ven_c_itipodoc= int.Parse(this.cboTipoDocumento.SelectedValue);
            ven.ven_c_vdestipodoc = this.cboTipoDocumento.SelectedItem.Text.Trim();
            ven.ven_c_iestado = int.Parse(this.cboEstado.SelectedValue);
            ven.ven_c_vestado = this.cboEstado.SelectedItem.Text.Trim();

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
#if DEBUG
                Mensaje("Error Fatal : \n" + ex.Message
                    + "\n" + ex.InnerException != null ? ex.InnerException.Message : string.Empty, "../Imagenes/warning.png");
#else
                    Mensaje("Error en el proceso.", "../Imagenes/warning.png");
#endif
            }
        }

        private void ActualizarVenta()
        {
            if (!VerificarDatosVenta(this.VentaSeleccionado))
            {
                return;
            }

            var ven = this.VentaSeleccionado;
            ven.ven_c_zfecha = DateTime.Now;
            ven.ven_c_ymoneda = byte.Parse(this.cboMoneda.SelectedValue);
            ven.ven_c_vdescmoneda = this.cboMoneda.SelectedItem.Text.Trim();
            ven.ven_c_itipodoc = int.Parse(this.cboTipoDocumento.SelectedValue);
            ven.ven_c_vdestipodoc = this.cboTipoDocumento.SelectedItem.Text.Trim();
            ven.ven_c_iestado = int.Parse(this.cboEstado.SelectedValue);
            ven.ven_c_vestado = this.cboEstado.SelectedItem.Text.Trim();

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
#if DEBUG
                Mensaje("Error Fatal : \n" + ex.Message
                    + "\n" + ex.InnerException != null ? ex.InnerException.Message : string.Empty, "../Imagenes/warning.png");
#else
                    Mensaje("Error en el proceso.", "../Imagenes/warning.png");
#endif
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
            this.txtRSProv.Text = string.Empty;
            this.txtRucProv.Text = string.Empty;
            this.cboMoneda.SelectedIndex = -1;
            this.cboTipoDocumento.SelectedIndex = -1;
            this.lblFechaRegistro.Text = string.Empty;
            this.gvItemsSeleccionados.DataSource = null;
            this.gvItemsSeleccionados.DataBind();
        }


        private bool VerificarDatosVenta(SIC_T_VENTA venta)
        {
            if (venta == null)
            {
                Mensaje("Estado de la página no válido.", "../Imagenes/warning.png");
                return false;
            }
            else if (venta.ven_c_vdoccli_id == null || venta.ven_c_vdoccli_id == string.Empty)
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
            else if (cboEstado.SelectedIndex == -1)
            {
                Mensaje("Debe seleccionar un Estado.", "../Imagenes/warning.png");
                return false;
            }
            else if (venta.SIC_T_VENTA_DETALLE == null
                || venta.SIC_T_VENTA_DETALLE.Count == 0)
            {
                Mensaje("Debe seleccionar al menos un item.", "../Imagenes/warning.png");
                return false;
            }
            else
            {
                return true;
            }
        }

        private void DeshabilitarVenta(int idVenta)
        {            
            try
            {
                if (this._venta.DeshabilitarOrdenCompra(idVenta))
                {
                    Mensaje("Venta anulada.", "../Imagenes/correcto.png");
                }
                else
                {
                    Mensaje("Error al realizar el proceso.", "../Imagenes/warning.png");
                }
            }
            catch (Exception ex)
            {
#if DEBUG
                Mensaje("Error Fatal : \n" + ex.Message
                    + "\n" + ex.InnerException != null ? ex.InnerException.Message : string.Empty, "../Imagenes/warning.png");
#else
                    Mensaje("Error en el proceso.", "../Imagenes/warning.png");
#endif
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
                var value = this._tasaCambio.ObtenerTasaCambio(DateTime.Today); 
                if (value != null )
                {
                    this.TasaCambio = value.tsc_c_ecompra;
                    lblTC.Text = value.tsc_c_ecompra.ToString();
                }
                
            }

        }

        protected void gvListaItem_RowCreated(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow &&
            //   (e.Row.RowState == DataControlRowState.Normal ||
            //    e.Row.RowState == DataControlRowState.Alternate))
            //{
            //    CheckBox chkBxSelect = (CheckBox)e.Row.Cells[1].FindControl("chkSelect");
            //    CheckBox chkBxHeader = (CheckBox)this.gvListaItem.HeaderRow.FindControl("chkAll");
            //    chkBxSelect.Attributes["onclick"] = string.Format
            //                                           (
            //                                              "javascript:ChildClick(this,'{0}');",
            //                                              chkBxHeader.ClientID
            //                                           );
            //}
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            ListarVentas();
        }

        protected void cboFiltroFamilia_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.ListarFiltroSubFamilia();
        }

        

    }
}