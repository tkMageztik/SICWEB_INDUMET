using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIC.BusinessLayer;
using SIC.EntityLayer;

namespace SIC.UserLayer.UserControl
{
    public partial class wucMenuDinamico : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["USUARIO"] != null)
                {
                    AgregarMenusPadres(((SIC_T_USUARIO)Session["USUARIO"]).usua_c_cdoc_id);
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }
            }
        }

        ISeguridadBL ObjSeguridadBL;

        public wucMenuDinamico()
        {
            ObjSeguridadBL = new SeguridadBL();
        }

        #region Events

        #endregion

        #region Methods

        public void CargarMenu(string strLogin)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    AgregarMenusPadres(strLogin);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void AgregarMenusPadres(string strUsuario)
        {
            List<SIC_T_MENU> ListaMenu = null;

            try
            {
                ListaMenu = new List<SIC_T_MENU>(ObjSeguridadBL.ObtenerMenuPadres(strUsuario));

                foreach (SIC_T_MENU menu in ListaMenu)
                {
                    MenuItem mnuPadre = new MenuItem(menu.menu_c_vnomb, menu.menu_c_iid.ToString(), "");

                    mnuPadre.Selectable = false;
                    //Agrego al Menu Principal
                    this.MnDinamico.Items.Add(mnuPadre);
                    //llamo a la rutina que Agrega los Hijos
                    AgregarMenusHijos(ref mnuPadre, strUsuario);
                }
            }
            catch (Exception ex)
            {
                Console.Write(ex.InnerException.Message);
                throw ex;
            }
        }

        public void AgregarMenusHijos(ref MenuItem mnuItem, string strUsuario)
        {
            List<SIC_T_MENU> ListaMenu = null;

            try
            {
                ListaMenu = new List<SIC_T_MENU>(ObjSeguridadBL.ObtenerMenuHijos(strUsuario, Convert.ToInt32(mnuItem.Value)));

                if (ListaMenu != null)
                {
                    foreach (SIC_T_MENU menu in ListaMenu)
                    {
                        MenuItem mnuHijo = new MenuItem("&nbsp;&nbsp;&nbsp;" + menu.menu_c_vnomb,
                            menu.menu_c_iid.ToString(), "", "../" + menu.menu_c_vpag_asp);

                        mnuHijo.ImageUrl = "~/Imagenes/menuItem.gif";
                        mnuItem.ChildItems.Add(mnuHijo);
                        //llamo a la rutina que agrega los hijos               
                        AgregarMenusHijos(ref mnuHijo, strUsuario);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

    }
}
