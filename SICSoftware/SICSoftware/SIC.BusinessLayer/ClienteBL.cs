using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using SIC.DataLayer;

namespace SIC.BusinessLayer
{
    public class ClienteBL
    {
        public List<SIC_T_CLIENTE> ListarClientes(byte cliGrupo, SIC_T_CLIENTE obj)
        {
            return new ClienteDA().ListarClientes(cliGrupo, obj);          
        }

        public List<SIC_SP_CLIENTE_LISTAR_COLABORADORES_POR_AREA_Result> ListarColaboradoresPorArea(byte area)
        {
            return new ClienteDA().ListarColaboradoresPorArea(area);
        }

        public SIC_T_CLI_CONTAC_CARGO[] ListarCargosContacto()
        {
            return new ClienteDA().ListarCargosContacto();
        }
        public int VerificarExistenciaNombreComercial(string _strNombre)
        {
            return new ClienteDA().VerificarExistenciaNombreComercial(_strNombre);
        }

        public int VerificarExistenciacliente(string _strRuc)
        {
            return new ClienteDA().VerificarExistenciaCliente(_strRuc);
        }

        public bool RegistrarClienteRazonSocialHistorico(string opcion, SIC_T_CLI_RS_HISTORICO _padv_t_cli_rs_historico)
        {
            return new ClienteDA().RegistrarClienteRazonSocialHistorico(opcion, _padv_t_cli_rs_historico);
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

        public bool RegistrarContacto(SIC_T_CLI_CONTACTO _contacto)
        {
            return new ClienteDA().RegistrarContacto(_contacto);
        }

        public bool ModificarCliente(SIC_T_CLIENTE _padv_t_cliente)
        {
            return new ClienteDA().ModificarCliente(_padv_t_cliente);
        }

        public bool ModificarDireccion(SIC_T_CLI_DIRECCION _padv_t_cli_direccion)
        {
            return new ClienteDA().ModificarDireccion(_padv_t_cli_direccion);
        }

        public bool ModificarContacto(SIC_T_CLI_CONTACTO _padv_t_cli_contacto)
        {
            return new ClienteDA().ModificarContacto(_padv_t_cli_contacto);
        }


        public int ContarRuc(string _strcli_c_cdoc_id)
        {
            return new ClienteDA().ContarRuc(_strcli_c_cdoc_id);
        }
        public bool RegistrarNombreComercial(SIC_T_NOMB_COM _nombre)
        {
            return new ClienteDA().RegistrarNombreComercial(_nombre);
        }

        public bool InsertarCliente(SIC_T_CLIENTE _padv_t_cliente)
        {
            return new ClienteDA().InsertarCliente(_padv_t_cliente);
        }

        public SIC_T_NOMB_COM BuscarNombreComercial(string _strnombre)
        {
            return new ClienteDA().BuscarNombreComercial(_strnombre);
        }


        public bool CrearRelacion(string cli_c_vdoc_id, int nomb_com_c_iid)
        {
            return new ClienteDA().CrearRelacion(cli_c_vdoc_id, nomb_com_c_iid);
        }

    }
}
