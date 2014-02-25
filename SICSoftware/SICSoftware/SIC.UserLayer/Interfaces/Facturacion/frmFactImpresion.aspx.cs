using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIC.BusinessLayer;

namespace SIC.UserLayer.Interfaces.Facturacion
{
    public partial class frmFactImpresion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.MostrarListaFactura();
                this.MostrarListaBoleta();
            }
        }

        /// <summary>
        /// Muestra la lista de Factura en el datagrid
        /// </summary>
        private void MostrarListaFactura()
        {
            ImpresionFacturaBoletaBL impresionBL = new ImpresionFacturaBoletaBL();
            gvListaFactura.DataSource = impresionBL.ListarFactura();
            gvListaFactura.DataBind();
            upListaFactura.Update();
        }

        /// <summary>
        /// Muestra la lista de Boletas en el datagrid
        /// </summary>
        private void MostrarListaBoleta()
        {

        }
    }
}