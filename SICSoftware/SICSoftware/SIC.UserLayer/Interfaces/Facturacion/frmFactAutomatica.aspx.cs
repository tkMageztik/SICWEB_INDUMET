using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIC.BusinessLayer;
using System.Globalization;
using SIC.EntityLayer;
using SIC.Data;

namespace SIC.UserLayer.Interfaces.Facturacion
{
    public partial class frmFactAutomatica : System.Web.UI.Page
    {

        #region DECLARACION DE VARIABLES
        private FacturacionAutomaticaBL facturacionAutomaticaBL
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
                this.ListarFiltroPeriodo();
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.BuscarVentas();
        }

        protected void gvListaVenta_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = (int) gvListaVenta.DataKeys[gvListaVenta.SelectedIndex].Value;
            this.MostrarPreliminar(id);
        }

        protected void btnCancelarCCE_Click(object sender, EventArgs e)
        {
            RegresarDesdePreliminarFactura();
        }

        #endregion


        #region Listado de Filtros
        private void ListarFiltroConcepto()
        {
            cboConcepto.DataSource = facturacionAutomaticaBL.ObtenerListaConcepto();
            cboConcepto.DataValueField = "con_c_iid";
            cboConcepto.DataTextField = "con_c_vdes";
            cboConcepto.DataBind();            
        }

        private void ListarFiltroPeriodo()
        {
            cboPeriodo.Items.Clear();
            foreach (var fecha in facturacionAutomaticaBL.ObtenerListaPeriodo())
            {
                string text = fecha.ToString("MMMM", new CultureInfo("es-PE")).ToUpper() + " " + fecha.Year;
                cboPeriodo.Items.Add(new ListItem(text, fecha.ToString("MM-yyyy")));
            }
            cboPeriodo.DataBind();
        }
        #endregion

        /// <summary>
        /// Busca todas las ventas del periodo seleccionado y las muestra en el gridview.
        /// </summary>
        private void BuscarVentas()
        {
            DateTime fecha;
            if (cboConcepto.SelectedIndex != -1
                && DateTime.TryParseExact(cboPeriodo.SelectedValue, "MM-yyyy", new CultureInfo("es-PE"), DateTimeStyles.None, out fecha)
              )
            {
                var resultado =  this.facturacionAutomaticaBL.ObtenerListaVentasPendientes(fecha.Year, fecha.Month);
                gvListaVenta.DataSource = resultado;
                gvListaVenta.DataBind();
                upGeneral.Update();
            }
        }

        /// <summary>
        /// Muestra el preliminar de Venta.
        /// </summary>
        private void MostrarPreliminar(int idVenta)
        {
            var venta = this.facturacionAutomaticaBL.ObtenerVenta(idVenta);
            if (venta.ven_c_itipodoc == (int)TipoParametroDetalle.FACTURA)
            {
                MostrarPreliminarFactura(venta);
            }
        }

        /// <summary>
        /// Muestra la vista de factura preliminar
        /// </summary>
        /// <param name="venta"></param>
        private void MostrarPreliminarFactura(SIC_T_VENTA venta)
        {
            var factura = this.facturacionAutomaticaBL.GenerarFacturaDesdeVenta(venta);
            ucFactura1.MostrarFactura(factura);
            mvFacturacionAutomatica.SetActiveView(vwFacturaPreliminar);
            upGeneral.Update();
        }

        private void RegresarDesdePreliminarFactura()
        {
            mvFacturacionAutomatica.SetActiveView(vwMain);
            upGeneral.Update();
        }

  
    }
}