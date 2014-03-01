using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIC.EntityLayer;
using SIC.BusinessLayer;

namespace SIC.UserLayer.Interfaces.Facturacion
{
    public partial class ucFactura : System.Web.UI.UserControl
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            EmpresaBL empresaBL = new EmpresaBL();
            SIC_T_EMPRESA empresa = empresaBL.ObtenerDatosEmpresa();
            lblRucProp.Text = empresa.emp_c_vruc;
            lblFactura.Text = "???-????????";
        }

        public void MostrarFactura(SIC_T_FACTURA factura)
        {
            lblFecha.Text = DateTime.Today.ToString("dd/MM/yyyy");
            lblSubTotal.Text = factura.fac_c_esubtotal.ToString();
            lblIGV.Text = factura.fac_c_eigvcal.ToString();
            lblTotal.Text = factura.fac_c_etotal.ToString();
            lblCliente.Text = factura.SIC_T_VENTA.SIC_T_CLIENTE.cli_c_vraz_soc;
            lblRuc.Text = factura.SIC_T_VENTA.SIC_T_CLIENTE.cli_c_vdoc_id;
            var resultado = factura.SIC_T_VENTA.SIC_T_CLIENTE.SIC_T_CLI_DIRECCION.FirstOrDefault(x => x.cli_direc_c_ctipo == "3");
            if (resultado != null)
            {
                lblDireccion.Text = resultado.cli_direc_c_vdirec;
            }

            GridView1.DataSource = factura.SIC_T_FACTURA_DETALLE.ToList();
            GridView1.DataBind();            
        }



 
    }
}