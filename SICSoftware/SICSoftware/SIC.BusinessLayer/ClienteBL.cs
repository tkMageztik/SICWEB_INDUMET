using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using SIC.DataLayer;
using System.Data;

namespace SIC.BusinessLayer
{
    public class ClienteBL
    {
        #region "METODOS"
        public DataTable ListarColaboradoresPorArea(int _intCodigoArea)
        {
            return new ClienteDA().ListarColaboradoresPorArea(_intCodigoArea);
        }

        //public List<SIC_SP_CLIENTES_CONSULTAR_Result> ListarClientesCobranzas(string pcli_c_btipo_pers, string pcli_c_vraz_soc, int pcli_c_bgrupo_ibk, string pcli_c_vdoc_id, DateTime? pcli_c_dfecharegistraini, DateTime? pcli_c_dfecharegistrafin, int pcli_c_tdocumento)
        //{
        //    return new ClienteDA().ListarClientesCobranzas(pcli_c_btipo_pers, pcli_c_vraz_soc, pcli_c_bgrupo_ibk, pcli_c_vdoc_id, pcli_c_dfecharegistraini, pcli_c_dfecharegistrafin, pcli_c_tdocumento);
        //}

        public List<SIC_T_CLIENTE> ListarClientesAlt(){
            return new ClienteDA().ListarClientesAlt(); 
        }



        public List<SIC_SP_CLIENTE_LISTAR_COLABORADORES_POR_AREA_Result> ListarColaboradoresPorArea(byte area)
        {
            return new ClienteDA().ListarColaboradoresPorArea(area);
        }

        public SIC_T_CLI_CONTAC_CARGO[] ListarCargosContacto()
        {
            return new ClienteDA().ListarCargosContacto();
        }
        public SIC_T_CLI_CONTAC_CARGO BuscarCargoContacto(byte _id)
        {
            return new ClienteDA().BuscarCargoContacto(_id);
        }

        //public SIC_T_CLI_CONTAC_CARGO[] ListaCargoRepLegGenGer()
        //{
        //    return new ClienteDA().ListaCargoRepLegGenGer();
        //}
        public SIC_T_ZONA_REPARTO BuscarClienteZonaReparto(byte _id)
        {
            return new ClienteDA().BuscarClienteZonaReparto(_id);
        }

        public SIC_T_CLI_DIRECCION BuscarDireccion(int _intcli_direc_c_iid, string _strcli_c_cdoc_id)
        {
            return new ClienteDA().BuscarDireccion(_intcli_direc_c_iid, _strcli_c_cdoc_id);
        }

        public SIC_T_CLI_DIRECCION BuscarDireccionTipo(string _strcli_direc_c_ctipo, string _strcli_c_cdoc_id)
        {
            return new ClienteDA().BuscarDireccionTipo(_strcli_direc_c_ctipo, _strcli_c_cdoc_id);
        }
        public SIC_T_CLI_SCORING[] ListarScorings()
        {
            return new ClienteDA().ListarScorings();
        }
        public SIC_VW_CLIENTE_LISTA[] ListarClientes()
        {
            return new ClienteDA().ListarCLiente();
        }
        public bool RomperRelacion(string cli_c_cdoc_id, int nomb_com_c_iid)
        {
            return new ClienteDA().RomperRelacion(cli_c_cdoc_id, nomb_com_c_iid);
        }
        public bool CrearRelacion(string cli_c_vdoc_id, int nomb_com_c_iid)
        {
            return new ClienteDA().CrearRelacion(cli_c_vdoc_id, nomb_com_c_iid);
        }
        public bool RegistrarNombreComercial(SIC_T_NOMB_COM _nombre)
        {
            return new ClienteDA().RegistrarNombreComercial(_nombre);
        }
        public bool ModificarNombreComercial(SIC_T_NOMB_COM _nombre)
        {
            return new ClienteDA().ModificarNombreComercial(_nombre);
        }
        public bool RegistrarContacto(SIC_T_CLI_CONTACTO _contacto)
        {
            return new ClienteDA().RegistrarContacto(_contacto);
        }
        public SIC_T_NOMB_COM ObtenerNombreComercialCliente(string _strnombre, string _cli_c_vdoc_id)
        {
            return new ClienteDA().ObtenerNombreComercialCliente(_strnombre, _cli_c_vdoc_id);
        }
        public SIC_T_NOMB_COM BuscarNombreComercial(string _strnombre)
        {
            return new ClienteDA().BuscarNombreComercial(_strnombre);
        }
        public SIC_T_NOMB_COM BuscarNombreComercial(int _intcod)
        {
            return new ClienteDA().BuscarNombreComercial(_intcod);
        }
        public int BuscarRelacion(string cli_c_cdoc_id, int nomb_com_c_iid)
        {
            return new ClienteDA().BuscarRelacion(cli_c_cdoc_id, nomb_com_c_iid);
        }
        public SIC_T_CLIENTE BuscarCliente(string _strRazSoc)
        {
            return new ClienteDA().BuscarCliente(_strRazSoc);
        }
        public SIC_T_CLIENTE BuscarClientexRuc(string _ruc)
        {
            return new ClienteDA().BuscarClientexRuc(_ruc);
        }

        public List<SIC_T_NOMB_COM> ListarNombresComerciales(string codCliente)
        {
            return new ClienteDA().ListarNombresComerciales(codCliente);
        }

        public List<SIC_T_PARAMETRO_DET> Listar_DocumentosIdentidad()
        {
            return new ClienteDA().Listar_DocumentosIdentidad();
        }
        public SIC_T_CLI_DIRECCION[] ListarDireccionesArray(string _strRucCli)
        {
            return new ClienteDA().ListarDireccionesArray(_strRucCli);
        }
        public List<SIC_T_CLI_DIRECCION> ListarDireccionesList(string _strRucCli)
        {
            return new ClienteDA().ListarDireccionesList(_strRucCli);
        }
        public SIC_T_CLI_CONTACTO[] ListarContactos(string _strRucCli)
        {
            return new ClienteDA().ListarContactos(_strRucCli);
        }
        public List<SIC_T_CLI_CONTACTO> ListarContactosList(string _strRucCli)
        {
            return new ClienteDA().ListarContactosList(_strRucCli);
        }
        public SIC_T_CLI_CONTACTO BuscarContacto(int _intcli_contac_c_iid, string _strcli_c_cdoc_id)
        {
            return new ClienteDA().BuscarContacto(_intcli_contac_c_iid, _strcli_c_cdoc_id);
        }
        public int VerificarExistenciaNombreComercial(string _strNombre)
        {
            return new ClienteDA().VerificarExistenciaNombreComercial(_strNombre);
        }
        public int VerificarExistenciacliente(string _strRuc)
        {
            return new ClienteDA().VerificarExistenciaCliente(_strRuc);
        }
        public bool InsertarCliente(SIC_T_CLIENTE _pSIC_T_cliente)
        {
            return new ClienteDA().InsertarCliente(_pSIC_T_cliente);
        }

        public bool RegistrarClienteRazonSocialHistorico(string opcion, SIC_T_CLI_RS_HISTORICO _pSIC_T_cli_rs_historico)
        {
            return new ClienteDA().RegistrarClienteRazonSocialHistorico(opcion, _pSIC_T_cli_rs_historico);
        }

        public int GenerarCodigoDireccion(string _strRuc)
        {
            return new ClienteDA().GenerarCodigoDireccion(_strRuc);
        }
        public bool RegistrarDireccion(SIC_T_CLI_DIRECCION _direccion)
        {
            return new ClienteDA().RegistrarDireccion(_direccion);
        }
        public void LimparRelaciones(string _strRuc)
        {
            new ClienteDA().LimparRelaciones(_strRuc);
        }
        public bool ModificarCliente(SIC_T_CLIENTE _pSIC_T_cliente)
        {
            return new ClienteDA().ModificarCliente(_pSIC_T_cliente);
        }

        public int DeshabilitarCliente(SIC_T_CLIENTE _pSIC_T_cliente)
        {
            return new ClienteDA().DeshabilitarCliente(_pSIC_T_cliente);
        }
        public bool ModificarDireccion(SIC_T_CLI_DIRECCION _pSIC_T_cli_direccion)
        {
            return new ClienteDA().ModificarDireccion(_pSIC_T_cli_direccion);
        }
        public bool LimpiarDirecciones(string _strRuc)
        {
            return new ClienteDA().LimpiarDirecciones(_strRuc);
        }
        public bool LimpiarContactos(string _strRuc)
        {
            return new ClienteDA().LimpiarContactos(_strRuc);
        }

        public List<string> ListarRazSocClientesLista()
        {
            return new ClienteDA().ListarRazSocClientesList();
        }
        public string[] ListarRazSocClientes()
        {
            return new ClienteDA().ListarRazSocClientes();
        }
        public int ContarRuc(string _strcli_c_cdoc_id)
        {
            return new ClienteDA().ContarRuc(_strcli_c_cdoc_id);
        }
        public bool ModificarContacto(SIC_T_CLI_CONTACTO _pSIC_T_cli_contacto)
        {
            return new ClienteDA().ModificarContacto(_pSIC_T_cli_contacto);
        }

        public List<SIC_SP_CLIENTE_LISTAR_Result> ListarClientes(SIC_T_CLIENTE obj)
        {
            return new ClienteDA().ListarClientes(obj);
        }

        public SIC_T_CLI_DIRECCION DireccionPorRuc(string _strcli_c_cdoc_id)
        {
            return new ClienteDA().DireccionPorRuc(_strcli_c_cdoc_id);
        }

        public bool EliminarDireccion(SIC_T_CLI_DIRECCION _Prop_Inm)
        {
            return new ClienteDA().EliminarDireccion(_Prop_Inm);
        }


        public List<SIC_T_CLIENTE> ListarProveedor()
        {
            return new ClienteDA().ListarProveedor();
        }

        #endregion
    }
}
