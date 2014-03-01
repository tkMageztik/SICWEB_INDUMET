using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SIC.UserLayer.Interfaces.Compras
{
    public partial class frmMovSalida : System.Web.UI.Page
    {
        #region Eventos
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            this.MostarNuevoMovimiento();
        }
        #endregion

        private void MostarNuevoMovimiento()
        {
            this.mvMovSalida.SetActiveView(this.vwNuevoMovimiento);
            upGeneral.Update();
        }

        protected void btnSeleccionarVenta_Click(object sender, EventArgs e)
        {
            this.mvMovSalida.SetActiveView(this.vwVenta);
            upGeneral.Update();
        }


        
    }
}