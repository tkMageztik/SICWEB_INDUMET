using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIC.BusinessLayer;
using SIC.Data;
using SIC.EntityLayer;



namespace SIC.UserLayer.Interfaces.Mantenimiento
{
    public partial class frmRegItem : System.Web.UI.Page
    {
        #region DECLARACION DE VARIABLES
        string ShowMessage;
        private ItemBL _item = null;
        private ParametroBL _parametro = null;
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
                this.ListarUnidadMedida();
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
            int itemId = (int)this.gvListaItem.DataKeys[e.RowIndex].Value;
            DeshabilitarItem(itemId);
        }


        #endregion

        #region Métodos
        /// <summary>
        /// Muesta los items en el gridview de la página.
        /// </summary>
        private void ListarItems()
        {
            gvListaItem.DataSource = _item.ListarItems();
            gvListaItem.DataBind();
        }

        /// <summary>
        /// Llena el dropdownlist con el parametro unidad de medida correspondiente
        /// </summary>
        private void ListarUnidadMedida()
        {
            cboUnidad.DataSource = _parametro.ListarParametros((int)TipoParametro.UNIDAD_DE_MEDIDA);
            cboUnidad.DataTextField = "par_det_c_vdesc";
            cboUnidad.DataValueField = "par_det_c_iid";
            cboUnidad.DataBind();
        }

        /// <summary>
        /// El formulario se acomodará para la inserción de un nuevo Item.
        /// </summary>
        private void NuevoItem()
        {
            EscenarioItem = TipoOperacion.Creacion;
            mvItem.ActiveViewIndex = 1;
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

                // Seteando la data en los controles
                this.txtCodigo.Text = ItemSeleccionado.itm_c_ccodigo;
                this.txtDescripcion.Text = ItemSeleccionado.itm_c_vdescripcion;
                this.txtPrecio.Text = ItemSeleccionado.itm_c_dprecio.ToString();
                this.cboUnidad.SelectedIndex = -1;
                var seleccion = cboUnidad.Items.FindByText(ItemSeleccionado.itm_c_vpardes);
                if (seleccion != null)
                {
                    seleccion.Selected = true;
                }

                mvItem.ActiveViewIndex = 1;
                upGeneral.Update();
            }
        }

        /// <summary>
        /// Limpia los campos de la vista Nuevo/Actualizar
        /// </summary>
        private void LimpiarCamposNuevoActualizar()
        {
            this.txtCodigo.Text = string.Empty;
            this.txtDescripcion.Text = string.Empty;
            this.txtPrecio.Text = string.Empty;
            this.cboUnidad.SelectedIndex = -1;
            this.cboUnidad.DataBind();
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
            decimal precio;
            decimal.TryParse(txtPrecio.Text, out precio);
            nuevoItem.itm_c_dprecio = precio;
            nuevoItem.itm_c_vdescripcion = this.txtDescripcion.Text.Trim();
            nuevoItem.par_det_c_idd = int.Parse(this.cboUnidad.SelectedValue);
            nuevoItem.itm_c_vpardes = this.cboUnidad.Text;

            // Ahora insertamos.
            if (_item.InsertarItem(nuevoItem))
            {
                Mensaje("Item insertado con éxito", "../Imagenes/correcto.png");
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
            else if (this.txtDescripcion.Text.Trim() == string.Empty)
            {
                Mensaje("Debe ingresar una descripción del Item.", "../Imagenes/warning.png");
                return false;
            }
            else if (!decimal.TryParse(this.txtPrecio.Text, out precio) )
            {
                Mensaje("Debe ingresar un precio válido.", "../Imagenes/warning.png");
                return false;
            }
            else if (precio < 0)
            {
                Mensaje("Debe ingresar un precio mayor a 0.", "../Imagenes/warning.png");
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
            decimal precio;
            decimal.TryParse(txtPrecio.Text, out precio);
            ItemSeleccionado.itm_c_dprecio = precio;
            ItemSeleccionado.par_det_c_idd = int.Parse(this.cboUnidad.SelectedValue);
            ItemSeleccionado.itm_c_vpardes = this.cboUnidad.SelectedItem.Text.Trim();

            if (_item.ModificarItem(ItemSeleccionado))
            {
                Mensaje("Item actualizado con éxito", "../Imagenes/correcto.png");
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
            upGeneral.Update();
        }




    }
}