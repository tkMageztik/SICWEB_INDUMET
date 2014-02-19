using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIC.EntityLayer;

namespace SIC.UserLayer.Interfaces.Facturacion
{
    public partial class ucFactura : System.Web.UI.UserControl
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void MostrarFactura(SIC_T_FACTURA factura)
        {
            lblFecha.Text = DateTime.Today.ToString("dd/MM/yyyy");
            lblSubTotal.Text = factura.fac_c_esubtotal.ToString();
            lblIGV.Text = factura.fac_c_eigvcal.ToString();
            lblTotal.Text = factura.fac_c_etotal.ToString();
            GridView1.DataSource = factura.SIC_T_FACTURA_DETALLE.ToList();
            GridView1.DataBind();            
        }



 
    }
}