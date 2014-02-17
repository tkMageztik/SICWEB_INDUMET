using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIC.BusinessLayer;
using System.Globalization;

namespace SIC.UserLayer.Interfaces.Facturacion
{
    public partial class frmFactAutomatica : System.Web.UI.Page
    {

        #region DECLARACION DE VARIABLES

        private FacturacionAutomaticaBL _facturacionAutomatica
        {
            get 
            {                 
                // Usando Lazy. Podria usarse el evento load enves?
                if (ViewState["vsFacturacionAutomaticaBL"]  == null)
                {
                    ViewState["vsFacturacionAutomaticaBL"] = new FacturacionAutomaticaBL();
                }
                return ViewState["vsFacturacionAutomaticaBL"] as FacturacionAutomaticaBL;
            }
            set { ViewState["vsFacturacionAutomaticaBL"] = value; }
        }

        #endregion

        #region Eventos

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ListarFiltroConcepto();
            }
        }
        #endregion

        private void ListarFiltroConcepto()
        {
            cboConcepto.Items.Clear();
            foreach (var fecha in _facturacionAutomatica.ObtenerListaPeriodo())
            {
                string text = fecha.ToString("MMMM", new CultureInfo("es-PE")).ToUpper() + " " + fecha.Year;
                cboConcepto.Items.Add(new ListItem(text, fecha.ToString("MM-YYYY")));
            }
            cboConcepto.DataBind();
        }
    }
}