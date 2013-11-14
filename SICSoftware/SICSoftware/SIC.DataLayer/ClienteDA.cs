using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Objects;
using SIC.EntityLayer;
using System.Data;

namespace SIC.DataLayer
{
    public class ClienteDA
    {
        public List<SIC_T_CLIENTE> ListarClientes(byte cliGrupo, SIC_T_CLIENTE obj)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return contexto.SIC_SP_CLIENTE_LISTAR(cliGrupo, obj.cli_c_vraz_soc, obj.cli_c_vdoc_id).ToList<SIC_T_CLIENTE>();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<SIC_SP_CLIENTE_LISTAR_COLABORADORES_POR_AREA_Result> ListarColaboradoresPorArea(byte area)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return contexto.SIC_SP_CLIENTE_LISTAR_COLABORADORES_POR_AREA(area).ToList<SIC_SP_CLIENTE_LISTAR_COLABORADORES_POR_AREA_Result>();
                }
            }

            catch
            {
                throw;
            }

        }

        public SIC_T_CLI_CONTAC_CARGO[] ListarCargosContacto()
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                return (from x
                            in contexto.SIC_T_CLI_CONTAC_CARGO
                        select x).ToArray();
            }
        }

        public int VerificarExistenciaNombreComercial(string _strNombre)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    var resultado = (contexto.SIC_SP_NOMBRECOMERCIAL_BUSCAR_EXISTENCIA(_strNombre));

                    foreach (var item in resultado)
                    {
                        return Convert.ToInt32(item.Value.ToString());
                    }
                }
            }
            catch (Exception)
            {

            }
            return 0;
        }

        public int VerificarExistenciaCliente(string _strRuc)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    var resultado = (contexto.SIC_SP_CLIENTE_VERIFICAR_EXISTENCIA(_strRuc));

                    foreach (var item in resultado)
                    {
                        return Convert.ToInt32(item.Value.ToString());
                    }
                }
            }
            catch (Exception)
            {

            }
            return 0;
        }

        public bool RegistrarClienteRazonSocialHistorico(string opcion, SIC_T_CLI_RS_HISTORICO _padv_t_cli_rs_historico)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    contexto.SIC_SP_CLIENTE_MANTENIMIENTO_RAZON_SOCIAL_HISTORICO(opcion, _padv_t_cli_rs_historico.cli_c_vdoc_id, _padv_t_cli_rs_historico.cli_rs_h_c_vraz_soc);
                    contexto.SaveChanges();
                    return true;
                }
            }
            catch (Exception)
            {
                return false;
            }
            finally { }

        }

        public int GenerarCodigoDireccion(string _strRuc)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    var resultado = (contexto.SIC_SP_CLIENTE_DIRECCION_GENERARIDDIRECCION(_strRuc));

                    foreach (var item in resultado)
                    {
                        return (Convert.ToInt32(item.Value.ToString()) + 1);
                    }
                }
            }
            catch (Exception)
            {
            }
            return 0;
        }

        public bool RegistrarDireccion(SIC_T_CLI_DIRECCION _direccion)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    contexto.AddToSIC_T_CLI_DIRECCION(_direccion);
                    contexto.SaveChanges();

                } return true;
            }
            catch (Exception)
            { return false; }
        }

        public void LimparRelaciones(string _strRuc)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    contexto.SIC_SP_CLIENTE_NOMBRECOMERCIAL_LIMPIAR(_strRuc);
                    contexto.SaveChanges();
                }
            }
            catch (Exception)
            {

            }
        }

        public bool RegistrarContacto(SIC_T_CLI_CONTACTO _contacto)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    contexto.AddToSIC_T_CLI_CONTACTO(_contacto);
                    contexto.SaveChanges();
                    return true;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool ModificarCliente(SIC_T_CLIENTE _padv_t_cliente)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                SIC_T_CLIENTE l2 = (from x in contexto.SIC_T_CLIENTE
                                    where x.cli_c_vdoc_id.Trim().Equals(_padv_t_cliente.cli_c_vdoc_id.Trim())
                                    //where x.NombreCliente.Contains("texto") para hacer busqueda como un like
                                    select x).FirstOrDefault();



                contexto.ApplyCurrentValues("SICDBWEBEntities.SIC_T_CLIENTE", _padv_t_cliente);
                try
                {
                    contexto.SaveChanges();
                    return true;
                }
                catch (OptimisticConcurrencyException)
                {
                    contexto.Refresh(RefreshMode.StoreWins, _padv_t_cliente);
                    contexto.SaveChanges();
                }
                return false;
            }
        }

        public bool ModificarDireccion(SIC_T_CLI_DIRECCION _padv_t_cli_direccion)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                SIC_T_CLI_DIRECCION l2 = (from x in contexto.SIC_T_CLI_DIRECCION
                                          where x.cli_direc_c_iid == _padv_t_cli_direccion.cli_direc_c_iid &&
                                          x.cli_c_vdoc_id.Trim().Equals(_padv_t_cli_direccion.cli_c_vdoc_id.Trim())
                                          select x).FirstOrDefault();
                contexto.ApplyCurrentValues("ADVDBEntities.ADV_T_CLI_DIRECCION", _padv_t_cli_direccion);
                try
                {
                    contexto.SaveChanges();
                    return true;
                }
                catch (OptimisticConcurrencyException)
                {
                    contexto.Refresh(RefreshMode.StoreWins, _padv_t_cli_direccion);
                    contexto.SaveChanges();
                }
                return false;
            }
        }

        public bool ModificarContacto(SIC_T_CLI_CONTACTO _padv_t_cli_contacto)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
               SIC_T_CLI_CONTACTO l2 = (from x in contexto.SIC_T_CLI_CONTACTO
                                         where x.cli_c_vdoc_id == _padv_t_cli_contacto.cli_c_vdoc_id &&
                                         x.cli_contac_c_iid == _padv_t_cli_contacto.cli_contac_c_iid
                                         select x).FirstOrDefault();
                contexto.ApplyCurrentValues("ADVDBEntities.ADV_T_CLI_CONTACTO", _padv_t_cli_contacto);
                try
                {
                    contexto.SaveChanges();
                    return true;
                }
                catch (OptimisticConcurrencyException)
                {
                    contexto.Refresh(RefreshMode.StoreWins, _padv_t_cli_contacto);
                    contexto.SaveChanges();
                }
                return false;
            }
        }

        public int ContarRuc(string _strcli_c_cdoc_id)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    var resultado = (from x in contexto.SIC_SP_CLIENTE_CONTAR_RUC(_strcli_c_cdoc_id)
                                     select x);
                    foreach (var item in resultado)
                    {
                        return Convert.ToInt32(item.Value.ToString());
                    }
                }
            }
            catch (Exception)
            {

            }
            return -1;
        }

        public bool RegistrarNombreComercial(SIC_T_NOMB_COM _nombre)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    contexto.AddToSIC_T_NOMB_COM(_nombre);
                    contexto.SaveChanges();
                    return true;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }


        public bool InsertarCliente(SIC_T_CLIENTE _padv_t_cliente)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    int correlativoint = 0;
                    //Primero recuperar el correlativo de cliente
                    var Correlativo = (from x in contexto.SIC_T_CLIENTE
                                       select x.cli_c_icorrelativo).Max();

                    correlativoint = int.Parse(Correlativo.ToString());
                    _padv_t_cliente.cli_c_icorrelativo = correlativoint + 1;
                    _padv_t_cliente.cli_c_dfecharegistra = DateTime.Now;
                    contexto.AddToSIC_T_CLIENTE(_padv_t_cliente);
                    contexto.SaveChanges();
                    return true;
                }
            }
            catch (Exception)
            {
                return false;
            }
            finally { }


        }

        public SIC_T_NOMB_COM BuscarNombreComercial(string _strnombre)
        {
            //ojo debe recibir el nombre en total mayuscula
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_NOMB_COM
                            where x.nomb_com_c_vnomb.Trim().ToUpper().Equals(_strnombre)
                            select x).FirstOrDefault();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public bool CrearRelacion(string cli_c_vdoc_id, int nomb_com_c_iid)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    contexto.SIC_SP_CLIENTE_NOMBRE_REGISTRAR(cli_c_vdoc_id, nomb_com_c_iid);
                    contexto.SaveChanges();
                    return true;
                }
            }
            catch (Exception)
            {
                throw;
            }

        }

    }


}
