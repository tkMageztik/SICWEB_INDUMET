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



namespace SIC.UserLayer.Interfaces.Mantenimiento
{
    public partial class frmRegItem : System.Web.UI.Page
    {
        #region DECLARACION DE VARIABLES
        string ShowMessage;
        private ItemBL _item = null;
        private ParametroBL _parametro = null;

        public TipoOperacion EscenarioItem
        {
            get { return (TipoOperacion)ViewState["vsEscenarioItem"]; }
            set { ViewState["vsEscenarioItem"] = value; }
        }

        public SIC_T_ITEM ItemSeleccionado
        {
            get { return (SIC_T_ITEM)ViewState["vsItemSeleccionado"]; }
            set { ViewState["vsItemSeleccionado"] = value; }
        }
        private int ItemEliminar
        {
            get { return (int)(ViewState["vsItemEliminar"] == null ? -1 : ViewState["vsItemEliminar"]); }
            set { ViewState["vsItemEliminar"] = value; }
        }

        #endregion

        #region EVENTOS
        public frmRegItem()
        {
            _item = new ItemBL();
            _parametro = new ParametroBL();
            EscenarioItem = TipoOperacion.Ninguna;
        }

        protected void Page_Load(object sender, EventArgs e)
        {            
            if (!IsPostBack)
            {
                this.ListarItems();
                this.ListarFiltroFamilia();
                this.ListarUnidadMedida();
                this.ListarFamilia();
                //this.ListarSubFamilia();
            }
            if (EscenarioItem == TipoOperacion.Eliminacion)
            {
                SetearEliminar();
            }
        }

        protected void gvListaItem_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                int itemId = (int)this.gvListaItem.DataKeys[e.NewEditIndex].Value;
                e.NewEditIndex = -1;
                this.gvListaItem.EditIndex = -1;
                this.EditarItem(itemId);
            }
            catch (InvalidCastException icEx)
            {
                Mensaje("Error de proceso.", "../Imagenes/warning.png");
                Console.Write(icEx.Message);
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (this.EscenarioItem == TipoOperacion.Creacion)
            {
                this.GuardarNuevoItem();
            }
            else if (this.EscenarioItem == TipoOperacion.Modificacion)
            {
                this.ActualizarItem();
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.CancelarNuevoEdicionItem();
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            this.NuevoItem();
        }
        
        protected void gvListaItem_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            this.EscenarioItem = TipoOperacion.Eliminacion;
            this.ItemEliminar = (int)this.gvListaItem.DataKeys[e.RowIndex].Value;
            this.SetearEliminar();
            this.ucMensaje2.Show("¿Desea eliminar el Item seleccionado?", null,
                                MensajeIcono.Alerta, MensajeBotones.AceptarCancelar);
        }

        private void SetearEliminar()
        {
            ResultadoMensajeHandler handler = null;
            handler = delegate(object s, ResMsjArgs e2)
            {
                if (e2.resultado == MensajeResultado.Aceptar)
                {
                    this.DeshabilitarItem(ItemEliminar);
                    this.ucMensaje2.ResultadoMensaje -= handler;
                }

                this.EscenarioItem = TipoOperacion.Ninguna;
            };

            this.ucMensaje2.ResultadoMensaje += handler;
            
        }

        protected void gvListaItem_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvListaItem.PageIndex = e.NewPageIndex;
            this.ListarItems();            
        }

        #endregion

        #region Métodos
        /// <summary>
        /// Muesta los items en el gridview de la página.
        /// </summary>
        private void ListarItems()
        {
            int id;
            int? idSubFamilia = null;
            int? idFamilia = null;
            if (int.TryParse(cboFiltroSubFamilia.SelectedItem.Value, out id) && id >= 0)
            {
                idSubFamilia = id;
            }
            if (int.TryParse(cboFiltroFamilia.SelectedItem.Value, out id) && id >= 0)
            {
                idFamilia = id;
            }
            
            gvListaItem.DataSource = _item.ListarItems(txtFiltroCodigo.Text.Trim(), txtFiltroDescr.Text.Trim(), idFamilia, idSubFamilia);
            gvListaItem.DataBind();
            upGeneral.Update();
        }

        /// <summary>
        /// Llena el dropdownlist con el parametro unidad de medida correspondiente
        /// </summary>
        private void ListarUnidadMedida()
        {
            cboUnidad.DataSource = _parametro.ListarParametros((int) TipoParametro.UNIDAD_DE_MEDIDA);
            cboUnidad.DataTextField = "par_det_c_vdesc";
            cboUnidad.DataValueField = "par_det_c_iid";
            cboUnidad.DataBind();
        }


        /// <summary>
        /// Lista las familias de items
        /// </summary>
        private void ListarFamilia()
        {
            cboFamilia.Items.Clear();
            cboFamilia.Items.Add(new ListItem("-- Seleccionar --"));
            cboFamilia.DataSource = _item.ListarFamiliaItem();
            cboFamilia.DataTextField = "ifm_c_des";
            cboFamilia.DataValueField = "ifm_c_iid";
            cboFamilia.DataBind();
        }

        /// <summary>
        /// Lista las familias de items
        /// </summary>
        private void ListarFiltroFamilia()
        {
            cboFiltroFamilia.Items.Clear();
            cboFiltroFamilia.Items.Add(new ListItem("-- Seleccionar --"));
            cboFiltroFamilia.DataSource = _item.ListarFamiliaItem();
            cboFiltroFamilia.DataTextField = "ifm_c_des";
            cboFiltroFamilia.DataValueField = "ifm_c_iid";
            cboFiltroFamilia.DataBind();
        }

        /// <summary>
        /// Lista las familias de items
        /// </summary>
        private void ListarFiltroFamiliaAgr()
        {
            cboFamiliaAgr.Items.Clear();
            cboFamiliaAgr.Items.Add(new ListItem("-- Insertar Nuevo --"));
            cboFamiliaAgr.DataSource = _item.ListarFamiliaItem();
            cboFamiliaAgr.DataTextField = "ifm_c_des";
            cboFamiliaAgr.DataValueField = "ifm_c_iid";
            cboFamiliaAgr.DataBind();
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
                cboSubFamilia.DataTextField = "isf_c_des";
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

        /// <summary>
        /// Obtiene la sub familia, depende de que familia se haya seleccionado
        /// </summary>
        private void ListarSubFamiliaAgr()
        {
            int idFamilia;
            if (cboFamiliaAgr.SelectedIndex > 0 && int.TryParse(cboFamiliaAgr.SelectedValue, out idFamilia) && idFamilia > 0)
            {
                // TODO: Revisar el selected index 0, deberia funcionar
                cboSubFamiliaAgr.Enabled = true;
                cboSubFamiliaAgr.Items.Clear();
                cboSubFamiliaAgr.DataSource = _item.ListarSubFamiliaItem(idFamilia);
                cboSubFamiliaAgr.DataTextField = "isf_c_des";
                cboSubFamiliaAgr.DataValueField = "isf_c_iid";
                cboSubFamiliaAgr.DataBind();
                btnAgregarSubFamilia.Enabled = true;
                txtNombreSubFamilia.Enabled = true;
            }
            else
            {
                cboSubFamiliaAgr.DataSource = null;
                cboSubFamiliaAgr.Enabled = false;
                cboSubFamiliaAgr.Items.Clear();
                cboSubFamiliaAgr.Items.Add(new ListItem("-- Seleccione una Familia --", "-1"));
                cboSubFamiliaAgr.DataBind();
                btnAgregarSubFamilia.Enabled = false;
                txtNombreSubFamilia.Enabled = false;
            }
            this.upGeneral.Update();
        }

        /// <summary>
        /// Obtiene la sub familia, depende de que familia se haya seleccionado
        /// </summary>
        private void ListarFiltroSubFamilia()
        {
            int idFamilia;
            if (cboFiltroFamilia.SelectedIndex > 0 && int.TryParse(cboFiltroFamilia.SelectedValue, out idFamilia) && idFamilia > 0)
            {
                // TODO: Revisar el selected index 0, deberia funcionar
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

        /// <summary>
        /// El formulario se acomodará para la inserción de un nuevo Item.
        /// </summary>
        private void NuevoItem()
        {
            EscenarioItem = TipoOperacion.Creacion;
            lblAccion.Text = "Nuevo";
            mvItem.ActiveViewIndex = 1;
            cboFamilia.ClearSelection();
            ListarSubFamilia();
            upGeneral.Update();
        }

        /// <summary>
        /// Deshabilita el item seleccionado.
        /// </summary>
        /// <param name="itemId">Id del item seleccionado</param>
        private void DeshabilitarItem(int itemId)
        {
            if (_item.DeshabilitarItem(itemId))
            {
                Mensaje("Item Deshabilitado.", "../Imagenes/correcto.png");
            }
            else
            {
                Mensaje("Error al realizar el proceso.", "../Imagenes/warning.png");
            }

            this.ListarItems();
            upGeneral.Update();
        }

        /// <summary>
        /// El formulario se acomodará para la actualización del Item seleccionado.
        /// </summary>
        /// <param name="idItem">Id del item</param>
        private void EditarItem(int idItem)
        {
            this.ItemSeleccionado = _item.ObtenerItemPorId(idItem); // Obtiene el item nuevamente

            // Comprobamos que el item exista (debido a que pudo ser deshabilitado por otra persona)
            if (this.ItemSeleccionado == null)
            {
                Mensaje("Item no encontrado.", "../Imagenes/warning.png");
            }
            else
            {
                this.EscenarioItem = TipoOperacion.Modificacion;
                this.lblAccion.Text = "Modificar";

                //Seteando la data en los controles
                this.txtCodigo.Text = ItemSeleccionado.itm_c_ccodigo;
                this.txtDescripcion.Text = ItemSeleccionado.itm_c_vdescripcion;
                this.txtPrecioCompra.Text = ItemSeleccionado.itm_c_dprecio_compra.ToString("F2", CultureInfo.InvariantCulture);
                this.txtPrecioVenta.Text = ItemSeleccionado.itm_c_dprecio_venta.ToString("F2", CultureInfo.InvariantCulture);                
                this.cboUnidad.SelectedIndex = -1;

                var seleccion = cboUnidad.Items.FindByText(ItemSeleccionado.itm_c_vpardes);
                if (seleccion != null)
                {
                    seleccion.Selected = true;
                }

                this.cboFamilia.SelectedIndex = -1;
                this.cboSubFamilia.SelectedIndex = -1;

                if (ItemSeleccionado.SIC_T_ITEM_SUB_FAMILIA != null)
                {
                    seleccion = cboFamilia.Items.FindByText(ItemSeleccionado.SIC_T_ITEM_SUB_FAMILIA.SIC_T_ITEM_FAMILIA.ifm_c_des);
                    if (seleccion != null)
                    {
                        seleccion.Selected = true;
                    }

                    this.ListarSubFamilia();

                    seleccion = cboSubFamilia.Items.FindByText(ItemSeleccionado.SIC_T_ITEM_SUB_FAMILIA.isf_c_des);
                    if (seleccion != null)
                    {
                        seleccion.Selected = true;
                    }
                }

                mvItem.ActiveViewIndex = 1;
            }
        }

        /// <summary>
        /// Limpia los campos de la vista Nuevo/Actualizar
        /// </summary>
        private void LimpiarCamposNuevoActualizar()
        {
            this.txtCodigo.Text = string.Empty;
            this.txtDescripcion.Text = string.Empty;
            this.txtPrecioCompra.Text = string.Empty;
            this.txtPrecioVenta.Text = string.Empty;
            this.cboUnidad.SelectedIndex = -1;
            this.cboUnidad.DataBind();
            this.cboFamilia.SelectedIndex = 0;
            this.cboSubFamilia.SelectedIndex = 0;
        }

        /// <summary>
        /// Guarda la data del nuevo item en la BD
        /// </summary>
        private void GuardarNuevoItem()
        {
            if (!VerificarDatosItem())
            {
                return;
            }

            // Luego creamos el objeto
            SIC_T_ITEM nuevoItem = new SIC_T_ITEM();
            nuevoItem.itm_c_ccodigo = this.txtCodigo.Text;
            decimal precioCompra, precioVenta;
            int idSubFamilia;
            decimal.TryParse(txtPrecioCompra.Text, NumberStyles.Any, CultureInfo.InvariantCulture, out precioCompra);
            decimal.TryParse(txtPrecioVenta.Text, NumberStyles.Any, CultureInfo.InvariantCulture, out precioVenta);
            int.TryParse(cboSubFamilia.SelectedValue, out idSubFamilia);
            nuevoItem.itm_c_dprecio_compra = precioCompra;
            nuevoItem.itm_c_dprecio_venta = precioVenta;
            nuevoItem.itm_c_vdescripcion = this.txtDescripcion.Text.Trim();
            nuevoItem.itm_c_yumedida = byte.Parse(this.cboUnidad.SelectedValue);
            nuevoItem.itm_c_vpardes = this.cboUnidad.SelectedItem.ToString();
            nuevoItem.itm_c_isf_iid = idSubFamilia;

            // Ahora insertamos.
            try
            {
                if (_item.InsertarItem(nuevoItem))
                {
                    Mensaje("Item registrado con éxito", "../Imagenes/correcto.png");
                }
                else
                {
                    Mensaje("Error al realizar el proceso.", "../Imagenes/warning.png");
                }

                mvItem.ActiveViewIndex = 0;
                this.ListarItems();
                this.LimpiarCamposNuevoActualizar();
                upGeneral.Update();
            }
            catch (ArgumentException aeEx)
            {
                Mensaje(aeEx.Message, "../Imagenes/warning.png");
            }
            catch (Exception ex)
            {
                Mensaje("Error inesperado al realizar el proceso.", "../Imagenes/warning.png");
            }
        }

        /// <summary>
        /// Cancela las operaciones de Nuevo y/o Edición y reinicia la data
        /// </summary>
        private void CancelarNuevoEdicionItem()
        {
            LimpiarCamposNuevoActualizar();
            this.ListarItems();

            mvItem.ActiveViewIndex = 0;            
            upGeneral.Update();
        }

        /// <summary>
        /// Verifica los datos del item ingresado o editado.
        /// </summary>
        /// <returns><c>True</c> si la data es correcta, 
        /// <c>False</c> en caso que no cumpla.</returns>
        private bool VerificarDatosItem()
        {
            decimal precio;

            if (this.txtCodigo.Text.Trim() == string.Empty)
            {
                Mensaje("Debe ingresar un Código de Item.", "../Imagenes/warning.png");
                return false;
            }
            else if (this.txtCodigo.Text.Trim().Length > 100)
            {
                Mensaje("El código acepta 100 caracteres como máxcimo.", "../Imagenes/warning.png");
                return false;
            }
            else if (this.txtDescripcion.Text.Trim() == string.Empty)
            {
                Mensaje("Debe ingresar una descripción del Item.", "../Imagenes/warning.png");
                return false;
            }
            else if (this.txtDescripcion.Text.Trim().Length > 250)
            {
                Mensaje("La descripción acepta 250 caracteres como máxcimo.", "../Imagenes/warning.png");
                return false;
            }
            else if (!decimal.TryParse(this.txtPrecioCompra.Text, NumberStyles.Any, CultureInfo.InvariantCulture, out precio) && precio <= 0)
            {
                Mensaje("Debe ingresar un precio de compra válido mayor a 0.", "../Imagenes/warning.png");
                return false;
            }
            else if (!decimal.TryParse(this.txtPrecioVenta.Text, NumberStyles.Any, CultureInfo.InvariantCulture, out precio) && precio <= 0)
            {
                Mensaje("Debe ingresar un precio de venta válido mayor a 0.", "../Imagenes/warning.png");
                return false;
            }
            else if (cboFamilia.SelectedIndex == 0 || cboSubFamilia.SelectedIndex == 0)
            {
                Mensaje("Debe seleccionar la familia y subfamilia.", "../Imagenes/warning.png");
                return false;
            }
            else
            {
                return true;
            }
        }

        /// <summary>
        /// Actualiza el item seleccionado
        /// </summary>
        private void ActualizarItem()
        {
            if (!VerificarDatosItem())
            {
                return;   
            }

            ItemSeleccionado.itm_c_ccodigo = txtCodigo.Text.Trim();
            ItemSeleccionado.itm_c_vdescripcion = txtDescripcion.Text.Trim();
            decimal precioCompra, precioVenta;
            int idSubFamilia;
            decimal.TryParse(txtPrecioCompra.Text, NumberStyles.Any, CultureInfo.InvariantCulture, out precioCompra);
            decimal.TryParse(txtPrecioVenta.Text, NumberStyles.Any, CultureInfo.InvariantCulture, out precioVenta);
            int.TryParse(cboSubFamilia.SelectedValue, out idSubFamilia);
            ItemSeleccionado.itm_c_dprecio_compra = precioCompra;
            ItemSeleccionado.itm_c_dprecio_venta = precioVenta;            
            ItemSeleccionado.itm_c_yumedida = byte.Parse(this.cboUnidad.SelectedValue);
            ItemSeleccionado.itm_c_vpardes = this.cboUnidad.SelectedItem.Text.Trim();
            ItemSeleccionado.itm_c_isf_iid = idSubFamilia;

            if (_item.ModificarItem(ItemSeleccionado))
            {
                Mensaje("Item modificado con éxito", "../Imagenes/correcto.png");
            }
            else
            {
                Mensaje("Error al realizar el proceso.", "../Imagenes/warning.png");
            }

            mvItem.ActiveViewIndex = 0;
            this.ListarItems();
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
            this.ListarItems();
        }

        protected void cboFamilia_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.ListarSubFamilia();
        }

        protected void View2_Activate(object sender, EventArgs e)
        {
            
        }

        protected void cboFiltroFamilia_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.ListarFiltroSubFamilia();
            upGeneral.Update();
        }

        protected void btnMostrarAgregarFam_Click(object sender, EventArgs e)
        {
            MostarVistaAgregarFamilia();
        }

        private void MostarVistaAgregarFamilia()
        {
            txtNombreFamilia.Text = String.Empty;
            txtNombreFamilia.Enabled = true;
            btnAgregarFamilia.Enabled = true;
            this.ListarFiltroFamiliaAgr();
            this.ListarSubFamiliaAgr();
            mvItem.ActiveViewIndex = 2;
            txtNombreFamilia.Text = string.Empty;
            txtNombreSubFamilia.Text = string.Empty;
            upGeneral.Update();
        }

        protected void btnAgregarFamilia_Click(object sender, EventArgs e)
        {
            InsertarFamilia();
        }

        private void InsertarFamilia()
        {
            if (txtNombreFamilia.Text.Trim() == string.Empty)
            {
                Mensaje("Ingrese un nombre de Familia.", "../Imagenes/warning.png");
                upGeneral.Update();
            }
            else
            {
                SIC_T_ITEM_FAMILIA fam = new SIC_T_ITEM_FAMILIA();
                fam.ifm_c_des = txtNombreFamilia.Text.Trim();
                try
                {
                    _item.AgregarFamilia(fam);
                    ListarFiltroFamiliaAgr();
                    txtNombreFamilia.Text = string.Empty;
                    Mensaje("Familia ingresada.", "../Imagenes/warning.png");
                    upGeneral.Update();
                }
                catch (Exception ex)
                {
#if DEBUG
                    Mensaje("Error al realizar el proceso.\n" + ex.Message + "\n"
                        + ex.InnerException != null ? ex.InnerException.Message : string.Empty, "../Imagenes/warning.png");
#else
                    Mensaje("Error al realizar el proceso.", "../Imagenes/warning.png");
#endif
                    upGeneral.Update();
                }
            }
        }

        protected void cboFamiliaAgr_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboFamiliaAgr.SelectedIndex == 0)
            {
                txtNombreFamilia.Enabled = true;
                txtNombreFamilia.Text = String.Empty;
                btnAgregarFamilia.Enabled = true;
            }
            else
            {
                txtNombreFamilia.Enabled = false;
                txtNombreFamilia.Text = String.Empty;
                btnAgregarFamilia.Enabled = false;
            }

            ListarSubFamiliaAgr();
            upGeneral.Update();
        }

        protected void btnAgregarSubFamilia_Click(object sender, EventArgs e)
        {
            InsertarSubFamilia();
        }

        private void InsertarSubFamilia()
        {
            int idFamilia = -1;
            if (!int.TryParse(cboFamiliaAgr.SelectedValue,out idFamilia) || idFamilia == -1 )
            {
                Mensaje("Seleccione una familia.", "../Imagenes/warning.png");
                upGeneral.Update();
            }
            else if (txtNombreSubFamilia.Text.Trim() == string.Empty)
            {
                Mensaje("Ingrese un nombre de SubFamilia.", "../Imagenes/warning.png");
                upGeneral.Update();
            }
            else
            {
                SIC_T_ITEM_SUB_FAMILIA sub = new SIC_T_ITEM_SUB_FAMILIA();
                sub.isf_c_des = txtNombreSubFamilia.Text.Trim();
                sub.isf_c_ifm_iid = idFamilia;
                try
                {
                    _item.AgregarSubFamilia(sub);
                    ListarSubFamiliaAgr();
                    txtNombreSubFamilia.Text = string.Empty;
                    Mensaje("SubFamilia ingresada.", "../Imagenes/warning.png");
                    upGeneral.Update();
                }
                catch (Exception ex)
                {
#if DEBUG
                    Mensaje("Error al realizar el proceso.\n" + ex.Message + "\n"
                        + ex.InnerException != null ? ex.InnerException.Message : string.Empty, "../Imagenes/warning.png");
#else
                    Mensaje("Error al realizar el proceso.", "../Imagenes/warning.png");
#endif
                }
            }
        }

        protected void lnkRegresar_Click(object sender, EventArgs e)
        {
            ListarFiltroFamilia();
            ListarFiltroSubFamilia();
            ListarFamilia();
            ListarSubFamilia();
            
            mvItem.ActiveViewIndex = 1;
            upGeneral.Update();
        }









    }
}