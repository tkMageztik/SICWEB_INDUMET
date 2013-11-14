using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SIC.UserLayer.UserControl
{
    public partial class wucMensajeAlerta : System.Web.UI.UserControl
    {
        bool status;
        public event EventHandler UpdateControl;
        public String Mensaje;
        public String Ruta;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ibtnCancelar_Click(object sender, ImageClickEventArgs e)
        {
            ModalPopupExtender1.Hide();
        }

        public Boolean IsLogin
        {
            get { return status; }
        }

        public void EnableModelDialog(bool visibility)
        {
            if (visibility)
            {
                lblMensaje.Text = Mensaje;
                imgmensaje.ImageUrl = Ruta;
                ModalPopupExtender1.Show();
            }
            else
            {
                ModalPopupExtender1.Hide();
            }
        }

    }
}