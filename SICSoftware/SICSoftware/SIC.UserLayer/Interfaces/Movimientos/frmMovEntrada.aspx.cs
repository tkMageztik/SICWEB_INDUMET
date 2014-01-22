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

namespace SIC.UserLayer.Interfaces.Movimientos
{
    public partial class frmMovEntrada : System.Web.UI.Page
    {
        #region DECLARACION DE VARIABLES
        private AlmacenBL _almacen = null;
        private MovimientoEntradaBL _movEntrada = null;
        private OrdenCompraBL _ordenCompra = null;

        private TipoOperacion EscenarioMovEn
        {
            get { return (TipoOperacion)ViewState["vsEscenarioMovEn"]; }
            set { ViewState["vsEscenarioMovEn"] = value; }
        }

        private SIC_T_MOVIMIENTO_ENTRADA MovEntSeleccionado
        {
            get { return ViewState["vsMovEntSeleccionado"] as SIC_T_MOVIMIENTO_ENTRADA; }
            set { ViewState["vsMovEntSeleccionado"] = value; }
        }

        private SIC_T_MOVIMIENTO_ENTRADA MovEntNuevo
        {
            get { return ViewState["vsMovEntNuevo"] as SIC_T_MOVIMIENTO_ENTRADA; }
            set { ViewState["vsMovEntNuevo"] = value; }
        }

        #endregion

        #region Eventos
        public frmMovEntrada()
        {
            _almacen = new AlmacenBL();
            _movEntrada = new MovimientoEntradaBL();
            _ordenCompra = new OrdenCompraBL();
            EscenarioMovEn = TipoOperacion.Ninguna;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.ListarMovimientoEntrada();
                this.ListarOrdenCompra();
                this.ListarEstados();
            }
        }

        protected void gvListaMovEn_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.MostrarModificarMovimientoEntrada((int)this.gvListaMovEn.DataKeys[gvListaMovEn.SelectedIndex].Value);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            this.MostrarNuevoMoviminetoEntrada();
        }


        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            MostrarListadoMovimientoEntrada();
        }

        protected void btnBuscarOC_Click(object sender, EventArgs e)
        {
            this.MostrarListaOrdenCompra();
        }

        protected void btnRegresarDesdeOC_Click(object sender, EventArgs e)
        {
            this.RegresarDesdeOrdenCompra();
        }

        protected void btnRegresarDetOc_Click(object sender, EventArgs e)
        {
            this.RegresarDesdeOCDetalle();
        }


        protected void btnRegresarDesdeAlmacen_Click(object sender, EventArgs e)
        {
            this.RegresarDesdeAlmacenes();
        }

        protected void gvListaAlmacen_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.SeleccionarAlmacen();
        }



        protected void gvListaOC_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.SeleccionarOrdenCompra();
        }

        protected void btnBuscarAlmacen_Click(object sender, EventArgs e)
        {
            this.MostrarListaAlmacenes();
        }

        protected void btnRegresarDesdeItems_Click(object sender, EventArgs e)
        {

        }


        protected void gvItemsSeleccionados_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvItemsSeleccionados.EditIndex = -1;
            if (this.EscenarioMovEn == TipoOperacion.Modificacion)
            {
                gvItemsSeleccionados.DataSource = MovEntSeleccionado.SIC_T_MOVIMIENTO_ENTRADA_DETALLE;
                gvItemsSeleccionados.DataBind();
            }
            else if (this.EscenarioMovEn == TipoOperacion.Creacion)
            {
                gvItemsSeleccionados.DataSource = MovEntNuevo.SIC_T_MOVIMIENTO_ENTRADA_DETALLE;
                gvItemsSeleccionados.DataBind();
            }
        }

        protected void gvItemsSeleccionados_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvItemsSeleccionados.EditIndex = e.NewEditIndex;
            if (this.EscenarioMovEn == TipoOperacion.Modificacion)
            {
                gvItemsSeleccionados.DataSource = MovEntSeleccionado.SIC_T_MOVIMIENTO_ENTRADA_DETALLE;
                gvItemsSeleccionados.DataBind();
            }
            else if (this.EscenarioMovEn == TipoOperacion.Creacion)
            {
                gvItemsSeleccionados.DataSource = MovEntNuevo.SIC_T_MOVIMIENTO_ENTRADA_DETALLE;
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

                if (this.EscenarioMovEn == TipoOperacion.Modificacion)
                {
                    SIC_T_MOVIMIENTO_ENTRADA movimientoEntrada = this.MovEntSeleccionado;
                    foreach (var item in movimientoEntrada.SIC_T_MOVIMIENTO_ENTRADA_DETALLE)
                    {
                        if (item.mve_det_c_iid == itemId)
                        {
                            item.mve_c_ecant_recibida = cantidadNueva;
                            break;
                        }
                    }
                    gvItemsSeleccionados.EditIndex = -1;
                    gvItemsSeleccionados.DataSource = MovEntSeleccionado.SIC_T_MOVIMIENTO_ENTRADA_DETALLE;
                    gvItemsSeleccionados.DataBind();
                }
                else if (this.EscenarioMovEn == TipoOperacion.Creacion)
                {
                    SIC_T_MOVIMIENTO_ENTRADA movimientoEntrada = this.MovEntNuevo;
                    foreach (var item in movimientoEntrada.SIC_T_MOVIMIENTO_ENTRADA_DETALLE)
                    {
                        if (item.mve_det_c_iid == itemId)
                        {
                            item.mve_c_ecant_recibida = cantidadNueva;
                            break;
                        }
                    }
                    gvItemsSeleccionados.EditIndex = -1;
                    gvItemsSeleccionados.DataSource = MovEntNuevo.SIC_T_MOVIMIENTO_ENTRADA_DETALLE;
                    gvItemsSeleccionados.DataBind();
                }
            }
            else
            {
                Mensaje("Debe ingresar un número entero válido mayor a 0.", "../Imagenes/warning.png");
                return;
            }
        }

        #endregion

        #region Metodos de Listado
        private void ListarEstados()
        {
            this.cboEstado.DataSource = _movEntrada.ObtenerMovimientoEstados();
            cboEstado.DataTextField = "mov_estado_vdescrpcion";
            cboEstado.DataValueField = "mov_estado_iid";
            cboEstado.DataBind();
        }

        private void ListarMovimientoEntrada()
        {
            this.gvListaMovEn.DataSource = _movEntrada.ObtenerMovimientosEntrada();
            this.gvListaMovEn.DataBind();
        }

        private void ListarOrdenCompra()
        {
            gvListaOC.DataSource = _ordenCompra.ListarOrdenDeCompraEstado((int)EstadosOrdenCompra.CERRADA);
            gvListaOC.DataBind();
        }

        private void ListarDetalleOrdenCompra()
        {
            if (EscenarioMovEn == TipoOperacion.Creacion && MovEntSeleccionado.SIC_T_ORDEN_DE_COMPRA != null)
            {
                gvOCDetalle.DataSource = MovEntSeleccionado.SIC_T_ORDEN_DE_COMPRA.SIC_T_ORDEN_DE_COMPRA_DET;
                gvOCDetalle.DataBind();
            }
        }

        private void ListarAlmacenes()
        {
            this.gvListaAlmacen.DataSource = _almacen.ObtenerAlmacenes();
            this.gvListaAlmacen.DataBind();
        }

        private void ListarDetalleMovimiento()
        {
            if (EscenarioMovEn == TipoOperacion.Creacion && this.MovEntNuevo != null)
            {
                this.gvItemsSeleccionados.DataSource = this.MovEntNuevo.SIC_T_MOVIMIENTO_ENTRADA_DETALLE;
                this.gvItemsSeleccionados.DataBind();
            }
            else if (EscenarioMovEn == TipoOperacion.Modificacion && this.MovEntSeleccionado != null)
            {
                this.gvItemsSeleccionados.DataSource = this.MovEntSeleccionado.SIC_T_MOVIMIENTO_ENTRADA_DETALLE;
                this.gvItemsSeleccionados.DataBind();
            }
        }

        #endregion

        #region Metodos de movimiento en la pagina
        private void MostrarNuevoMoviminetoEntrada()
        {
            this.EscenarioMovEn = TipoOperacion.Creacion;
            this.MovEntNuevo = new SIC_T_MOVIMIENTO_ENTRADA();
            this.mvMovimientoEntrada.ActiveViewIndex = 1;
            this.Limpiar();
            this.upGeneral.Update();
        }

        private void MostrarModificarMovimientoEntrada(int idMovimiento)
        {
            this.EscenarioMovEn = TipoOperacion.Modificacion;
            this.MovEntSeleccionado = _movEntrada.ObtenerMovimientoEntradaPorId(idMovimiento);
            if (MovEntSeleccionado != null)
            {
                this.mvMovimientoEntrada.ActiveViewIndex = 1;
                this.ListarDetalleMovimiento();
                txtAlmacen.Text = MovEntSeleccionado.SIC_T_ALMACEN != null ? MovEntSeleccionado.SIC_T_ALMACEN.alm_c_vdes : string.Empty;
                txtSerieNumeroOC.Text = MovEntSeleccionado.SIC_T_ORDEN_DE_COMPRA != null ? MovEntSeleccionado.SIC_T_ORDEN_DE_COMPRA.odc_c_vcodigo.ToString() : string.Empty;
                txtNumeroFact.Text = MovEntSeleccionado.mve_c_vfacturanumero;
                txtNumeroGuia.Text = MovEntSeleccionado.mve_c_vguianumero;
                txtSerieFact.Text = MovEntSeleccionado.mve_c_vfacturaserie;
                txtSerieGuia.Text = MovEntSeleccionado.mve_c_vguiaserie;

                cboEstado.SelectedIndex = -1;
                var seleccion = cboEstado.Items.FindByText(MovEntSeleccionado.mve_c_vdesestado);
                if (seleccion != null)
                {
                    seleccion.Selected = true;
                }


                if (MovEntSeleccionado.mve_c_dguiafecha.HasValue)
                {
                    txtFechaGuia_CalendarExtender.SelectedDate = MovEntSeleccionado.mve_c_dguiafecha.Value;
                }
                this.upGeneral.Update();
            }
            else
            {
                Mensaje("Error.", "../Imagenes/warning.png");
            }
        }

        private void MostrarListadoMovimientoEntrada()
        {
            this.EscenarioMovEn = TipoOperacion.Ninguna;
            this.mvMovimientoEntrada.ActiveViewIndex = 0;
            this.ListarMovimientoEntrada();
            this.upGeneral.Update();
        }

        private void MostrarListaOrdenCompra()
        {
            this.mvMovimientoEntrada.ActiveViewIndex = 2;
            this.ListarOrdenCompra();
            this.upGeneral.Update();
        }

        private void RegresarDesdeNuevoModificar()
        {
            this.mvMovimientoEntrada.ActiveViewIndex = 0;
            Limpiar();
            this.ListarMovimientoEntrada();
            this.upGeneral.Update();
        }

        private void Limpiar()
        {
            this.txtAlmacen.Text = string.Empty;
            this.txtNumeroFact.Text = string.Empty;
            this.txtNumeroGuia.Text = string.Empty;
            this.txtSerieFact.Text = string.Empty;
            this.txtSerieGuia.Text = string.Empty;
            this.txtSerieNumeroOC.Text = string.Empty;
            this.MovEntNuevo = null;
            this.txtObs.Text = string.Empty;
            this.MovEntSeleccionado = null;
        }

        private void MostrarListaDetalleOC()
        {
            this.mvMovimientoEntrada.ActiveViewIndex = 4;
            this.ListarDetalleOrdenCompra();
            this.upGeneral.Update();
        }

        private void RegresarDesdeOrdenCompra()
        {
            this.mvMovimientoEntrada.ActiveViewIndex = 1;
            this.upGeneral.Update();
        }

        private void RegresarDesdeOCDetalle()
        {
            this.mvMovimientoEntrada.ActiveViewIndex = 1;
            this.upGeneral.Update();
        }

        private void MostrarListaAlmacenes()
        {
            this.mvMovimientoEntrada.ActiveViewIndex = 3;
            this.ListarAlmacenes();
            this.upGeneral.Update();
        }

        private void RegresarDesdeAlmacenes()
        {
            this.mvMovimientoEntrada.ActiveViewIndex = 1;
            this.upGeneral.Update();
        }


        #endregion



        #region Metodos de Proceso
        private bool VerificarDatosIngreso()
        {
            DateTime time;
            //if (!DateTime.TryParse(txtFechaFactura.Text, out time))
            //{
            //    Mensaje("Ingrese una fecha de Factura correcta.", "../Imagenes/warning.png");
            //    return false;
            //}
            if (!DateTime.TryParseExact(txtFechaGuia.Text, "dd/MM/yyyy", new CultureInfo("en-US"), DateTimeStyles.None, out time))
            {
                Mensaje("Ingrese una fecha de Guía correcta.", "../Imagenes/warning.png");
                return false;
            }
            if (txtNumeroFact.Text.Trim().Length == 0 || txtSerieFact.Text.Trim().Length == 0)
            {
                Mensaje("Ingrese la serie y número de la Factura.", "../Imagenes/warning.png");
                return false;
            }
            else if (txtNumeroGuia.Text.Trim().Length == 0 || txtSerieGuia.Text.Trim().Length == 0)
            {
                Mensaje("Ingrese la serie y número de la Guía.", "../Imagenes/warning.png");
                return false;
            }
            else if (this.MovEntNuevo.SIC_T_ORDEN_DE_COMPRA == null)
            {
                Mensaje("Seleccione una orden de compra.", "../Imagenes/warning.png");
                return false;
            }
            else if (this.MovEntNuevo.SIC_T_ALMACEN == null)
            {
                Mensaje("Seleccione un almácén.", "../Imagenes/warning.png");
                return false;
            }
            else
            {
                return true;
            }
        }

        private bool VerificarDatosModificacion()
        {
            DateTime time;
            string[] formats = { "dd/MM/yyyy", };
            //if (!DateTime.TryParse(txtFechaFactura.Text, out time))
            //{
            //    Mensaje("Ingrese una fecha de Factura correcta.", "../Imagenes/warning.png");
            //    return false;
            //}
            if (!DateTime.TryParseExact(txtFechaGuia.Text, "dd/MM/yyyy", new CultureInfo("en-US"), DateTimeStyles.None, out time))
            {
                Mensaje("Ingrese una fecha de Guía correcta.", "../Imagenes/warning.png");
                return false;
            }
            if (txtNumeroFact.Text.Trim().Length == 0 || txtSerieFact.Text.Trim().Length == 0)
            {
                Mensaje("Ingrese la serie y número de la Factura.", "../Imagenes/warning.png");
                return false;
            }
            else if (txtNumeroGuia.Text.Trim().Length == 0 || txtSerieGuia.Text.Trim().Length == 0)
            {
                Mensaje("Ingrese la serie y número de la Guía.", "../Imagenes/warning.png");
                return false;
            }
            else if (this.MovEntSeleccionado.SIC_T_ORDEN_DE_COMPRA == null)
            {
                Mensaje("Seleccione una orden de compra.", "../Imagenes/warning.png");
                return false;
            }
            else if (this.MovEntSeleccionado.SIC_T_ALMACEN == null)
            {
                Mensaje("Seleccione un almácén.", "../Imagenes/warning.png");
                return false;
            }
            else
            {
                return true;
            }
        }

        private void IngresarMovimientoEntrada()
        {
            if (!VerificarDatosIngreso())
            {
                return;
            }

            SIC_T_MOVIMIENTO_ENTRADA movEntrada = this.MovEntNuevo;
            movEntrada.mve_c_dguiafecha = DateTime.ParseExact(txtFechaGuia.Text, "dd/MM/yyyy", new CultureInfo("en-US"), DateTimeStyles.None );
            movEntrada.mve_c_vguianumero = txtNumeroGuia.Text;
            movEntrada.mve_c_vguiaserie = txtSerieGuia.Text;
            movEntrada.mve_c_vfacturanumero = txtNumeroFact.Text;
            movEntrada.mve_c_vfacturaserie = txtSerieFact.Text;
            movEntrada.mve_c_iestado = int.Parse(this.cboEstado.SelectedValue);
            movEntrada.mve_c_vdesestado = cboEstado.SelectedItem.Text.Trim();
            movEntrada.mve_c_bactivo = true;
            movEntrada.mve_c_dfecha = DateTime.Now;
            movEntrada.mve_c_vobservacion = txtObs.Text;
            movEntrada.SIC_T_ALMACEN = null;

            if (this._movEntrada.InsertarMovimientoEntrada(movEntrada))
            {
                Mensaje("Insertado con éxito.", "../Imagenes/correcto.png");
                RegresarDesdeNuevoModificar();
            }
            else
            {
                Mensaje("Error en el proceso.", "../Imagenes/warning.png");
            }

        }

        private void ModificarMovimientoEntrada()
        {
            if (!VerificarDatosModificacion())
            {
                return;
            }

            SIC_T_MOVIMIENTO_ENTRADA movEntrada = this.MovEntSeleccionado;
            movEntrada.mve_c_dguiafecha = DateTime.ParseExact(txtFechaGuia.Text, "dd/MM/yyyy", new CultureInfo("en-US"), DateTimeStyles.None );
            //movEntrada. = DateTime.Parse(txtFechaGuia.Text);
            movEntrada.mve_c_vguianumero = txtNumeroGuia.Text;
            movEntrada.mve_c_vguiaserie = txtSerieGuia.Text;
            movEntrada.mve_c_vfacturanumero = txtNumeroFact.Text;
            movEntrada.mve_c_vfacturaserie = txtSerieFact.Text;
            movEntrada.mve_c_bactivo = true;
            movEntrada.mve_c_iestado = int.Parse(this.cboEstado.SelectedValue);
            movEntrada.mve_c_vdesestado = cboEstado.SelectedItem.Text.Trim();
            movEntrada.mve_c_vobservacion = txtObs.Text;
            movEntrada.SIC_T_ALMACEN = null;

            if (this._movEntrada.ModificarMovimientoEntrada(movEntrada))
            {
                Mensaje("Insertado con éxito.", "../Imagenes/correcto.png");
                RegresarDesdeNuevoModificar();
            }
            else
            {
                Mensaje("Error en el proceso.", "../Imagenes/warning.png");
            }
        }



        #endregion

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (EscenarioMovEn == TipoOperacion.Modificacion)
            {
                this.ModificarMovimientoEntrada();
            }
            else if (EscenarioMovEn == TipoOperacion.Creacion)
            {
                this.IngresarMovimientoEntrada();
            }
        }

        private void SeleccionarOrdenCompra()
        {
            if (gvListaOC.SelectedIndex != -1)
            {
                int id = -1;
                if (Int32.TryParse(gvListaOC.DataKeys[gvListaOC.SelectedIndex].Value.ToString(), out id))
                {
                    if (this.EscenarioMovEn == TipoOperacion.Creacion)
                    {
                        MovEntNuevo.SIC_T_ORDEN_DE_COMPRA = _ordenCompra.ObtenerOrdenCompra(id);
                        txtSerieNumeroOC.Text = MovEntNuevo.SIC_T_ORDEN_DE_COMPRA != null ? MovEntNuevo.SIC_T_ORDEN_DE_COMPRA.odc_c_vcodigo.ToString() : string.Empty;
                        txtProveedorOC.Text = MovEntNuevo.SIC_T_ORDEN_DE_COMPRA.SIC_T_CLIENTE.cli_c_vraz_soc;

                        //if (MovEntNuevo.SIC_T_MOVIMIENTO_ENTRADA_DETALLE == null)
                        //{
                        //    MovEntNuevo.SIC_T_MOVIMIENTO_ENTRADA_DETALLE = new System.Data.Objects.DataClasses.EntityCollection<SIC_T_MOVIMIENTO_ENTRADA_DETALLE>();
                        //}
                        //MovEntNuevo.SIC_T_MOVIMIENTO_ENTRADA_DETALLE.Clear();

                        foreach (var detalle in MovEntNuevo.SIC_T_ORDEN_DE_COMPRA.SIC_T_ORDEN_DE_COMPRA_DET)
                        {
                            var movDet = new SIC_T_MOVIMIENTO_ENTRADA_DETALLE();
                            movDet.mve_c_ecant_pedida = detalle.odc_c_ecantidad;
                            movDet.mve_c_ecant_recibida = 0;
                            movDet.mve_c_vdescripcion_item = detalle.SIC_T_ITEM.itm_c_vdescripcion;
                            movDet.SIC_T_ORDEN_DE_COMPRA_DET = detalle;
                            MovEntNuevo.SIC_T_MOVIMIENTO_ENTRADA_DETALLE.Add(movDet);
                        }

                        this.ListarDetalleMovimiento();
                        this.RegresarDesdeOrdenCompra();

                    }
                    else if (this.EscenarioMovEn == TipoOperacion.Modificacion)
                    {
                        MovEntSeleccionado.SIC_T_ORDEN_DE_COMPRA = _ordenCompra.ObtenerOrdenCompra(id);
                        txtSerieNumeroOC.Text = MovEntSeleccionado.SIC_T_ORDEN_DE_COMPRA != null ? MovEntSeleccionado.SIC_T_ORDEN_DE_COMPRA.odc_c_vcodigo.ToString() : string.Empty;
                        //MovEntSeleccionado.SIC_T_MOVIMIENTO_ENTRADA_DETALLE.Clear();
                        // Todo: mark remove?
                        this.ListarDetalleMovimiento();
                        this.RegresarDesdeOrdenCompra();
                    }
                }
            }


        }

        private void SeleccionarAlmacen()
        {
            if (gvListaAlmacen.SelectedIndex != -1)
            {
                int id = -1;
                if (Int32.TryParse(gvListaAlmacen.DataKeys[gvListaAlmacen.SelectedIndex].Value.ToString(), out id))
                {
                    if (this.EscenarioMovEn == TipoOperacion.Creacion)
                    {
                        var almacen = _almacen.ObtenerPorIdNoContext(id);
                        MovEntNuevo.SIC_T_ALMACEN = almacen;
                        MovEntNuevo.mve_c_iidalmacen = almacen.alm_c_iid;
                        txtAlmacen.Text = almacen.alm_c_vdes;
                    }
                    else if (this.EscenarioMovEn == TipoOperacion.Modificacion)
                    {
                        var almacen = _almacen.ObtenerPorIdNoContext(id);
                        MovEntSeleccionado.SIC_T_ALMACEN = almacen;
                        MovEntSeleccionado.mve_c_iidalmacen = almacen.alm_c_iid;
                        txtAlmacen.Text = almacen.alm_c_vdes;
                    }
                }
            }

            this.RegresarDesdeAlmacenes();

        }




        private void Mensaje(string mensaje, string ruta)
        {
            divPopUpMsg.Attributes["Class"] = "PopupMostrar";
            ucMensaje.Visible = true;
            ucMensaje.Mensaje = mensaje;
            ucMensaje.Ruta = ruta;
            ucMensaje.EnableModelDialog(true);
            return;
        }

        protected void gvItemsSeleccionados_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            this.gvItemsSeleccionados.PageIndex = e.NewPageIndex;
            this.ListarDetalleMovimiento();
        }

        protected void gvListaOC_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.gvListaOC.PageIndex = e.NewPageIndex;
            this.ListarOrdenCompra();
        }

        protected void gvListaAlmacen_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.gvListaAlmacen.PageIndex = e.NewPageIndex;
            this.ListarAlmacenes();
        }        
    }
}