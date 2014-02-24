using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIC.BusinessLayer;
using SIC.EntityLayer;

namespace SIC.UserLayer.Interfaces.Facturacion
{
    public partial class ucBoleta : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            EmpresaBL empresaBL = new EmpresaBL();
            SIC_T_EMPRESA empresa = empresaBL.ObtenerDatosEmpresa();
            lblRucProp.Text = empresa.emp_c_vruc;
            lblFactura.Text = "???-????????";
        }

        public void Mostrarboleta(SIC_T_BOLETA boleta)
        {
            lblFecha.Text = DateTime.Today.ToString("dd/MM/yyyy");
            lblSubTotal.Text = boleta.bol_c_esubtotal.ToString();
            lblIGV.Text = boleta.bol_c_eigvcal.ToString();
            lblTotal.Text = boleta.bol_c_etotal.ToString();
            lblCliente.Text = boleta.SIC_T_VENTA.SIC_T_CLIENTE.cli_c_vraz_soc;
            lblRuc.Text = boleta.SIC_T_VENTA.SIC_T_CLIENTE.cli_c_vdoc_id;
            //lblDireccion.Text = factura.SIC_T_VENTA.SIC_T_CLIENTE.cli_c_vraz_soc;
            GridView1.DataSource = boleta.SIC_T_BOLETA_DETALLE.ToList();
            GridView1.DataBind();
        }
    }
}