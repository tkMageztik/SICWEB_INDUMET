//---------------------------------------------------------------------------------------------------------------
//Creado: Jonnathan De La Barra			Fecha: 11/10/2012
//Descripción: Se creó la clase para implementar los métodos para la lógica de Seguridad
//Modificado: Nombre y Apellido 		Fecha Modificación:
//Descripción de la modificación:
//---------------------------------------------------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.DataLayer;
using SIC.EntityLayer;

namespace SIC.BusinessLayer
{
    //public interface ISeguridadBL
    //{
    //    SGA_T_MENU[] ObtenerMenuPadres(string prmstr_codUsuario);
    //    SGA_T_MENU[] ObtenerMenuHijos(string prmstr_codUsuario, int prmint_codMenuPadre);
    //    string VerificarAccesso(string prmstrUsername);
    //    int PermisoUsuarioConsultar(string user, string aspPath);
    //}

    //public class SeguridadBL : ISeguridadBL
    //{
    //    public SGA_T_MENU[] ObtenerMenuPadres(string prmstr_codUsuario)
    //    {
    //        ISeguridadDA objDSeguridad = null;

    //        try
    //        {
    //            objDSeguridad = new SeguridadDA();
    //            return objDSeguridad.ObtenerMenuPadres(prmstr_codUsuario);
    //        }
    //        catch (Exception ex)
    //        {
    //            throw ex;
    //        }
    //        finally
    //        {
    //            objDSeguridad.Dispose();
    //        }
    //    }

    //    public SGA_T_MENU[] ObtenerMenuHijos(string prmstr_codUsuario, int prmint_codMenuPadre)
    //    {
    //        ISeguridadDA objDSeguridad = null;

    //        try
    //        {
    //            objDSeguridad = new SeguridadDA();
    //            return objDSeguridad.ObtenerMenuHijos(prmstr_codUsuario, prmint_codMenuPadre);
    //        }
    //        catch (Exception ex)
    //        {
    //            throw ex;
    //        }
    //        finally
    //        {
    //            objDSeguridad.Dispose();
    //        }
    //    }

    //    public string VerificarAccesso(string prmstrUsername)
    //    {
    //        ISeguridadDA objDSeguridad = null;

    //        try
    //        {
    //            objDSeguridad = new SeguridadDA();
    //            return objDSeguridad.VerificarAccesso(prmstrUsername);
    //        }
    //        catch (Exception ex)
    //        {
    //            throw ex;
    //        }
    //        finally
    //        {
    //            objDSeguridad.Dispose();
    //        }
    //    }


    //    public int PermisoUsuarioConsultar(string user, string aspPath)
    //    {
    //        ISeguridadDA objDSeguridad = null;

    //        try
    //        {
    //            objDSeguridad = new SeguridadDA();
    //            return objDSeguridad.PermisoUsuarioConsultar(user, aspPath);
    //        }
    //        catch (Exception ex)
    //        {
    //            throw ex;
    //        }
    //        finally
    //        {
    //            objDSeguridad.Dispose();
    //        }
    //    }



    //}
}
