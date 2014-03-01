using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIC.BusinessLayer;
using System.Globalization;

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

        protected void btnSeleccionarVenta_Click(object sender, EventArgs e)
        {
            this.MostrarVentas();
        }

        protected void gvListaVenta_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvListaVenta.PageIndex = e.NewPageIndex;
            ListarVentas();
        }

        protected void gvListaVenta_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.SeleccionarVenta(-1);
        }
        #endregion

        private void ListarVentas()
        {
            VentaBL ventaBL = new VentaBL();
            DateTime inicio, fin;
            DateTime? fi = null, ff = null;
            if (DateTime.TryParseExact(txtFiltroFecIni.Text, "dd/MM/yyyy", new CultureInfo("en-US"), DateTimeStyles.None, out inicio))
            {
                fi = inicio;
            }

            if (DateTime.TryParseExact(txtFiltroFecFin.Text, "dd/MM/yyyy", new CultureInfo("en-US"), DateTimeStyles.None, out fin))
            {
                ff = fin;
            }

            gvListaVenta.DataSource = ventaBL.ListarVentas(txtFiltroRuc.Text, txtFiltroRS.Text, fi, ff);
            gvListaVenta.DataBind();
            upGeneral.Update();
        }

        private void MostarNuevoMovimiento()
        {
            this.mvMovSalida.SetActiveView(this.vwNuevoMovimiento);
            upGeneral.Update();
        }

        private void MostrarVentas()
        {
            this.mvMovSalida.SetActiveView(this.vwVenta);
            upGeneral.Update();
        }        

        private void SeleccionarVenta(int idVenta)
        {
            this.mvMovSalida.SetActiveView(this.vwNuevoMovimiento);
            upGeneral.Update();
        } 
    }
}