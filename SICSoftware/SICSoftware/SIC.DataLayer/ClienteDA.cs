﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Objects;
using SIC.EntityLayer;
using System.Data;
using SIC.Data;
using SIC.UIGeneral;

namespace SIC.DataLayer
{
    public class ClienteDA
    {
        #region "Métodos"

        public List<SIC_T_CLIENTE> ListarClientes(SIC_T_CLIENTE obj)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return contexto.SIC_SP_CLIENTE_LISTAR(obj.cli_c_vraz_soc, obj.cli_c_vdoc_id, obj.cli_c_bcliente, obj.cli_c_bproveedor).ToList<SIC_T_CLIENTE>();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }


        public List<SIC_T_CLIENTE> ListarClientesAlt()
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_CLIENTE
                            where x.cli_c_bactivo == true && x.cli_c_bcliente == true
                            select x).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<SIC_T_CLIENTE> ListarProveedor()
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_CLIENTE
                            where x.cli_c_bactivo == true && x.cli_c_bproveedor == true
                            select x).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public SIC_T_CLIENTE BuscarProveedor(String ruc)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_CLIENTE
                            where x.cli_c_bactivo == true && x.cli_c_bproveedor == true
                            & x.cli_c_vdoc_id == ruc
                            select x).FirstOrDefault<SIC_T_CLIENTE>();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }



        public SIC_T_CLIENTE BuscarCliente(string _strRazSoc)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_CLIENTE
                            where x.cli_c_vraz_soc.Trim().Equals(_strRazSoc) &&
                            x.cli_c_bactivo == true
                            select x).FirstOrDefault();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
        public SIC_T_CLIENTE BuscarClientexRuc(string _ruc)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_CLIENTE
                            where x.cli_c_vdoc_id.Trim().Equals(_ruc) &&
                            x.cli_c_bactivo == true
                            select x).FirstOrDefault();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public SIC_T_CLI_CONTAC_CARGO BuscarCargoContacto(byte _id)
        {
            try
            {
                using (SICDBWEBEntities contacto = new SICDBWEBEntities())
                {
                    return (from x in contacto.SIC_T_CLI_CONTAC_CARGO
                            where x.cli_contac_cargo_c_yid == _id
                            select x).FirstOrDefault();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public SIC_T_ZONA_REPARTO BuscarClienteZonaReparto(byte _id)
        {
            try
            {
                using (SICDBWEBEntities contacto = new SICDBWEBEntities())
                {
                    return (from p in contacto.SIC_T_ZONA_REPARTO
                            where p.zona_rep_c_yid == _id
                            select p).FirstOrDefault();
                }
            }
            catch (Exception)
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

        //public SIC_T_CLI_CONTAC_CARGO[] ListaCargoRepLegGenGer() 
        //{ 
        //    using(SICDBWEBEntities contexto=new SICDBWEBEntities())
        //    {
        //        return (from x in contexto.SIC_T_CLI_CONTAC_CARGO
        //                where x.cli_contac_cargo_c_yid == 1 || x.cli_contac_cargo_c_yid==2
        //            select x).ToArray();
        //    }
        //}


        public SIC_T_CLI_CONTACTO[] ListarContactos(string _strRucCli)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                return (from x in contexto.SIC_T_CLI_CONTACTO
                        where x.cli_c_vdoc_id.Trim().Equals(_strRucCli.Trim()) &&
                        x.cli_contac_c_bactivo == true
                        select x).ToArray();
            }
        }
        public List<SIC_T_CLI_CONTACTO> ListarContactosList(string _strRucCli)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                return (from x in contexto.SIC_T_CLI_CONTACTO
                        where x.cli_c_vdoc_id.Trim().Equals(_strRucCli.Trim()) &&
                        x.cli_contac_c_bactivo == true
                        select x).ToList();
            }
        }
        public SIC_T_CLI_CONTACTO BuscarContacto(int _intcli_contac_c_iid, string _strcli_c_cdoc_id)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                return (from x in contexto.SIC_T_CLI_CONTACTO
                        where x.cli_contac_c_iid == _intcli_contac_c_iid &&
                        x.cli_c_vdoc_id.Trim().Equals(_strcli_c_cdoc_id.Trim())
                        select x).FirstOrDefault();
            }
        }
        public SIC_T_CLI_DIRECCION[] ListarDireccionesArray(string _strRucCli)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_CLI_DIRECCION
                            where x.cli_c_vdoc_id.Trim().Equals(_strRucCli.Trim()) &&
                            x.cli_direc_c_bactivo == true
                            select x).ToArray();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
        public List<SIC_T_CLI_DIRECCION> ListarDireccionesList(string _strRucCli)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_CLI_DIRECCION
                            where x.cli_c_vdoc_id.Trim().Equals(_strRucCli.Trim()) &&
                            x.cli_direc_c_bactivo == true
                            select x).ToList();
                }
            }
            catch (Exception)
            {
                return null;
            }
        }
        public SIC_T_CLI_DIRECCION BuscarDireccion(int _intcli_direc_c_iid, string _strcli_c_cdoc_id)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_CLI_DIRECCION
                            where x.cli_direc_c_iid == _intcli_direc_c_iid &&
                            x.cli_c_vdoc_id.Trim().Equals(_strcli_c_cdoc_id.Trim())
                            select x).FirstOrDefault();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public SIC_T_CLI_DIRECCION BuscarDireccionTipo(string _strcli_direc_c_ctipo, string _strcli_c_cdoc_id)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_CLI_DIRECCION
                            where x.cli_direc_c_ctipo == _strcli_direc_c_ctipo &&
                            x.cli_c_vdoc_id.Trim().Equals(_strcli_c_cdoc_id.Trim())
                            select x).FirstOrDefault();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public SIC_T_COLABORADOR[] ListarColaboradoresPorArea2(int _intCodigoArea)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                return (from x in contexto.SIC_T_COLABORADOR
                        where x.colab_area_c_yid == _intCodigoArea
                        select x).ToArray();
            }
        }
        public SIC_T_CLI_SCORING[] ListarScorings()
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                return (from x
                            in contexto.SIC_T_CLI_SCORING
                        select x).ToArray();
            }
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
                            select x).OrderByDescending(n => n.nomb_com_c_iid).FirstOrDefault();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        public SIC_T_NOMB_COM BuscarNombreComercial(int _intcod)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_NOMB_COM
                            where x.nomb_com_c_iid == _intcod
                            select x).FirstOrDefault();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
        public SIC_T_NOMB_COM ObtenerNombreComercialCliente(string _strnombre, string _cli_c_vdoc_id)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return contexto.SIC_SP_NOMB_COMER_OBTENER_POR_NOMBRE(_strnombre, _cli_c_vdoc_id).FirstOrDefault();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
        public SIC_T_NOMB_COM[] ListarNombresComerciales()
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                return (from x in contexto.SIC_T_NOMB_COM
                        select x).ToArray();
            }
        }

        public List<SIC_T_PARAMETRO_DET> Listar_DocumentosIdentidad()
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                List<int> lista = UIUtil.EnumToList<DocumentoPersona>();

                return (from x in contexto.SIC_T_PARAMETRO_DET
                        where
                        lista.Contains(x.par_det_c_iid)
                        select x).ToList<SIC_T_PARAMETRO_DET>();
            }

        }


        public List<SIC_T_NOMB_COM> ListarNombresComerciales(string codCliente)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                return contexto.SIC_SP_NOMBRE_COMERCIAL_LISTAR(codCliente).ToList<SIC_T_NOMB_COM>();
            }
        }

        public DataTable ListarColaboradoresPorArea(int _intCodigoArea)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Value");
            dt.Columns.Add("Nombre");
            SIC_T_COLABORADOR[] colaboradores = null;
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                colaboradores = (from x in contexto.SIC_T_COLABORADOR
                                 where x.colab_area_c_yid == _intCodigoArea
                                 select x).ToArray();
                foreach (SIC_T_COLABORADOR item in colaboradores)
                {
                    DataRow dr = dt.NewRow();
                    dr[0] = Convert.ToString(item.colab_c_cdoc_id);
                    dr[1] = Convert.ToString(item.colab_c_vape_pat + " " + item.colab_c_vape_mat + " ," + item.colab_c_vnomb);
                    dt.Rows.Add(dr);
                }
            }
            return dt;
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
        //public List<SIC_SP_CLIENTES_CONSULTAR_Result> ListarClientesCobranzas(string pcli_c_btipo_pers, string pcli_c_vraz_soc, int pcli_c_bgrupo_ibk, string pcli_c_vdoc_id, DateTime? pcli_c_dfecharegistraini, DateTime? pcli_c_dfecharegistrafin, int pcli_c_tdocumento)
        //{
        //    try
        //    {
        //        using (SICDBWEBEntities contexto = new SICDBWEBEntities())
        //        {
        //            return contexto.SIC_SP_CLIENTES_CONSULTAR(pcli_c_btipo_pers, pcli_c_vraz_soc, pcli_c_bgrupo_ibk, pcli_c_vdoc_id, pcli_c_dfecharegistraini, pcli_c_dfecharegistrafin, pcli_c_tdocumento).ToList<SIC_SP_CLIENTES_CONSULTAR_Result>();
        //        }
        //    }

        //    catch
        //    {
        //        throw;
        //    }
        //}
        public SIC_VW_CLIENTE_LISTA[] ListarCLiente()
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                var query = (from x in contexto.SIC_VW_CLIENTE_LISTA
                             select x);
                return query.ToArray();
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
        public bool InsertarCliente(SIC_T_CLIENTE _pSIC_T_cliente)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    contexto.AddToSIC_T_CLIENTE(_pSIC_T_cliente);
                    contexto.SaveChanges();
                    return true;
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally { }


        }

        public bool RegistrarClienteRazonSocialHistorico(string opcion, SIC_T_CLI_RS_HISTORICO _pSIC_T_cli_rs_historico)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    contexto.SIC_SP_CLIENTE_MANTENIMIENTO_RAZON_SOCIAL_HISTORICO(opcion, _pSIC_T_cli_rs_historico.cli_c_vdoc_id, _pSIC_T_cli_rs_historico.cli_rs_h_c_vraz_soc);
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
        public bool LimpiarContactos(string _strRuc)
        {
            /*
             * este método consume un SP que recibe
             * el ruc del cliente y borra todos los contactos
             * relacionadas con dicho ruc
             */
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    contexto.SIC_SP_CLIENTE_CONTACTO_LIMPIAR(_strRuc);
                    contexto.SaveChanges();
                    return true;
                }

            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool LimpiarDirecciones(string _strRuc)
        {
            /*
             este método consume un SP que recibe
             * el ruc del cliente y borra todas las direcciones
             * relacionadas con dicho ruc
             */
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    contexto.SIC_SP_CLIENTE_DIRECCION_LIMPIAR(_strRuc);
                    contexto.SaveChanges();
                    return true;
                }

            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool ModificarCliente(SIC_T_CLIENTE _pSIC_T_cliente)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                SIC_T_CLIENTE l2 = (from x in contexto.SIC_T_CLIENTE
                                    where x.cli_c_vdoc_id.Trim().Equals(_pSIC_T_cliente.cli_c_vdoc_id.Trim())
                                    //where x.NombreCliente.Contains("texto") para hacer busqueda como un like
                                    select x).FirstOrDefault();
                _pSIC_T_cliente.cli_c_dfecharegistra = l2.cli_c_dfecharegistra;

                contexto.ApplyCurrentValues("SICDBWEBEntities.SIC_T_CLIENTE", _pSIC_T_cliente);
                try
                {
                    contexto.SaveChanges();
                    return true;
                }
                catch (OptimisticConcurrencyException)
                {
                    contexto.Refresh(RefreshMode.StoreWins, _pSIC_T_cliente);
                    contexto.SaveChanges();
                }
                return false;
            }
        }
        public int DeshabilitarCliente(SIC_T_CLIENTE _pSIC_T_cliente)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return contexto.SIC_SP_DESHABILITAR_CLIENTE(_pSIC_T_cliente.cli_c_vdoc_id);
                }
            }

            catch { throw; }

        }
        public bool ModificarContacto(SIC_T_CLI_CONTACTO _pSIC_T_cli_contacto)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                SIC_T_CLI_CONTACTO l2 = (from x in contexto.SIC_T_CLI_CONTACTO
                                         where x.cli_c_vdoc_id == _pSIC_T_cli_contacto.cli_c_vdoc_id &&
                                         x.cli_contac_c_iid == _pSIC_T_cli_contacto.cli_contac_c_iid
                                         select x).FirstOrDefault();
                contexto.ApplyCurrentValues("SICDBWEBEntities.SIC_T_CLI_CONTACTO", _pSIC_T_cli_contacto);
                try
                {
                    contexto.SaveChanges();
                    return true;
                }
                catch (OptimisticConcurrencyException)
                {
                    contexto.Refresh(RefreshMode.StoreWins, _pSIC_T_cli_contacto);
                    contexto.SaveChanges();
                }
                return false;
            }
        }
        public bool ModificarDireccion(SIC_T_CLI_DIRECCION _pSIC_T_cli_direccion)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                SIC_T_CLI_DIRECCION l2 = (from x in contexto.SIC_T_CLI_DIRECCION
                                          where x.cli_direc_c_iid == _pSIC_T_cli_direccion.cli_direc_c_iid &&
                                          x.cli_c_vdoc_id.Trim().Equals(_pSIC_T_cli_direccion.cli_c_vdoc_id.Trim())
                                          select x).FirstOrDefault();
                contexto.ApplyCurrentValues("SICDBWEBEntities.SIC_T_CLI_DIRECCION", _pSIC_T_cli_direccion);
                try
                {
                    contexto.SaveChanges();
                    return true;
                }
                catch (OptimisticConcurrencyException)
                {
                    contexto.Refresh(RefreshMode.StoreWins, _pSIC_T_cli_direccion);
                    contexto.SaveChanges();
                }
                return false;
            }
        }
        public bool RomperRelacion(string cli_c_cdoc_id, int nomb_com_c_iid)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    contexto.SIC_SP_CLIENTE_NOMBRE_ELIMINAR_RELACION(cli_c_cdoc_id, nomb_com_c_iid);
                    contexto.SaveChanges();
                    return true;
                }
            }
            catch (Exception)
            {
                return false;
                throw;
            }
            finally { }


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
        public bool RegistrarDireccion(SIC_T_CLI_DIRECCION _direccion)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    contexto.AddToSIC_T_CLI_DIRECCION(_direccion);
                    contexto.SaveChanges();
                    return true;
                }
            }
            catch (Exception)
            { return false; }
        }


        public bool EliminarDireccion(SIC_T_CLI_DIRECCION _Prop_Inm)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {

                    var lstData = (from x in contexto.SIC_T_CLI_DIRECCION
                                   where x.cli_c_vdoc_id == _Prop_Inm.cli_c_vdoc_id
                                   select x).FirstOrDefault();
                    contexto.DeleteObject(lstData);
                    contexto.SaveChanges();
                    return true;
                }
            }
            catch (Exception)
            {
                throw;
                return false;
            }
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
        public bool ModificarNombreComercial(SIC_T_NOMB_COM _nombre)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    SIC_T_NOMB_COM mNomComer = (from x in contexto.SIC_T_NOMB_COM
                                                where x.nomb_com_c_iid == _nombre.nomb_com_c_iid
                                                select x).FirstOrDefault();

                    contexto.ApplyCurrentValues("SICDBWEBEntities.SIC_T_NOMB_COM", _nombre);
                    try
                    {
                        contexto.SaveChanges();
                        return true;
                    }
                    catch (OptimisticConcurrencyException)
                    {
                        contexto.Refresh(RefreshMode.StoreWins, _nombre);
                        contexto.SaveChanges();
                    }
                    return false;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }
        public int BuscarRelacion(string cli_c_cdoc_id, int nomb_com_c_iid)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    var resultado = (contexto.SIC_SP_CLIENTE_NOMBRE_CONTAR(cli_c_cdoc_id, nomb_com_c_iid));

                    foreach (var item in resultado)
                    {
                        return Convert.ToInt32(item.Value.ToString());
                    }
                }
            }
            catch (Exception)
            {
                return 0;
            } return 0;
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
        public string[] ListarRazSocClientes()
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_CLIENTE
                            where x.cli_c_bactivo == true
                            select x.cli_c_vraz_soc).ToArray();
                }
            }
            catch (Exception)
            {
                return null;
            }
        }
        public List<string> ListarRazSocClientesList()
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_CLIENTE
                            select x.cli_c_vraz_soc).ToList();
                }
            }
            catch (Exception)
            {
                return null;
            }
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

        public SIC_T_CLI_DIRECCION DireccionPorRuc(string _strcli_c_cdoc_id)
        {
            try
            {
                using (SICDBWEBEntities contexto = new SICDBWEBEntities())
                {
                    return (from x in contexto.SIC_T_CLI_DIRECCION
                            where
                            x.cli_c_vdoc_id.Trim().Equals(_strcli_c_cdoc_id.Trim())
                            select x).FirstOrDefault();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }


        #endregion

        public List<SIC_T_CLIENTE> ListarClientes(string razonSocial, string ruc)
        {

            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                contexto.ContextOptions.LazyLoadingEnabled = false;
                var lista = (from x in contexto.SIC_T_CLIENTE
                                .Include("SIC_T_CLI_SCORING")
                             where (razonSocial == null || razonSocial.Length == 0 || x.cli_c_vraz_soc == razonSocial)
                                && (ruc == null || ruc.Length == 0 || x.cli_c_vdoc_id == ruc)
                             select x).ToList();
                return lista;
            }
        }
    }


}
