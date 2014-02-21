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
using SIC.Data;
using System.Text.RegularExpressions;
using SIC.UIGeneral;

namespace SIC.UserLayer.Interfaces.Mantenimiento
{
    public partial class frmRegCliente : System.Web.UI.Page
    {
        #region DECLARACION DE VARIABLES
        string ShowMessage;
        private UbigeoBL _ubigeo = null;
        private ClienteBL _cliente = null;
        //EvalCreditoBL _eCredi = new EvalCreditoBL();
        #endregion

        #region METODOS
        private bool verificarExistenciaArchivos(SIC_T_NOMB_COM nComerciales)
        {
            string directorio = @"D:\\CREDITOS";
            string directorio_creditos = directorio;//System.Configuration.ConfigurationManager.AppSettings["DIRECTORIO_USUARIO"];
            string directorio_credito_comercial = directorio_creditos + "/{0}_{1}";

            if (nComerciales.nomb_com_c_vnomb == null)
            {
                nComerciales.nomb_com_c_vnomb = "";
            }

            if (System.IO.Directory.Exists(string.Format(directorio_credito_comercial, nComerciales.nomb_com_c_iid, nComerciales.nomb_com_c_vnomb.Replace(" ", "_"))))
            {
                string[] files = System.IO.Directory.GetFiles(string.Format(directorio_credito_comercial, nComerciales.nomb_com_c_iid, nComerciales.nomb_com_c_vnomb.Replace(" ", "_")));
                return files.Length > 0;
            }

            return false;
        }

        private void asignarNombresComerciales()
        {
            int x = 0;
            foreach (SIC_T_NOMB_COM _fila in NombresComerciales)
            {
                ((TextBox)gvNombresComerciales.Rows[x].FindControl("txtNombreComercial")).Text = _fila.nomb_com_c_vnomb;
                ((Label)gvNombresComerciales.Rows[x].FindControl("lblIdNomCom")).Text = _fila.nomb_com_c_iid.ToString();
                x++;
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
        private void enlazarNombresComerciales()
        {
            int i = 0;
            //_cliente.LimparRelaciones(txtNroRuc.Text.Trim().ToUpper());
            //recorremos el grid de nombres comerciales
            foreach (var fila in gvNombresComerciales.Rows)
            {
                //validamos que contenga un nombre
                if (((TextBox)gvNombresComerciales.Rows[i].FindControl("txtNombreComercial")).Text.Trim().Length > 0)
                {
                    int IdNomCom = Convert.ToInt32(((Label)gvNombresComerciales.Rows[i].FindControl("lblIdNomCom")).Text);
                    if (IdNomCom == 0)
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
        private void crearDirectorioxNomComerciales(SIC_T_NOMB_COM _nomCom, string nomComerAnti, bool actualizar)
        {
            string directorio = @"D:\\CREDITOS";
            string directorio_creditos = directorio;//System.Configuration.ConfigurationManager.AppSettings["DIRECTORIO_USUARIO"];
            string directorio_credito_comercial = directorio_creditos + "/{0}_{1}";

            if (!System.IO.Directory.Exists(directorio_creditos))
            {
                System.IO.Directory.CreateDirectory(directorio_creditos);
            }

            if (!System.IO.Directory.Exists(string.Format(directorio_credito_comercial, _nomCom.nomb_com_c_iid, nomComerAnti.Replace(" ", "_"))))
            {
                System.IO.Directory.CreateDirectory(string.Format(directorio_credito_comercial, _nomCom.nomb_com_c_iid, nomComerAnti.Replace(" ", "_")));
            }
            else
            {
                if (_nomCom.nomb_com_c_vnomb != nomComerAnti)
                {
                    string directorioActual = string.Format(directorio_credito_comercial, _nomCom.nomb_com_c_iid, nomComerAnti.Replace(" ", "_"));
                    string directorioModificado = string.Format(directorio_credito_comercial, _nomCom.nomb_com_c_iid, _nomCom.nomb_com_c_vnomb.Replace(" ", "_"));
                    System.IO.Directory.Move(directorioActual, directorioModificado);
                }
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
        private void inicializarNuevoCliente()
        {
            cboTipoPersona.Items.Clear();
            ListItem li = new ListItem();
            ListItem li2 = new ListItem();
            li.Text = "NATURAL";
            li.Value = "0";
            cboTipoPersona.Items.Add(li);
            li2.Text = "JURÍDICA";
            li2.Value = "1";
            cboTipoPersona.Items.Add(li2);
            cboTipoPersona.DataBind();

            gvNombresComerciales.DataSource = NombresComerciales;
            gvNombresComerciales.DataBind();

            chkCliente.Checked = true;
            chkProveedor.Checked = false;

            gvDireccion.DataSource = Direcciones;
            gvDireccion.DataBind();

            listarDepartamentos();

            UIPage.Fill(_cliente.ListarColaboradoresPorArea(Convert.ToByte(6)), "colab_c_cdoc_id", "colab_c_vnomb_completo", cboEjecutivo, " ", "0");

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
            //cboScoring.SelectedValue = "A";
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
            cboCargoContacto.Style.Add("text-transform", "uppercase");

            cboCargoContacto.DataBind();
            txtFechaNacimientoContacto.Attributes.Add("readonly", "readonly");
            txtFechaAniversario.Attributes.Add("readonly", "readonly");
            txtFecConstitucion.Attributes.Add("readonly", "readonly");

            gvContactos.DataSource = "";
            gvContactos.DataBind();
        }
        private void inicializarViews()
        {
            NombresComerciales = new List<SIC_T_NOMB_COM>();
            BorrarNombresComerciales = new List<SIC_T_NOMB_COM>();
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
            cboTipoDoc.SelectedValue = "1";
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

                LlenarTipoDireccion(_x);

                if (lblAccion.Text == "NUEVO")
                {
                    ((DropDownList)gvDireccion.Rows[_x].FindControl("cboProvincia")).Enabled = false;
                    ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDistrito")).Enabled = false;
                }

                _x++;
            }
        }
        private void LlenarTipoDireccion(int idx)
        {
            ((DropDownList)gvDireccion.Rows[idx].FindControl("cboTipoDireccion")).Items.Clear();
            ((DropDownList)gvDireccion.Rows[idx].FindControl("cboTipoDireccion")).Items.Insert(0, new ListItem("Tipo", "0"));
            ((DropDownList)gvDireccion.Rows[idx].FindControl("cboTipoDireccion")).Items.Insert(1, new ListItem("Fiscal", "1"));
            ((DropDownList)gvDireccion.Rows[idx].FindControl("cboTipoDireccion")).Items.Insert(2, new ListItem("Sucursal", "2"));
            ((DropDownList)gvDireccion.Rows[idx].FindControl("cboTipoDireccion")).Items.Insert(3, new ListItem("Facturación", "3"));
            ((DropDownList)gvDireccion.Rows[idx].FindControl("cboTipoDireccion")).DataBind();
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



            if (cboTipoPersona.SelectedValue.Equals("1"))
            {
                _clienteNod.cli_c_btipo_pers = true;
            }
            else
            {
                _clienteNod.cli_c_btipo_pers = false;
            }
            _clienteNod.colab_c_cdoc_id = null;
            //_clienteNod.cli_scor_c_cletra = cboScoring.SelectedItem.ToString();
            _clienteNod.zona_rep_c_yid = Convert.ToByte(cboZonaReparto.SelectedValue.ToString());
            _clienteNod.cli_c_bactivo = true;
            _clienteNod.cli_c_dfechaactualiza = Convert.ToDateTime(DateTime.Now);

            try
            {
                _clienteNod.cli_c_dfec_const = Convert.ToDateTime(txtFecConstitucion.Text);
            }
            catch (Exception)
            {
                _clienteNod.cli_c_dfec_const = null;
            }
            _clienteNod.cli_c_bcliente = chkCliente.Checked;
            _clienteNod.cli_c_bproveedor = chkProveedor.Checked;

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



        private void preguardarNombresComerciales()
        {
            string _strRazSoc = txtRazonSocial.Text;
            SIC_T_CLIENTE _tCliente = _cliente.BuscarCliente(_strRazSoc);

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
                    SIC_T_NOMB_COM _nuevoNombre = NombresComerciales[i];
                    if (_nuevoNombre.nomb_com_c_iid == 0)
                    {
                        _nuevoNombre = new SIC_T_NOMB_COM();
                        _nuevoNombre.nomb_com_c_vnomb = ((TextBox)gvNombresComerciales.Rows[i].FindControl("txtNombreComercial")).Text.Trim().ToUpper();

                        if (_cliente.RegistrarNombreComercial(_nuevoNombre))
                        {
                            //crearDirectorioxNomComerciales(_nuevoNombre, _nuevoNombre.nomb_com_c_vnomb, false);
                        }
                    }
                    else
                    {
                        string _nombreAnterior = string.Empty;
                        _nombreAnterior = NombresComerciales[i].nomb_com_c_vnomb;

                        _nuevoNombre.nomb_com_c_vnomb = ((TextBox)gvNombresComerciales.Rows[i].FindControl("txtNombreComercial")).Text.Trim().ToUpper();

                        if (_cliente.ModificarNombreComercial(_nuevoNombre))
                        {
                            //crearDirectorioxNomComerciales(_nuevoNombre, _nombreAnterior, true);
                        }
                    }
                }
                i++;
            }

            //string directorio = @"D:\\CREDITOS";
            //string directorio_creditos = directorio;//System.Configuration.ConfigurationManager.AppSettings["DIRECTORIO_USUARIO"];
            //string directorio_credito_comercial = directorio_creditos + "/{0}_{1}";
            //foreach (var nComerciales in BorrarNombresComerciales)
            //{
            //    _cliente.RomperRelacion(_tCliente.cli_c_vdoc_id, nComerciales.nomb_com_c_iid);
            //    System.IO.Directory.Delete(string.Format(directorio_credito_comercial, nComerciales.nomb_com_c_iid, nComerciales.nomb_com_c_vnomb.Replace(" ", "_")));
            //}

            BorrarNombresComerciales.Clear();
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
                _clienteNuevo.cli_c_dfecharegistra = DateTime.Now;
                try
                {
                    _clienteNuevo.cli_c_dfec_aniv = Convert.ToDateTime(txtFechaAniversario.Text);
                }
                catch (Exception)
                {
                    _clienteNuevo.cli_c_dfec_aniv = null;
                }

                if (cboTipoPersona.SelectedValue.Equals("1"))
                {
                    _clienteNuevo.cli_c_btipo_pers = true;
                }
                else
                {
                    _clienteNuevo.cli_c_btipo_pers = false;
                }
                _clienteNuevo.colab_c_cdoc_id = null;
                //_clienteNuevo.cli_scor_c_cletra = cboScoring.SelectedItem.ToString();
                _clienteNuevo.zona_rep_c_yid = Convert.ToByte(cboZonaReparto.SelectedValue.ToString());
                _clienteNuevo.cli_c_bactivo = true;

                try
                {
                    _clienteNuevo.cli_c_dfec_const = Convert.ToDateTime(txtFecConstitucion.Text);
                }
                catch (Exception)
                {
                    _clienteNuevo.cli_c_dfec_const = null;
                }

                _clienteNuevo.colab_c_cdoc_id = null;
                _clienteNuevo.cli_c_bproveedor = chkProveedor.Checked;
                _clienteNuevo.cli_c_bcliente = chkCliente.Checked;
                /*al final*/

                SIC_T_CLI_RS_HISTORICO _rsHistorico = new SIC_T_CLI_RS_HISTORICO();
                _rsHistorico.cli_c_vdoc_id = _clienteNuevo.cli_c_vdoc_id;
                _rsHistorico.cli_rs_h_c_vraz_soc = _clienteNuevo.cli_c_vraz_soc;
                _cliente.RegistrarClienteRazonSocialHistorico(Convert.ToInt16(TipoOperacion.Creacion).ToString(), _rsHistorico);


                if (_cliente.InsertarCliente(_clienteNuevo))
                {
                    Mensaje("Cliente registrado con éxito", "../Imagenes/correcto.png");
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
        private void salvarNombresComerciales()
        {
            NombresComerciales.Clear();
            foreach (GridViewRow item in gvNombresComerciales.Rows)
            {
                SIC_T_NOMB_COM _nomComTemp = new SIC_T_NOMB_COM();
                _nomComTemp.nomb_com_c_vnomb = ((TextBox)item.FindControl("txtNombreComercial")).Text;
                _nomComTemp.nomb_com_c_iid = Convert.ToInt32(((Label)item.FindControl("lblIdNomCom")).Text);

                NombresComerciales.Add(_nomComTemp);
            }
        }
        private bool validarCampos()
        {
            //este métoo devuelve false si encontro errores
            //devuelve true si todo esta ok
            bool _flag = true;
            int contDir = 0;
            //string expresion;
            ShowMessage = string.Empty;
            /*
             * validando nombres comerciales
             */

            if (!chkCliente.Checked & !chkProveedor.Checked)
            {
                ShowMessage = "- Debe seleccionar por lo menos una función, si la empresa es Cliente o Proveedor </br>";
                _flag = false;
            }

            string _strRazSoc = txtRazonSocial.Text;
            SIC_T_CLIENTE _tCliente = _cliente.BuscarCliente(_strRazSoc);
            if (_tCliente == null)
            {
                salvarNombresComerciales();
                salvarCamposDirecciones();
            }


            List<string> _ListaExistenteNombresComerciales = new List<string>();
            foreach (GridViewRow _fila in gvNombresComerciales.Rows)
            {
                int idx = _fila.RowIndex;

                string nomComer = ((TextBox)_fila.FindControl("txtNombreComercial")).Text;
                if (nomComer.Trim().Length == 0)
                {
                    ShowMessage += "- Ingrese Nombre Comercial " + (idx + 1) + " </br>";
                    _flag = false;
                }
                else
                {
                    _ListaExistenteNombresComerciales.Add(nomComer.Trim());
                }
            }

            foreach (string nomc in _ListaExistenteNombresComerciales)
            {
                int _Existen = (from n in _ListaExistenteNombresComerciales where n == nomc select n).Count();
                if (_Existen > 1)
                {
                    ShowMessage += "- El nombre comercial " + nomc + " ya existe, revisar. </br>";
                    _flag = false;
                    break;
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
            /* TODO: HABILITAR CUANDO SE ACTIVE WORKFLOW COMERCIAL
            if (txtNumeroPartida.Text.Trim().Length == 0)
            {
                ShowMessage += "- Ingrese N° de Partida </br>";
                _flag = false;
            }
             
            if (txtRubroDetallado.Text.Trim().Length == 0)
            {
                ShowMessage += "- Ingrese Rubro Detallado </br>";
                _flag = false;
            }*/

            if (txtTelefono.Text.Trim().Length == 0 || txtTelefono.Text.Trim().Length > 10)
            {
                ShowMessage += "- Ingrese Teléfono correcto </br>";
                _flag = false;
            }

            /* TODO: HABILITAR CUANDO SE ACTIVE WORKFLOW COMERCIAL
            
            if (txtFecConstitucion.Text.Trim().Length == 0)
            {
                ShowMessage += "- Ingrese Fecha de Constitución </br>";
                _flag = false;
            }*/

            //if (cboEjecutivo.SelectedValue == "0") {
            //    ShowMessage += "- Seleccione ejecutivo de cobranza </br>";
            //    _flag = false;
            //}
            //expresion = "\\d{10}";
            //if (Regex.IsMatch(txtTelefono.Text.Trim(), expresion))
            //{
            //    lblMensaje.Text += "- Formato de Teléfono incorrecto </br>";
            //    _flag = false;
            //}
            List<string> _ListaTipoDireccion = new List<string>();
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
                else if (((DropDownList)_fila.FindControl("cboTipoDireccion")).SelectedValue.Equals("1"))
                {
                    _ListaTipoDireccion.Add(((DropDownList)_fila.FindControl("cboTipoDireccion")).SelectedValue);
                }
                else if (((DropDownList)_fila.FindControl("cboTipoDireccion")).SelectedValue.Equals("3"))
                {
                    contDir += 1;
                }
            }


            if (_ListaTipoDireccion.Count == 0)
            {
                ShowMessage += "- Debe ingresar por lo menos una dirección fiscal </br>";
                _flag = false;
            }
            else if (_ListaTipoDireccion.Count > 1)
            {
                ShowMessage += "- Solo debe ingresar una dirección fiscal </br>";
                _flag = false;
            }
            else if (contDir < 1)
            {
                ShowMessage += "- Debe Ingresar una dirección de facturación </br>";
                _flag = false;
            }

            /* TODO: HABILITAR CUANDO SE ACTIVE WORKFLOW COMERCIAL 
            if (gvContactos.Rows.Count == 0)
            {
                ShowMessage += "- Ingrese por lo menos un Contacto </br>";
                _flag = false;
            }*/

            return _flag;
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
        private bool ValidarCarnetExtranjeria(string _carnet)
        {
            Regex reg = new Regex("[A-Z0-9]");
            return reg.IsMatch(_carnet.ToUpper());
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
        #endregion

        #region EVENTOS
        public frmRegCliente()
        {
            _ubigeo = new UbigeoBL();
            _cliente = new ClienteBL();
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
            EscenarioContacto = TipoOperacion.Creacion;
            mvCliente.ActiveViewIndex = 2;
        }
        protected void btnAgregarNombreComercial_Click(object sender, EventArgs e)
        {
            string _strRazSoc = txtRazonSocial.Text;
            SIC_T_CLIENTE _tCliente = _cliente.BuscarCliente(_strRazSoc);
            //if (_tCliente == null)
            //{
            salvarNombresComerciales();
            //}

            SIC_T_NOMB_COM _nomComTemp = new SIC_T_NOMB_COM();
            NombresComerciales.Add(_nomComTemp);
            gvNombresComerciales.DataSource = NombresComerciales;
            gvNombresComerciales.DataBind();
            asignarNombresComerciales();
            mvCliente.ActiveViewIndex = 1;
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            ListarClientes();
        }

        private void ListarClientes()
        {
            gvLista.DataSource = _cliente.ListarClientes(
            new SIC_T_CLIENTE() { cli_c_vraz_soc = txtFiltroRazonSocial.Text, cli_c_vdoc_id = txtRuc.Text });
            gvLista.DataBind();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            ListarClientes();
            NombresComerciales.Clear();
            gvLista.EditIndex = -1;
            ListarClientes();
            Escenario = TipoOperacion.Listar;

            limpiarViewsTodos();
            mvCliente.ActiveViewIndex = 0;

        }
        private void limpiarViewsTodos()
        {
            ViewState["vsNombresComerciales"] = null;
            ViewState["vsBorrarNombresComerciales"] = null;
            ViewState["vsDirecciones"] = null;
            ViewState["vsBorrarDirecciones"] = null;
            ViewState["vsContactos"] = null;
            ViewState["vsBorrarContactos"] = null;
            ViewState["vsUbigeos"] = null;
        }

        protected void btnCancelarContacto_Click(object sender, EventArgs e)
        {

            limpiarCamposRegistroContacto();
            gvContactos.EditIndex = -1;
            ListarContactos();
            mvCliente.ActiveViewIndex = 1;

        }

        private bool Validar_Contacto_RepLegal_GerenteGeneral(string accion, int index)
        {
            bool _flag = true;
            ShowMessage = string.Empty;
            int cont01 = 0;
            int cont02 = 0;
            int _n = 0;
            string validar = string.Empty;
            if (index != -1)
            {
                validar = ((Label)gvContactos.Rows[index].FindControl("lblCargo")).Text.ToString();
            }

            foreach (SIC_T_CLI_CONTACTO _fila in Contactos)
            {

                string cargo = ((Label)gvContactos.Rows[_n].FindControl("lblCargo")).Text.ToString();
                if (cargo == "Representante legal")
                {
                    cont01 += 1;
                }
                if (cargo == "Gerente General")
                {
                    cont02 += 1;
                }
                _n++;
            }

            if (accion == "Guardar")
            {
                if (cont01 < 1 && cont02 < 1)
                {
                    ShowMessage = "Debe Registrar un Contacto con Cargo Representante legal o Gerente General";
                    Mensaje(ShowMessage, "../Imagenes/warning.png");
                    upMensaje.Update();
                    _flag = false;
                }
            }
            else
            {
                if (validar == "Representante legal" || validar == "Gerente General")
                {
                    if (accion == "Eliminar")
                    {
                        if (cont01 == 1 && cont02 == 0)
                        {
                            ShowMessage = "Debe Tener Registrado un Contacto con Cargo Representante legal o Gerente General";
                            Mensaje(ShowMessage, "../Imagenes/warning.png");
                            upMensaje.Update();
                            _flag = false;
                        }
                        if (cont01 == 0 && cont02 == 1)
                        {
                            ShowMessage = "Debe Tener Registrado un Contacto con Cargo Representante legal o Gerente General";
                            Mensaje(ShowMessage, "../Imagenes/warning.png");
                            upMensaje.Update();
                            _flag = false;
                        }
                    }
                }
            }


            return _flag;
        }


        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            NombresComerciales.Add(new SIC_T_NOMB_COM());
            Direcciones.Add(new SIC_T_CLI_DIRECCION());
            Ubigeos.Add(new Ubigeo());
            lblAccion.Text = "NUEVO"; //ES NECESARIO PARA DESHABILITAR O HABILITAR COMBOS UBIGEO.
            inicializarNuevoCliente();
            Escenario = TipoOperacion.Creacion;
            //cboTipoDocumento.Enabled = true;
            mvCliente.ActiveViewIndex = 1;


            gvNombresComerciales.Columns[2].Visible = false;

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

                    gvLista.EditIndex = -1;
                }

                limpiarViewsTodos();

                gvLista.EditIndex = -1;
                ListarClientes();
                mvCliente.ActiveViewIndex = 0;

                txtNroRuc.ReadOnly = false;
                txtNroRuc.Enabled = false;
            }
            else
            {
                Mensaje(ShowMessage, "../Imagenes/warning.png");
                mvCliente.ActiveViewIndex = 1;
            }
        }
        private void modificarDirecciones()
        {
            salvarCamposDirecciones();
            int numcod = 0;

            List<SIC_T_CLI_DIRECCION> listDireccion = _cliente.ListarDireccionesList(txtNroRuc.Text.Trim().ToUpper());

            bool estado = true;

            foreach (var item in listDireccion)
            {
                SIC_T_CLI_DIRECCION _Data = new SIC_T_CLI_DIRECCION();
                _Data.cli_c_vdoc_id = item.cli_c_vdoc_id;
                _Data.cli_direc_c_iid = item.cli_direc_c_iid;
                if (!_cliente.EliminarDireccion(_Data))
                {
                    estado = false;
                }
            }




            if (estado)
            {
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

            //foreach (SIC_T_CLI_DIRECCION _fila in Direcciones)
            //{
            //    numcod = numcod + 1;
            //    if (_fila.cli_direc_c_iid.ToString().Equals(string.Empty) | _fila.cli_direc_c_iid.ToString().Equals("0"))
            //    {
            //        //_fila.zona_rep_c_yid = Convert.ToByte(cboZonaReparto.SelectedValue);

            //        if (_fila.cli_c_vdoc_id == null | _fila.cli_c_vdoc_id == string.Empty)
            //        {
            //            _fila.cli_c_vdoc_id = txtNroRuc.Text.Trim().ToUpper();
            //        }

            //        if (_fila.cli_direc_c_iid == 0)
            //        {
            //            if (Direcciones.IndexOf(_fila) != 0)
            //            {
            //                _fila.cli_direc_c_iid = _cliente.GenerarCodigoDireccion(txtNroRuc.Text.Trim().ToUpper());
            //            }
            //        }

            //        if (_fila.cli_direc_c_bactivo == null)
            //        {
            //            _fila.cli_direc_c_bactivo = true;
            //        }

            //        if (!_cliente.RegistrarDireccion(_fila))
            //        {
            //            Mensaje("No se pudo registrar la dirección", "../Imagenes/warning.png");
            //        }
            //    }
            //else
            //{
            //    //_fila.zona_rep_c_yid = Convert.ToByte(cboZonaReparto.SelectedValue);
            //    if (!_cliente.ModificarDireccion(_fila))
            //    {
            //        Mensaje("No se pudo modificar la dirección", "../Imagenes/warning.png");
            //    }
            //}

            // }
            //foreach (SIC_T_CLI_DIRECCION _fila in BorrarDirecciones)
            //{
            //    _fila.cli_direc_c_bactivo = false;
            //    if (!_cliente.ModificarDireccion(_fila))
            //    {
            //        Mensaje("No se pudo eliminar la dirección", "../Imagenes/warning.png");
            //    }
            //}

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
        protected void btnGuardarContacto_Click(object sender, EventArgs e)
        {
            bool _validator = false;

            //if (cboTipoDoc.SelectedValue == "1")
            //{
            //    if (!ValidarDni(txtDniContacto.Text.Trim()))
            //    {
            //        lblValidarDni.Text = "Formato de Dni incorrecto";
            //        _validator = true;
            //    }
            //    else
            //    {
            //        lblValidarDni.Text = "";
            //    }

            //}

            //if (cboTipoDoc.SelectedValue == "2")
            //{
            //    if (!ValidarCarnetExtranjeria(txtDniContacto.Text.Trim().ToUpper()))
            //    {
            //        lblValidarDni.Text = "Formato de Carnet de Extranjeria incorrecto";
            //        _validator = true;
            //    }
            //    else
            //    {
            //        lblValidarDni.Text = "";
            //    }
            //}

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
                lblValidarApellido.Text = "";
            }

            if (cboTipoDoc.SelectedValue == "1")
            {
                if (!ValidarApellido(txtApellidoMaternoContacto.Text.Trim()))
                {
                    lblValidarApellidoMaterno.Text = "Ingrese apellido correcto";
                    _validator = true;
                }
                else
                {
                    lblValidarApellidoMaterno.Text = "";
                }

            }

            if (cboTipoDoc.SelectedValue == "2")
            {

                lblValidarApellidoMaterno.Text = "";
            }


            //if (txtFechaNacimientoContacto.Text.Length == 0)
            //{
            //    lblValidarFechaNac.Text = "Ingrese fecha de nacimiento";
            //    _validator = true;
            //}
            //else
            //{
            //    lblValidarFechaNac.Text = string.Empty;
            //}

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

                if (txtFechaNacimientoContacto.Text != string.Empty)
                {
                    _contactoTemp.cli_contac_c_dfec_cump = Convert.ToDateTime(txtFechaNacimientoContacto.Text);
                }

                _contactoTemp.cli_contac_c_vcorreo = txtEmailContacto.Text;

                if (txtFechaNacimientoContacto.Text.Length != 0)
                {
                    _contactoTemp.cli_contac_c_dfec_cump = Convert.ToDateTime(txtFechaNacimientoContacto.Text);

                }
                else
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
                if (txtFechaNacimientoContacto.Text.Length != 0)
                {
                    Contactos[gvContactos.EditIndex].cli_contac_c_dfec_cump = Convert.ToDateTime(txtFechaNacimientoContacto.Text);
                }
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

            bool estado = Validar_Contacto_RepLegal_GerenteGeneral("Guardar", gvContactos.Rows.Count - 1);
            if (!estado)
            {
                lblContacto.Text = "NUEVO CONTACTO";
                EscenarioContacto = TipoOperacion.Creacion;
                mvCliente.ActiveViewIndex = 2;
            }
            else
            {
                mvCliente.ActiveViewIndex = 1;
            }


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
        protected void gvContactos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (Contactos[e.RowIndex].cli_contac_c_iid > 0)
            {
                BorrarContactos.Add(Contactos[e.RowIndex]);
            }

            if (Validar_Contacto_RepLegal_GerenteGeneral("Eliminar", e.RowIndex))
            {
                Contactos.RemoveAt(e.RowIndex);
            }

            ListarContactos();
            mvCliente.ActiveViewIndex = 1;
            upGeneral.Update();
        }
        protected void gvContactos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            string valor = Contactos[e.NewEditIndex].cli_contac_c_cdoc_id;

            if (Contactos[e.NewEditIndex].cli_contac_c_cdoc_id.Trim().Length == 8)
            {

                cboTipoDoc.SelectedValue = "1";
                txtDniContacto.MaxLength = 8;
                txtDniContacto_FilteredTextBoxExtender.ValidChars = "0123456789";

                txtDniContacto.Text = valor;
            }
            else
            {
                if (Contactos[e.NewEditIndex].cli_contac_c_cdoc_id.Trim().Length == 12)
                {
                    cboTipoDoc.SelectedValue = "2";
                    txtDniContacto.MaxLength = 12;
                    txtDniContacto_FilteredTextBoxExtender.ValidChars = "abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789";
                    txtDniContacto.Text = valor.ToUpper();
                }
            }

            txtNombreContacto.Text = Contactos[e.NewEditIndex].cli_contac_c_vnomb;
            txtApellidoPaternoContacto.Text = Contactos[e.NewEditIndex].cli_contac_c_vape_pat;
            txtApellidoMaternoContacto.Text = Contactos[e.NewEditIndex].cli_contac_c_vape_mat;
            txtTelefonofijoContacto.Text = Contactos[e.NewEditIndex].cli_contac_c_ctlf;
            txttelefonoMovilContacto.Text = Contactos[e.NewEditIndex].cli_contac_c_ccel;
            txtEmailContacto.Text = Contactos[e.NewEditIndex].cli_contac_c_vcorreo;
            txtFechaNacimientoContacto.Text = string.Format("{0:dd/MM/yyyy}", Contactos[e.NewEditIndex].cli_contac_c_dfec_cump);
            cboCargoContacto.SelectedValue = Contactos[e.NewEditIndex].cli_contac_cargo_c_yid.ToString();
            txtObservacionesContacto.Text = Contactos[e.NewEditIndex].cli_contac_c_vobserv;
            lblContacto.Text = "EDITAR CONTACTO";

            EscenarioContacto = TipoOperacion.Modificacion;
            mvCliente.ActiveViewIndex = 2;
            upGeneral.Update();

        }
        protected void gvDireccion_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (gvDireccion.Rows.Count > 1)
            {
                salvarCamposDirecciones();
                if (Direcciones[e.RowIndex].cli_direc_c_iid != 0)
                {
                    BorrarDirecciones.Add(Direcciones[e.RowIndex]);
                }
                Ubigeos.RemoveAt(e.RowIndex);
                Direcciones.RemoveAt(e.RowIndex);
                gvDireccion.DataSource = Direcciones;
                gvDireccion.DataBind();
                listarDepartamentos();
                asignarUbigeos();
            }
            mvCliente.ActiveViewIndex = 1;
        }
        protected void gvLista_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvLista.PageIndex = e.NewPageIndex;
            ListarClientes();
            //mvCliente.ActiveViewIndex = 0;

        }

        protected void gvLista_RowEditing(object sender, GridViewEditEventArgs e)
        {
            EditarCliente(e.NewEditIndex);
        }

        private void EditarCliente(int idx)
        {
            lblAccion.Text = "EDITAR";
            Escenario = TipoOperacion.Modificacion;


            gvNombresComerciales.Columns[2].Visible = true;

            limpiarViewsTodos();
            inicializarViews();
            inicializarNuevoCliente();
            SIC_T_CLIENTE _tCliente = _cliente.BuscarCliente(gvLista.Rows[idx].Cells[1].Text); ;

            if (Convert.ToBoolean(_tCliente.cli_c_btipo_pers))
            {
                cboTipoPersona.SelectedValue = "1";
            }
            else
            {
                cboTipoPersona.SelectedValue = "0";
            }
            txtRazonSocial.Text = _tCliente.cli_c_vraz_soc;
            txtNroRuc.Text = _tCliente.cli_c_vdoc_id;

            //if (txtNroRuc.Text.Length <= 6)
            //{
            //    cboTipoDocumento.SelectedValue = Convert.ToByte(TipoDocumentoPersona.CARNE_EXTRANJERIA).ToString();
            //}
            //else if (txtNroRuc.Text.Length <= 8)
            //{
            //    cboTipoDocumento.SelectedValue = Convert.ToByte(TipoDocumentoPersona.DNI).ToString();
            //}
            //else
            //{
            //    cboTipoDocumento.SelectedValue = Convert.ToByte(TipoDocumentoPersona.RUC).ToString();
            //}

            //cboTipoDocumento.Enabled = false;

            txtNumeroPartida.Text = _tCliente.cli_c_vpartida;
            txtRubroDetallado.Text = _tCliente.cli_c_vrubro;


            txtFechaAniversario.Text = string.Format("{0:dd/MM/yyyy}", _tCliente.cli_c_dfec_aniv);
            //cboEjecutivo.SelectedValue = _tCliente.colab_c_cdoc_id;
            //cboScoring.SelectedValue = _tCliente.cli_scor_c_cletra;
            txtFecConstitucion.Text = string.Format("{0:dd/MM/yyyy}", _tCliente.cli_c_dfec_const);

            string zonareparto = _tCliente.zona_rep_c_yid.ToString();

            if ((zonareparto == null))
            {
                cboZonaReparto.SelectedIndex = 0;
            }
            else if ((zonareparto == ""))
            {
                cboZonaReparto.SelectedIndex = 0;
            }

            else
            {
                cboZonaReparto.SelectedValue = _tCliente.zona_rep_c_yid.ToString();
            }
            chkProveedor.Checked = Convert.ToBoolean(_tCliente.cli_c_bproveedor);
            chkCliente.Checked = Convert.ToBoolean(_tCliente.cli_c_bcliente);
            txtTelefono.Text = _tCliente.cli_c_ctlf;

            ListarNomComerciales();
            ListarDirecciones();

            listarDepartamentos();
            //if (Direcciones.Count > 0)
            //{
            //    cboZonaReparto.SelectedValue = Direcciones[0].zona_rep_c_yid.ToString();
            //}


            Contactos = _cliente.ListarContactosList(_tCliente.cli_c_vdoc_id);

            ListarContactos();

            EscenarioContacto = TipoOperacion.Modificacion;
            txtNroRuc.Enabled = false;
            txtNroRuc.ReadOnly = true;
            mvCliente.ActiveViewIndex = 1;
            upGeneral.Update();
        }

        private void ListarNomComerciales()
        {
            NombresComerciales = _cliente.ListarNombresComerciales(txtNroRuc.Text);
            gvNombresComerciales.DataSource = NombresComerciales;
            gvNombresComerciales.DataBind();
        }

        private void ListarDirecciones()
        {
            Direcciones = _cliente.ListarDireccionesList(txtNroRuc.Text);
            gvDireccion.DataSource = Direcciones;
            gvDireccion.DataBind();

            int _x = 0;
            Ubigeo _ubigeoTemporal = null;
            foreach (var fila in Direcciones)
            {
                ((TextBox)gvDireccion.Rows[_x].FindControl("txtDireccion")).Text
                    = fila.cli_direc_c_vdirec;
                SIC_T_DISTRITO _distrito = _ubigeo.BuscarDistrito(fila.dist_c_ccod_ubig);
                SIC_T_PROVINCIA _provincia = _ubigeo.BuscarProvincia(_distrito.prov_c_ccod);
                SIC_T_DEPARTAMENTO _departamento = _ubigeo.BuscarDepartamento(_provincia.depa_c_ccod);
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDepartamento")).SelectedValue
                     = _departamento.depa_c_ccod;
                _ubigeoTemporal = new Ubigeo();
                _ubigeoTemporal.Departamento = _departamento.depa_c_ccod;
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboProvincia")).DataSource
                    = _ubigeo.ListarProvincias(_departamento.depa_c_ccod);
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboProvincia")).DataTextField = "prov_c_vnomb";
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboProvincia")).DataValueField = "prov_c_ccod";
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboProvincia")).DataBind();
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboProvincia")).SelectedValue
                    = _provincia.prov_c_ccod;
                _ubigeoTemporal.Provincia = _provincia.prov_c_ccod;
                Ubigeos.Add(_ubigeoTemporal);
                //distrito
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDistrito")).DataSource
                    = _ubigeo.ListarDistritos(_distrito.prov_c_ccod);
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDistrito")).DataTextField = "dist_c_vnomb";
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDistrito")).DataValueField = "dist_c_ccod_ubig";
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDistrito")).DataBind();
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboDistrito")).SelectedValue
                    = _distrito.dist_c_ccod_ubig;

                //tipo direccion
                ((DropDownList)gvDireccion.Rows[_x].FindControl("cboTipoDireccion")).SelectedValue
                    = fila.cli_direc_c_ctipo;
                _x++;
            }

            listarDepartamentos();
            asignarUbigeos();
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
        protected void gvLista_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                SIC_T_CLIENTE _tCliente = _cliente.BuscarCliente(Server.HtmlDecode(gvLista.Rows[e.RowIndex].Cells[1].Text));
                _tCliente.cli_c_bactivo = false;
                _cliente.DeshabilitarCliente(_tCliente);
                Mensaje("Cliente Eliminado con éxito", "../Imagenes/correcto.png");
                ListarClientes();
            }

            catch (Exception exc)
            {
                Mensaje(exc.InnerException.Message, "../Imagenes/warning.png");
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (ViewState["vsNombresComerciales"] != null)
            {
                NombresComerciales = (List<SIC_T_NOMB_COM>)ViewState["vsNombresComerciales"];
            }
            else
            {
                NombresComerciales = new List<SIC_T_NOMB_COM>();
            }

            if (ViewState["vsBorrarNombresComerciales"] != null)
            {
                BorrarNombresComerciales = (List<SIC_T_NOMB_COM>)ViewState["vsBorrarNombresComerciales"];
            }
            else
            {
                BorrarNombresComerciales = new List<SIC_T_NOMB_COM>();
            }

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

            if (ViewState["vsUbigeos"] != null)
            {
                Ubigeos = (List<Ubigeo>)ViewState["vsUbigeos"];
            }
            else
            {
                Ubigeos = new List<Ubigeo>();
            }
            if (ViewState["vsEscenario"] != null)
            {
                Escenario = (TipoOperacion)ViewState["vsEscenario"];
            }
            else
            {
                Escenario = TipoOperacion.Listar;
            }
            if (ViewState["vsEscenarioContacto"] != null)
            {
                EscenarioContacto = (TipoOperacion)ViewState["vsEscenarioContacto"];
            }
            else
            {
                EscenarioContacto = TipoOperacion.Listar;
            }

            if (!Page.IsPostBack)
            {
                ListarClientes();
                mvCliente.ActiveViewIndex = 0;

                UIPage.Fill(_cliente.Listar_DocumentosIdentidad().Where(x => x.par_det_c_iid != Convert.ToInt32(DocumentoPersona.RUC))
                    , "par_det_c_iid", "par_det_c_vdesc", cboTipoDoc, string.Empty, "0");
                cboTipoDoc_SelectedIndexChanged(sender, e);
            }
            //cboCentroComercial.DataSource = _local.ListarInmuebles();
            //cboCentroComercial.DataValueField = "inm_c_icod";
            //cboCentroComercial.DataTextField = "inm_c_vnomb";
            //cboCentroComercial.DataBind();


            //if (Escenario == TipoOperacion.Modificacion)
            //{
            //    cboTipoDocumento.Enabled = false;
            //}
            //else
            //{
            //    cboTipoDocumento.Enabled = true;
            //}

        }
        private void Page_PreRender(object sender, EventArgs e)
        {
            ViewState.Add("vsNombresComerciales", NombresComerciales);
            ViewState.Add("vsBorrarNombresComerciales", BorrarNombresComerciales);
            ViewState.Add("vsDirecciones", Direcciones);
            ViewState.Add("vsBorrarDirecciones", BorrarDirecciones);
            ViewState.Add("vsUbigeos", Ubigeos);
            ViewState.Add("vsContactos", Contactos);
            ViewState.Add("vsBorrarContactos", BorrarContactos);
            ViewState.Add("vsEscenario", Escenario);
            ViewState.Add("vsEscenarioContacto", EscenarioContacto);
        }
        #endregion

        #region PROPIEDADES
        private List<SIC_T_NOMB_COM> NombresComerciales
        {
            get { return (List<SIC_T_NOMB_COM>)ViewState["vsNombresComerciales"]; }
            set { ViewState["vsNombresComerciales"] = value; }
        }
        private List<SIC_T_NOMB_COM> BorrarNombresComerciales
        {
            get { return (List<SIC_T_NOMB_COM>)ViewState["vsBorrarNombresComerciales"]; }
            set { ViewState["vsBorrarNombresComerciales"] = value; }
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

        //private List<SIC_T_CLI_CONTAC_CARGO> ListarCargoContFiltro
        //{
        //    get { return (List<SIC_T_CLI_CONTAC_CARGO>)ViewState["vsListarCargoContFiltro"]; }
        //    set { ViewState["vsListarCargoContFiltro"] = value; }
        //}

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

        #region CLASES ANIDADAS
        [Serializable()]
        private class Ubigeo
        {
            public string Departamento { get; set; }
            public string Provincia { get; set; }
            //public string Departamento 
            //{
            //    get { return _lDepartamento; }
            //    set { _lDepartamento = value; }

            //}
            //public string Provincia
            //{
            //    get { return _lProvincia; }
            //    set { _lProvincia = value; }
            //}
        #endregion
        }

        protected void gvLista_RowCreated(object sender, GridViewRowEventArgs e)
        {
            ResaltarGrilla(e);

            //COMIENZO DE VALIDACION PARA QUE SE MUESTRE UN CONFIRM ANTES DE ELIMINAR UN CLIENTE
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // loop all data rows
                foreach (DataControlFieldCell cell in e.Row.Cells)
                {
                    // check all cells in one row
                    foreach (Control control in cell.Controls)
                    {
                        // Must use LinkButton here instead of ImageButton
                        // if you are having Links (not images) as the command button.
                        ImageButton button = control as ImageButton;

                        if (button != null && button.CommandName == "Delete")
                            // Add delete confirmation
                            button.OnClientClick = "if (!confirm('¿Está seguro de " +
                                "eliminar el cliente?')) return;";
                    }
                }
            }
            //FIN DE LA VALIDACION
        }
        private static void ResaltarGrilla(GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='D4E3F7';this.style.cursor='hand';");
                //e.Row.Attributes.Add("onmouseover", "this.style.textDecoration='underline';this.style.cursor='hand';");
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;this.style.cursor='cursor';");
                //e.Row.Attributes.Add("onmouseout", "this.style.textDecoration='none';this.style.cursor='cursor';");
            }
        }

        protected void gvContactos_RowCreated(object sender, GridViewRowEventArgs e)
        {
            ResaltarGrilla(e);
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


        protected void cboTipoPersona_SelectedIndexChanged(object sender, EventArgs e)
        {

            //if (cboTipoPersona.SelectedValue == "0")
            //{
            //    cboTipoDocumento.SelectedIndex = 0;
            //    cboTipoDocumento.Enabled = true;
            //    mvCliente.ActiveViewIndex = 1;
            //}
            //else if (cboTipoPersona.SelectedValue == "1")
            //{
            //    cboTipoDocumento.SelectedIndex = 2;
            //    cboTipoDocumento.Enabled = false;
            //    mvCliente.ActiveViewIndex = 1;
            //}

            // 

        }


        protected void gvNombresComerciales_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int idx = Convert.ToInt32(e.CommandArgument);
            SIC_T_NOMB_COM oNomComer = NombresComerciales[idx];

            switch (e.CommandName)
            {
                case "remover":
                    if (verificarExistenciaArchivos(oNomComer))
                    {
                        Mensaje("El directorio no está vació, por favor eliminar todo su contenido", "../Imagenes/warning.png");
                        upMensaje.Update();
                    }
                    else
                    {
                        salvarNombresComerciales();
                        if (NombresComerciales.Count > 1)
                        {
                            if (oNomComer.nomb_com_c_iid != 0)
                            {
                                BorrarNombresComerciales.Add(oNomComer);
                            }

                            NombresComerciales.RemoveAt(idx);
                            gvNombresComerciales.DataSource = NombresComerciales;
                            gvNombresComerciales.DataBind();
                            asignarNombresComerciales();

                        }
                    }
                    break;
                case "eval":
                    Response.Redirect("~/Interfaces/CreditosYCobranzas/frmCreYCobEvalCliente.aspx?nueva_eval=true&IdNomCom="
                    + oNomComer.nomb_com_c_iid + "&IdCliente=" + txtNroRuc.Text + "&Pa=cliente");
                    break;
                default:
                    break;
            }



            mvCliente.ActiveViewIndex = 1;
        }

        protected void gvNombresComerciales_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int IdNomCom = Convert.ToInt32(((Label)e.Row.FindControl("lblIdNomCom")).Text);
                //List<ADV_SP_EVAL_CREDITO_OBT_CLIENTE_NOMB_COMERCIAL_Result> _ListaNombreComercial = new List<ADV_SP_EVAL_CREDITO_OBT_CLIENTE_NOMB_COMERCIAL_Result>();
                //_ListaNombreComercial = _eCredi.ObtClienteNombreComercial(IdNomCom, txtNroRuc.Text, 0);

                //ADV_SP_EVAL_CREDITO_OBT_CLIENTE_NOMB_COMERCIAL_Result _CrediNombreComercial = null;
                //    if (_ListaNombreComercial.Count > 0)
                //    {
                //        _CrediNombreComercial = _ListaNombreComercial[0];
                //    }

                //    if (_CrediNombreComercial != null)
                //    {
                //        if (!_CrediNombreComercial.eval_cred_c_dfec_registro.HasValue)
                //        {
                //            e.Row.Cells[2].Visible = false;//true;
                //            e.Row.Cells[3].Visible = false;
                //        }
                //        else
                //        {
                //            e.Row.Cells[2].Visible = false;
                //            e.Row.Cells[3].Visible = false;//true;
                //        }
                //    }
                //    else
                //    {
                //        e.Row.Cells[2].Visible = false;//true;
                //        e.Row.Cells[3].Visible = false;
                //    }


            }
        }

        protected void gvNombresComerciales_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //int IdNomCom = Convert.ToInt32(((Label)gvNombresComerciales.Rows[e.NewEditIndex].FindControl("lblIdNomCom")).Text);

            //Response.Redirect("~/Interfaces/CreditosYCobranzas/frmCreYCobEvalCliente.aspx?nueva_eval=true&IdNomCom="
            //        + IdNomCom + "&IdCliente=" + txtNroRuc.Text + "&Pa=cliente");
        }

        protected void cboTipoDoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboTipoDoc.SelectedValue == Convert.ToInt16(DocumentoPersona.DNI).ToString())
            {
                lbl.Text = "(*)";
                txtDniContacto.MaxLength = 8;
                txtDniContacto_FilteredTextBoxExtender.ValidChars = "0123456789";
                txtDniContacto.Text = "";
            }

            if (cboTipoDoc.SelectedValue == Convert.ToInt16(DocumentoPersona.CARNE_EXTRANJERIA).ToString())
            {
                lbl.Text = "";
                txtDniContacto.MaxLength = 12;
                txtDniContacto_FilteredTextBoxExtender.ValidChars = "abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789";
            }
            upMen.Update();
            up.Update();
        }

    }

}