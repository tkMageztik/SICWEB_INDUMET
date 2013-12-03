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
            this.ListarItems();
            if (!IsPostBack)
            {
                this.ListarUnidadMedida();
            }
        }

        protected void gvListaItem_RowEditing(object sender, GridViewEditEventArgs e)
        {
            // TODO: TRY CATCH
            int itemId = (int) this.gvListaItem.DataKeys[e.NewEditIndex].Value;
            this.EditarItem(itemId);
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

        #endregion


        #region Métodos
        private void ListarItems()
        {
            gvListaItem.DataSource = _item.ListarItems();
            gvListaItem.DataBind();
        }

        private void ListarUnidadMedida()
        {
            cboUnidad.DataSource = _parametro.ListarParametros(1);
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
        /// El formulario se acomodará para la actualización del Item seleccionado.
        /// </summary>
        /// <param name="index"></param>
        private void EditarItem(int idItem)
        {
            EscenarioItem = TipoOperacion.Modificacion;
            this.ItemSeleccionado = _item.ObtenerItemPorId(idItem);
            this.txtCodigo.Text = ItemSeleccionado.itm_c_ccodigo;
            this.txtDescripcion.Text = ItemSeleccionado.itm_c_vdescripcion;
            this.txtPrecio.Text = ItemSeleccionado.itm_c_dprecio.ToString();
            cboUnidad.SelectedIndex = -1;
            cboUnidad.Items.FindByText(ItemSeleccionado.itm_c_vpardes).Selected = true;
            mvItem.ActiveViewIndex = 1;
            upGeneral.Update();
        }

        private void LimpiarCamposNuevoActualizar()
        {
            this.txtCodigo.Text = string.Empty;
            this.txtDescripcion.Text = string.Empty;
            this.txtPrecio.Text = string.Empty;
          
        }

        /// <summary>
        /// Guarda la data del nuevo item en la BD
        /// </summary>
        private void GuardarNuevoItem()
        {
            // Primero validamos

            // Luego creamos el objeto
            SIC_T_ITEM nuevoItem = new SIC_T_ITEM();
            nuevoItem.itm_c_ccodigo = this.txtCodigo.Text;
            nuevoItem.itm_c_dprecio = Decimal.Parse( this.txtPrecio.Text);
            nuevoItem.itm_c_vdescripcion = this.txtDescripcion.Text;
            nuevoItem.par_det_c_idd = int.Parse(this.cboUnidad.SelectedValue);
            nuevoItem.itm_c_vpardes = this.cboUnidad.Text;

            // Ahora insertamos.
            _item.InsertarItem(nuevoItem);

            // Mostramos mensaje
            Mensaje("Item insertado con éxito", "../Imagenes/correcto.png");

            mvItem.ActiveViewIndex = 0;
            gvListaItem.EditIndex = -1;
            this.ListarItems();
            upGeneral.Update();
        }

        /// <summary>
        /// Cancela las operaciones de Nuevo y/o Edición y reinicia la data
        /// </summary>
        private void CancelarNuevoEdicionItem()
        {
            this.EscenarioItem = TipoOperacion.Ninguna;
            this.txtCodigo.Text = string.Empty;
            this.txtDescripcion.Text = string.Empty;
            this.txtPrecio.Text = string.Empty;
            gvListaItem.EditIndex = -1;
            gvListaItem.DataBind();
            mvItem.ActiveViewIndex = 0;
            upGeneral.Update();
        }

        /// <summary>
        /// Actualiza el item seleccionado
        /// </summary>
        private void ActualizarItem()
        {
            ItemSeleccionado.itm_c_ccodigo = txtCodigo.Text;
            ItemSeleccionado.itm_c_vdescripcion = txtDescripcion.Text;
            ItemSeleccionado.itm_c_dprecio = Decimal.Parse(txtPrecio.Text);
            ItemSeleccionado.par_det_c_idd = int.Parse(this.cboUnidad.SelectedValue);
            ItemSeleccionado.itm_c_vpardes = this.cboUnidad.SelectedItem.Text;

            _item.ModificarItem(ItemSeleccionado);

            // Mostramos mensaje
            Mensaje("Item actualizado con éxito", "../Imagenes/correcto.png");

            mvItem.ActiveViewIndex = 0;
            gvListaItem.EditIndex = -1;
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

        }

    

      
    }
}