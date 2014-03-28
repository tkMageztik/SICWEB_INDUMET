using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIC.BusinessLayer;

namespace SIC.UserLayer.Interfaces
{
    public partial class frmImpresora : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ImpresoraBL impresoraBL = new ImpresoraBL();
                txtDireccion.Text = impresoraBL.ObtenerImpresoraDefecto();                
            }

            if (Configuracion.EsServidorImpresion)
            {
                txtDireccion.Enabled = false;
                btnGuardar.Enabled = false;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                ImpresoraBL impresoraBL = new ImpresoraBL();
                impresoraBL.ActualizarImpresora(txtDireccion.Text);
                Mensaje("Impresora actualizada.", "~/Imagenes/correcto.png");

            }
            catch (Exception ex)
            {
#if DEBUG
                SIC.Data.ExceptionTrace.Write(ex);
                String mensajeError = "Error Fatal : \n" + ex.Message;
                if (ex.InnerException != null)
                {
                    mensajeError += "\n" + ex.InnerException.Message ;
                }

                Mensaje(mensajeError, "~/Imagenes/warning.png");
#else
                    SIC.Data.ExceptionTrace.Write(ex);
                    Mensaje("Error en el proceso, se ha guardado la traza de la excepción..", "~/Imagenes/warning.png");
#endif
            }
        }


        private void Mensaje(string mensaje, string ruta)
        {
            divPopUpMsg.Attributes["Class"] = "PopupMostrar";
            ucMensaje.Visible = true;
            ucMensaje.Mensaje = mensaje;
            ucMensaje.Ruta = ruta;
            ucMensaje.EnableModelDialog(true);
            upMensaje.Update();
            return;
        }
    }
}