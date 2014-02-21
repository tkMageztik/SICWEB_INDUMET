using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace SIC.UserLayer.UserControl
{
    public delegate void ResultadoMensajeHandler(object sender, ResMsjArgs e);

    public partial class wucMensajeAlerta2 : System.Web.UI.UserControl
    {
        //private const String RUTA_WARNING = "~/Imagenes/warning.png";
        private const String RUTA_WARNING = "~/Imagenes/warning.png";
        //private const String RUTA_CORRECTO = "~/Imagenes/correcto.png";
        private const String RUTA_CORRECTO = "~/Imagenes/correcto.png";

        private const String BOTON_ACEPTAR = "Aceptar";
        private const String BOTON_CANCELAR = "Cancelar";
        private const String BOTON_OK = "Ok";

        private const String TITULO_DEFAULT = "SICWEB - INDUMET";

        public int Codigo { get; set; }



        private MensajeBotones mensajeBotones
        {
            get { return (MensajeBotones)ViewState["vsMensajeBotones"]; }
            set { ViewState["vsMensajeBotones"] = value; }
        }

        public event ResultadoMensajeHandler ResultadoMensaje;

        protected virtual void OnResultadoMensaje(ResMsjArgs e)
        {
            if (ResultadoMensaje != null)
            {
                ResultadoMensaje(this, e);
            }

            this.ModalPopupExtender1.Hide();
        }




        bool status;


        public void Show(String mensaje)
        {
            this.Show(mensaje, null, MensajeIcono.Ninguno, MensajeBotones.Ok);
        }

        public void Show(String mensaje, String titulo)
        {
            this.Show(mensaje, titulo, MensajeIcono.Ninguno, MensajeBotones.Ok);
        }

        public void Show(String mensaje, String titulo, MensajeIcono mensajeIcono)
        {
            this.Show(mensaje, titulo, mensajeIcono, MensajeBotones.Ok);
        }

        public void Show(String mensaje, String titulo, MensajeIcono mensajeIcono, MensajeBotones mensajeBotones)
        {
            lblMensaje.Text = mensaje;
            if (titulo == null || titulo == string.Empty)
            {
                lblTitulo.Text = TITULO_DEFAULT;
            }
            else
            {
                lblTitulo.Text = titulo;
            }

            switch (mensajeIcono)
            {
                case MensajeIcono.Alerta:
                    this.imgMensaje.Visible = true;
                    this.imgMensaje.ImageUrl = RUTA_WARNING;
                    break;

                case MensajeIcono.Correcto:
                    this.imgMensaje.Visible = true;
                    this.imgMensaje.ImageUrl = RUTA_CORRECTO;
                    break;

                default:
                    this.imgMensaje.Visible = false;
                    break;
            }

            this.mensajeBotones = mensajeBotones;
            switch (mensajeBotones)
            {
                case MensajeBotones.AceptarCancelar:
                    btnFirst.Visible = true;
                    btnFirst.Text = BOTON_ACEPTAR;
                    btnSecond.Visible = true;
                    btnSecond.Text = BOTON_CANCELAR;
                    btnThird.Visible = false;
                    break;

                default:
                    btnFirst.Visible = false;
                    btnSecond.Visible = true;
                    btnSecond.Text = BOTON_OK;
                    btnThird.Visible = false;
                    break;
            }

            this.Visible = true;
            ModalPopupExtender1.Show();
        }

        protected void btnFirst_Click(object sender, EventArgs e)
        {
            switch (mensajeBotones)
            {
                case MensajeBotones.AceptarCancelar:
                    OnResultadoMensaje(new ResMsjArgs(MensajeResultado.Aceptar, false));
                    break;
                default:
                    break;
            }
        }

        protected void btnSecond_Click(object sender, EventArgs e)
        {
            switch (mensajeBotones)
            {
                case MensajeBotones.AceptarCancelar:
                    OnResultadoMensaje(new ResMsjArgs(MensajeResultado.Cancelar, false));
                    break;
                case MensajeBotones.Ok:
                    OnResultadoMensaje(new ResMsjArgs(MensajeResultado.Ok, false));
                    break;
                default:
                    break;
            }
        }

        protected void btnThird_Click(object sender, EventArgs e)
        {

        }



    }

    public enum MensajeIcono
    {
        Ninguno,
        Correcto,
        Alerta,
    }

    public enum MensajeBotones
    {
        Ok,
        AceptarCancelar,
    }

    public enum MensajeResultado
    {
        Ok,
        Aceptar,
        Cancelar,
    }

    public class ResMsjArgs : EventArgs
    {
        public MensajeResultado resultado { get; set; }

        private ResMsjArgs() { }

        public ResMsjArgs(MensajeResultado resultado, bool removerDelegate)
        {
            this.resultado = resultado;
        }
    }
}