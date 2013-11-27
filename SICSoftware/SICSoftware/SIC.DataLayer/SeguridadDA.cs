//---------------------------------------------------------------------------------------------------------------
//Creado: Jonnathan De La Barra			 
//Fecha: 11/10/2012
//Descripción: Se creó la clase para implementar los métodos de acceso a datos relacionados a la Seguridad.
//Modificado: Nombre y Apellido 		Fecha Modificación:
//Descripción de la modificación:
//---------------------------------------------------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data.Entity;
using System.Data.Objects;
using SIC.EntityLayer;
using System.Data.Objects.DataClasses;
using SIC.Data;
using System.Data;

namespace SIC.DataLayer
{
    //public interface ISeguridadDA : IDisposable
    //{
    //    SIC_T_MENU[] ObtenerMenuPadres(string prmstr_codUsuario);
    //    SIC_T_MENU[] ObtenerMenuHijos(string prmstr_codUsuario, int prmint_codMenuPadre);
    //    string VerificarAccesso(string prmstrUsername);
    //    int PermisoUsuarioConsultar(string user, string aspPath);
    //}

    //public class SeguridadDA : ISeguridadDA
    //{
    //    public SIC_T_MENU[] ObtenerMenuPadres(string prmstr_codUsuario)
    //    {
    //        SICDBWEBEntities sgaBEL = new SICDBWEBEntities();
    //        List<SIC_T_MENU> lsMenus = null;
    //        SIC_T_MENU MenuBE = null;

    //        try
    //        {
    //            ObjectResult<SIC_T_MENU> retMenu = sgaBEL.ObtenerMenuPadres(prmstr_codUsuario);

    //            var _menuPadre = from res in retMenu
    //                             select new
    //                             {
    //                                 menu_c_iid = res.menu_c_iid,
    //                                 menu_c_vnomb = res.menu_c_vnomb,
    //                                 menu_c_vpag_asp = res.menu_c_vpag_asp,
    //                                 menu_c_iid_padre = res.menu_c_iid_padre,
    //                                 menu_c_ynivel = res.menu_c_ynivel
    //                             };

    //            lsMenus = new List<SIC_T_MENU>();

    //            foreach (var item in _menuPadre)
    //            {
    //                MenuBE = new SIC_T_MENU();

    //                MenuBE.menu_c_iid = item.menu_c_iid;
    //                MenuBE.menu_c_vnomb = item.menu_c_vnomb;
    //                MenuBE.menu_c_vpag_asp = item.menu_c_vpag_asp;
    //                MenuBE.menu_c_iid_padre = item.menu_c_iid_padre;
    //                MenuBE.menu_c_ynivel = item.menu_c_ynivel;

    //                lsMenus.Add(MenuBE);
    //            }

    //            return lsMenus.ToArray();
    //        }
    //        catch (Exception ex)
    //        {
    //            throw ex;
    //        }
    //        finally
    //        {
    //            sgaBEL.Dispose();
    //        }
    //    }

    //    public SIC_T_MENU[] ObtenerMenuHijos(string prmstr_codUsuario, int prmint_codMenuPadre)
    //    {
    //        SICDBWEBEntities sgaBEL = new SICDBWEBEntities();
    //        List<SIC_T_MENU> lsMenus = null;
    //        SIC_T_MENU MenuBE = null;

    //        try
    //        {
    //            ObjectResult<SIC_T_MENU> retMenu = sgaBEL.ObtenerMenuHijos(prmstr_codUsuario, prmint_codMenuPadre);

    //            var _menuPadre = from res in retMenu
    //                             select new
    //                             {
    //                                 menu_c_iid = res.menu_c_iid,
    //                                 menu_c_vnomb = res.menu_c_vnomb,
    //                                 menu_c_vpag_asp = res.menu_c_vpag_asp,
    //                                 menu_c_iid_padre = res.menu_c_iid_padre,
    //                                 menu_c_ynivel = res.menu_c_ynivel
    //                             };

    //            lsMenus = new List<SIC_T_MENU>();

    //            foreach (var item in _menuPadre)
    //            {
    //                MenuBE = new SIC_T_MENU();

    //                MenuBE.menu_c_iid = item.menu_c_iid;
    //                MenuBE.menu_c_vnomb = item.menu_c_vnomb;
    //                MenuBE.menu_c_vpag_asp = item.menu_c_vpag_asp;
    //                MenuBE.menu_c_iid_padre = item.menu_c_iid_padre;
    //                MenuBE.menu_c_ynivel = item.menu_c_ynivel;

    //                lsMenus.Add(MenuBE);
    //            }

    //            return lsMenus.ToArray();
    //        }
    //        catch (Exception ex)
    //        {
    //            throw ex;
    //        }
    //        finally
    //        {
    //            sgaBEL.Dispose();
    //        }
    //    }

    //    public string VerificarAccesso(string prmstrUsername)
    //    {
    //        SICDBWEBEntities sgaBEL = new SICDBWEBEntities();
    //        string strUsuario = string.Empty;

    //        try
    //        {
    //            ObjectResult<string> resAcceso = sgaBEL.VerificarAccesoSistema(prmstrUsername);

    //            var acceso = from res in resAcceso
    //                         select res;

    //            foreach (var item in acceso)
    //                strUsuario = item.ToString();

    //            return strUsuario;
    //        }
    //        catch (Exception ex)
    //        {
    //            throw ex;
    //        }
    //        finally
    //        {
    //            sgaBEL.Dispose();
    //        }
    //    }

    //    public int PermisoUsuarioConsultar(string user, string aspPath)
    //    {
    //        try
    //        {
    //            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
    //            {
    //                return Convert.ToInt16(contexto.SIC_SP_USUARIO_PERMISO_ASP_CONSULTAR(user, aspPath).FirstOrDefault());
    //            }
    //        }
    //        catch
    //        {
    //            throw;
    //        }

    //    }


    //    public void Dispose()
    //    {
    //        GC.Collect();
    //    }
    //}
}
