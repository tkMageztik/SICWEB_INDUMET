using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Data.Entity;
using SIC.BusinessLayer;
using SIC.EntityLayer;
using System.Text.RegularExpressions;
using ADV.Data;

namespace SIC.UserLayer
{
    public partial class _Default : System.Web.UI.Page
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
                    Response.Redirect("Interfaces/frmRefCliente.aspx");
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
