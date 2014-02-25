using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIC.BusinessLayer;
using SIC.Data;
using SIC.EntityLayer;
using SIC.UserLayer.UserControl;
using System.Globalization;
using SIC.UIGeneral;

namespace SIC.UserLayer.Interfaces.Mantenimiento
{
    public partial class frmRegOC : System.Web.UI.Page
    {
        #region DECLARACION DE VARIABLES
        private ParametroBL _parametro = null;
        private OrdenCompraBL _ordenCompra = null;
        private ItemBL _item = null;
        private ClienteBL _cliente = null;
        private TasaCambioBL _tasaCambio = null;
        private IgvBL _igv = null;
        private EmpresaBL _empresa = null;

        private TipoOperacion EscenarioOC
        {
            get { return (TipoOperacion)ViewState["vsEscenarioOC"]; }
            set { ViewState["vsEscenarioOC"] = value; }
        }

        private List<int> ItemsSeleccionadosPreliminar
        {
            get { return ViewState["ItemsSeleccionadosPreliminar"] as List<int>; }
            set { ViewState["ItemsSeleccionadosPreliminar"] = value; }
        }

        private decimal percepcion
        {
            get { return ViewState["OCpercepcion"] == null ? 0.0M : (decimal)ViewState["OCpercepcion"]; }
            set { ViewState["OCpercepcion"] = value; }
        }

        private decimal igv
        {
            get { return ViewState["OCigv"] == null ? 0.0M : (decimal)ViewState["OCigv"]; }
            set { ViewState["OCigv"] = value; }
        }

        private decimal percepcionmax
        {
            get { return ViewState["OCpercepcionmax"] == null ? 0.0M : (decimal)ViewState["OCpercepcionmax"]; }
            set { ViewState["OCpercepcionmax"] = value; }
        }

        private SIC_T_ORDEN_DE_COMPRA OCSeleccionado
        {
            get { return ViewState["vsOCSeleccionado"] as SIC_T_ORDEN_DE_COMPRA; }
            set { ViewState["vsOCSeleccionado"] = value; }
        }

        private SIC_T_ORDEN_DE_COMPRA OCNuevo
        {
            get { return ViewState["vsOCNuevo"] as SIC_T_ORDEN_DE_COMPRA; }
            set { ViewState["vsOCNuevo"] = value; }
        }

        private int idOC
        {
            get { return Convert.ToInt32(ViewState["vsIdOC"]); }
            set { ViewState["vsIdOC"] = value; }
        }

        private decimal TasaCambio
        {
            get { return (decimal)(ViewState["vsOCTC"] == null ? 1.0M : ViewState["vsOCTC"]); }
            set { ViewState["vsOCTC"] = value; }
        }

        private bool percepcionactive
        {
            get { return (bool)(ViewState["vsOCPercepcionActive"] == null ? false : ViewState["vsOCPercepcionActive"]); }
            set { ViewState["vsOCPercepcionActive"] = value; }
        }

        #endregion

        #region Eventos

        public frmRegOC()
        {
            _parametro = new ParametroBL();
            _item = new ItemBL();
            _ordenCompra = new OrdenCompraBL();
            _cliente = new ClienteBL();
            _tasaCambio = new TasaCambioBL();
            _igv = new IgvBL();
            _empresa = new EmpresaBL();
            EscenarioOC = TipoOperacion.Ninguna;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.ListarComboMoneda();
                this.ListarCombosEstado();
                this.ListarProveedores();
                this.ListarFamilia();
                this.ListarComboMonedaFiltro();
                this.ListarCombosEstadoFiltro();
                this.ListarOrdenCompra();
                this.ListarComboClase();
                this.ListarDirecciones();
                gvItemsSeleccionados.DataSource = null;
                gvItemsSeleccionados.DataBind();
                this.ObtenerDatosImpuesto();
            }
            if (EscenarioOC == TipoOperacion.Eliminacion)
            {
                SetearCambiarEstado(EstadoOC.ANULADA);
            }
            else if (EscenarioOC == TipoOperacion.Cierre)
            {
                SetearCambiarEstado(EstadoOC.CERRADA);
            }
        }

        protected void cboFamilia_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.ListarSubFamilia();
            upGeneral.Update();
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
            if (this.EscenarioOC == TipoOperacion.Creacion)
            {
                this.IngresarOC();
            }
            else if (this.EscenarioOC == TipoOperacion.Modificacion)
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
            if (this.EscenarioOC == TipoOperacion.Modificacion)
            {
                gvItemsSeleccionados.DataSource = OCSeleccionado.SIC_T_ORDEN_DE_COMPRA_DET;
                gvItemsSeleccionados.DataBind();
            }
            else if (this.EscenarioOC == TipoOperacion.Creacion)
            {
                gvItemsSeleccionados.DataSource = OCNuevo.SIC_T_ORDEN_DE_COMPRA_DET;
                gvItemsSeleccionados.DataBind();
            }
        }

        protected void gvItemsSeleccionados_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvItemsSeleccionados.EditIndex = -1;
            if (this.EscenarioOC == TipoOperacion.Modificacion)
            {
                gvItemsSeleccionados.DataSource = OCSeleccionado.SIC_T_ORDEN_DE_COMPRA_DET;
                gvItemsSeleccionados.DataBind();
            }
            else if (this.EscenarioOC == TipoOperacion.Creacion)
            {
                gvItemsSeleccionados.DataSource = OCNuevo.SIC_T_ORDEN_DE_COMPRA_DET;
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
                int itemId = (int)gvItemsSeleccionados.DataKeys[e.RowIndex].Value;

                if (this.EscenarioOC == TipoOperacion.Modificacion)
                {
                    SIC_T_ORDEN_DE_COMPRA ordenCompra = this.OCSeleccionado;
                    foreach (var item in ordenCompra.SIC_T_ORDEN_DE_COMPRA_DET)
                    {
                        if (item.odc_c_iitemid == itemId)
                        {
                            item.odc_c_ecantidad = cantidadNueva;
                            item.odc_c_epreciounit = precioNuevo;
                            if (cboMoneda.SelectedIndex == 0)
                            {
                                item.precioUnitarioSoles = precioNuevo;
                            }
                            else
                            {
                                item.precioUnitarioSoles = precioNuevo * this.TasaCambio;
                                ;
                            }
                            item.odc_c_epreciototal = item.odc_c_epreciounit * cantidadNueva;
                            break;
                        }
                    }
                    this.RecalcularMontos(ordenCompra);
                    gvItemsSeleccionados.EditIndex = -1;
                    gvItemsSeleccionados.DataSource = ordenCompra.SIC_T_ORDEN_DE_COMPRA_DET;
                    gvItemsSeleccionados.DataBind();
                }
                else if (this.EscenarioOC == TipoOperacion.Creacion)
                {
                    SIC_T_ORDEN_DE_COMPRA ordenCompra = this.OCNuevo;
                    foreach (var item in ordenCompra.SIC_T_ORDEN_DE_COMPRA_DET)
                    {
                        if (item.odc_c_iitemid == itemId)
                        {
                            item.odc_c_ecantidad = cantidadNueva;
                            item.odc_c_epreciounit = precioNuevo;
                            if (cboMoneda.SelectedIndex == 0)
                            {
                                item.precioUnitarioSoles = precioNuevo;
                            }
                            else
                            {
                                item.precioUnitarioSoles = precioNuevo * this.TasaCambio;
                                ;
                            }
                            item.odc_c_epreciototal = item.odc_c_epreciounit * cantidadNueva;
                            break;
                        }
                    }
                    this.RecalcularMontos(ordenCompra);
                    gvItemsSeleccionados.EditIndex = -1;
                    gvItemsSeleccionados.DataSource = ordenCompra.SIC_T_ORDEN_DE_COMPRA_DET;
                    gvItemsSeleccionados.DataBind();
                }

            }
            else
            {
                Mensaje("Debe ingresar números entero válido mayor a 0.", "~/Imagenes/warning.png");
                return;
            }
        }

        protected void gvListaOC_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int ocId = (int)this.gvListaOC.DataKeys[e.NewEditIndex].Value;
            e.NewEditIndex = -1;
            this.gvListaItem.EditIndex = -1;
            this.ListarOrdenCompra();
            this.MostrarModificarOrdenCompra(ocId);
        }

        protected void gvListaOC_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            this.EscenarioOC = TipoOperacion.Eliminacion;

            this.idOC = (int)this.gvListaOC.DataKeys[e.RowIndex].Value;
            var oc = _ordenCompra.ObtenerOrdenCompra(idOC);
            if (oc != null && (oc.odc_c_iestado == (int)EstadoOC.ABIERTA || oc.odc_c_iestado == (int)EstadoOC.VENCIDA))
            {
                this.Mensaje("No se puede eliminar ordenes de compra en estado ABIERTA o VENCIDA.", "~/Imagenes/warning.png");
                //return;
            }
            else
            {
                if (oc != null && (oc.odc_c_iestado == (int)EstadoOC.ANULADA))
                {
                    this.Mensaje("La orden de compra ya se encuentra ANULADA.", "~/Imagenes/warning.png");
                    return;
                }

                this.SetearCambiarEstado(EstadoOC.ANULADA);
                this.ucMensaje2.Show("¿Desea Anular la Orden de Compra seleccionada?", null,
                                    MensajeIcono.Alerta, MensajeBotones.AceptarCancelar);
            }

            ListarOrdenCompra();
        }

        private void SetearCambiarEstado(EstadoOC estadoOC)
        {
            ResultadoMensajeHandler handler = null;
            handler = delegate(object s, ResMsjArgs e2)
            {
                if (e2.resultado == MensajeResultado.Aceptar)
                {
                    this.CambiarEstado(idOC, estadoOC);
                    this.ucMensaje2.ResultadoMensaje -= handler;
                }

                this.EscenarioOC = TipoOperacion.Ninguna;
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

        private void ListarComboMonedaFiltro()
        {
            cboFiltroMoneda.Items.Add(new ListItem("-Seleccionar-", "-1"));
            cboFiltroMoneda.DataSource = _parametro.ListarParametros((int)TipoParametro.MONEDA);
            cboFiltroMoneda.DataTextField = "par_det_c_vdesc";
            cboFiltroMoneda.DataValueField = "par_det_c_iid";
            cboFiltroMoneda.DataBind();
        }

        /// <summary>
        /// Carga los combos de Estado.
        /// </summary>
        private void ListarCombosEstado()
        {
            cboEstado.DataSource = _ordenCompra.ListarEstadosOrdenCompra().
                Where(x => x.odc_estado_iid == (int)EstadoOC.ABIERTA | x.odc_estado_iid == (int)EstadoOC.PLANEADA);

            cboEstado.DataTextField = "odc_estado_vdescripcion";
            cboEstado.DataValueField = "odc_estado_iid";
            cboEstado.DataBind();
        }

        /// <summary>
        /// Obtiene la sub familia, depende de que familia se haya seleccionado
        /// </summary>
        private void ListarSubFamilia()
        {
            int idFamilia;
            if (cboFamilia.SelectedIndex > 0 && int.TryParse(cboFamilia.SelectedValue, out idFamilia) && idFamilia > 0)
            {
                // TODO: Revisar el selected index 0, deberia funcionar
                cboSubFamilia.Enabled = true;
                cboSubFamilia.Items.Clear();
                cboSubFamilia.Items.Add(new ListItem("-- Seleccionar --", "-1"));
                cboSubFamilia.DataSource = _item.ListarSubFamiliaItem(idFamilia);
                cboSubFamilia.DataTextField = "isf_c_vdesc";
                cboSubFamilia.DataValueField = "isf_c_iid";
                cboSubFamilia.DataBind();
            }
            else
            {
                cboSubFamilia.DataSource = null;
                cboSubFamilia.Enabled = false;
                cboSubFamilia.Items.Clear();
                cboSubFamilia.Items.Add(new ListItem("-- Seleccionar --", "-1"));
                cboSubFamilia.DataBind();
            }
            this.upGeneral.Update();
        }

        private void ListarCombosEstadoFiltro()
        {
            cboFiltroEstado.Items.Add(new ListItem("-Seleccionar-", "-1"));
            cboFiltroEstado.DataSource = _ordenCompra.ListarEstadosOrdenCompra();
            cboFiltroEstado.DataTextField = "odc_estado_vdescripcion";
            cboFiltroEstado.DataValueField = "odc_estado_iid";
            cboFiltroEstado.DataBind();
        }

        private void ListarComboClase()
        {
            cboClaseOC.DataSource = _ordenCompra.ListarClasesOrdenCompra();
            cboClaseOC.DataTextField = "odc_cla_vdes";
            cboClaseOC.DataValueField = "odc_cla_iid";
            cboClaseOC.DataBind();
        }

        /// <summary>
        /// Carga la lista de Ordenes de Compra
        /// </summary>
        private void ListarOrdenCompra()
        {
            byte idB;
            byte? idMoneda = null;
            if (cboFiltroMoneda.SelectedIndex > 0 && byte.TryParse(cboFiltroMoneda.SelectedValue, out idB))
            {
                idMoneda = idB;
            }

            int id;
            int? idEstado = null;
            if (cboFiltroEstado.SelectedIndex > 0 && int.TryParse(cboFiltroEstado.SelectedValue, out id))
            {
                idEstado = id;
            }

            gvListaOC.DataSource = _ordenCompra.ListarOrdenDeCompra(idMoneda, txtFiltroRuc.Text.Trim(), idEstado);
            gvListaOC.DataBind();
        }


        /// <summary>
        /// Carga la lista de items para la busqueda tomando en consideración los filtros.
        /// </summary>
        private void ListarItem()
        {
            int id;
            int? idSubFamilia = null;
            int? idFamilia = null;
            if (int.TryParse(cboSubFamilia.SelectedItem.Value, out id) && id >= 0)
            {
                idSubFamilia = id;
            }
            if (int.TryParse(cboFamilia.SelectedItem.Value, out id) && id >= 0)
            {
                idFamilia = id;
            }

            gvListaItem.DataSource = _item.ListarItems(txtFiltroCodigo.Text.Trim(), txtFiltroDescr.Text.Trim(), idFamilia, idSubFamilia);
            gvListaItem.DataBind();
        }

        /// <summary>
        /// Lista las familias de items
        /// </summary>
        private void ListarFamilia()
        {
            cboFamilia.DataSource = _item.ListarFamiliaItem();
            cboFamilia.DataTextField = "ifm_c_des";
            cboFamilia.DataValueField = "ifm_c_iid";
            cboFamilia.DataBind();
        }

        private void ListarProveedores()
        {
            gvProveedores.DataSource = _cliente.ListarProveedor();
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
            if (this.EscenarioOC == TipoOperacion.Creacion)
            {
                lblIGV.Text = this.OCNuevo.odc_c_eigv * 100 + "%";
                lblPercepcion.Text = this.OCNuevo.odc_c_epercepcion * 100 + "%";
            }
            else if (this.EscenarioOC == TipoOperacion.Modificacion)
            {
                lblIGV.Text = this.OCSeleccionado.odc_c_eigv * 100 + "%";
                lblPercepcion.Text = this.OCSeleccionado.odc_c_epercepcion * 100 + "%";
            }
        }

        #endregion

        #region Metodos de Movimiento
        /// <summary>
        /// Inicializa y muestra la vista de Nuevo OC. 
        /// </summary>
        private void MostrarNuevaOrdenCompra()
        {
            PermitirIngresarDatos(true);
            this.Limpiar();

            this.txtSerie.Enabled = true;
            this.txtNumero.Enabled = true;
            this.txtSerie.Text = obtNroSerie();
            this.txtNumero.Text = obtCorrePorSerieOC();
            this.OCNuevo = new SIC_T_ORDEN_DE_COMPRA();
            this.OCNuevo.SIC_T_ORDEN_DE_COMPRA_DET = new System.Data.Objects.DataClasses.EntityCollection<SIC_T_ORDEN_DE_COMPRA_DET>();
            this.OCNuevo.odc_c_eigv = this.igv;
            this.OCNuevo.odc_c_epercepcion = this.percepcion;
            this.OCNuevo.odc_c_zfecharegistro = DateTime.Now;
            this.OCNuevo.odc_c_zfechaentrega_ini = DateTime.Now;
            this.OCNuevo.odc_c_zfechaentrega_fin = DateTime.Now;
            this.gvItemsSeleccionados.DataSource = this.OCNuevo.SIC_T_ORDEN_DE_COMPRA_DET;
            this.EscenarioOC = TipoOperacion.Creacion;
            this.chkPercepcion.Checked = false;

            this.lblAccion.Text = "Nuevo";
            this.lblFecha.Text = this.OCNuevo.odc_c_zfecharegistro.ToString("dd/MM/yyyy");

            this.ItemsSeleccionadosPreliminar = new List<int>();
            this.RecalcularMontos(this.OCNuevo);
            this.mvOC.ActiveViewIndex = 1;
            this.cboMoneda.SelectedIndex = -1;
            this.txtObs.Text = string.Empty;
            this.cboClaseOC.SelectedIndex = -1;

            this.txtFecEnIni.Text = string.Empty;
            this.txtFecEntFin.Text = string.Empty;

            this.ObtenerTasaCambio(this.OCNuevo.odc_c_zfecharegistro);
            this.upGeneral.Update();
        }

        private string obtCorrePorSerieOC()
        {
            int corre = (_ordenCompra.ObtCorrelativoPorSerieOrdenCompra(txtSerie.Text) + 1);
            int length = corre.ToString().Length - 1;

            //8-1 es la longitud del tipo de dato código de la BD.
            return String.Concat(Enumerable.Repeat("0", 7 - length))
                + corre.ToString();
        }

        /// <summary>
        /// Inicializa y muestra la vista de Modificar OC.
        /// </summary>
        private void MostrarModificarOrdenCompra(int id)
        {
            PermitirIngresarDatos(true);
            this.Limpiar();
            this.OCSeleccionado = _ordenCompra.ObtenerOrdenCompra(id);

            if (this.OCSeleccionado.odc_c_iestado != (int)EstadoOC.PLANEADA)
            {
                Mensaje("Solo se puede editar ordenes de compra en estado planeada.", "~/Imagenes/warning.png");
                upGeneral.Update();
                this.OCSeleccionado = null;
                return;
            }

            this.txtSerie.Enabled = false;
            this.txtNumero.Enabled = false;

            this.lblAccion.Text = "Modificar";

            //String[] res = OCSeleccionado.odc_c_vcodigo.Split('-');
            //if (res.Length == 2)
            //{
            this.txtSerie.Text = this.OCSeleccionado.odc_c_cserie;
            this.txtNumero.Text = this.OCSeleccionado.odc_c_vcodigo;
            //}

            this.lblFecha.Text = this.OCSeleccionado.odc_c_zfecharegistro.ToString("dd/MM/yyyy");


            this.EscenarioOC = TipoOperacion.Modificacion;
            this.txtObs.Text = this.OCSeleccionado.odc_c_vobservacion;
            this.txtDirecEntrega.Text = this.OCSeleccionado.odc_c_vdireccion;
            this.chkPercepcion.Checked = OCSeleccionado.odc_c_bactivo;
            this.txtFecEnIni.Text = OCSeleccionado.odc_c_zfechaentrega_ini.ToString("dd/MM/yyyy");
            this.txtFecEntFin.Text = OCSeleccionado.odc_c_zfechaentrega_fin.ToString("dd/MM/yyyy");


            this.OCSeleccionado.odc_c_eigv = this.igv;
            this.OCSeleccionado.odc_c_epercepcion = this.percepcion;
            this.ItemsSeleccionadosPreliminar = new List<int>();
            foreach (var item in OCSeleccionado.SIC_T_ORDEN_DE_COMPRA_DET)
            {
                this.ItemsSeleccionadosPreliminar.Add(item.SIC_T_ITEM.itm_c_iid);
            }

            txtRSProv.Text = this.OCSeleccionado.SIC_T_CLIENTE == null ? string.Empty :
                                                                           this.OCSeleccionado.SIC_T_CLIENTE.cli_c_vraz_soc;
            cboEstado.SelectedIndex = -1;

            var seleccion = cboEstado.Items.FindByText(OCSeleccionado.odc_c_vdescestado);
            if (seleccion != null)
            {
                seleccion.Selected = true;
            }

            cboMoneda.SelectedIndex = -1;
            seleccion = cboMoneda.Items.FindByText(OCSeleccionado.odc_c_vdescmoneda);
            if (seleccion != null)
            {
                seleccion.Selected = true;
            }
            this.ObtenerTasaCambio(this.OCSeleccionado.odc_c_zfecharegistro);

            foreach (var item in OCSeleccionado.SIC_T_ORDEN_DE_COMPRA_DET)
            {
                item.codigoItem = item.SIC_T_ITEM.itm_c_ccodigo;
                item.descItem = item.SIC_T_ITEM.itm_c_vdescripcion;
                item.precioReferenciaSoles = item.SIC_T_ITEM.itm_c_dprecio_compra;

                if (cboMoneda.SelectedIndex == 0)
                {
                    item.precioReferencia = item.precioReferenciaSoles;
                    item.precioUnitarioSoles = item.odc_c_epreciounit;
                }
                else
                {
                    item.precioReferencia = Math.Round(item.precioReferenciaSoles / this.TasaCambio, 2);
                    item.precioUnitarioSoles = Math.Round(item.odc_c_epreciounit * this.TasaCambio, 2);
                }

            }

            this.gvItemsSeleccionados.DataSource = this.OCSeleccionado.SIC_T_ORDEN_DE_COMPRA_DET;
            this.gvItemsSeleccionados.DataBind();

            cboClaseOC.SelectedIndex = -1;
            seleccion = cboClaseOC.Items.FindByText(OCSeleccionado.odc_c_clase_des);
            if (seleccion != null)
            {
                seleccion.Selected = true;
            }

            this.RecalcularMontos(this.OCSeleccionado);
            this.MostrarDatosImpuestos();

            this.mvOC.ActiveViewIndex = 1;
            this.upGeneral.Update();
        }

        protected void gvListaOC_SelectedIndexChanged(object sender, EventArgs e)
        {
            int ocId = (int)this.gvListaOC.DataKeys[gvListaOC.SelectedIndex].Value;
            this.MostrarVerOrdenCompra(ocId);
        }

        private void MostrarVerOrdenCompra(int ocId)
        {
            PermitirIngresarDatos(false);
            this.Limpiar();
            this.OCSeleccionado = _ordenCompra.ObtenerOrdenCompra(ocId);

            this.txtSerie.Enabled = false;
            this.txtNumero.Enabled = false;

            //String[] res = OCSeleccionado.odc_c_vcodigo.Split('-');
            //if (res.Length == 2)
            //{
            this.txtSerie.Text = this.OCSeleccionado.odc_c_cserie;
            this.txtNumero.Text = this.OCSeleccionado.odc_c_vcodigo;
            //}

            this.lblFecha.Text = this.OCSeleccionado.odc_c_zfecharegistro.ToString("dd/MM/yyyy");
            this.EscenarioOC = TipoOperacion.Modificacion;
            this.txtObs.Text = this.OCSeleccionado.odc_c_vobservacion;
            this.txtDirecEntrega.Text = this.OCSeleccionado.odc_c_vdireccion;
            this.chkPercepcion.Checked = OCSeleccionado.odc_c_bpercepcion;
            this.txtFecEnIni.Text = OCSeleccionado.odc_c_zfechaentrega_ini.ToString("dd/MM/yyyy");
            this.txtFecEntFin.Text = OCSeleccionado.odc_c_zfechaentrega_fin.ToString("dd/MM/yyyy");
            this.OCSeleccionado.odc_c_eigv = this.igv;
            this.OCSeleccionado.odc_c_epercepcion = this.percepcion;
            this.ItemsSeleccionadosPreliminar = new List<int>();
            foreach (var item in OCSeleccionado.SIC_T_ORDEN_DE_COMPRA_DET)
            {
                this.ItemsSeleccionadosPreliminar.Add(item.SIC_T_ITEM.itm_c_iid);
            }

            txtRSProv.Text = this.OCSeleccionado.SIC_T_CLIENTE == null ? string.Empty :
                                                                           this.OCSeleccionado.SIC_T_CLIENTE.cli_c_vraz_soc;
            cboEstado.SelectedIndex = -1;

            var seleccion = cboEstado.Items.FindByText(OCSeleccionado.odc_c_vdescestado);
            if (seleccion != null)
            {
                seleccion.Selected = true;
            }

            cboMoneda.SelectedIndex = -1;
            seleccion = cboMoneda.Items.FindByText(OCSeleccionado.odc_c_vdescmoneda);
            if (seleccion != null)
            {
                seleccion.Selected = true;
            }
            this.ObtenerTasaCambio(this.OCSeleccionado.odc_c_zfecharegistro);

            foreach (var item in OCSeleccionado.SIC_T_ORDEN_DE_COMPRA_DET)
            {
                item.codigoItem = item.SIC_T_ITEM.itm_c_ccodigo;
                item.descItem = item.SIC_T_ITEM.itm_c_vdescripcion;
                item.precioReferenciaSoles = item.SIC_T_ITEM.itm_c_dprecio_compra;

                if (cboMoneda.SelectedIndex == 0)
                {
                    item.precioReferencia = item.precioReferenciaSoles;
                    item.precioUnitarioSoles = item.odc_c_epreciounit;
                }
                else
                {
                    item.precioReferencia = Math.Round(item.precioReferenciaSoles / this.TasaCambio, 2);
                    item.precioUnitarioSoles = Math.Round(item.odc_c_epreciounit * this.TasaCambio, 2);
                }

            }

            this.gvItemsSeleccionados.DataSource = this.OCSeleccionado.SIC_T_ORDEN_DE_COMPRA_DET;
            this.gvItemsSeleccionados.DataBind();

            cboClaseOC.SelectedIndex = -1;
            seleccion = cboClaseOC.Items.FindByText(OCSeleccionado.odc_c_clase_des);
            if (seleccion != null)
            {
                seleccion.Selected = true;
            }

            this.RecalcularMontos(this.OCSeleccionado);
            this.MostrarDatosImpuestos();

            this.mvOC.ActiveViewIndex = 1;
            this.upGeneral.Update();
        }

        private void PermitirIngresarDatos(bool permitir)
        {
            btnGuardar.Visible = permitir;
            btnBuscarProveedor.Visible = permitir;
            btnBuscarDireccion.Visible = permitir;
            btnBuscarItem.Visible = permitir;
            chkPercepcion.Enabled = permitir;
            txtObs.Enabled = permitir;
            cboClaseOC.Enabled = permitir;
            cboEstado.Enabled = permitir;
            cboMoneda.Enabled = permitir;
            txtFecEnIni.Enabled = permitir;
            txtFecEntFin.Enabled = permitir;
            txtSerie.Enabled = permitir;
            txtNumero.Enabled = permitir;
            btnBuscarItems.Visible = permitir;

            /*Asegurarse que esta columna sea la de editar los items, de la orden de compra
             **/
            gvItemsSeleccionados.Columns[5].Visible = permitir;
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
            if (EscenarioOC == TipoOperacion.Creacion || EscenarioOC == TipoOperacion.Modificacion)
            {
                this.ListarItem();
                mvOC.ActiveViewIndex = 2;
                upGeneral.Update();
            }
            else
            {
                Mensaje("Operación no permitida.", "~/Imagenes/warning.png");
            }
        }

        /// <summary>
        /// Regresa a la vista Nuevo/Edicion desde la lista items.
        /// Se prodecederá a updatear la lista de items seleccionados.
        /// </summary>
        private void RegresarDesdeListaItems()
        {
            this.ActualizarListaItemsPreliminar();
            if (this.EscenarioOC == TipoOperacion.Creacion)
            {
                this.ActualizarListaItems(this.OCNuevo);
                this.RecalcularMontos(this.OCNuevo);
            }
            else if (this.EscenarioOC == TipoOperacion.Modificacion)
            {
                this.ActualizarListaItems(this.OCSeleccionado);
                this.RecalcularMontos(this.OCSeleccionado);
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
            this.ListarOrdenCompra();
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
            ItemsSeleccionadosPreliminar = list;
        }

        /// <summary>
        /// Actualiza la lista de items desde la lista preliminar
        /// </summary>
        private void ActualizarListaItems(SIC_T_ORDEN_DE_COMPRA ordenDeCompra)
        {
            if (ordenDeCompra == null)
            {
                return;
            }
            if (ordenDeCompra.SIC_T_ORDEN_DE_COMPRA_DET == null)
            {
                ordenDeCompra.SIC_T_ORDEN_DE_COMPRA_DET = new System.Data.Objects.DataClasses.EntityCollection<SIC_T_ORDEN_DE_COMPRA_DET>();
            }

            List<int> listaPrel = this.ItemsSeleccionadosPreliminar;
            if (listaPrel == null)
            {
                return;
            }

            // Primero eliminamos todos los que no estan seleccionados           
            List<SIC_T_ORDEN_DE_COMPRA_DET> remover =
                ordenDeCompra.SIC_T_ORDEN_DE_COMPRA_DET.Where(x => !listaPrel.Contains(x.odc_c_iitemid)).ToList();
            foreach (var item in remover)
            {
                ordenDeCompra.SIC_T_ORDEN_DE_COMPRA_DET.Remove(item);
            }

            decimal precioReferencia, precioReferenciaSoles;
            // Ahora agregamos los nuevos
            foreach (int idItem in listaPrel)
            {
                if (!ordenDeCompra.SIC_T_ORDEN_DE_COMPRA_DET.Where(x => x.odc_c_iitemid == idItem).Any())
                {
                    SIC_T_ITEM itemEncontrado = _item.ObtenerItemPorIdNoContext(idItem);
                    precioReferencia = (cboMoneda.SelectedIndex == 0 ? itemEncontrado.itm_c_dprecio_compra
                                                                        : Math.Round(itemEncontrado.itm_c_dprecio_compra / this.TasaCambio, 2));
                    precioReferenciaSoles = itemEncontrado.itm_c_dprecio_compra;
                    SIC_T_ORDEN_DE_COMPRA_DET nuevoDetalle = new SIC_T_ORDEN_DE_COMPRA_DET();
                    nuevoDetalle.odc_c_ecantidad = 1;
                    nuevoDetalle.odc_c_iitemid = itemEncontrado.itm_c_iid;
                    nuevoDetalle.odc_c_epreciounit = precioReferencia;
                    nuevoDetalle.odc_c_epreciototal = precioReferencia;
                    nuevoDetalle.precioReferencia = precioReferencia;
                    nuevoDetalle.precioReferenciaSoles = precioReferenciaSoles;
                    nuevoDetalle.precioUnitarioSoles = itemEncontrado.itm_c_dprecio_compra;
                    nuevoDetalle.codigoItem = itemEncontrado.itm_c_ccodigo;
                    nuevoDetalle.descItem = itemEncontrado.itm_c_vdescripcion;

                    //nuevoDetalle.SIC_T_ITEM = itemEncontrado;
                    ordenDeCompra.SIC_T_ORDEN_DE_COMPRA_DET.Add(nuevoDetalle);
                }
            }

            gvItemsSeleccionados.DataSource = ordenDeCompra.SIC_T_ORDEN_DE_COMPRA_DET;
            gvItemsSeleccionados.DataBind();
        }

        private void CambiarMonedaListaItem(SIC_T_ORDEN_DE_COMPRA ordenDeCompra)
        {
            bool bSoles = cboMoneda.SelectedIndex == 0;
            foreach (var item in ordenDeCompra.SIC_T_ORDEN_DE_COMPRA_DET)
            {
                if (bSoles)
                {
                    item.odc_c_epreciounit = item.precioUnitarioSoles;
                    item.precioReferencia = item.precioReferenciaSoles;
                    item.odc_c_epreciototal = item.odc_c_epreciounit * item.odc_c_ecantidad;
                }
                else
                {
                    item.odc_c_epreciounit = Math.Round(item.precioUnitarioSoles / this.TasaCambio, 2);
                    item.precioReferencia = Math.Round(item.precioReferenciaSoles / this.TasaCambio, 2);
                    item.odc_c_epreciototal = item.odc_c_epreciounit * item.odc_c_ecantidad;
                }
            }

            gvItemsSeleccionados.DataSource = ordenDeCompra.SIC_T_ORDEN_DE_COMPRA_DET;
            gvItemsSeleccionados.DataBind();
        }

        /// <summary>
        /// Recalcula los montos de subtotal, igv, percepcion y total de la orden de compra.
        /// El resultado mostrado dependera de la moneda (soles/dolares) seleccionado
        /// </summary>
        /// <param name="ordenDeCompra"></param>
        private void RecalcularMontos(SIC_T_ORDEN_DE_COMPRA ordenDeCompra)
        {
            decimal subTotal = 0M;
            String simbolo = "S/.";
            bool bSoles = cboMoneda.SelectedIndex == 0;
            if (bSoles)
            {
                simbolo = "S/.";
            }
            else
            {
                simbolo = "US$";
            }

            foreach (var item in ordenDeCompra.SIC_T_ORDEN_DE_COMPRA_DET)
            {
                subTotal += item.odc_c_epreciototal;
            }

            ordenDeCompra.odc_c_esubtotal = subTotal;
            ordenDeCompra.odc_c_eigv = this.igv;
            ordenDeCompra.odc_c_eigvcal = Math.Round(subTotal * ordenDeCompra.odc_c_eigv, 2);
            ordenDeCompra.odc_c_epercepcion = this.percepcion;

            if (chkPercepcion.Checked && subTotal >= (bSoles ? this.percepcionmax : Math.Round(this.percepcionmax / this.TasaCambio, 2)))
            {
                ordenDeCompra.odc_c_epercepcioncal = Math.Round(subTotal * ordenDeCompra.odc_c_epercepcion, 2);
            }
            else
            {
                ordenDeCompra.odc_c_epercepcioncal = 0;
            }

            ordenDeCompra.odc_c_etotal = ordenDeCompra.odc_c_esubtotal + ordenDeCompra.odc_c_eigvcal
                                        + ordenDeCompra.odc_c_epercepcioncal;

            this.lblPercepMax.Text = simbolo + " " + (bSoles ? this.percepcionmax : Math.Round(this.percepcionmax / this.TasaCambio, 2));

            this.lblSubTotal.Text = simbolo + " " + ordenDeCompra.odc_c_esubtotal.ToString("F2", CultureInfo.InvariantCulture);
            this.lblTotal.Text = simbolo + " " + ordenDeCompra.odc_c_etotal.ToString("F2", CultureInfo.InvariantCulture);
            this.lblIGVCal.Text = simbolo + " " + ordenDeCompra.odc_c_eigvcal.ToString("F2", CultureInfo.InvariantCulture);
            if (chkPercepcion.Checked)
            {
                this.lblPercepcionCal.Text = simbolo + " " + ordenDeCompra.odc_c_epercepcioncal.ToString("F2", CultureInfo.InvariantCulture);
            }
            else
            {
                this.lblPercepcionCal.Text = "-";
            }
        }

        /// <summary>
        /// Selecciona la empresa y regresa a la vista Nuevo/Editar
        /// </summary>
        private void SeleccionEmpresa()
        {
            String RUC = this.gvProveedores.DataKeys[gvProveedores.SelectedIndex].Value.ToString();
            if (EscenarioOC == TipoOperacion.Modificacion)
            {
                this.OCSeleccionado.prov_c_vdoc_id = RUC;
            }
            else if (EscenarioOC == TipoOperacion.Creacion)
            {
                this.OCNuevo.prov_c_vdoc_id = RUC;
            }

            if (gvProveedores.Rows[gvProveedores.SelectedIndex].Cells[1].Text != null)
            {
                txtRSProv.Text = gvProveedores.Rows[gvProveedores.SelectedIndex].Cells[1].Text;
            }

            mvOC.ActiveViewIndex = 1;
            upGeneral.Update();
        }

        private string obtNroSerie()
        {
            int length = Convert.ToInt32(DateTime.Now.Year.ToString().Substring(1)).ToString().Length - 1;
            return String.Concat(Enumerable.Repeat("0", length))
                + Convert.ToInt32(DateTime.Now.Year.ToString().Substring(1)).ToString();
        }

        /// <summary>
        /// Ingresa la Orden de Compra en la bd y termina el proceso
        /// </summary>
        ///      
        private void IngresarOC()
        {
            if (!VerificarDatosOC(this.OCNuevo))
            {
                return;
            }

            string[] formats = { "dd/MM/yyyy" };

            var oc = this.OCNuevo;
            oc.odc_c_cserie = obtNroSerie();
            oc.odc_c_vcodigo = obtCorrePorSerieOC();
            oc.odc_c_zfechaentrega_ini = DateTime.ParseExact(txtFecEnIni.Text, "dd/MM/yyyy",
                                new CultureInfo("en-US"), DateTimeStyles.None);
            oc.odc_c_zfechaentrega_fin = DateTime.ParseExact(txtFecEntFin.Text, "dd/MM/yyyy",
                                new CultureInfo("en-US"), DateTimeStyles.None);
            oc.odc_c_ymoneda = byte.Parse(this.cboMoneda.SelectedValue);
            oc.odc_c_vdescmoneda = this.cboMoneda.SelectedItem.Text.Trim();
            oc.odc_c_iestado = int.Parse(this.cboEstado.SelectedValue);
            oc.odc_c_vdescestado = this.cboEstado.SelectedItem.Text.Trim();
            oc.odc_c_vobservacion = txtObs.Text;
            oc.odc_c_clase_iid = int.Parse(this.cboClaseOC.SelectedValue);
            oc.odc_c_clase_des = this.cboClaseOC.SelectedItem.Text.Trim();
            oc.odc_c_bpercepcion = this.chkPercepcion.Checked;

            SIC_T_USUARIO usuarioActual = Session["USUARIO"] as SIC_T_USUARIO;
            if (usuarioActual != null)
            {
                oc.odc_c_iid_usuario_creador = usuarioActual.usua_c_cdoc_id;
            }

            try
            {
                if (_ordenCompra.InsertarOrdenCompra(this.OCNuevo))
                {
                    Mensaje("Orden de Compra registrada con éxito", "~/Imagenes/correcto.png");
                    this.Limpiar();
                    this.ListarOrdenCompra();
                    mvOC.ActiveViewIndex = 0;
                    upGeneral.Update();
                }
                else
                {
                    Mensaje("Error al realizar el proceso.", "~/Imagenes/warning.png");
                }
            }
            catch (Exception ex)
            {
#if DEBUG

                String mensajeError = "Error Fatal : \n" + ex.Message;
                if (ex.InnerException != null)
                {
                    mensajeError += "\n" + ex.InnerException != null ? ex.InnerException.Message : string.Empty;
                }

                Mensaje(mensajeError, "~/Imagenes/warning.png");
#else
                Mensaje("Error al realizar el proceso.", "~/Imagenes/warning.png");
#endif
            }
        }

        private void ActualizarOC()
        {
            if (!VerificarDatosOC(this.OCSeleccionado))
            {
                return;
            }

            var oc = this.OCSeleccionado;
            oc.odc_c_zfechaentrega_ini = DateTime.ParseExact(txtFecEnIni.Text, "dd/MM/yyyy",
                                           new CultureInfo("en-US"), DateTimeStyles.None);
            oc.odc_c_zfechaentrega_fin = DateTime.ParseExact(txtFecEntFin.Text, "dd/MM/yyyy",
                                new CultureInfo("en-US"), DateTimeStyles.None);
            oc.odc_c_ymoneda = byte.Parse(this.cboMoneda.SelectedValue);
            oc.odc_c_vdescmoneda = this.cboMoneda.SelectedItem.Text.Trim();
            oc.odc_c_iestado = int.Parse(this.cboEstado.SelectedValue);
            oc.odc_c_vdescestado = this.cboEstado.SelectedItem.Text.Trim();
            oc.odc_c_vobservacion = txtObs.Text;
            oc.odc_c_clase_iid = int.Parse(this.cboClaseOC.SelectedValue);
            oc.odc_c_clase_des = this.cboClaseOC.SelectedItem.Text.Trim();
            oc.odc_c_bpercepcion = this.chkPercepcion.Checked;

            SIC_T_USUARIO usuarioActual = Session["USUARIO"] as SIC_T_USUARIO;
            if (usuarioActual != null)
            {
                oc.odc_c_iid_usuario_mod = usuarioActual.usua_c_cdoc_id;
            }

            oc.odc_c_zfecharmod = DateTime.Now;

            try
            {
                if (_ordenCompra.ModificarOrdenCompra(this.OCSeleccionado))
                {
                    Mensaje("Orden de Compra modificada con éxito", "~/Imagenes/correcto.png");
                    this.Limpiar();
                    this.ListarOrdenCompra();
                    mvOC.ActiveViewIndex = 0;
                    upGeneral.Update();
                }
                else
                {
                    Mensaje("Error al realizar el proceso.", "~/Imagenes/warning.png");
                }
            }
            catch (Exception ex)
            {
                Mensaje("Error al realizar el proceso.", "~/Imagenes/warning.png");
            }
        }

        /// <summary>
        /// Limpia 
        /// </summary>
        private void Limpiar()
        {
            this.OCNuevo = null;
            this.OCSeleccionado = null;
            this.EscenarioOC = TipoOperacion.Ninguna;
            this.TasaCambio = 1.0M;
            this.ItemsSeleccionadosPreliminar = null;
            this.txtRSProv.Text = string.Empty;
            this.cboMoneda.SelectedIndex = -1;
            this.cboEstado.SelectedIndex = -1;
            this.txtFecEnIni.Text = DateTime.Today.ToString("dd/MM/yyyy");
            this.txtFecEntFin.Text = DateTime.Today.ToString("dd/MM/yyyy");
            //this.txtFecEnIni_CalendarExtender.SelectedDate = DateTime.Today;
            //this.txtFecEntFin_CalendarExtender.SelectedDate = DateTime.Today;
            this.txtDirecEntrega.Text = string.Empty;
            this.txtObs.Text = string.Empty;
            this.gvItemsSeleccionados.DataSource = null;
            this.gvItemsSeleccionados.DataBind();
        }


        private bool VerificarDatosOC(SIC_T_ORDEN_DE_COMPRA ordenDeCompra)
        {
            DateTime fechaInicio, fechaFin;

            if (ordenDeCompra == null)
            {
                Mensaje("Estado de la página no válido.", "~/Imagenes/warning.png");
                return false;
            }
            else if (ordenDeCompra.prov_c_vdoc_id == null || ordenDeCompra.prov_c_vdoc_id == string.Empty)
            {
                Mensaje("Debe seleccionar un proveedor.", "~/Imagenes/warning.png");
                return false;
            }
            else if (ordenDeCompra.odc_c_idireccion <= 0)
            {
                Mensaje("Debe seleccionar una dirección.", "~/Imagenes/warning.png");
                return false;
            }
            //else if (DateTime.Compare(calFechaEntrega.SelectedDate, DateTime.Today) < 0)
            //{
            //    Mensaje("Debe ingresar una fecha válida.", "~/Imagenes/warning.png");
            //    return false;
            //}
            else if (cboEstado.SelectedIndex == -1)
            {
                Mensaje("Debe seleccionar un estado.", "~/Imagenes/warning.png");
                return false;
            }
            else if (cboMoneda.SelectedIndex == -1)
            {
                Mensaje("Debe seleccionar un tipo de Moneda.", "~/Imagenes/warning.png");
                return false;
            }
            else if (cboClaseOC.SelectedIndex == -1)
            {
                Mensaje("Debe seleccionar la clase de la orden de compra.", "~/Imagenes/warning.png");
                return false;
            }
            else if (ordenDeCompra.SIC_T_ORDEN_DE_COMPRA_DET == null
                || ordenDeCompra.SIC_T_ORDEN_DE_COMPRA_DET.Count == 0)
            {
                Mensaje("Debe seleccionar al menos un item.", "~/Imagenes/warning.png");
                return false;
            }
            else if (!DateTime.TryParseExact(txtFecEnIni.Text, "dd/MM/yyyy", new CultureInfo("en-US"), DateTimeStyles.None, out fechaInicio)
                || !DateTime.TryParseExact(txtFecEntFin.Text, "dd/MM/yyyy", new CultureInfo("en-US"), DateTimeStyles.None, out fechaFin))
            {
                Mensaje("Se requiere fechas válidas con formato dd/MM/yyyy.", "~/Imagenes/warning.png");
                return false;
            }
            else if (fechaInicio > fechaFin)
            {
                Mensaje("La fecha de entrega final debe ser posterior a la fecha de entrega inicial.", "~/Imagenes/warning.png");
                return false;
            }
            else if (fechaInicio.Date < ordenDeCompra.odc_c_zfecharegistro.Date)
            {
                Mensaje("La fecha de entrega inicial debe ser el mismo dia o despues de la fecha de registro.", "~/Imagenes/warning.png");
                return false;

            }
            else if (this.EscenarioOC == TipoOperacion.Creacion
                && (null != _ordenCompra.ObtenerORdenCompraPorCodigo(this.txtSerie.Text + "-" + this.txtNumero.Text)))
            {
                Mensaje("El codigo ya existe.", "~/Imagenes/warning.png");
                return false;
            }
            else
            {
                return true;
            }

        }

        private void CambiarEstado(int idOC, EstadoOC estadoOC)
        {
            try
            {
                if (this._ordenCompra.CambiarEstadoOrdenCompra(idOC, estadoOC) >= 1)
                {
                    Mensaje("Orden de Compra " + Enum.GetName(typeof(EstadoOC), estadoOC), "~/Imagenes/correcto.png");
                }
                else
                {
                    Mensaje("Error al realizar el proceso.", "~/Imagenes/warning.png");
                }
            }
            catch (Exception)
            {
                Mensaje("Error al realizar el proceso.", "~/Imagenes/warning.png");
            }


            this.ListarOrdenCompra();
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
            ListarOrdenCompra();
        }

        protected void gvListaOC_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvListaOC.PageIndex = e.NewPageIndex;
            ListarOrdenCompra();
        }

        protected void gvItemsSeleccionados_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void cboEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (EscenarioOC == TipoOperacion.Creacion)
            {
                ObtenerTasaCambio(this.OCNuevo.odc_c_zfecharegistro);
            }
            else if (EscenarioOC == TipoOperacion.Modificacion)
            {
                ObtenerTasaCambio(this.OCSeleccionado.odc_c_zfecharegistro);
            }
        }

        private void ObtenerTasaCambio(DateTime fechaTC)
        {
            var value = this._tasaCambio.ObtenerTasaCambio(fechaTC);

            if (value != null)
            {
                this.TasaCambio = value.tsc_c_ecompra;
                lblTC.Text = "S/. " + value.tsc_c_ecompra.ToString("F4", CultureInfo.InvariantCulture);
            }
        }

        protected void cboMoneda_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.EscenarioOC == TipoOperacion.Creacion)
            {
                CambiarMonedaListaItem(this.OCNuevo);
                RecalcularMontos(this.OCNuevo);
                this.upGeneral.Update();
            }
            else if (this.EscenarioOC == TipoOperacion.Modificacion)
            {
                CambiarMonedaListaItem(this.OCSeleccionado);
                RecalcularMontos(this.OCSeleccionado);
                this.upGeneral.Update();
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
            //

        }

        protected void chkPercepcion_CheckedChanged(object sender, EventArgs e)
        {
            percepcionactive = chkPercepcion.Checked;
            if (EscenarioOC == TipoOperacion.Creacion)
            {

                RecalcularMontos(this.OCNuevo);
            }
            else if (EscenarioOC == TipoOperacion.Modificacion)
            {
                RecalcularMontos(this.OCSeleccionado);
            }
        }

        protected void gvDireccion_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = (int)this.gvDireccion.DataKeys[gvDireccion.SelectedIndex].Value;
            var res = _empresa.ObtenerDireccionEmpresa(id);

            if (res != null)
            {
                if (this.EscenarioOC == TipoOperacion.Creacion)
                {
                    this.OCNuevo.odc_c_idireccion = res.emp_dir_c_iid;
                    this.OCNuevo.odc_c_vdireccion = res.emp_dir_c_vdireccion;
                }
                else if (this.EscenarioOC == TipoOperacion.Modificacion)
                {
                    this.OCSeleccionado.odc_c_idireccion = res.emp_dir_c_iid;
                    this.OCSeleccionado.odc_c_vdireccion = res.emp_dir_c_vdireccion;

                }
                this.txtDirecEntrega.Text = res.emp_dir_c_vdireccion;
            }
            mvOC.ActiveViewIndex = 1;
            upGeneral.Update();
        }


        protected void gvDireccion_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDireccion.PageIndex = e.NewPageIndex;
            this.ListarDirecciones();
        }

        private void ListarDirecciones()
        {
            gvDireccion.DataSource = _empresa.ListarDireccionEmpresa();
            gvDireccion.DataBind();
        }

        protected void btnRgresarDesdeProveedor_Click(object sender, EventArgs e)
        {
            mvOC.ActiveViewIndex = 1;
            upGeneral.Update();
        }

        protected void btnRegresarDireccion_Click(object sender, EventArgs e)
        {
            mvOC.ActiveViewIndex = 1;
            upGeneral.Update();
        }

        protected void btnBuscarDireccion_Click(object sender, EventArgs e)
        {
            mvOC.ActiveViewIndex = 4;
            upGeneral.Update();
        }

        private void DescargarODC(int id)
        {
            SIC_T_ORDEN_DE_COMPRA odc = _ordenCompra.ObtenerOrdenCompra(id);
            PdfOrdenCompra.init(odc);
        }

        protected void gvListaOC_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lnkDescargar = e.Row.FindControl("lnkDescargar") as LinkButton;
                ScriptManager.GetCurrent(this).RegisterPostBackControl(lnkDescargar);
            }
        }

        protected void lnkDescargar_Click(object sender, EventArgs e)
        {
            LinkButton btnDescargar = sender as LinkButton;
            GridViewRow row = btnDescargar.NamingContainer as GridViewRow;

            int id = (int) gvListaOC.DataKeys[row.RowIndex].Value;
            DescargarODC(id);
        }

        protected void gvListaOC_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Cerrar")
            {

                this.EscenarioOC = TipoOperacion.Eliminacion;

                this.idOC = (int)this.gvListaOC.DataKeys[Convert.ToInt32(e.CommandArgument)].Values["odc_c_iid"];
                var oc = _ordenCompra.ObtenerOrdenCompra(idOC);

                if (oc != null && (oc.odc_c_iestado == (int)EstadoOC.ANULADA | oc.odc_c_iestado == (int)EstadoOC.PLANEADA))
                {
                    this.Mensaje("No se puede CERRAR una orden de compra en estado PLANEADA ó ANULADA, en su defecto ANULARLA", "~/Imagenes/warning.png");
                    //return;
                }
                else
                {
                    if (oc != null && (oc.odc_c_iestado == (int)EstadoOC.CERRADA))
                    {
                        this.Mensaje("La orden de compra ya se encuentra CERRADA.", "~/Imagenes/warning.png");
                        return;
                    }

                    this.SetearCambiarEstado(EstadoOC.CERRADA);
                    this.ucMensaje2.Show("¿Desea Cerrar la Orden de Compra seleccionada?", null,
                                        MensajeIcono.Alerta, MensajeBotones.AceptarCancelar);
                }

                ListarOrdenCompra();
            }
        }

        //protected void PostBackBind_DataBinding(object sender, EventArgs e)
        //{
        //    LinkButton lb = (LinkButton)sender;
        //    ScriptManager sm = (ScriptManager)Page.Master.FindControl("SM_ID");
        //    sm.RegisterPostBackControl(lb);

        //}

        //protected void gvListaOC_DataBinding(object sender, EventArgs e)
        //{
        //    if (((GridView)sender).SelectedIndex != -1)
        //    {
        //        LinkButton lnkDescargar = ((GridView)sender).FindControl("lnkDescargar") as LinkButton;
        //        ScriptManager.GetCurrent(this).RegisterPostBackControl(lnkDescargar);
        //    }
        //}

    }
}