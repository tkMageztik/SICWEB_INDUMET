using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIC.BusinessLayer;

namespace SIC.UserLayer
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnIngresar_Click(object sender, System.EventArgs e)
        {
            SIC.EntityLayer.SIC_T_USUARIO mUsuario = null;

            bool mExisteUsuario = false;
            mExisteUsuario = new UsuarioBL().ObtenerUsuarioxNombre(txtUsuario.Text);

            if (!mExisteUsuario)
            {
                lblMensaje.Text = "Usuario y/o Password es invalido";
                return;
            }
            else
            {
                mUsuario = new UsuarioBL().Login(txtClave.Text);

                if (mUsuario != null)
                {
                    Response.Redirect("Interfaces/Mantenimiento/frmRegCliente.aspx");
                }
                else
                {
                    lblMensaje.Text = "Usuario y/o Password es invalido";
                    return;
                }
            }
        }
    }
}