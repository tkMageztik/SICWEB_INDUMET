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

        private EstadoMovimiento estadoMovimiento
        {
            get { return (EstadoMovimiento)ViewState["vsEstadoMovimiento"]; }
            set { ViewState["vsEstadoMovimiento"] = value; }
        }

        //private SIC_T_MOVIMIENTO_ENTRADA MovEntNuevo
        //{
        //    get { return ViewState["vsMovEntNuevo"] as SIC_T_MOVIMIENTO_ENTRADA; }
        //    set { ViewState["vsMovEntNuevo"] = value; }
        //}
        private int MovSeleccionado
        {
            get { return Convert.ToInt32(ViewState["vsOCEliminar"]); }
            set { ViewState["vsOCEliminar"] = value; }
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
                this.ListarEstados();
                this.ListarMovimientoEntrada();
                this.ListarOrdenCompra();
            }
            if (EscenarioMovEn == TipoOperacion.Cierre)
            {
                SetearCerrar();
            }
            else if (EscenarioMovEn == TipoOperacion.Eliminacion)
            {
                SetearAnular();
            }
        }




        protected void gvListaMovEn_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.MostrarModificarMovimientoEntrada((int)this.gvListaMovEn.DataKeys[gvListaMovEn.SelectedIndex].Value);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            ListarMovimientoEntrada();
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
        #endregion

        #region Metodos de Listado
        private void ListarEstados()
        {
            this.cboEstado.DataSource = _movEntrada.ObtenerMovimientoEstados();
            cboEstado.DataTextField = "mov_estado_vdescrpcion";
            cboEstado.DataValueField = "mov_estado_iid";
            cboEstado.DataBind();
        }

        private EstadoMovimiento ObtenerEstadoMov()
        {
            if (EscenarioMovEn == TipoOperacion.Creacion)
            {
                foreach (SIC_T_MOVIMIENTO_ENTRADA_DETALLE tmp in MovEntNuevo.SIC_T_MOVIMIENTO_ENTRADA_DETALLE)
                {
                    if (tmp.mve_c_ecant_recibida < tmp.mve_c_ecant_pedida)
                    {
                        estadoMovimiento = EstadoMovimiento.POR_REGULARIZAR;
                        return EstadoMovimiento.POR_REGULARIZAR;
                    }
                }
                estadoMovimiento = EstadoMovimiento.CERRADO;
                return EstadoMovimiento.CERRADO;
            }
            //TipoOperacion.Creacion
            else
            {
                foreach (SIC_T_MOVIMIENTO_ENTRADA_DETALLE tmp in MovEntSeleccionado.SIC_T_MOVIMIENTO_ENTRADA_DETALLE)
                {
                    if (tmp.mve_c_ecant_recibida < tmp.mve_c_ecant_pedida)
                    {
                        estadoMovimiento = EstadoMovimiento.POR_REGULARIZAR;
                        return EstadoMovimiento.POR_REGULARIZAR;
                    }
                }
                estadoMovimiento = EstadoMovimiento.CERRADO;
                return EstadoMovimiento.CERRADO;
            }

        }

        private void ListarMovimientoEntrada()
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
            this.gvListaMovEn.DataSource = _movEntrada.ObtenerMovimientosEntrada(this.txtFiltroRuc.Text, this.txtFiltroRS.Text, fi, ff, Convert.ToInt32(cboEstado.SelectedValue));
            //this.gvListaMovEn.DataSource = _movEntrada.ObtenerMovimientosEntrada();
            this.gvListaMovEn.DataBind();
        }

        private void ListarOrdenCompra()
        {
            gvListaOC.DataSource = _ordenCompra.ListarOrdenDeCompraEstado((int)EstadosOrdenCompra.ABIERTA);
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
            this.Limpiar();
            this.EscenarioMovEn = TipoOperacion.Creacion;
            this.MovEntNuevo = new SIC_T_MOVIMIENTO_ENTRADA();
            this.MovEntNuevo.mve_c_zfecharegistro = DateTime.Now;
            this.mvMovimientoEntrada.ActiveViewIndex = 1;
            this.upGeneral.Update();
        }

        private void MostrarModificarMovimientoEntrada(int idMovimiento)
        {
            this.MovEntSeleccionado = _movEntrada.ObtenerMovimientoEntradaPorId(idMovimiento);
            this.MovEntSeleccionado.CalcularCantidadAtendida(this.MovEntSeleccionado.SIC_T_ORDEN_DE_COMPRA);
            if (MovEntSeleccionado.mve_c_iestado == (int)EstadoMovimiento.CERRADO || MovEntSeleccionado.mve_c_iestado == (int)EstadoMovimiento.ANULADO)
            {
                this.Mensaje("No se puede modificar movimientos en estado CERRADO o ANULADO.", "~/Imagenes/warning.png");
                return;
            }

            this.EscenarioMovEn = TipoOperacion.Modificacion;
            if (MovEntSeleccionado != null)
            {
                this.mvMovimientoEntrada.ActiveViewIndex = 1;
                this.ListarDetalleMovimiento();
                txtAlmacen.Text = MovEntSeleccionado.SIC_T_ALMACEN != null ? MovEntSeleccionado.SIC_T_ALMACEN.alm_c_vdesc : string.Empty;
                txtNumeroOC.Text = MovEntSeleccionado.SIC_T_ORDEN_DE_COMPRA != null ? MovEntSeleccionado.SIC_T_ORDEN_DE_COMPRA.odc_c_vcodigo.ToString() : string.Empty;
                txtSerieOC.Text = MovEntSeleccionado.SIC_T_ORDEN_DE_COMPRA != null ? MovEntSeleccionado.SIC_T_ORDEN_DE_COMPRA.odc_c_cserie.ToString() : string.Empty;


                txtProveedorOC.Text = MovEntSeleccionado.SIC_T_ORDEN_DE_COMPRA != null && MovEntSeleccionado.SIC_T_ORDEN_DE_COMPRA.SIC_T_CLIENTE != null ?
                                    MovEntSeleccionado.SIC_T_ORDEN_DE_COMPRA.SIC_T_CLIENTE.cli_c_vraz_soc : string.Empty;
                txtObs.Text = MovEntSeleccionado.mve_c_vobservacion;
                txtFechaFact.Text = MovEntSeleccionado.mve_c_zfacturafecha.ToString("dd/MM/yyyy");



                if (MovEntSeleccionado.mve_c_zguiafecha.HasValue)
                {
                    txtFechaGuia.Text = MovEntSeleccionado.mve_c_zguiafecha.Value.ToString("dd/MM/yyyy");
                }
                else
                {
                    txtFechaGuia.Text = String.Empty;
                }

                String[] factCod, guiaCod;
                if (MovEntSeleccionado.mve_c_vfacturacodigo != null)
                {
                    factCod = MovEntSeleccionado.mve_c_vfacturacodigo.Split('-');
                    if (factCod.Count() == 2)
                    {
                        txtSerieFact.Text = factCod[0];
                        txtNumeroFact.Text = factCod[1];
                    }
                    else
                    {
                        txtNumeroFact.Text = MovEntSeleccionado.mve_c_vfacturacodigo;
                    }
                }

                if (MovEntSeleccionado.mve_c_vguiacodigo != null)
                {
                    guiaCod = MovEntSeleccionado.mve_c_vguiacodigo.Split('-');
                    if (guiaCod.Count() == 2)
                    {
                        txtSerieGuia.Text = guiaCod[0];
                        txtNumeroGuia.Text = guiaCod[1];
                    }
                    else
                    {
                        txtNumeroGuia.Text = MovEntSeleccionado.mve_c_vguiacodigo;
                    }
                }


                //cboEstado.SelectedIndex = -1;
                //var seleccion = cboEstado.Items.FindByText(MovEntSeleccionado.mve_c_vdesestado);
                //if (seleccion != null)
                //{
                //    seleccion.Selected = true;
                //}

                this.upGeneral.Update();
            }
            else
            {
                Mensaje("Error.", "~/Imagenes/warning.png");
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
            this.txtProveedorOC.Text = string.Empty;
            this.txtNumeroFact.Text = string.Empty;
            this.txtNumeroGuia.Text = string.Empty;
            this.txtSerieFact.Text = string.Empty;
            this.txtSerieGuia.Text = string.Empty;
            this.txtNumeroOC.Text = string.Empty;
            this.txtSerieOC.Text = string.Empty;
            this.txtFechaGuia.Text = string.Empty;
            this.txtFechaFact.Text = string.Empty;
            this.MovEntNuevo = null;
            this.txtObs.Text = string.Empty;
            this.gvItemsSeleccionados.DataSource = null;
            this.gvItemsSeleccionados.DataBind();
            this.MovEntSeleccionado = null;
            this.MovEntNuevo = null;
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
            var equivocado = this.MovEntNuevo.SIC_T_MOVIMIENTO_ENTRADA_DETALLE.FirstOrDefault(x=> x.CantidadAtendida + x.mve_c_ecant_recibida > x.mve_c_ecant_pedida);
            if (!DateTime.TryParseExact(txtFechaFact.Text, "dd/MM/yyyy", new CultureInfo("en-US"), DateTimeStyles.None, out time))
            {
                Mensaje("Ingrese una fecha de factura correcta.", "~/Imagenes/warning.png");
                return false;
            }
            else if (txtNumeroFact.Text.Trim().Length == 0 || txtSerieFact.Text.Trim().Length == 0)
            {
                Mensaje("Ingrese la serie y número de la Factura.", "~/Imagenes/warning.png");
                return false;
            }
            else if (txtFechaFact.Text.Trim() != string.Empty && !DateTime.TryParseExact(txtFechaFact.Text, "dd/MM/yyyy", new CultureInfo("en-US"), DateTimeStyles.None, out time))
            {
                Mensaje("Ingrese una fecha de guia correcta, o borre la fecha.", "~/Imagenes/warning.png");
                return false;
            }
            else if (this.MovEntNuevo.SIC_T_ORDEN_DE_COMPRA == null)
            {
                Mensaje("Seleccione una orden de compra.", "~/Imagenes/warning.png");
                return false;
            }
            else if (this.MovEntNuevo.SIC_T_ALMACEN == null)
            {
                Mensaje("Seleccione un almácén.", "~/Imagenes/warning.png");
                return false;
            }
            else if (this.MovEntNuevo.SIC_T_MOVIMIENTO_ENTRADA_DETALLE != null && !this.MovEntNuevo.SIC_T_MOVIMIENTO_ENTRADA_DETALLE.Any(x => x.mve_c_ecant_recibida > 0))
            {
                Mensaje("Debe ingresar al menos un item con stock.", "~/Imagenes/warning.png");
                return false;
            }
            else if (equivocado != null)
            {
                Mensaje("Se esta ingresando una cantidad en exceso del item " + equivocado.mve_c_vdescripcion_item , "~/Imagenes/warning.png");
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
            var equivocado = this.MovEntSeleccionado.SIC_T_MOVIMIENTO_ENTRADA_DETALLE.FirstOrDefault(x => x.CantidadAtendida + x.mve_c_ecant_recibida > x.mve_c_ecant_pedida);
            if (!DateTime.TryParseExact(txtFechaFact.Text, "dd/MM/yyyy", new CultureInfo("en-US"), DateTimeStyles.None, out time))
            {
                Mensaje("Ingrese una fecha de factura correcta.", "~/Imagenes/warning.png");
                return false;
            }
            else if (txtNumeroFact.Text.Trim().Length == 0 || txtSerieFact.Text.Trim().Length == 0)
            {
                Mensaje("Ingrese la serie y número de la Factura.", "~/Imagenes/warning.png");
                return false;
            }
            else if (txtFechaFact.Text.Trim() != string.Empty && !DateTime.TryParseExact(txtFechaFact.Text, "dd/MM/yyyy", new CultureInfo("en-US"), DateTimeStyles.None, out time))
            {
                Mensaje("Ingrese una fecha de guia correcta, o borre la fecha.", "~/Imagenes/warning.png");
                return false;
            }
            else if (this.MovEntSeleccionado.SIC_T_ORDEN_DE_COMPRA == null)
            {
                Mensaje("Seleccione una orden de compra.", "~/Imagenes/warning.png");
                return false;
            }
            else if (this.MovEntSeleccionado.SIC_T_ALMACEN == null)
            {
                Mensaje("Seleccione un almácén.", "~/Imagenes/warning.png");
                return false;
            }
            else if (this.MovEntSeleccionado.SIC_T_MOVIMIENTO_ENTRADA_DETALLE != null && !this.MovEntSeleccionado.SIC_T_MOVIMIENTO_ENTRADA_DETALLE.Any(x => x.mve_c_ecant_recibida > 0))
            {
                Mensaje("Debe ingresar al menos un item con stock.", "~/Imagenes/warning.png");
                return false;
            }
            else if (equivocado != null)
            {
                Mensaje("Se esta ingresando una cantidad en exceso del item " + equivocado.mve_c_vdescripcion_item, "~/Imagenes/warning.png");
                return false;
            }
            else
            {
                return true;
            }
        }

        private void IngresarMovimientoEntrada()
        {
            SIC_T_MOVIMIENTO_ENTRADA movEntrada = this.MovEntNuevo;
            for (int i = 0; i < gvItemsSeleccionados.Rows.Count; i++)
            {
                TextBox txtCantidad = (TextBox) gvItemsSeleccionados.Rows[i].FindControl("txtCantidad");
                decimal cantidadNueva = 0;
                if (decimal.TryParse(txtCantidad.Text, out cantidadNueva) && cantidadNueva >= 0)
                {
                    int itemId = (int)gvItemsSeleccionados.DataKeys[i].Value;
                    foreach (var item in movEntrada.SIC_T_MOVIMIENTO_ENTRADA_DETALLE)
                    {
                        if (item.mve_c_iocdet_id == itemId)
                        {
                            item.mve_c_ecant_recibida = cantidadNueva;
                            break;
                        }
                    }                                  
                }
                else
                {
                    txtCantidad.Text = "0";
                }
            }

            if (!VerificarDatosIngreso())
            {
                return;
            }

            movEntrada.mve_c_vfacturacodigo = txtSerieFact.Text + "-" + txtNumeroFact.Text;
            movEntrada.mve_c_zfacturafecha = DateTime.ParseExact(txtFechaFact.Text, "dd/MM/yyyy", new CultureInfo("en-US"), DateTimeStyles.None);
            movEntrada.mve_c_vguiacodigo = txtSerieGuia.Text + "-" + txtNumeroGuia.Text;
            if (txtFechaGuia.Text == string.Empty)
            {
                movEntrada.mve_c_zguiafecha = null;
            }
            else
            {
                movEntrada.mve_c_zguiafecha = DateTime.ParseExact(txtFechaGuia.Text, "dd/MM/yyyy", new CultureInfo("en-US"), DateTimeStyles.None);
            }

            movEntrada.mve_c_iestado = Convert.ToInt32(ObtenerEstadoMov());
            movEntrada.mve_c_vdesestado = Enum.GetName(typeof(EstadoMovimiento), estadoMovimiento);
            movEntrada.mve_c_bactivo = true;
            movEntrada.mve_c_zfecharegistro = DateTime.Now;
            movEntrada.mve_c_vobservacion = txtObs.Text;
            movEntrada.SIC_T_ALMACEN = null;
            try
            {
                if (this._movEntrada.InsertarMovimientoEntrada(movEntrada))
                {
                    if (estadoMovimiento == EstadoMovimiento.CERRADO)
                    {
                        _ordenCompra.CambiarEstadoOrdenCompra(movEntrada.odc_c_iid, EstadoOC.CERRADA);
                    }

                    Mensaje("Insertado con éxito. <br/>" + ObtMsjEstadoMovimiento() + " <br/> Además, la orden de compra relacionada, ha sido CERRADA"
                        , "~/Imagenes/correcto.png");
                    RegresarDesdeNuevoModificar();
                }
                else
                {
                    Mensaje("Error en el proceso, se ha guardado la traza de la excepción..", "~/Imagenes/warning.png");
                }
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

        private void ModificarMovimientoEntrada()
        {

            SIC_T_MOVIMIENTO_ENTRADA movEntrada = this.MovEntSeleccionado;
            for (int i = 0; i < gvItemsSeleccionados.Rows.Count; i++)
            {
                TextBox txtCantidad = (TextBox)gvItemsSeleccionados.Rows[i].FindControl("txtCantidad");
                decimal cantidadNueva = 0;
                if (decimal.TryParse(txtCantidad.Text, out cantidadNueva) && cantidadNueva >= 0)
                {
                    int itemId = (int)gvItemsSeleccionados.DataKeys[i].Value;
                    foreach (var item in movEntrada.SIC_T_MOVIMIENTO_ENTRADA_DETALLE)
                    {
                        if (item.mve_c_iocdet_id == itemId)
                        {
                            item.mve_c_ecant_recibida = cantidadNueva;
                            break;
                        }
                    }
                }
                else
                {
                    txtCantidad.Text = "0";
                }
            }

            if (!VerificarDatosModificacion())
            {
                return;
            }

            movEntrada.mve_c_vfacturacodigo = txtSerieFact.Text + "-" + txtNumeroFact.Text;
            movEntrada.mve_c_zfacturafecha = DateTime.ParseExact(txtFechaFact.Text, "dd/MM/yyyy", new CultureInfo("en-US"), DateTimeStyles.None);
            movEntrada.mve_c_vguiacodigo = txtSerieGuia.Text + "-" + txtNumeroGuia.Text;
            if (txtFechaGuia.Text == string.Empty)
            {
                movEntrada.mve_c_zguiafecha = null;
            }
            else
            {
                movEntrada.mve_c_zguiafecha = DateTime.ParseExact(txtFechaGuia.Text, "dd/MM/yyyy", new CultureInfo("en-US"), DateTimeStyles.None);
            }

            movEntrada.mve_c_iestado = Convert.ToInt32(ObtenerEstadoMov());
            movEntrada.mve_c_vdesestado = Enum.GetName(typeof(EstadoMovimiento), estadoMovimiento);
            movEntrada.mve_c_bactivo = true;
            movEntrada.mve_c_zfecharegistro = DateTime.Now;
            movEntrada.mve_c_vobservacion = txtObs.Text;
            movEntrada.SIC_T_ALMACEN = null;

            try
            {
                if (this._movEntrada.ModificarMovimientoEntrada(movEntrada))
                {
                    if (estadoMovimiento == EstadoMovimiento.CERRADO)
                    {
                        _ordenCompra.CambiarEstadoOrdenCompra(movEntrada.odc_c_iid, EstadoOC.CERRADA);
                    }
                    Mensaje("Modificado con éxito. <br/>" + ObtMsjEstadoMovimiento() + " <br/> Además, la orden de compra relacionada, ha sido CERRADA"
                        , "~/Imagenes/correcto.png");
                    RegresarDesdeNuevoModificar();
                }
                else
                {
                    Mensaje("Error en el proceso, se ha guardado la traza de la excepción..", "~/Imagenes/warning.png");
                }
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

        private string ObtMsjEstadoMovimiento()
        {
            return "El movimiento se encuentra " + estadoMovimiento.ToString() + " debido a que" +
                (estadoMovimiento.Equals(EstadoMovimiento.CERRADO) ? " se "
                : " no se ") + " ingresaron todos los items de orden de compra";
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
                        MovEntNuevo.SIC_T_ORDEN_DE_COMPRA = _ordenCompra.ObtenerOrdenCompraNoContext(id);                        
                        txtNumeroOC.Text = MovEntNuevo.SIC_T_ORDEN_DE_COMPRA != null ? MovEntNuevo.SIC_T_ORDEN_DE_COMPRA.odc_c_vcodigo.ToString() : string.Empty;
                        txtSerieOC.Text = MovEntNuevo.SIC_T_ORDEN_DE_COMPRA != null ? MovEntNuevo.SIC_T_ORDEN_DE_COMPRA.odc_c_cserie.ToString() : string.Empty;
                        txtProveedorOC.Text = MovEntNuevo.SIC_T_ORDEN_DE_COMPRA.SIC_T_CLIENTE.cli_c_vraz_soc;
                        foreach (var detalle in MovEntNuevo.SIC_T_ORDEN_DE_COMPRA.SIC_T_ORDEN_DE_COMPRA_DET)
                        {
                            var movDet = new SIC_T_MOVIMIENTO_ENTRADA_DETALLE();
                            movDet.mve_c_ecant_pedida = detalle.odc_c_ecantidad;
                            movDet.mve_c_ecant_recibida = 0;
                            movDet.mve_c_vdescripcion_item = detalle.SIC_T_ITEM.itm_c_vdescripcion;
                            movDet.SIC_T_ORDEN_DE_COMPRA_DET = detalle;
                            movDet.mve_c_iocdet_id = detalle.odc_det_c_iid;
                            MovEntNuevo.SIC_T_MOVIMIENTO_ENTRADA_DETALLE.Add(movDet);
                        }

                        MovEntNuevo.CalcularCantidadAtendida(MovEntNuevo.SIC_T_ORDEN_DE_COMPRA);

                        this.ListarDetalleMovimiento();
                        this.RegresarDesdeOrdenCompra();
                    }
                    else if (this.EscenarioMovEn == TipoOperacion.Modificacion)
                    {
                        MovEntSeleccionado.SIC_T_ORDEN_DE_COMPRA = _ordenCompra.ObtenerOrdenCompraNoContext(id);                        
                        txtNumeroOC.Text = MovEntSeleccionado.SIC_T_ORDEN_DE_COMPRA != null ? MovEntSeleccionado.SIC_T_ORDEN_DE_COMPRA.odc_c_vcodigo.ToString() : string.Empty;
                        txtSerieOC.Text = MovEntSeleccionado.SIC_T_ORDEN_DE_COMPRA != null ? MovEntSeleccionado.SIC_T_ORDEN_DE_COMPRA.odc_c_cserie.ToString() : string.Empty;
                        txtProveedorOC.Text = MovEntSeleccionado.SIC_T_ORDEN_DE_COMPRA.SIC_T_CLIENTE.cli_c_vraz_soc;

                        foreach (var detalle in MovEntSeleccionado.SIC_T_ORDEN_DE_COMPRA.SIC_T_ORDEN_DE_COMPRA_DET)
                        {
                            var movDet = new SIC_T_MOVIMIENTO_ENTRADA_DETALLE();
                            movDet.mve_c_ecant_pedida = detalle.odc_c_ecantidad;
                            movDet.mve_c_ecant_recibida = 0;
                            movDet.mve_c_vdescripcion_item = detalle.SIC_T_ITEM.itm_c_vdescripcion;
                            movDet.SIC_T_ORDEN_DE_COMPRA_DET = detalle;
                            movDet.mve_c_iocdet_id = detalle.odc_det_c_iid;
                            MovEntSeleccionado.SIC_T_MOVIMIENTO_ENTRADA_DETALLE.Add(movDet);
                        }

                        MovEntSeleccionado.CalcularCantidadAtendida(MovEntNuevo.SIC_T_ORDEN_DE_COMPRA);

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
                        txtAlmacen.Text = almacen.alm_c_vdesc;
                    }
                    else if (this.EscenarioMovEn == TipoOperacion.Modificacion)
                    {
                        var almacen = _almacen.ObtenerPorIdNoContext(id);
                        MovEntSeleccionado.SIC_T_ALMACEN = almacen;
                        MovEntSeleccionado.mve_c_iidalmacen = almacen.alm_c_iid;
                        txtAlmacen.Text = almacen.alm_c_vdesc;
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
            upGeneral.Update();
            return;
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

        protected void gvListaMovEn_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            MovSeleccionado = Convert.ToInt32(e.CommandArgument);
            this.MovEntSeleccionado = _movEntrada.ObtenerMovimientoEntradaPorId((int)gvListaMovEn.DataKeys[MovSeleccionado].Values["mve_c_iid"]);
            if (e.CommandName == "Cerrar")
            {
                if (MovEntSeleccionado.mve_c_iestado == (int)EstadoMovimiento.ANULADO)
                {
                    this.Mensaje("No se puede CERRAR movimientos en estado ANULADO.", "~/Imagenes/warning.png");
                    return;
                }
                else if (MovEntSeleccionado.mve_c_iestado == (int)EstadoMovimiento.CERRADO)
                {
                    this.Mensaje("El Movimiento ya se encuentra en estado CERRADO.", "~/Imagenes/warning.png");
                    return;
                }

                this.EscenarioMovEn = TipoOperacion.Cierre;
                this.SetearCerrar();
                this.ucMensaje2.Show("¿Está seguro de cerrar la orden de compra seleccionada? <br/> esto actualizará los stocks en los almacenes respectivos.", null,
                                    MensajeIcono.Alerta, MensajeBotones.AceptarCancelar);
            }
            else if (e.CommandName == "Anular")
            {

                if (MovEntSeleccionado.mve_c_iestado == (int)EstadoMovimiento.CERRADO)
                {
                    this.Mensaje("No se puede CERRAR movimientos en estado ANULADO.", "~/Imagenes/warning.png");
                    return;
                }
                else if (MovEntSeleccionado.mve_c_iestado == (int)EstadoMovimiento.ANULADO)
                {
                    this.Mensaje("El Movimiento ya se encuentra en estado ANULADO.", "~/Imagenes/warning.png");
                    return;
                }
                this.EscenarioMovEn = TipoOperacion.Eliminacion;
                this.SetearCerrar();
                this.ucMensaje2.Show("¿Está seguro de Anular el Movimiento seleccionado?", null,
                                    MensajeIcono.Alerta, MensajeBotones.AceptarCancelar);
            }
        }

        private void SetearCerrar()
        {
            ResultadoMensajeHandler handler = null;
            handler = delegate(object s, ResMsjArgs e2)
            {
                if (e2.resultado == MensajeResultado.Aceptar)
                {
                    this.CerrarMovimientoEntrada();
                    this.ucMensaje2.ResultadoMensaje -= handler;
                }

                this.EscenarioMovEn = TipoOperacion.Ninguna;
            };

            this.ucMensaje2.ResultadoMensaje += handler;

        }


        private void SetearAnular()
        {
            ResultadoMensajeHandler handler = null;
            handler = delegate(object s, ResMsjArgs e2)
            {
                if (e2.resultado == MensajeResultado.Aceptar)
                {
                    this.AnularMovimientoEntrada();
                    this.ucMensaje2.ResultadoMensaje -= handler;
                }

                this.EscenarioMovEn = TipoOperacion.Ninguna;
            };

            this.ucMensaje2.ResultadoMensaje += handler;

        }

        private void CerrarMovimientoEntrada()
        {
            _movEntrada.CambiarEstadoMovimientoEntrada(Convert.ToInt32(gvListaMovEn.DataKeys[MovSeleccionado]
                .Values["mve_c_iid"]), EstadoMovimiento.CERRADO);
            Mensaje("Movimiento Cerrado.", "~/Imagenes/correcto.png");

            this.ListarMovimientoEntrada();
            upGeneral.Update();
        }

        private void AnularMovimientoEntrada()
        {
            _movEntrada.CambiarEstadoMovimientoEntrada(Convert.ToInt32(gvListaMovEn.DataKeys[MovSeleccionado]
                .Values["mve_c_iid"]), EstadoMovimiento.ANULADO);
            Mensaje("Movimiento Anulado.", "~/Imagenes/correcto.png");

            this.ListarMovimientoEntrada();
            upGeneral.Update();
        }



    }
}
