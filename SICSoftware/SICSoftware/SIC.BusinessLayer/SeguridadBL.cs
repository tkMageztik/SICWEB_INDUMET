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
    public interface ISeguridadBL
    {
        SIC_T_MENU[] ObtenerMenuPadres(string prmstr_codUsuario);
        SIC_T_MENU[] ObtenerMenuHijos(string prmstr_codUsuario, int prmint_codMenuPadre);
        SIC_T_USUARIO VerificarAccesso(string codUsu, string usuPass);
        //int PermisoUsuarioConsultar(string user, string aspPath);
    }

    public class SeguridadBL : ISeguridadBL
    {
        public SIC_T_MENU[] ObtenerMenuPadres(string prmstr_codUsuario)
        {
            ISeguridadDA objDSeguridad = null;

            try
            {
                objDSeguridad = new SeguridadDA();
                return objDSeguridad.ObtenerMenuPadres(prmstr_codUsuario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDSeguridad.Dispose();
            }
        }

        public SIC_T_MENU[] ObtenerMenuHijos(string prmstr_codUsuario, int prmint_codMenuPadre)
        {
            ISeguridadDA objDSeguridad = null;

            try
            {
                objDSeguridad = new SeguridadDA();
                return objDSeguridad.ObtenerMenuHijos(prmstr_codUsuario, prmint_codMenuPadre);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDSeguridad.Dispose();
            }
        }

        public SIC_T_USUARIO VerificarAccesso(string codUsu, string usuPass)
        {
            try
            {
                return new SeguridadDA().VerificarAccesso(codUsu, usuPass);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //public int PermisoUsuarioConsultar(string user, string aspPath)
        //{
        //    ISeguridadDA objDSeguridad = null;

        //    try
        //    {
        //        objDSeguridad = new SeguridadDA();
        //        return objDSeguridad.PermisoUsuarioConsultar(user, aspPath);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    finally
        //    {
        //        objDSeguridad.Dispose();
        //    }
        //}



    }
}
