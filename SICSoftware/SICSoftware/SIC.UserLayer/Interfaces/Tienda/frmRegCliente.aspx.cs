using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Entity;
using SIC.BusinessLayer;
using SIC.EntityLayer;
using System.Text.RegularExpressions;
using ADV.Data;


namespace SIC.UserLayer.Interfaces.Tienda
{
    public partial class frmRegCliente : System.Web.UI.Page
    {
        string ShowMessage;
        private UbigeoBL _ubigeo = null;
        private ClienteBL _cliente = null;
        //private LocalBL _local = null;

        bool status;
        public event EventHandler UpdateControl;
     
        public String Ruta;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            Escenario = TipoOperacion.Listar;

            EscenarioContacto = TipoOperacion.Listar;

            List<SIC_T_CLI_DIRECCION> lstDireccion = new List<SIC_T_CLI_DIRECCION>();
            lstDireccion.Add(new SIC_T_CLI_DIRECCION());
            Direcciones =  lstDireccion;

            inicializarViews();
            if (ViewState["vsDirecciones"] != null)
            {
                Direcciones = (List<SIC_T_CLI_DIRECCION>)ViewState["vsDirecciones"];
            }
            else
            {
                Direcciones = new List<SIC_T_CLI_DIRECCION>();
            }

            if (ViewState["vsBorrarDirecciones"] != null)
            {
                BorrarDirecciones = (List<SIC_T_CLI_DIRECCION>)ViewState["vsBorrarDirecciones"];
            }
            else
            {
                BorrarDirecciones = new List<SIC_T_CLI_DIRECCION>();
            }

            if (ViewState["vsContactos"] != null)
            {
                Contactos = (List<SIC_T_CLI_CONTACTO>)ViewState["vsContactos"];
            }
            else
            {
                Contactos = new List<SIC_T_CLI_CONTACTO>();
            }

            if (ViewState["vsBorrarContactos"] != null)
            {
                BorrarContactos = (List<SIC_T_CLI_CONTACTO>)ViewState["vsBorrarContactos"];
            }
            else
            {
                BorrarContactos = new List<SIC_T_CLI_CONTACTO>();
            }

            //if (ViewState["vsUbigeos"] != null)
            //{
            //    Ubigeos = (List<Ubigeo>)ViewState["vsUbigeos"];
            //}
            //else
            //{
            //    Ubigeos = new List<Ubigeo>();
            //}
           

            if (!Page.IsPostBack)
            {
                ListarClientes();
            }
            //cboCentroComercial.DataSource = _local.ListarInmuebles();
            //cboCentroComercial.DataValueField = "inm_c_icod";
            //cboCentroComercial.DataTextField = "inm_c_vnomb";
            //cboCentroComercial.DataBind();
            mvCliente.ActiveViewIndex = 0;

          
        }

        private void asignarNombresComerciales()
        {
            int x = 0;
            foreach (SIC_T_NOMB_COM _fila in NombresComerciales)
            {
                ((TextBox)gvNombresComerciales.Rows[x].FindControl("txtNombreComercial")).Text
                    = _fila.nomb_com_c_vnomb;
                x++;
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            ListarClientes();
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            NombresComerciales.Add(new SIC_T_NOMB_COM());
            Direcciones.Add(new SIC_T_CLI_DIRECCION());
            Ubigeos = new List<Ubigeo>();
            Ubigeos.Add(new Ubigeo());
            lblAccion.Text = "NUEVO"; //ES NECESARIO PARA DESHABILITAR O HABILITAR COMBOS UBIGEO.
            inicializarNuevoCliente();
            Escenario = TipoOperacion.Creacion;
            cboTipoDocumento.Enabled = true;
            mvCliente.ActiveViewIndex = 1;


            gvNombresComerciales.Columns[2].Visible = false;
        }

        protected void gvLista_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvLista_RowCreated(object sender, GridViewRowEventArgs e)
        {
          
        }

        protected void gvLista_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }
        protected void gvLista_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvLista.PageIndex = e.NewPageIndex;
            ListarClientes();
            mvCliente.ActiveViewIndex = 0;
        }

        protected void gvLista_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

            if (validarCampos())
            {
                if (gvLista.EditIndex <= -1)
                {
                    preguardarNombresComerciales();
                    registrarCliente();
                    registrarDirecciones();
                    enlazarNombresComerciales();
                    guardarContactos();

                    mvCliente.ActiveViewIndex = 1;
                    gvNombresComerciales.Columns[2].Visible = true;
                }
                if (gvLista.EditIndex > -1)
                {
                    preguardarNombresComerciales();
                    modificarCliente();
                    enlazarNombresComerciales();
                    modificarDirecciones();
                    guardarContactos();
                    modificarContactos();

                    mvCliente.ActiveViewIndex = 1;
                }
                limpiarViews();
                //TODO: Revisar guardado de clientes, desde modificar al guardar por 
                //segunda vez gvLista.EditIndex = -1;
                ListarClientes();

            }
            else
            {
                Mensaje(ShowMessage, "../Imagenes/warning.png");
                mvCliente.ActiveViewIndex = 1;
            }  

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {

            NombresComerciales.Clear();
            gvLista.EditIndex = -1;
            ListarClientes();
            Escenario = TipoOperacion.Listar;

            limpiarViews();
            mvCliente.ActiveViewIndex = 0;
        }

        private void limpiarViews()
        {
            ViewState["vsNombresComerciales"] = null;
            ViewState["vsDirecciones"] = null;
            ViewState["vsBorrarDirecciones"] = null;
            ViewState["vsContactos"] = null;
            ViewState["vsBorrarContactos"] = null;
            ViewState["vsUbigeos"] = null;
        }

        protected void gvNombresComerciales_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
           
        }

        protected void gvNombresComerciales_RowEditing(object sender, GridViewEditEventArgs e)
        {
        }

        protected void btnAgregarNombreComercial_Click(object sender, EventArgs e)
        {
            salvarNombresComerciales();
            SIC_T_NOMB_COM _nomComTemp = new SIC_T_NOMB_COM();
            NombresComerciales.Add(_nomComTemp);
            gvNombresComerciales.DataSource = NombresComerciales;
            gvNombresComerciales.DataBind();
            asignarNombresComerciales();
            mvCliente.ActiveViewIndex = 1;
        }

        protected void cboDepartamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            salvarCamposDirecciones();
            listarDepartamentos();
            asignarUbigeos();
            mvCliente.ActiveViewIndex = 1;
        }

        protected void cboProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            salvarCamposDirecciones();
            listarDepartamentos();
            asignarUbigeos();
            mvCliente.ActiveViewIndex = 1;
        }

        protected void gvDireccion_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
           
           
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Ubigeo _ubigeoTemporal = new Ubigeo();
            _ubigeoTemporal.Departamento = "0";
            _ubigeoTemporal.Provincia = "0";
            Ubigeos.Add(_ubigeoTemporal);
            Direcciones.Add(new SIC_T_CLI_DIRECCION());
            salvarCamposDirecciones();
            gvDireccion.DataSource = Direcciones;
            gvDireccion.DataBind();
            listarDepartamentos();
            asignarUbigeos();
            mvCliente.ActiveViewIndex = 1;
           
        }

        protected void btnAgregarContacto_Click(object sender, EventArgs e)
        {
            lblContacto.Text = "NUEVO CONTACTO";
            //EscenarioContacto = TipoOperacion.Creacion;
            mvCliente.ActiveViewIndex = 2;
        }

        protected void gvContactos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
        }

        protected void gvContactos_RowEditing(object sender, GridViewEditEventArgs e)
        {
           

        }

        protected void gvContactos_RowCreated(object sender, GridViewRowEventArgs e)
        {
    
        }

        protected void btnGuardarContacto_Click(object sender, EventArgs e)
        {
            bool _validator = false;
            if (!ValidarDni(txtDniContacto.Text.Trim()))
            {
                lblValidarDni.Text = "Formato de Dni incorrecto";
                _validator = true;
            }
            else
            {
                lblValidarDni.Text = "";
            }
            if (!ValidarNombre(txtNombreContacto.Text.Trim()))
            {
                lblValidarNombre.Text = "Ingrese nombre correcto";
                _validator = true;
            }
            else
            {
                lblValidarNombre.Text = "";
            }
            if (!ValidarApellido(txtApellidoPaternoContacto.Text.Trim()))
            {
                lblValidarApellido.Text = "Ingrese apellido correcto";
                _validator = true;
            }
            else
            {
                lblValidarNombre.Text = "";
            }

            //if (!ValidarTelefonoFijo(txtTelefonofijoContacto.Text.Trim()))
            //{
            //    lblValidarTelefonoFijo.Text = "Formato de teléfono incorrecto";
            //    _validator = true;
            //}
            //else
            //{
            //    lblValidarTelefonoFijo.Text = "";
            //}
            //if (!ValidarCelular(txttelefonoMovilContacto.Text.Trim()))
            //{
            //    lblValidarTelefonoMovil.Text = "Formato de celular incorrecto";
            //    _validator = true;
            //}
            //else
            //{
            //    lblValidarTelefonoMovil.Text = "";
            //}
            if (!ValidarEmail(txtEmailContacto.Text.Trim()))
            {
                lblValidarEmail.Text = "Ingrese un email correcto";
                _validator = true;
            }
            else
            {
                lblValidarEmail.Text = "";
            }
            if (_validator)
            {
                mvCliente.ActiveViewIndex = 2;

                return;
            }
            //si el comportamiento es nuevo
            if (gvContactos.EditIndex <= -1)
            {
               SIC_T_CLI_CONTACTO _contactoTemp = new SIC_T_CLI_CONTACTO();

                _contactoTemp.cli_c_vdoc_id = txtNroRuc.Text.Trim();
                _contactoTemp.cli_contac_c_cdoc_id = txtDniContacto.Text;
                _contactoTemp.cli_contac_c_vnomb = txtNombreContacto.Text;
                _contactoTemp.cli_contac_c_vape_pat = txtApellidoPaternoContacto.Text;
                _contactoTemp.cli_contac_c_vape_mat = txtApellidoMaternoContacto.Text;
                _contactoTemp.cli_contac_c_ctlf = txtTelefonofijoContacto.Text;
                _contactoTemp.cli_contac_c_ccel = txttelefonoMovilContacto.Text;
                _contactoTemp.cli_contac_c_vcorreo = txtEmailContacto.Text;
                try
                {
                    _contactoTemp.cli_contac_c_dfec_cump = Convert.ToDateTime(txtFechaNacimientoContacto.Text);
                }
                catch (Exception)
                {
                    _contactoTemp.cli_contac_c_dfec_cump = null;
                }
                _contactoTemp.cli_contac_cargo_c_yid = Convert.ToByte(cboCargoContacto.SelectedValue);
                _contactoTemp.cli_contac_c_vobserv = txtObservacionesContacto.Text;
                _contactoTemp.cli_contac_c_bactivo = true;
                Contactos.Add(_contactoTemp);

            }
            //si el compoertamiento es edicion
            if (gvContactos.EditIndex >= 0)
            {
                Contactos[gvContactos.EditIndex].cli_contac_c_cdoc_id = txtDniContacto.Text;
                Contactos[gvContactos.EditIndex].cli_contac_c_vnomb = txtNombreContacto.Text;
                Contactos[gvContactos.EditIndex].cli_contac_c_vape_pat = txtApellidoPaternoContacto.Text;
                Contactos[gvContactos.EditIndex].cli_contac_c_vape_mat = txtApellidoMaternoContacto.Text;
                Contactos[gvContactos.EditIndex].cli_contac_c_ctlf = txtTelefonofijoContacto.Text;
                Contactos[gvContactos.EditIndex].cli_contac_c_ccel = txttelefonoMovilContacto.Text;
                Contactos[gvContactos.EditIndex].cli_contac_c_vcorreo = txtEmailContacto.Text;
                Contactos[gvContactos.EditIndex].cli_contac_c_dfec_cump = Convert.ToDateTime(txtFechaNacimientoContacto.Text);
                Contactos[gvContactos.EditIndex].cli_contac_cargo_c_yid = Convert.ToByte(cboCargoContacto.SelectedValue);
                if (txtObservacionesContacto.Text.Length > 50)
                {
                    Contactos[gvContactos.EditIndex].cli_contac_c_vobserv = txtObservacionesContacto.Text.Substring(0, 50);
                }
                else
                {
                    Contactos[gvContactos.EditIndex].cli_contac_c_vobserv = txtObservacionesContacto.Text;
                }
                Contactos[gvContactos.EditIndex].cli_contac_c_bactivo = true;

            }
            //cancelamos el edit index
            limpiarCamposRegistroContacto();
            gvContactos.EditIndex = -1;
            ListarContactos();
            mvCliente.ActiveViewIndex = 1;
 

        }

        protected void btnCancelarContacto_Click(object sender, EventArgs e)
        {
            limpiarCamposRegistroContacto();
            gvContactos.EditIndex = -1;
            ListarContactos();
            mvCliente.ActiveViewIndex = 1;
        }

        private void ListarClientes()
        {
            gvLista.DataSource = _cliente.ListarClientes(Convert.ToByte(cboTipo.SelectedValue),
            new SIC_T_CLIENTE() { cli_c_vraz_soc = txtFiltroRazonSocial.Text, cli_c_vdoc_id = txtRuc.Text });
            gvLista.DataBind();
        }

        private void inicializarNuevoCliente()
        {
            cboTipoPersona.Items.Clear();
            ListItem li = new ListItem();
            ListItem li2 = new ListItem();
            li.Text = "Natural";
            li.Value = "0";
            cboTipoPersona.Items.Add(li);
            li2.Text = "Jurídica";
            li2.Value = "1";
            cboTipoPersona.Items.Add(li2);
            cboTipoPersona.DataBind();


            gvDireccion.DataSource = Direcciones;
            gvDireccion.DataBind();

            listarDepartamentos();

            cboEjecutivo.DataSource = _cliente.ListarColaboradoresPorArea(Convert.ToByte(6));
            cboEjecutivo.DataValueField = "colab_c_cdoc_id";
            cboEjecutivo.DataTextField = "colab_c_vnomb_completo";
            cboEjecutivo.DataBind();

            //cboScoring.Items.Clear();
            //cboScoring.DataSource = _cliente.ListarScorings();
            //cboScoring.DataTextField = "cli_scor_c_cletra";
            //cboScoring.DataValueField = "cli_scor_c_cletra";
            //cboScoring.DataBind();

            cboZonaReparto.Items.Clear();
            cboZonaReparto.Items.Insert(0, new ListItem("A", "1"));
            cboZonaReparto.Items.Insert(1, new ListItem("B", "2"));
            cboZonaReparto.Items.Insert(2, new ListItem("C", "3"));

            txtRazonSocial.Text = "";
            txtNroRuc.Text = "";
            txtNroRuc.ReadOnly = false;
            txtNroRuc.Enabled = true;
            txtNumeroPartida.Text = "";
            txtRubroDetallado.Text = "";
            txtFechaAniversario.Text = "";
            txtFecConstitucion.Text = "";
            txtTelefono.Text = "";

            cboZonaReparto.SelectedValue = "1";

            txtDniContacto.Text = "";
            txtNombreContacto.Text = "";
            txtApellidoPaternoContacto.Text = "";
            txtApellidoMaternoContacto.Text = "";
            txtTelefonofijoContacto.Text = "";
            txttelefonoMovilContacto.Text = "";
            txtEmailContacto.Text = "";
            txtFechaNacimientoContacto.Text = "";
            txtObservacionesContacto.Text = "";

            cboCargoContacto.Items.Clear();
            cboCargoContacto.DataSource = _cliente.ListarCargosContacto();
            cboCargoContacto.DataTextField = "cli_contac_cargo_c_vnomb";
            cboCargoContacto.DataValueField = "cli_contac_cargo_c_yid";
            cboCargoContacto.DataBind();
            txtFechaNacimientoContacto.Attributes.Add("readonly", "readonly");
            txtFechaAniversario.Attributes.Add("readonly", "readonly");
            txtFecConstitucion.Attributes.Add("readonly", "readonly");

            gvContactos.DataSource = null;
            gvContactos.DataBind();
        }

        private void listarDepartamentos()
        {
            int _x = 0;
            foreach (var _fila in Direcciones)
            {
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDepartamento")).Items.Clear();
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDepartamento")).DataSource = _ubigeo.ListarDepartamentos();
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDepartamento")).DataValueField = "depa_c_ccod";
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDepartamento")).DataTextField = "depa_c_vnomb";
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDepartamento")).DataBind();

                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDepartamento")).Items.Insert(0, new ListItem("Departamento", "0"));
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboProvincia")).Items.Clear();
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboProvincia")).Items.Insert(0, new ListItem("Provincia", "0"));
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboProvincia")).DataBind();

                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDistrito")).Items.Clear();
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDistrito")).Items.Insert(0, new ListItem("Distrito", "0"));
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDistrito")).DataBind();

                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboTipoDireccion")).Items.Clear();
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboTipoDireccion")).Items.Insert(0, new ListItem("Tipo", "0"));
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboTipoDireccion")).Items.Insert(1, new ListItem("Fiscal", "1"));
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboTipoDireccion")).Items.Insert(2, new ListItem("Sucursal", "2"));
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboTipoDireccion")).Items.Insert(3, new ListItem("Factura", "3"));
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboTipoDireccion")).DataBind();

                if (lblAccion.Text == "NUEVO")
                {
                    ((DropDownList)gvDireccion.Rows[_x].FindControl("cboProvincia")).Enabled = false;
                    ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDistrito")).Enabled = false;
                }

                _x++;
            }
        }

        #region PROPIEDADES


        private List<SIC_T_NOMB_COM> NombresComerciales
        {
            get { return (List<SIC_T_NOMB_COM>)ViewState["vsNombresComerciales"]; }
            set { ViewState["vsNombresComerciales"] = value; }
        }

        private List<SIC_T_CLI_DIRECCION> Direcciones
        {
            get { return (List<SIC_T_CLI_DIRECCION>)ViewState["vsDirecciones"]; }
            set { ViewState["vsDirecciones"] = value; }
        }
        private List<SIC_T_CLI_DIRECCION> BorrarDirecciones
        {
            get { return (List<SIC_T_CLI_DIRECCION>)ViewState["vsBorrarDirecciones"]; }
            set { ViewState["vsBorrarDirecciones"] = value; }
        }
        private List<SIC_T_CLI_CONTACTO> Contactos
        {
            get { return (List<SIC_T_CLI_CONTACTO>)ViewState["vsContactos"]; }
            set { ViewState["vsContactos"] = value; }
        }
        private List<SIC_T_CLI_CONTACTO> BorrarContactos
        {
            get { return (List<SIC_T_CLI_CONTACTO>)ViewState["vsBorrarContactos"]; }
            set { ViewState["vsBorrarContactos"] = value; }
        }
        private List<Ubigeo> Ubigeos
        {
            get { return (List<Ubigeo>)ViewState["vsUbigeos"]; }
            set { ViewState["vsUbigeos"] = value; }
        }
        public TipoOperacion Escenario
        {
            get { return (TipoOperacion)ViewState["vsEscenario"]; }
            set { ViewState["vsEscenario"] = value; }
        }
        public TipoOperacion EscenarioContacto
        {
            get { return (TipoOperacion)ViewState["vsEscenarioContacto"]; }
            set { ViewState["vsEscenarioContacto"] = value; }
        }
        #endregion

         public frmRegCliente()
        {
            _ubigeo = new UbigeoBL();
            _cliente = new ClienteBL();
          
        }

         protected void cboTipoPersona_SelectedIndexChanged(object sender, EventArgs e)
         {
              if (cboTipoPersona.SelectedValue == "0")
            {
                cboTipoDocumento.SelectedIndex = 0;
                cboTipoDocumento.Enabled = true;
                mvCliente.ActiveViewIndex = 1;
            }
            else if (cboTipoPersona.SelectedValue == "1")
            {
                cboTipoDocumento.SelectedIndex = 2;
                cboTipoDocumento.Enabled = false;
                mvCliente.ActiveViewIndex = 1;
            }
         }

        [Serializable()]
        private class Ubigeo
        {
            public string Departamento { get; set; }
            public string Provincia { get; set; }
                  
        }


        private void Page_PreRender(object sender, EventArgs e)
        {
            ViewState.Add("vsNombresComerciales", NombresComerciales);
            ViewState.Add("vsDirecciones", Direcciones);
            ViewState.Add("vsBorrarDirecciones", BorrarDirecciones);
            ViewState.Add("vsUbigeos", Ubigeos);
            ViewState.Add("vsContactos", Contactos);
            ViewState.Add("vsBorrarContactos", BorrarContactos);
            ViewState.Add("vsEscenario", Escenario);
            ViewState.Add("vsEscenarioContacto", EscenarioContacto);
        }

        private void salvarCamposDirecciones()
        {
            foreach (GridViewRow item in gvDireccion.Rows)
            {
                Direcciones[item.RowIndex].cli_direc_c_vdirec = ((TextBox)item.FindControl("txtDireccion")).Text;
                Direcciones[item.RowIndex].dist_c_ccod_ubig = ((DropDownList)item.FindControl("cboDistrito")).SelectedValue;
                Direcciones[item.RowIndex].cli_direc_c_ctipo = ((DropDownList)item.FindControl("cboTipoDireccion")).SelectedValue;

                Ubigeos[item.RowIndex].Departamento = ((DropDownList)item.FindControl("cboDepartamento")).SelectedValue.ToString();
                Ubigeos[item.RowIndex].Provincia = ((DropDownList)item.FindControl("cboProvincia")).SelectedValue.ToString();

            }
        }

        private void asignarUbigeos()
        {
            int _x = 0;
            foreach (var _fila in Direcciones)
            {
                ((TextBox)gvDireccion.Rows[_x].FindControl("txtDireccion")).Text
                    = _fila.cli_direc_c_vdirec;

                if ((Ubigeos[_x].Departamento != null || !Ubigeos[_x].Departamento.Equals("0")))
                {
                    ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDepartamento")).SelectedValue
                         = Ubigeos[_x].Departamento;
                    ((DropDownList)gvDireccion.Rows[_x].FindControl("cboProvincia")).Items.Clear();
                    ((DropDownList)gvDireccion.Rows[_x].FindControl("cboProvincia")).DataSource = _ubigeo.ListarProvincias(Ubigeos[_x].Departamento);
                    ((DropDownList)gvDireccion.Rows[_x].FindControl("cboProvincia")).DataValueField = "prov_c_ccod";
                    ((DropDownList)gvDireccion.Rows[_x].FindControl("cboProvincia")).DataTextField = "prov_c_vnomb";
                    ((DropDownList)gvDireccion.Rows[_x].FindControl("cboProvincia")).DataBind();
                    ((DropDownList)gvDireccion.Rows[_x].FindControl("cboProvincia")).Items.Insert(0, new ListItem("Provincia", "0"));

                    string provincia = ((DropDownList)gvDireccion.Rows[_x].FindControl("cboProvincia")).Items.FindByValue(Ubigeos[_x].Provincia) != null ?
                         Ubigeos[_x].Provincia : "0";

                    ((DropDownList)gvDireccion.Rows[_x].FindControl("cboProvincia")).SelectedValue = provincia;
                    ((DropDownList)gvDireccion.Rows[_x].FindControl("cboProvincia")).Enabled = true;

                    if (Ubigeos[_x].Provincia != null && !Ubigeos[_x].Provincia.Equals("0"))
                    {
                        ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDistrito")).Items.Clear();
                        ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDistrito")).DataSource = _ubigeo.ListarDistritos(Ubigeos[_x].Provincia);
                        ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDistrito")).DataValueField = "dist_c_ccod_ubig";
                        ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDistrito")).DataTextField = "dist_c_vnomb";
                        ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDistrito")).DataBind();
                        ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDistrito")).Items.Insert(0, new ListItem("Distrito", "0"));
                        ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDistrito")).SelectedValue = "0";


                        if (provincia.Equals("0"))
                        {
                            ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDistrito")).Enabled = false;
                        }
                        else
                        {
                            ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDistrito")).Enabled = true;
                            string distrito = ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDistrito")).Items.FindByValue(Direcciones[_x].dist_c_ccod_ubig) != null ? Direcciones[_x].dist_c_ccod_ubig : "0";
                            ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDistrito")).SelectedValue = distrito;
                        }
                    }
                    else
                    {
                        ((DropDownList)gvDireccion.Rows[_x].FindControl("cboProvincia")).SelectedValue = "0";
                        ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDistrito")).Enabled = false;

                    }
                }
                else
                {
                    ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDepartamento")).SelectedValue = "0";
                    ((DropDownList)gvDireccion.Rows[_x].FindControl("cboProvincia")).Enabled = false;
                }
                try
                {
                    ((DropDownList)gvDireccion.Rows[_x].FindControl("cboTipoDireccion")).SelectedValue
                    = _fila.cli_direc_c_ctipo;
                }
                catch (Exception)
                {
                    ((DropDownList)gvDireccion.Rows[_x].FindControl("cboTipoDireccion")).SelectedValue = "0";
                }
                _x++;
            }
        }

        private void salvarNombresComerciales()
        {
            NombresComerciales = new List<SIC_T_NOMB_COM>();
            NombresComerciales.Clear();
            foreach (GridViewRow item in gvNombresComerciales.Rows)
            {
                SIC_T_NOMB_COM _nomComTemp = new SIC_T_NOMB_COM();
                _nomComTemp.nomb_com_c_vnomb = ((TextBox)item.FindControl("txtNombreComercial")).Text;
                NombresComerciales.Add(_nomComTemp);
            }
        }

        private void inicializarViews()
        {
            NombresComerciales = new List<SIC_T_NOMB_COM>();
            Ubigeos = new List<Ubigeo>();
            Direcciones = new List<SIC_T_CLI_DIRECCION>();
            BorrarDirecciones = new List<SIC_T_CLI_DIRECCION>();
            Contactos = new List<SIC_T_CLI_CONTACTO>();
            BorrarContactos = new List<SIC_T_CLI_CONTACTO>();
        }

        private void limpiarCamposRegistroContacto()
        {
            txtDniContacto.Text = "";
            txtNombreContacto.Text = "";
            txtApellidoPaternoContacto.Text = "";
            txtApellidoMaternoContacto.Text = "";
            txtTelefonofijoContacto.Text = "";
            txttelefonoMovilContacto.Text = "";
            txtFechaNacimientoContacto.Text = "";
            txtEmailContacto.Text = "";
            txtObservacionesContacto.Text = "";
        }

        private void ListarContactos()
        {
            SIC_T_CLI_CONTAC_CARGO[] _cargos = _cliente.ListarCargosContacto();
            gvContactos.DataSource = Contactos;
            gvContactos.DataBind();
            int _n = 0;
            foreach (SIC_T_CLI_CONTACTO _fila in Contactos)
            {
                ((Label)gvContactos.Rows[_n].FindControl("lblNombre")).Text =
                    System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(
                    _fila.cli_contac_c_vape_pat + " " + _fila.cli_contac_c_vape_mat + ", " + _fila.cli_contac_c_vnomb
                    );
                ((Label)gvContactos.Rows[_n].FindControl("lblEmail")).Text =
                    _fila.cli_contac_c_vcorreo;
                ((Label)gvContactos.Rows[_n].FindControl("lblCargo")).Text =
                    _cargos.Where(x => x.cli_contac_cargo_c_yid == _fila.cli_contac_cargo_c_yid).First().cli_contac_cargo_c_vnomb;
                _n++;
            }
        }

        private bool ValidarCelular(string _strCel)
        {
            String expresion = "\\d{9}";
            if (Regex.IsMatch(_strCel, expresion))
            {
                if (Regex.Replace(_strCel, expresion, String.Empty).Length == 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
        private bool ValidarDni(string _strDni)
        {
            String expresion;
            expresion = "\\d{8}";
            if (Regex.IsMatch(_strDni, expresion))
            {
                if (Regex.Replace(_strDni, expresion, String.Empty).Length == 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
        private bool ValidarEmail(string email)
        {
            String expresion;
            expresion = "\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";

            if (Regex.IsMatch(email, expresion))
            {
                if (Regex.Replace(email, expresion, String.Empty).Length == 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }



        private bool ValidarNombre(string _nombre)
        {
            Regex reg = new Regex("[A-Z]");
            return reg.IsMatch(_nombre.ToUpper());
        }
        private bool ValidarApellido(string _apellido)
        {
            Regex reg = new Regex("[A-Z]");
            return reg.IsMatch(_apellido.ToUpper());
        }
        private bool ValidarTelefonoFijo(string _strtlf)
        {
            //String expresion = "\\d{2}-\\d{7}";
            string expresion = "\\d{10}";
            if (Regex.IsMatch(_strtlf, expresion))
            {
                if (Regex.Replace(_strtlf, expresion, String.Empty).Length == 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }

        private bool validarCampos()
        {
            //este métoo devuelve false si encontro errores
            //devuelve true si todo esta ok
            bool _flag = true;
            //string expresion;
            ShowMessage = string.Empty;
            /*
             * validando nombres comerciales
             */
            salvarNombresComerciales();
            salvarCamposDirecciones();

            foreach (GridViewRow _fila in gvNombresComerciales.Rows)
            {
                int asdasd = _fila.RowIndex;

                if (((TextBox)_fila.FindControl("txtNombreComercial")).Text.Trim().Length == 0)
                {
                    ShowMessage += "- Ingrese Nombre Comercial " + (asdasd + 1) + " </br>";
                    _flag = false;
                }
            }
            if (txtRazonSocial.Text.Trim().Length == 0)
            {
                ShowMessage += "- Ingrese Razón Social </br>";
                _flag = false;
            }


            string expresionDni = "\\d{8}";
            string expresionRuc = "\\d{11}";
            string expresionCarne = "\\d{6}";
            bool formatoCorrecto = true;

            /*if (cboTipoDocumento.SelectedValue == Convert.ToByte(TipoDocumentoPersona.DNI).ToString())
            {
                if (!Regex.IsMatch(txtNroRuc.Text.Trim(), expresionDni))
                {
                    ShowMessage += "- Formato de DNI incorrecto </br>";
                    ShowMessage += "- El DNI debe tener 8 dígitos </br>";
                    formatoCorrecto = false;
                    _flag = false;

                }
                //if (txtNroRuc.Text.Trim().Length != 8)
                //{
                //    ShowMessage += "- El Dni debe ser de 8 números </br>";
                //    _flag = false;

                //}
            }*/
            /* else if (cboTipoDocumento.SelectedValue == Convert.ToByte(TipoDocumentoPersona.CARNE_EXTRANJERIA).ToString())
             {
                 if (!Regex.IsMatch(txtNroRuc.Text.Trim(), expresionCarne))
                 {
                     ShowMessage += "- Formato Carné de Extranjería incorrecto </br>";
                     ShowMessage += "- El Carné de Extranjería debe tener 6 dígitos </br>";
                     formatoCorrecto = false;
                     _flag = false;

                 }
                 //if (txtNroRuc.Text.Trim().Length != 6)
                 //{
                 //    ShowMessage += "- El Carné de Extranjería debe ser de 6 números </br>";
                 //    _flag = false;

                 //}
             }*/

            /*else if (cboTipoDocumento.SelectedValue == Convert.ToByte(TipoDocumentoPersona.RUC).ToString())
            {*/
            if (!Regex.IsMatch(txtNroRuc.Text.Trim(), expresionRuc))
            {
                ShowMessage += "- Formato de Ruc incorrecto </br>";
                ShowMessage += "- El Ruc debe tener 11 dígitos</br>";
                formatoCorrecto = false;
                _flag = false;

            }
            //if (txtNroRuc.Text.Trim().Length != 11)
            //{
            //    ShowMessage += "- El Ruc debe ser de 11 números </br>";
            //    _flag = false;

            //}
            /*}*/

            if (formatoCorrecto)
            {
                if (_cliente.ContarRuc(txtNroRuc.Text.Trim()) > 0 && txtNroRuc.Enabled == true)
                {
                    ShowMessage += "- El RUC ya existe </br>";
                    _flag = false;
                }
            }

            //if (txtNumeroPartida.Text.Trim().Length == 0)
            //{
            //    ShowMessage += "- Ingrese N° de Partida </br>";
            //    _flag = false;
            //}
            //if (txtRubroDetallado.Text.Trim().Length == 0)
            //{
            //    ShowMessage += "- Ingrese Rubro Detallado </br>";
            //    _flag = false;
            //}
            //if (txtFechaAniversario.Text.Trim().Length == 0)
            //{
            //    ShowMessage += "- Ingrese Aniversario </br>";
            //    _flag = false;
            //}
            if (txtTelefono.Text.Trim().Length == 0 || txtTelefono.Text.Trim().Length > 10)
            {
                ShowMessage += "- Ingrese Teléfono correcto </br>";
                _flag = false;
            }
            //expresion = "\\d{10}";
            //if (Regex.IsMatch(txtTelefono.Text.Trim(), expresion))
            //{
            //    lblMensaje.Text += "- Formato de Teléfono incorrecto </br>";
            //    _flag = false;
            //}
            foreach (GridViewRow _fila in gvDireccion.Rows)
            {
                if (((TextBox)_fila.FindControl("txtDireccion")).Text.Length == 0)
                {
                    ShowMessage += "- Ingrese Dirección " + (_fila.RowIndex + 1) + " </br>";
                    _flag = false;
                }

                if (((DropDownList)_fila.FindControl("cboDepartamento")).SelectedValue.Equals("0"))
                {
                    ShowMessage += "- Seleccione Departamento de la Dirección " + (_fila.RowIndex + 1) + "</br>";
                    _flag = false;
                }

                if (((DropDownList)_fila.FindControl("cboProvincia")).SelectedValue.Equals("0"))
                {
                    ShowMessage += "- Seleccione Provincia de la Dirección " + (_fila.RowIndex + 1) + "</br>";
                    _flag = false;
                }

                if (((DropDownList)_fila.FindControl("cboDistrito")).SelectedValue.Equals("0"))
                {
                    ShowMessage += "- Seleccione Distrito de la Dirección " + (_fila.RowIndex + 1) + "</br>";
                    _flag = false;
                }
                if (((DropDownList)_fila.FindControl("cboTipoDireccion")).SelectedValue.Equals("0"))
                {
                    ShowMessage += "- Seleccione Tipo de Dirección " + (_fila.RowIndex + 1) + "</br>";
                    _flag = false;
                }
            }
            //if (gvContactos.Rows.Count == 0)
            //{
            //    ShowMessage += "- Ingrese por lo menos un Contacto </br>";
            //    _flag = false;
            //}
            return _flag;
        }

        private void preguardarNombresComerciales()
        {
            /*
             * este método preguarda los nombres comerciales de los clientes
             * si encuentra un nombre comercial no lo registra
             * aqui no se hace el enlace entre nombre comercial y cliente
             */
            int i = 0;
            //recorremos el grid de nombres comerciales
            foreach (var fila in gvNombresComerciales.Rows)
            {
                //validamos que contenga un nombre
                if (((TextBox)gvNombresComerciales.Rows[i].FindControl("txtNombreComercial")).Text.Trim().Length > 0)
                {
                    if (_cliente.VerificarExistenciaNombreComercial(((TextBox)gvNombresComerciales.Rows[i].FindControl("txtNombreComercial")).Text.Trim().ToUpper()) == 0)
                    {
                        SIC_T_NOMB_COM _nuevoNombre = new SIC_T_NOMB_COM();
                        _nuevoNombre.nomb_com_c_vnomb =
                            ((TextBox)gvNombresComerciales.Rows[i].FindControl("txtNombreComercial")).Text.Trim().ToUpper();
                        _cliente.RegistrarNombreComercial(_nuevoNombre);
                    }
                }
                i++;
            }
        }

        private void registrarCliente()
        {
            //verificamos que el cliente no existe
            if (_cliente.VerificarExistenciacliente(txtNroRuc.Text.Trim().ToUpper()) == 0)
            {
                SIC_T_CLIENTE _clienteNuevo = new SIC_T_CLIENTE();
                _clienteNuevo.cli_c_vdoc_id = txtNroRuc.Text.Trim().ToUpper();
                _clienteNuevo.cli_c_vraz_soc = txtRazonSocial.Text.Trim().ToUpper();
                _clienteNuevo.cli_c_vpartida = txtNumeroPartida.Text.Trim().ToUpper();
                _clienteNuevo.cli_c_vrubro = txtRubroDetallado.Text.Trim().ToUpper();
                _clienteNuevo.cli_c_ctlf = txtTelefono.Text.Trim();
                try
                {
                    _clienteNuevo.cli_c_dfec_aniv = Convert.ToDateTime(txtFechaAniversario.Text);
                }
                catch (Exception)
                {
                    _clienteNuevo.cli_c_dfec_aniv = null;
                }

                if (rbGrupoIbk.SelectedValue.Equals("1"))
                {
                    _clienteNuevo.cli_c_bgrupo_ibk = true;
                }
                else
                {
                    _clienteNuevo.cli_c_bgrupo_ibk = false;
                }
                if (cboTipoPersona.SelectedValue.Equals("1"))
                {
                    _clienteNuevo.cli_c_btipo_pers = true;
                }
                else
                {
                    _clienteNuevo.cli_c_btipo_pers = false;
                }
                _clienteNuevo.colab_c_cdoc_id = cboEjecutivo.SelectedValue;
                //_clienteNuevo.cli_scor_c_cletra = cboScoring.SelectedItem.ToString();
                _clienteNuevo.zona_rep_c_yid = Convert.ToByte(cboZonaReparto.SelectedValue.ToString());
                _clienteNuevo.cli_c_bactivo = true;

                //try
                //{
                //    _clienteNuevo.cli_c_dfec_const = Convert.ToDateTime(txtFecConstitucion.Text);
                //}
                //catch (Exception)
                //{
                //    _clienteNuevo.cli_c_dfec_const = null;
                //}

                /*al final*/

                SIC_T_CLI_RS_HISTORICO _rsHistorico = new SIC_T_CLI_RS_HISTORICO();
                _rsHistorico.cli_c_vdoc_id = _clienteNuevo.cli_c_vdoc_id;
                _rsHistorico.cli_rs_h_c_vraz_soc = _clienteNuevo.cli_c_vraz_soc;
                _cliente.RegistrarClienteRazonSocialHistorico(Convert.ToInt16(TipoOperacion.Creacion).ToString(), _rsHistorico);

                if (_cliente.InsertarCliente(_clienteNuevo))
                {
                    Mensaje("Cliente registrado con éxito", "../Imagenes/warning.png");
                }
                else
                {
                    _cliente.RegistrarClienteRazonSocialHistorico(Convert.ToInt16(TipoOperacion.Eliminacion).ToString(), _rsHistorico);
                    Mensaje("No se pudo registrar el cliente", "../Imagenes/warning.png");
                }
            }
            else
            {
                //mostramos un mensaje de que existe
                Mensaje("El RUC ya existe", "../Imagenes/warning.png");
                mvCliente.ActiveViewIndex = 1;
            }
        }

        private void registrarDirecciones()
        {
            /*registro de direcciones*/
            foreach (GridViewRow item in gvDireccion.Rows)
            {
                SIC_T_CLI_DIRECCION _cliDireccion = new SIC_T_CLI_DIRECCION();
                _cliDireccion.cli_direc_c_iid = _cliente.GenerarCodigoDireccion(txtNroRuc.Text.Trim().ToUpper());
                _cliDireccion.cli_c_vdoc_id = txtNroRuc.Text.Trim().ToUpper();
                _cliDireccion.cli_direc_c_vdirec = ((TextBox)item.FindControl("txtDireccion")).Text;
                _cliDireccion.cli_direc_c_ctipo = ((DropDownList)item.FindControl("cboTipoDireccion")).SelectedValue;
                //_cliDireccion.zona_rep_c_yid = Convert.ToByte(cboZonaReparto.SelectedValue.ToString());
                _cliDireccion.dist_c_ccod_ubig = ((DropDownList)item.FindControl("cboDistrito")).SelectedValue;
                _cliDireccion.cli_direc_c_bactivo = true;
                if (!_cliente.RegistrarDireccion(_cliDireccion))
                {
                    Mensaje("No se pudo modificar la dirección", "../Imagenes/warning.png");
                }
            }
        }

        private void enlazarNombresComerciales()
        {
            int i = 0;
            _cliente.LimparRelaciones(txtNroRuc.Text.Trim().ToUpper());
            //recorremos el grid de nombres comerciales
            foreach (var fila in gvNombresComerciales.Rows)
            {
                //validamos que contenga un nombre
                if (((TextBox)gvNombresComerciales.Rows[i].FindControl("txtNombreComercial")).Text.Trim().Length > 0)
                {
                    if (_cliente.VerificarExistenciaNombreComercial(((TextBox)gvNombresComerciales.Rows[i].FindControl("txtNombreComercial")).Text.Trim().ToUpper()) == 1)
                    {
                        SIC_T_NOMB_COM _nomCom = _cliente.BuscarNombreComercial(((TextBox)gvNombresComerciales.Rows[i].FindControl("txtNombreComercial")).Text.Trim().ToUpper());
                        if (!_cliente.CrearRelacion(txtNroRuc.Text.Trim().ToUpper(), _nomCom.nomb_com_c_iid))
                        {
                            Mensaje("No se pudo registrar la relación de Nombres Comerciales", "../Imagenes/warning.png");
                        }
                    }
                }
                i++;
            }
        }

        private void guardarContactos()
        {
            //recorremos el dt de contactos
            foreach (SIC_T_CLI_CONTACTO _fila in Contactos)
            {
                if (_fila.cli_contac_c_iid == 0)
                {
                    _fila.cli_c_vdoc_id = txtNroRuc.Text.Trim();
                    if (!_cliente.RegistrarContacto(_fila))
                    {
                        Mensaje("No se pudieron registrar los contactos", "../Imagenes/warning.png");
                    }
                }
            }
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

             
        private void modificarCliente()
        {
            /**
             * este método permite guardar
             * la información de los clientes modificados
             * 
             * */
            SIC_T_CLIENTE _clienteNod = new SIC_T_CLIENTE();
            _clienteNod.cli_c_vdoc_id = txtNroRuc.Text.Trim().ToUpper();
            //_clienteNod.cli_c_vdoc_id = _clienteNod.cli_c_vdoc_id.PadRight(11, ' ');
            _clienteNod.cli_c_vraz_soc = txtRazonSocial.Text.Trim().ToUpper();
            _clienteNod.cli_c_vpartida = txtNumeroPartida.Text.Trim().ToUpper();
            _clienteNod.cli_c_vrubro = txtRubroDetallado.Text.Trim().ToUpper();
            _clienteNod.cli_c_ctlf = txtTelefono.Text.Trim();
            try
            {
                _clienteNod.cli_c_dfec_aniv = Convert.ToDateTime(txtFechaAniversario.Text);
            }
            catch (Exception)
            {
                _clienteNod.cli_c_dfec_aniv = null;
            }
            if (rbGrupoIbk.SelectedValue.Equals("1"))
            {
                _clienteNod.cli_c_bgrupo_ibk = true;
            }
            else
            {
                _clienteNod.cli_c_bgrupo_ibk = false;
            }
            if (cboTipoPersona.SelectedValue.Equals("1"))
            {
                _clienteNod.cli_c_btipo_pers = true;
            }
            else
            {
                _clienteNod.cli_c_btipo_pers = false;
            }
            _clienteNod.colab_c_cdoc_id = cboEjecutivo.SelectedValue;
            //_clienteNod.cli_scor_c_cletra = cboScoring.SelectedItem.ToString();
            _clienteNod.zona_rep_c_yid = Convert.ToByte(cboZonaReparto.SelectedValue.ToString());
            _clienteNod.cli_c_bactivo = true;
            _clienteNod.cli_c_dfecharegistra = Convert.ToDateTime(DateTime.Now);

            //try
            //{
            //    _clienteNod.cli_c_dfec_const = Convert.ToDateTime(txtFecConstitucion.Text);
            //}
            //catch (Exception)
            //{
            //    _clienteNod.cli_c_dfec_const = null;
            //}

            /*REGISTRAMOS SOLO SI SE HA CAMBIADO DE RAZÓN SOCIAL*/
            SIC_T_CLI_RS_HISTORICO _rsHistorico = new SIC_T_CLI_RS_HISTORICO();
            _rsHistorico.cli_c_vdoc_id = _clienteNod.cli_c_vdoc_id;
            _rsHistorico.cli_rs_h_c_vraz_soc = _clienteNod.cli_c_vraz_soc;
            _cliente.RegistrarClienteRazonSocialHistorico(Convert.ToInt16(TipoOperacion.Creacion).ToString(), _rsHistorico);

            if (_cliente.ModificarCliente(_clienteNod))
            {
                Mensaje("Cliente modificado con éxito", "../Imagenes/correcto.png");
            }
            else
            {
                /*ELIMINAMOS SI AL MODIFICAR CLIENTE SE GENERÓ UN ERROR.*/
                _cliente.RegistrarClienteRazonSocialHistorico(Convert.ToInt16(TipoOperacion.Eliminacion).ToString(), _rsHistorico);
                Mensaje("El cliente no se pudo modificar", "../Imagenes/warning.png");
            }

        }

        private void modificarDirecciones()
        {
            int numcod = 0;
            foreach (SIC_T_CLI_DIRECCION _fila in Direcciones)
            {
                numcod = numcod + 1;
                if (_fila.cli_direc_c_iid.ToString().Equals(string.Empty) | _fila.cli_direc_c_iid.ToString().Equals("0"))
                {
                    //_fila.zona_rep_c_yid = Convert.ToByte(cboZonaReparto.SelectedValue);

                    if (_fila.cli_c_vdoc_id == null | _fila.cli_c_vdoc_id == string.Empty)
                    {
                        _fila.cli_c_vdoc_id = txtNroRuc.Text.Trim().ToUpper();
                    }

                    if (_fila.cli_direc_c_iid == 0)
                    {
                        if (Direcciones.IndexOf(_fila) != 0)
                        {
                            _fila.cli_direc_c_iid = _cliente.GenerarCodigoDireccion(txtNroRuc.Text.Trim().ToUpper());
                        }
                    }

                    if (_fila.cli_direc_c_bactivo == null)
                    {
                        _fila.cli_direc_c_bactivo = true;
                    }

                    if (!_cliente.RegistrarDireccion(_fila))
                    {
                        Mensaje("No se pudo registrar la dirección", "../Imagenes/warning.png");
                    }
                }
                else
                {
                    //_fila.zona_rep_c_yid = Convert.ToByte(cboZonaReparto.SelectedValue);
                    if (!_cliente.ModificarDireccion(_fila))
                    {
                        Mensaje("No se pudo modificar la dirección", "../Imagenes/warning.png");
                    }
                }

            }
            foreach (SIC_T_CLI_DIRECCION _fila in BorrarDirecciones)
            {
                _fila.cli_direc_c_bactivo = false;
                if (!_cliente.ModificarDireccion(_fila))
                {
                    Mensaje("No se pudo eliminar la dirección", "../Imagenes/warning.png");
                }
            }
        }

        private void modificarContactos()
        {
            foreach (SIC_T_CLI_CONTACTO _fila in Contactos)
            {
                if (_fila.cli_contac_c_iid > 0)
                {
                    if (!_cliente.ModificarContacto(_fila))
                    {
                        Mensaje("No se pudo modificar los contactos", "../Imagenes/warning.png");
                    }
                }

            }
            /*eliminando*/
            foreach (var _fila in BorrarContactos)
            {
                _fila.cli_contac_c_bactivo = false;
                _cliente.ModificarContacto(_fila);
            }
        }

    }
}