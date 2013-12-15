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

namespace SIC.UserLayer.Interfaces.Mantenimiento
{
    public partial class frmRegOC : System.Web.UI.Page
    {
        #region DECLARACION DE VARIABLES
        private ParametroBL _parametro = null;
        private OrdenCompraBL _ordenCompra = null;
        private ItemBL _item = null;
        private ProveedorBL _proveedor = null;

        private TipoOperacion EscenarioOC
        {
            get { return (TipoOperacion) ViewState["vsEscenarioOC"] ; }
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

        private int OCEliminar
        {
            get { return (int) (ViewState["vsOCEliminar"]==null?-1:ViewState["vsOCEliminar"]) ; }
            set { ViewState["vsOCEliminar"] = value; }
        }

        #endregion

        #region Eventos
        public frmRegOC()
        {
            _parametro = new ParametroBL();
            _item = new ItemBL();
            _ordenCompra = new OrdenCompraBL();
            _proveedor = new ProveedorBL();
            EscenarioOC = TipoOperacion.Ninguna;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.ListarComboMoneda();
                this.ListarCombosEstado();
                this.ListarItem();
                this.ListarProveedores();
                this.ListarOrdenCompra();
                gvItemsSeleccionados.DataSource = null;
                gvItemsSeleccionados.DataBind();
                this.ObtenerDatosImpuesto();
            }
            if (EscenarioOC == TipoOperacion.Eliminacion)
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
            int cantidadNueva;
            if (int.TryParse(txtCantidad.Text, out cantidadNueva) && cantidadNueva > 0)
            {
                int itemId = (int)gvItemsSeleccionados.DataKeys[e.RowIndex].Value;

                if (this.EscenarioOC == TipoOperacion.Modificacion)
                {
                    SIC_T_ORDEN_DE_COMPRA ordenCompra = this.OCSeleccionado;
                    foreach (var item in ordenCompra.SIC_T_ORDEN_DE_COMPRA_DET)
                    {
                        if (item.ocd_c_iitemid == itemId)
                        {
                            item.ocd_c_icantidad = cantidadNueva;
                            item.ocd_c_dprecio = item.SIC_T_ITEM.itm_c_dprecio * cantidadNueva;
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
                        if (item.ocd_c_iitemid == itemId)
                        {
                            item.ocd_c_icantidad = cantidadNueva;
                            item.ocd_c_dprecio = item.SIC_T_ITEM.itm_c_dprecio * cantidadNueva;
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
                Mensaje("Debe ingresar un número entero válido mayor a 0.", "../Imagenes/warning.png");
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
            this.OCEliminar = (int)this.gvListaOC.DataKeys[e.RowIndex].Value;
            this.SetearEliminar();

            this.ucMensaje2.Show("¿Desea eliminar la Orden de Compra seleccionada?", null,
                                MensajeIcono.Alerta, MensajeBotones.AceptarCancelar);
        }

        private void SetearEliminar()
        {
            ResultadoMensajeHandler handler = null;
            handler = delegate(object s, ResMsjArgs e2)
            {
                if (e2.resultado == MensajeResultado.Aceptar)
                {
                    this.DeshabilitarOC(OCEliminar);
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

        /// <summary>
        /// Carga los combos de Estado.
        /// </summary>
        private void ListarCombosEstado()
        {
            cboEstado.DataSource = _ordenCompra.ListarEstadosOrdenCompra();
            cboEstado.DataTextField = "odc_estado_vdescripcion";
            cboEstado.DataValueField = "odc_estado_iid";
            cboEstado.DataBind();
        }
        /// <summary>
        /// Carga la lista de Ordenes de Compra
        /// </summary>
        private void ListarOrdenCompra()
        {
            gvListaOC.DataSource =  _ordenCompra.ListarOrdenDeCompra();
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
            gvProveedores.DataSource = _proveedor.ListarProveedores();
            gvProveedores.DataBind();
        }

        private void ObtenerDatosImpuesto()
        {
            var listaPercepcion = this._parametro.ListarParametros((int)TipoParametro.PERCEPCION);
            var listaIGV = this._parametro.ListarParametros((int)TipoParametro.IGV);

            if (listaIGV.Count == 1)
            {
                this.igv = decimal.Parse(listaIGV[0].par_det_c_vcampo_1.ToString(), CultureInfo.InvariantCulture);
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
                lblIGV.Text = this.OCNuevo.ocd_c_digv * 100 + "%";
                lblPercepcion.Text = this.OCNuevo.ocd_c_dpercepcion * 100 + "%";
            }
            else if (this.EscenarioOC == TipoOperacion.Modificacion)
            {
                lblIGV.Text = this.OCSeleccionado.ocd_c_digv * 100 + "%";
                lblPercepcion.Text = this.OCSeleccionado.ocd_c_dpercepcion * 100 + "%";
            }            
        }

        #endregion

        #region Metodos de Movimiento
        /// <summary>
        /// Inicializa y muestra la vista de Nuevo OC. 
        /// </summary>
        private void MostrarNuevaOrdenCompra()
        {
            this.OCNuevo = new SIC_T_ORDEN_DE_COMPRA();
            this.OCNuevo.SIC_T_ORDEN_DE_COMPRA_DET = new System.Data.Objects.DataClasses.EntityCollection<SIC_T_ORDEN_DE_COMPRA_DET>();
            this.OCNuevo.ocd_c_digv = this.igv;
            this.OCNuevo.ocd_c_dpercepcion = this.percepcion;
            //-- Missing percepcion max
            this.gvItemsSeleccionados.DataSource = this.OCNuevo.SIC_T_ORDEN_DE_COMPRA_DET;
            this.EscenarioOC = TipoOperacion.Creacion;
            this.lblAccion.Text = "Nuevo";
            this.ItemsSeleccionadosPreliminar = new List<int>();
            this.RecalcularMontos(this.OCNuevo);
            this.mvOC.ActiveViewIndex = 1;
            this.MostrarDatosImpuestos();


            this.upGeneral.Update();
        }

        /// <summary>
        /// Inicializa y muestra la vista de Modificar OC.
        /// </summary>
        private void MostrarModificarOrdenCompra(int id)
        {
            this.OCSeleccionado = _ordenCompra.ObtenerOrdenCompra(id);
            this.gvItemsSeleccionados.DataSource = this.OCSeleccionado.SIC_T_ORDEN_DE_COMPRA_DET;
            this.gvItemsSeleccionados.DataBind();
            this.EscenarioOC = TipoOperacion.Modificacion;
            if (OCSeleccionado.odc_c_zfecha.HasValue)
            {
                this.calFechaEntrega.SelectedDate = OCSeleccionado.odc_c_zfecha.Value;
            }
            else
            {
                this.calFechaEntrega.SelectedDate = DateTime.Today;
            }

            this.OCSeleccionado.ocd_c_digv = this.igv;
            this.OCSeleccionado.ocd_c_dpercepcion = this.percepcion;
            
            this.ItemsSeleccionadosPreliminar = new List<int>();
            foreach (var item in OCSeleccionado.SIC_T_ORDEN_DE_COMPRA_DET)
            {
                this.ItemsSeleccionadosPreliminar.Add(item.SIC_T_ITEM.itm_c_iid);
            }

            txtRSProv.Text = this.OCSeleccionado.SIC_T_PROVEEDOR == null ? string.Empty : 
                                                                           this.OCSeleccionado.SIC_T_PROVEEDOR.pro_c_vraz_soc;
            cboEstado.SelectedIndex = -1;

            var seleccion = cboEstado.Items.FindByText(OCSeleccionado.ocd_c_vdescestado);
            if (seleccion != null)
            {
                seleccion.Selected = true;
            }

            cboMoneda.SelectedIndex = -1;
            seleccion = cboMoneda.Items.FindByText(OCSeleccionado.ocd_c_vdescmoneda);
            if (seleccion != null)
            {
                seleccion.Selected = true;
            }

            this.RecalcularMontos(this.OCSeleccionado);
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
            if (EscenarioOC == TipoOperacion.Creacion || EscenarioOC == TipoOperacion.Modificacion)
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
            if(listaPrel == null)
            {
                return;
            }

            // Primero eliminamos todos los que no estan seleccionados           
            List<SIC_T_ORDEN_DE_COMPRA_DET> remover = 
                ordenDeCompra.SIC_T_ORDEN_DE_COMPRA_DET.Where(x => !listaPrel.Contains(x.ocd_c_iitemid)).ToList();
            foreach (var item in remover)
            {
                ordenDeCompra.SIC_T_ORDEN_DE_COMPRA_DET.Remove(item);
            }

            // Ahora agregamos los nuevos
            foreach (int idItem in listaPrel)
            {
                if (!ordenDeCompra.SIC_T_ORDEN_DE_COMPRA_DET.Where(x => x.ocd_c_iitemid == idItem).Any())
                {
                    SIC_T_ITEM itemEncontrado = _item.ObtenerItemPorIdNoContext(idItem);
                    SIC_T_ORDEN_DE_COMPRA_DET nuevoDetalle = new SIC_T_ORDEN_DE_COMPRA_DET();
                    nuevoDetalle.ocd_c_icantidad = 1;
                    nuevoDetalle.ocd_c_iitemid = itemEncontrado.itm_c_iid;
                    nuevoDetalle.ocd_c_dprecio = itemEncontrado.itm_c_dprecio;
                    nuevoDetalle.SIC_T_ITEM = itemEncontrado;
                    ordenDeCompra.SIC_T_ORDEN_DE_COMPRA_DET.Add(nuevoDetalle);
                }
            }

            gvItemsSeleccionados.DataSource = ordenDeCompra.SIC_T_ORDEN_DE_COMPRA_DET;
            gvItemsSeleccionados.DataBind();
        }

        /// <summary>
        /// Recalcula los montos de subtotal, igv, percepcion y total de la orden de compra.
        /// </summary>
        /// <param name="ordenDeCompra"></param>
        private void RecalcularMontos(SIC_T_ORDEN_DE_COMPRA ordenDeCompra)
        {
            decimal subTotal = 0M;

            foreach (var item in ordenDeCompra.SIC_T_ORDEN_DE_COMPRA_DET)
            {
                if (item.ocd_c_dprecio.HasValue)
                {
                    subTotal += item.ocd_c_dprecio.Value;
                }
            }

            ordenDeCompra.ocd_c_dsubtotal = subTotal;
            ordenDeCompra.ocd_c_digv = this.igv;
            ordenDeCompra.ocd_c_digvcal = subTotal * ordenDeCompra.ocd_c_digv.Value;
            ordenDeCompra.ocd_c_dpercepcion = this.percepcion;
            

            if (ordenDeCompra.ocd_c_dsubtotal.Value > this.percepcionmax)
            {
                ordenDeCompra.ocd_c_dpercepcioncal = subTotal * ordenDeCompra.ocd_c_dpercepcion.Value;
            }
            else
            {
                ordenDeCompra.ocd_c_dpercepcioncal = 0;
            }

            ordenDeCompra.ocd_c_dtotal = ordenDeCompra.ocd_c_dsubtotal + ordenDeCompra.ocd_c_digvcal 
                                        + ordenDeCompra.ocd_c_dpercepcioncal;

            this.lblSubTotal.Text = ordenDeCompra.ocd_c_dsubtotal.Value.ToString();
            this.lblTotal.Text = ordenDeCompra.ocd_c_dtotal.Value.ToString();
            this.lblIGVCal.Text = ordenDeCompra.ocd_c_digvcal.Value.ToString();
            this.lblPercepcionCal.Text = ordenDeCompra.ocd_c_dpercepcioncal.Value.ToString();
        }

        /// <summary>
        /// Selecciona la empresa y regresa a la vista Nuevo/Editar
        /// </summary>
        private void SeleccionEmpresa()
        {            
            String RUC = this.gvProveedores.DataKeys[gvProveedores.SelectedIndex].Value.ToString();
            if (EscenarioOC == TipoOperacion.Modificacion)
            {
                this.OCSeleccionado.ocd_c_vdocprov_id = RUC;
            }
            else if (EscenarioOC == TipoOperacion.Creacion)
            {
                this.OCNuevo.ocd_c_vdocprov_id = RUC;
            }

            if (gvProveedores.Rows[gvProveedores.SelectedIndex].Cells[1].Text != null)
            {
                txtRSProv.Text = gvProveedores.Rows[gvProveedores.SelectedIndex].Cells[1].Text;
            }

            mvOC.ActiveViewIndex = 1;
            upGeneral.Update();
        }

        /// <summary>
        /// Ingresa la Orden de Compra en la bd y termina el proceso
        /// </summary>
        private void IngresarOC()
        {
            if (!VerificarDatosOC(this.OCNuevo))
            {
                return;
            }

            var oc = this.OCNuevo;
            oc.odc_c_zfecha = this.calFechaEntrega.SelectedDate;
            oc.odc_c_ymoneda = byte.Parse(this.cboMoneda.SelectedValue);
            oc.ocd_c_vdescmoneda = this.cboMoneda.SelectedItem.Text.Trim();
            oc.ocd_c_iestado = int.Parse(this.cboEstado.SelectedValue);

            try
            {
                if (_ordenCompra.InsertarOrdenCompra(this.OCNuevo))
                {
                    Mensaje("Orden de Compra registrada con éxito", "../Imagenes/correcto.png");
                    this.Limpiar();
                    this.ListarOrdenCompra();
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
            if (!VerificarDatosOC(this.OCSeleccionado))
            {
                return;
            }

            var oc = this.OCSeleccionado;
            oc.odc_c_zfecha = this.calFechaEntrega.SelectedDate;
            oc.odc_c_ymoneda = byte.Parse(this.cboMoneda.SelectedValue);
            oc.ocd_c_vdescmoneda = this.cboMoneda.SelectedItem.Text.Trim();
            oc.ocd_c_iestado = int.Parse(this.cboEstado.SelectedValue);
            oc.ocd_c_vdescestado = this.cboEstado.SelectedItem.Text.Trim();

            try
            {
                if (_ordenCompra.ModificarOrdenCompra(this.OCSeleccionado))
                {
                    Mensaje("Orden de Compra modificada con éxito", "../Imagenes/correcto.png");
                    this.Limpiar();
                    this.ListarOrdenCompra();
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
            this.OCNuevo = null;
            this.OCSeleccionado = null;
            this.EscenarioOC = TipoOperacion.Ninguna;
            this.ItemsSeleccionadosPreliminar = null;
            this.txtRSProv.Text = string.Empty;
            this.cboMoneda.SelectedIndex = -1;
            this.cboEstado.SelectedIndex = -1;
            this.calFechaEntrega.SelectedDate = DateTime.Today;
            this.gvItemsSeleccionados.DataSource = null;
            this.gvItemsSeleccionados.DataBind();
        }


        private bool VerificarDatosOC(SIC_T_ORDEN_DE_COMPRA ordenDeCompra)
        {
            if (ordenDeCompra == null)
            {
                Mensaje("Estado de la página no válido.", "../Imagenes/warning.png");
                return false;
            }
            else if (ordenDeCompra.ocd_c_vdocprov_id == null || ordenDeCompra.ocd_c_vdocprov_id == string.Empty)
            {
                Mensaje("Debe seleccionar un proveedor.", "../Imagenes/warning.png");
                return false;
            }
            else if (DateTime.Compare(calFechaEntrega.SelectedDate, DateTime.Today) < 0)
            {
                Mensaje("Debe ingresar una fecha válida.", "../Imagenes/warning.png");
                return false;
            }
            else if (cboEstado.SelectedIndex == -1)
            {
                Mensaje("Debe seleccionar un estado.", "../Imagenes/warning.png");
                return false;
            }
            else if (cboMoneda.SelectedIndex == -1)
            {
                Mensaje("Debe seleccionar un tipo de Moneda.", "../Imagenes/warning.png");
                return false;
            }
            else if (ordenDeCompra.SIC_T_ORDEN_DE_COMPRA_DET == null
                || ordenDeCompra.SIC_T_ORDEN_DE_COMPRA_DET.Count == 0)
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
                if (this._ordenCompra.DeshabilitarOrdenCompra(idOC))
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

        }





   

      
    }
}