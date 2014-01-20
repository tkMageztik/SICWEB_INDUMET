using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIC.BusinessLayer;
using SIC.EntityLayer;

namespace SIC.UserLayer
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
#if DEBUG
            txtUsuario.Text = "admin";
            txtClave.Text = "juan899833245";
#endif
        }


        protected void btnIngresar_Click(object sender, System.EventArgs e)
        {
            SIC_T_USUARIO usuario = null;

            usuario = new SeguridadBL().VerificarAccesso(txtUsuario.Text, txtClave.Text);

            if (usuario == null)
            {
                lblMensaje.Text = "Usuario y/o Password es invalido";
                return;
            }
            else
            {
                Session["USUARIO"] = usuario;
                Response.Redirect("/Interfaces/Mantenimiento/frmRegItem.aspx");
            }
        }

    }
}