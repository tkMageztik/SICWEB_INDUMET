using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIC.BusinessLayer;
using SIC.EntityLayer;

namespace SIC.UserLayer.Interfaces.Mantenimiento
{
    public partial class frmMantEmpresa : System.Web.UI.Page
    {
        private EmpresaBL _empresa = null;
        private CentroCostoBL _centroCosto = null;

        private SIC_T_EMP_CENTRO_COSTO CentroCostoModificar
        {
            get { return ViewState["vsCentroCosto"] as SIC_T_EMP_CENTRO_COSTO; }
            set { ViewState["vsCentroCosto"] = value; }
        }

        private SIC_T_EMP_DIRECCION LocalModificar
        {
            get { return ViewState["vsLocal"] as SIC_T_EMP_DIRECCION; }
            set { ViewState["vsLocal"] = value; }
        }

        #region Eventos
        public frmMantEmpresa()
        {
            _empresa = new EmpresaBL();
            _centroCosto = new CentroCostoBL();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.ObtenerDatosEmpresa();
                this.ListarCentroCosto();
                this.ListarLocal();
            }
        }

        protected void btnAgregarCentroCosto_Click(object sender, EventArgs e)
        {
            this.MostrarNuevoCentroCosto();
        }

        protected void btnCancelarCCN_Click(object sender, EventArgs e)
        {
            this.RegresarDesdeNuevoCentroCosto();
        }

        protected void gvCentroCosto_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int ccId = (int)this.gvCentroCosto.DataKeys[e.NewEditIndex].Value;
            e.NewEditIndex = -1;
            this.gvCentroCosto.EditIndex = -1;
            this.ListarCentroCosto();
            this.MostrarModificarCentroCosto(ccId);
            
        }

        protected void btnCancelarCCE_Click(object sender, EventArgs e)
        {
            this.RegresarDesdeModificarCentroCosto();
        }

        protected void btnGuardarCCE_Click(object sender, EventArgs e)
        {
            this.ModificarCentroCosto();
        }

        protected void btnAgregarLocal_Click(object sender, EventArgs e)
        {
            this.MostarNuevoLocal();
        }

        protected void lnkGuardarLCN_Click(object sender, EventArgs e)
        {
            this.GuardarLocalNuevo();
        }

        protected void btnCancelarLCN_Click(object sender, EventArgs e)
        {
            RegresarDesdeNuevoLocal();
        }
        
        protected void btnGuardarCCN_Click(object sender, EventArgs e)
        {
            this.GuarderNuevoCentroCosto();
        }

        protected void gvLocal_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int locId = (int)this.gvLocal.DataKeys[e.NewEditIndex].Value;
            e.NewEditIndex = -1;
            this.gvLocal.EditIndex = -1;
            this.ListarLocal();
            this.MostrarModificarLocal(locId);
        }

        protected void btnCancelarLCE_Click(object sender, EventArgs e)
        {
            RegresarDesdeModificarLocal();
        }

        protected void lnkGuardarLCE_Click(object sender, EventArgs e)
        {
            ActualizarLocal();
        }

        protected void cboDepartamentoN_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListarComboProvinciaN(cboDepartamentoN.SelectedValue);
        }
        
        protected void cboProvinciaN_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListarComboDistritoN(cboProvinciaN.SelectedValue);
        }

        #endregion

        #region Nuevo Centro de Costo

        private void MostrarNuevoCentroCosto()
        {
            this.LimpiarNuevoCentroCosto();
            this.mvCliente.SetActiveView(vwCentroCostoNuevo);
            this.upGeneral.Update();
        }

        private bool ValidarDatosNuevoCentroCosto()
        {
            if (txtDescripcionCCN.Text.Trim().Length <= 0)
            {
                Mensaje("Debe ingresar el nombre del centro de costo.", "../Imagenes/warning.png");
                return false;
            }
            else if (txtSerBoletaN.Text.Trim().Length <= 0)
            {
                Mensaje("Debe ingresar la serie de boleta del centro de costo.", "../Imagenes/warning.png");
                return false;
            }
            else if (txtSerFacturaN.Text.Trim().Length <= 0)
            {
                Mensaje("Debe ingresar el serie de factura del centro de costo.", "../Imagenes/warning.png");
                return false;
            }
            else
            {
                return true;
            }
        }

        private void GuarderNuevoCentroCosto()
        {
            SIC_T_EMP_CENTRO_COSTO centroCosto = new SIC_T_EMP_CENTRO_COSTO();
            centroCosto.emp_cst_c_vserieboleta = txtSerBoletaN.Text;
            centroCosto.emp_cst_c_vseriefactura = txtSerFacturaN.Text;
            centroCosto.emp_cst_c_vdesc = txtDescripcionCCN.Text;

            var validacion = _empresa.ValidarCentroCosto(centroCosto);
            if (!validacion.EsValido)
            {
                Mensaje(validacion.Mensaje, "../Imagenes/warning.png");
            }
            else
            {

                try
                {
                    _empresa.IngresarCentroCosto(centroCosto);
                    Mensaje("Ingresado con éxito", "../Imagenes/correcto.png");
                    this.mvCliente.SetActiveView(vwEmpresa);
                    this.ListarCentroCosto();
                    this.upGeneral.Update();
                }
                catch (Exception ex)
                {
#if DEBUG
                    String mensajeError = "Error Fatal : \n" + ex.Message;
                    if (ex.InnerException != null)
                    {
                        mensajeError += "\n" + ex.InnerException != null ? ex.InnerException.Message : string.Empty;
                    }

                    Mensaje(mensajeError, "../Imagenes/warning.png");
#else
                Mensaje("Error en el proceso.", "../Imagenes/warning.png");
#endif
                }
            }
        }

        private void LimpiarNuevoCentroCosto()
        {
            this.txtDescripcionCCN.Text = string.Empty;
            this.txtSerBoletaN.Text = string.Empty;
            this.txtSerFacturaN.Text = string.Empty;
        }

        private void RegresarDesdeNuevoCentroCosto()
        {
            this.mvCliente.SetActiveView(vwEmpresa);
            this.upGeneral.Update();
        }

        #endregion

        #region Editar Centro de Costo
        
        private void MostrarModificarCentroCosto(int idCentroCosto)
        {
            this.LimpiarModificarCentroCosto();            
            var centroCosto = _centroCosto.ObtenerCentroCosto(idCentroCosto);
            if(centroCosto== null)
            {
                // TODO: ERROR
                return;
            }

            this.CentroCostoModificar = centroCosto;
            this.txtDescripcionCCE.Text = centroCosto.emp_cst_c_vdesc;
            this.txtSerBoletaE.Text = centroCosto.emp_cst_c_vserieboleta;
            this.txtSerFacturaE.Text = centroCosto.emp_cst_c_vseriefactura;
            this.mvCliente.SetActiveView(vwCentroCostoEditar);
            this.upGeneral.Update();
        }

        private void LimpiarModificarCentroCosto()
        {
            this.txtDescripcionCCE.Text = string.Empty;
            this.txtSerBoletaE.Text = string.Empty;
            this.txtSerFacturaE.Text = string.Empty;
        }


        private bool ValidarDatosModificarCentroCosto()
        {
            if (txtDescripcionCCE.Text.Trim().Length <= 0)
            {
                Mensaje("Debe ingresar el nombre del centro de costo.", "../Imagenes/warning.png");
                return false;
            }
            else if (txtSerBoletaE.Text.Trim().Length <= 0)
            {
                Mensaje("Debe ingresar la serie de boleta del centro de costo.", "../Imagenes/warning.png");
                return false;
            }
            else if (txtSerFacturaE.Text.Trim().Length <= 0)
            {
                Mensaje("Debe ingresar el serie de factura del centro de costo.", "../Imagenes/warning.png");
                return false;
            }
            else
            {
                return true;
            }
        }

        private void ModificarCentroCosto()
        {
            if (this.CentroCostoModificar == null)
            {
                return;
            }

            //if (!ValidarDatosModificarCentroCosto())
            //{
            //    return;
            //}

            var centroCosto = this.CentroCostoModificar;
            centroCosto.emp_cst_c_vdesc = txtDescripcionCCE.Text;

            var validacion = _empresa.ValidarCentroCosto(centroCosto);
            if (!validacion.EsValido)
            {
                Mensaje(validacion.Mensaje, "../Imagenes/warning.png");
            }
            else
            {
                try
                {
                    _empresa.ModificarCentroCosto(centroCosto);
                    Mensaje("Modificado con éxito", "../Imagenes/correcto.png");
                    this.mvCliente.SetActiveView(vwEmpresa);
                    this.ListarCentroCosto();
                    this.upGeneral.Update();
                }
                catch (Exception ex)
                {
#if DEBUG
                    String mensajeError = "Error Fatal : \n" + ex.Message;
                    if (ex.InnerException != null)
                    {
                        mensajeError += "\n" + ex.InnerException != null ? ex.InnerException.Message : string.Empty;
                    }

                    Mensaje(mensajeError, "../Imagenes/warning.png");
#else
                    Mensaje("Error en el proceso.", "../Imagenes/warning.png");
#endif
                }
            }
        }

        private void RegresarDesdeModificarCentroCosto()
        {
            this.mvCliente.SetActiveView(vwEmpresa);
            this.upGeneral.Update();
        }

        #endregion

        private void ObtenerDatosEmpresa()
        {
            var empresa = _empresa.ObtenerDatosEmpresa();
            this.txtRUC.Text = empresa.emp_c_vruc;
            this.txtRazonSocial.Text = empresa.emp_c_vrazonsocial;
        }

        private void ListarCentroCosto()
        {
            this.gvCentroCosto.DataSource = _centroCosto.ListarCentroCosto();
            this.gvCentroCosto.DataBind();
        }

        private void ListarLocal()
        {
            this.gvLocal.DataSource = _empresa.ListarDireccionEmpresa();
            this.gvLocal.DataBind();
        }

        private void ListarComboCentroCosto()
        {
            cboCentroCostoE.Items.Clear();
            cboCentroCostoE.Items.Add(new ListItem("-- Seleccionar --", "-1"));
            cboCentroCostoE.DataSource = _centroCosto.ListarCentroCosto();
            cboCentroCostoE.DataTextField = "emp_cst_c_vdesc";
            cboCentroCostoE.DataValueField = "emp_cst_c_iid";
            cboCentroCostoE.DataBind();

            cboCentroCostoN.Items.Clear();
            cboCentroCostoN.Items.Add(new ListItem("-- Seleccionar --", "-1"));
            cboCentroCostoN.DataSource = _centroCosto.ListarCentroCosto();
            cboCentroCostoN.DataTextField = "emp_cst_c_vdesc";
            cboCentroCostoN.DataValueField = "emp_cst_c_iid";
            cboCentroCostoN.DataBind();
        }

        private void ListarComboDepartamentoN()
        {
            cboDepartamentoN.Items.Clear();
            cboDepartamentoN.Items.Add(new ListItem("-- Seleccionar --", null));
            cboDepartamentoN.DataSource = _empresa.ListarDepatamentos();
            cboDepartamentoN.DataTextField = "depa_c_vnomb";
            cboDepartamentoN.DataValueField = "depa_c_ccod";
            cboDepartamentoN.DataBind();
            upGeneral.Update();
        }

        private void ListarComboProvinciaN(string codigoDepartamento)
        {
            cboProvinciaN.Items.Clear();
            cboProvinciaN.Items.Add(new ListItem("-- Seleccionar --", null));
            if (codigoDepartamento != null) 
            {
                cboProvinciaN.DataSource = _empresa.ListarProvincias(codigoDepartamento);
                cboProvinciaN.DataTextField = "prov_c_vnomb";
                cboProvinciaN.DataValueField = "prov_c_ccod";
                cboProvinciaN.DataBind();
                
            }
            ListarComboDistritoN(null);
        }


        private void ListarComboDistritoN(string codigoProvincia)
        {
            cboDistritoN.Items.Clear();
            cboDistritoN.Items.Add(new ListItem("-- Seleccionar --", null));
            if (codigoProvincia != null)
            {
                cboDistritoN.DataSource = _empresa.ListarDistritos(codigoProvincia);
                cboDistritoN.DataTextField = "dist_c_vnomb";
                cboDistritoN.DataValueField = "dist_c_ccod_ubig";
                cboDistritoN.DataBind();
            }
            upGeneral.Update();
        }

        private void ListarTipoDireccionN()
        {
            cboTipoDireccionN.Items.Clear();
            cboTipoDireccionN.Items.Add(new ListItem("-- Seleccionar --", null));
            cboTipoDireccionN.DataSource = _empresa.ListarTipoDireccion();
            cboTipoDireccionN.DataTextField = "par_det_c_vdesc";
            cboTipoDireccionN.DataValueField = "par_det_c_iid";
            cboTipoDireccionN.DataBind();
            upGeneral.Update();
        }

        private void Mensaje(string mensaje, string ruta)
        {
            divPopUpMsg.Attributes["Class"] = "PopupMostrar";
            ucMensaje.Visible = true;
            ucMensaje.Mensaje = mensaje;
            ucMensaje.Ruta = ruta;
            ucMensaje.EnableModelDialog(true);
            upMensaje.Update();
            return;
        }
            
        #region Agergar Locales

        private void MostarNuevoLocal()
        {
            this.LimpiarNuevoLocal();
            this.ListarComboCentroCosto();
            this.ListarComboDepartamentoN();
            this.ListarComboProvinciaN(null);
            this.ListarComboDistritoN(null);
            this.ListarTipoDireccionN();
            this.mvCliente.SetActiveView(vwLocalNuevo);
            this.upGeneral.Update();
        }

        private void LimpiarNuevoLocal()
        {
            txtDescripcionLCN.Text = string.Empty;
            cboCentroCostoN.ClearSelection();
        }

        private void RegresarDesdeNuevoLocal()
        {
            this.LimpiarNuevoLocal();
            this.mvCliente.SetActiveView(vwEmpresa);
            this.upGeneral.Update();
        }

        private bool VerificarDatosLocalNuevo()
        {
            int idSeleccionado = -1;
            if (this.txtDescripcionLCN.Text.Trim().Length <= 0)
            {
                Mensaje("Debe ingresar el nombre del local.", "../Imagenes/warning.png");
                return false;
            }
            else if (int.TryParse(this.cboCentroCostoN.SelectedValue, out idSeleccionado) && idSeleccionado == -1)
            {
                Mensaje("Debe seleccionar un centro de costo.", "../Imagenes/warning.png");
                return false;
            }
            else
            {
                return true;
            }
        }



        private void GuardarLocalNuevo()
        {
            if (!this.VerificarDatosLocalNuevo())
            {
                return;
            }
             
            SIC_T_EMP_DIRECCION local = new SIC_T_EMP_DIRECCION();
            local.emp_dir_c_vdireccion = txtDescripcionLCN.Text.Trim();
            local.emp_dir_c_iid_centrocosto = int.Parse(cboCentroCostoN.SelectedValue);

            try
            {
                this._empresa.IngresarDireccion(local);
                Mensaje("Ingresado con éxito", "../Imagenes/correcto.png");
                this.mvCliente.SetActiveView(vwEmpresa);
                this.ListarLocal();
                this.upGeneral.Update();
            }
            catch (Exception ex)
            {
#if DEBUG
                String mensajeError = "Error Fatal : \n" + ex.Message;
                if (ex.InnerException != null)
                {
                    mensajeError += "\n" + ex.InnerException != null ? ex.InnerException.Message : string.Empty;
                }

                Mensaje(mensajeError, "../Imagenes/warning.png");
#else
                Mensaje("Error en el proceso.", "../Imagenes/warning.png");
#endif
            }
        }

        #endregion


        #region Modificar Local

        private void MostrarModificarLocal(int locId)
        {
            this.LimpiarModificarLocal();
            this.ListarComboCentroCosto();
            var local = _empresa.ObtenerDireccionEmpresa(locId);
            if (local == null)
            {
                // TODO: ERROR
                return;
            }

            this.LocalModificar = local;
            this.txtDescripcionLCE.Text = local.emp_dir_c_vdireccion;
            this.cboCentroCostoE.ClearSelection();
            var seleccion = cboCentroCostoE.Items.FindByValue(local.emp_dir_c_iid_centrocosto.ToString());
            if (seleccion != null)
            {
                seleccion.Selected = true;
            }

            this.mvCliente.SetActiveView(vwLocalEditar);
            this.upGeneral.Update();
        }

        private void LimpiarModificarLocal()
        {
            this.txtDescripcionLCE.Text = string.Empty;
            this.cboCentroCostoE.ClearSelection();
        }

        private bool VerificarDatosLocalModificar()
        {

            int idSeleccionado = -1;
            if (this.txtDescripcionLCE.Text.Trim().Length <= 0)
            {
                Mensaje("Debe ingresar el nombre del local.", "../Imagenes/warning.png");
                return false;
            }
            else if (int.TryParse(this.cboCentroCostoE.SelectedValue, out idSeleccionado) && idSeleccionado == -1)
            {
                Mensaje("Debe seleccionar un centro de costo.", "../Imagenes/warning.png");
                return false;
            }
            else
            {
                return true;
            }
        }

        private void ActualizarLocal()
        {
            if (!this.VerificarDatosLocalModificar())
            {
                return;
            }

            this.LocalModificar.emp_dir_c_vdireccion = txtDescripcionLCE.Text.Trim();
            this.LocalModificar.emp_dir_c_iid_centrocosto = int.Parse(cboCentroCostoE.SelectedValue);

            try
            {
                this._empresa.ModificarDireccion(this.LocalModificar);
                Mensaje("Modificado con éxito", "../Imagenes/correcto.png");
                this.mvCliente.SetActiveView(vwEmpresa);
                this.ListarLocal();
                this.upGeneral.Update();
            }
            catch (Exception ex)
            {
#if DEBUG
                String mensajeError = "Error Fatal : \n" + ex.Message;
                if (ex.InnerException != null)
                {
                    mensajeError += "\n" + ex.InnerException != null ? ex.InnerException.Message : string.Empty;
                }

                Mensaje(mensajeError, "../Imagenes/warning.png");
#else
                Mensaje("Error en el proceso.", "../Imagenes/warning.png");
#endif
            }
        }

        private void RegresarDesdeModificarLocal()
        {
            this.LimpiarModificarLocal();
            this.mvCliente.SetActiveView(vwEmpresa);
            this.upGeneral.Update();
        }
        

        #endregion


  











    }
}