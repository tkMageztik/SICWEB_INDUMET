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

        private decimal percepcion
        {
            get { return ViewState["Venpercepcion"] == null ? 0.0M : (decimal)ViewState["Venpercepcion"]; }
            set { ViewState["Venpercepcion"] = value; }
        }

        private decimal igv
        {
            get { return ViewState["Venigv"] == null ? 0.0M : (decimal)ViewState["Venigv"]; }
            set { ViewState["Venigv"] = value; }
        }

        private decimal percepcionmax
        {
            get { return ViewState["Venpercepcionmax"] == null ? 0.0M : (decimal)ViewState["Venpercepcionmax"]; }
            set { ViewState["Venpercepcionmax"] = value; }
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

        #endregion

        #region Eventos
        public frmVenta()
        {
            _parametro = new ParametroBL();
            _item = new ItemBL();
            _venta = new VentaBL();
            _cliente = new ClienteBL();
            _igv = new IgvBL();
            EscenarioVenta = TipoOperacion.Ninguna;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.ListarComboMoneda();
                this.ListarComboMoneda();
                this.ListarItem();
                this.ListarProveedores();
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
            this.MostrarNuevaOrdenCompra();
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

        protected void gvProveedores_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.SeleccionEmpresa();
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

        protected void gvProveedores_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvProveedores.PageIndex = e.NewPageIndex;
            this.ListarProveedores();
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
            decimal cantidadNueva;
            if (decimal.TryParse(txtCantidad.Text, out cantidadNueva) && cantidadNueva > 0)
            {
                int itemId = (int)gvItemsSeleccionados.DataKeys[e.RowIndex].Value;

                if (this.EscenarioVenta == TipoOperacion.Modificacion)
                {
                    SIC_T_VENTA ordenCompra = this.VentaSeleccionado;
                    foreach (var item in ordenCompra.SIC_T_VENTA_DETALLE)
                    {
                        if (item.ven_det_c_iitemid== itemId)
                        {
                            item.ven_det_c_ecantidad = cantidadNueva;
                            item.ven_det_c_eprecio = item.SIC_T_ITEM.itm_c_dprecio * cantidadNueva;
                            break;
                        }
                    }
                    this.RecalcularMontos(ordenCompra);
                    gvItemsSeleccionados.EditIndex = -1;
                    gvItemsSeleccionados.DataSource = ordenCompra.SIC_T_VENTA_DETALLE;
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
                            item.ven_det_c_eprecio = item.SIC_T_ITEM.itm_c_dprecio * cantidadNueva;
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

        protected void gvListaOC_RowEditing(object sender, GridViewEditEventArgs e)
        {
          
            int ocId = (int)this.gvListaOC.DataKeys[e.NewEditIndex].Value;
            e.NewEditIndex = -1;
            this.gvListaItem.EditIndex = -1;
            this.ListarVentas();
            this.MostrarModificarOrdenCompra(ocId);            
        }

        protected void gvListaOC_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            this.EscenarioVenta = TipoOperacion.Eliminacion;
            this.VentaEliminar = (int)this.gvListaOC.DataKeys[e.RowIndex].Value;
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
            gvListaOC.DataSource =  _venta.ListarVentas();
            gvListaOC.DataBind();
        }

        /// <summary>
        /// Carga la lista de items para la busqueda tomando en consideración los filtros.
        /// </summary>
        private void ListarItem()
        {
            gvListaItem.DataSource = _item.ListarItems(txtFiltroCodigo.Text.Trim(), txtFiltroDescr.Text.Trim());
            gvListaItem.DataBind();
        }


        private void ListarProveedores()
        {
            gvProveedores.DataSource = _cliente.ListarClientesAlt();
            gvProveedores.DataBind();
        }

        private void ObtenerDatosImpuesto()
        {
            var listaPercepcion = this._parametro.ListarParametros((int)TipoParametro.PERCEPCION);

            var resultado = this._igv.ObtenerIgv(DateTime.Today);

            if (resultado != null && resultado.igv_c_eigv.HasValue)
            {
                this.igv = resultado.igv_c_eigv.Value;
            }
            else
            {
                this.igv = 0.18M;
            }

            decimal prev, prev2;

            if (listaPercepcion.Count == 2)
            {
                prev = decimal.Parse(listaPercepcion[0].par_det_c_vcampo_1.ToString(), CultureInfo.InvariantCulture); 
                prev2 = decimal.Parse(listaPercepcion[1].par_det_c_vcampo_1.ToString(), CultureInfo.InvariantCulture); 

                if (prev > 1)
                {
                    this.percepcionmax = prev;
                    this.percepcion = prev2;
                }
                else
                {
                    this.percepcion = prev;
                    this.percepcionmax = prev2;
                }
            }
            else
            {
                this.percepcionmax = 500M;
                this.percepcion = 0.02M;
            }

        }

        public void MostrarDatosImpuestos()
        {
            if (this.EscenarioVenta == TipoOperacion.Creacion)
            {
                lblIGV.Text = this.VentaNuevo.ven_c_digv * 100 + "%";
                lblPercepcion.Text = this.VentaNuevo.ven_c_dpercepcion * 100 + "%";
            }
            else if (this.EscenarioVenta == TipoOperacion.Modificacion)
            {
                lblIGV.Text = this.VentaSeleccionado.ven_c_digv * 100 + "%";
                lblPercepcion.Text = this.VentaSeleccionado.ven_c_dpercepcion * 100 + "%";
            }            
        }

        #endregion

        #region Metodos de Movimiento
        /// <summary>
        /// Inicializa y muestra la vista de Nuevo OC. 
        /// </summary>
        private void MostrarNuevaOrdenCompra()
        {
            this.VentaNuevo = new SIC_T_VENTA();
            this.VentaNuevo.SIC_T_VENTA_DETALLE = new System.Data.Objects.DataClasses.EntityCollection<SIC_T_VENTA_DETALLE>();
            this.VentaNuevo.ven_c_digv = this.igv;
            this.VentaNuevo.ven_c_dpercepcion = this.percepcion;
            //-- Missing percepcion max
            this.gvItemsSeleccionados.DataSource = this.VentaNuevo.SIC_T_VENTA_DETALLE;
            this.EscenarioVenta = TipoOperacion.Creacion;
            this.lblAccion.Text = "Nuevo";
            this.ItemsSeleccionadosPreliminar = new List<int>();
            this.RecalcularMontos(this.VentaNuevo);
            this.mvOC.ActiveViewIndex = 1;
            this.MostrarDatosImpuestos();


            this.upGeneral.Update();
        }

        /// <summary>
        /// Inicializa y muestra la vista de Modificar OC.
        /// </summary>
        private void MostrarModificarOrdenCompra(int id)
        {
            this.VentaSeleccionado = _venta.ObtenerOrdenCompra(id);
            this.gvItemsSeleccionados.DataSource = this.VentaSeleccionado.SIC_T_VENTA_DETALLE;
            this.gvItemsSeleccionados.DataBind();
            this.EscenarioVenta = TipoOperacion.Modificacion;
            if (VentaSeleccionado.ven_c_zfecha.HasValue)
            {
                this.calFechaEntrega.SelectedDate = VentaSeleccionado.ven_c_zfecha.Value;
            }
            else
            {
                this.calFechaEntrega.SelectedDate = DateTime.Today;
            }

            this.VentaSeleccionado.ven_c_digv = this.igv;
            this.VentaSeleccionado.ven_c_dpercepcion = this.percepcion;
            
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
        private void ActualizarListaItems(SIC_T_VENTA ordenDeCompra)
        {
            if (ordenDeCompra == null)
            {
                return;
            }
            if (ordenDeCompra.SIC_T_VENTA_DETALLE == null)
            {
                ordenDeCompra.SIC_T_VENTA_DETALLE = new System.Data.Objects.DataClasses.EntityCollection<SIC_T_VENTA_DETALLE>();
            }

            List<int> listaPrel = this.ItemsSeleccionadosPreliminar;
            if(listaPrel == null)
            {
                return;
            }

            // Primero eliminamos todos los que no estan seleccionados           
            List<SIC_T_VENTA_DETALLE> remover = 
                ordenDeCompra.SIC_T_VENTA_DETALLE.Where(x => !listaPrel.Contains(x.ven_det_c_iitemid)).ToList();
            foreach (var item in remover)
            {
                ordenDeCompra.SIC_T_VENTA_DETALLE.Remove(item);
            }

            // Ahora agregamos los nuevos
            foreach (int idItem in listaPrel)
            {
                if (!ordenDeCompra.SIC_T_VENTA_DETALLE.Where(x => x.ven_det_c_iitemid == idItem).Any())
                {
                    SIC_T_ITEM itemEncontrado = _item.ObtenerItemPorIdNoContext(idItem);
                    SIC_T_VENTA_DETALLE nuevoDetalle = new SIC_T_VENTA_DETALLE();
                    nuevoDetalle.ven_det_c_ecantidad = 1;
                    nuevoDetalle.ven_det_c_iitemid = itemEncontrado.itm_c_iid;
                    nuevoDetalle.ven_det_c_eprecio = itemEncontrado.itm_c_dprecio;
                    nuevoDetalle.SIC_T_ITEM = itemEncontrado;
                    ordenDeCompra.SIC_T_VENTA_DETALLE.Add(nuevoDetalle);
                }
            }

            gvItemsSeleccionados.DataSource = ordenDeCompra.SIC_T_VENTA_DETALLE;
            gvItemsSeleccionados.DataBind();
        }

        /// <summary>
        /// Recalcula los montos de subtotal, igv, percepcion y total de la Venta.
        /// </summary>
        /// <param name="ordenDeCompra"></param>
        private void RecalcularMontos(SIC_T_VENTA ordenDeCompra)
        {
            decimal subTotal = 0M;

            foreach (var item in ordenDeCompra.SIC_T_VENTA_DETALLE)
            {
                if (item.ven_det_c_eprecio.HasValue)
                {
                    subTotal += item.ven_det_c_eprecio.Value;
                }
            }

            ordenDeCompra.ven_c_dsubtotal = subTotal;
            ordenDeCompra.ven_c_digv = this.igv;
            ordenDeCompra.ven_c_digvcal = subTotal * ordenDeCompra.ven_c_digv.Value;
            ordenDeCompra.ven_c_dpercepcion = this.percepcion;
            

            if (ordenDeCompra.ven_c_dsubtotal.Value > this.percepcionmax)
            {
                ordenDeCompra.ven_c_dpercepcioncal = subTotal * ordenDeCompra.ven_c_dpercepcion.Value;
            }
            else
            {
                ordenDeCompra.ven_c_dpercepcioncal = 0;
            }

            ordenDeCompra.ven_c_dtotal = ordenDeCompra.ven_c_dsubtotal + ordenDeCompra.ven_c_digvcal 
                                        + ordenDeCompra.ven_c_dpercepcioncal;

            this.lblSubTotal.Text = ordenDeCompra.ven_c_dsubtotal.Value.ToString();
            this.lblTotal.Text = ordenDeCompra.ven_c_dtotal.Value.ToString();
            this.lblIGVCal.Text = ordenDeCompra.ven_c_digvcal.Value.ToString();
            this.lblPercepcionCal.Text = ordenDeCompra.ven_c_dpercepcioncal.Value.ToString();
        }

        /// <summary>
        /// Selecciona la empresa y regresa a la vista Nuevo/Editar
        /// </summary>
        private void SeleccionEmpresa()
        {            
            String RUC = this.gvProveedores.DataKeys[gvProveedores.SelectedIndex].Value.ToString();
            if (EscenarioVenta == TipoOperacion.Modificacion)
            {
                this.VentaSeleccionado.ven_c_vdoccli_id = RUC;
            }
            else if (EscenarioVenta == TipoOperacion.Creacion)
            {
                this.VentaNuevo.ven_c_vdoccli_id = RUC;
            }

            if (gvProveedores.Rows[gvProveedores.SelectedIndex].Cells[1].Text != null)
            {
                txtRSProv.Text = gvProveedores.Rows[gvProveedores.SelectedIndex].Cells[1].Text;
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
            ven.ven_c_zfecha = this.calFechaEntrega.SelectedDate;
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
            ven.ven_c_zfecha = this.calFechaEntrega.SelectedDate;
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
            this.calFechaEntrega.SelectedDate = DateTime.Today;
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
                Mensaje("Debe seleccionar un proveedor.", "../Imagenes/warning.png");
                return false;
            }
            //else if (DateTime.Compare(calFechaEntrega.SelectedDate, DateTime.Today) < 0)
            //{
            //    Mensaje("Debe ingresar una fecha válida.", "../Imagenes/warning.png");
            //    return false;
            //}
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

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

        }

        protected void gvListaOC_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvListaOC.PageIndex= e.NewPageIndex;
            ListarVentas();
        }  

      
    }
}