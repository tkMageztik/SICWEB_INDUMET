using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ADV.BusinessLayer;
using ADV.EntityLayer;
using ADV.Data;

namespace ADV.UserLayer.Interfaces.Facturacion.UserControl
{
    public partial class wucFactura : System.Web.UI.UserControl
    {
        bool status;
        public event EventHandler UpdateControl;
        public String codigoFactura;
        public string RucPropAdmin;
        public int TipoDoc;
        public int Periodo;
        public int TipoProc; //1--frm Facturacion consulta
                             //2--frm Facturacion impresion


        //tipo 2
        public int inmueble;
        public string FecIni, FecFin;
        public int iiddoc;


        FacturacionBL _FacturacionBL = null;

        protected void Page_Load(object sender, EventArgs e)
        {      
                       
        }
        protected void ibtnCancelar_Click(object sender, ImageClickEventArgs e)
        {
            ModalPopupExtender1.Hide();
        }

        public Boolean IsLogin
        {
            get { return status; }
        }
        public void EnableModelDialog(bool visibility)
        {
            if (visibility)
            {
                cargarFactura();
                ModalPopupExtender1.Show();
            }
            else
            {
                ModalPopupExtender1.Hide();
            }
        }

        private void cargarFactura()
        {
            _FacturacionBL = new FacturacionBL();

            if (TipoProc == 1) //consulta facturas
            {                 
                IList<ADV_SP_FACTURACION_CONSULTAR_Result> ListaFacturas = new List<ADV_SP_FACTURACION_CONSULTAR_Result>();

                ListaFacturas = _FacturacionBL.ListaConsultaFacturas(TipoDoc, Periodo, codigoFactura, RucPropAdmin, 0, 0, "", "", "", "","");
                if (ListaFacturas.Count > 0)
                {
                    if (ListaFacturas[0].prop_c_cdoc_id == "20382748566") // interseguro
                    {
                        imgLogo.ImageUrl = "../../../Imagenes/interseguro.jpg";
                    }
                    else if (ListaFacturas[0].prop_c_cdoc_id == "20499141051") // milenia
                    {
                        imgLogo.ImageUrl = "../../../Imagenes/milenia.png";
                    }
                    else if (ListaFacturas[0].prop_c_cdoc_id == "20511315922") // real plaza
                    {
                        imgLogo.ImageUrl = "../../../Imagenes/logo_rp.png";
                    }
                    else if (ListaFacturas[0].prop_c_cdoc_id == "20519398169") // patrimonio en fideicomiso
                    {
                        imgLogo.ImageUrl = "../../../Imagenes/interproperties.png";
                    }
                    else if (ListaFacturas[0].prop_c_cdoc_id == "20535505684") // CC estacion central
                    {
                        imgLogo.ImageUrl = "";
                    }

                    lblFecha.Text = Convert.ToDateTime(ListaFacturas[0].fact_c_dfec_emi).ToShortDateString();
                    lblCliente.Text = ListaFacturas[0].cli_c_vraz_soc.ToString();
                    lblRuc.Text = ListaFacturas[0].cli_c_vdoc_id;
                    lblDomicilio.Text = ListaFacturas[0].cli_direc_c_vdirec;
                    lblInmueble.Text = ListaFacturas[0].inm_c_vnomb;
                    lblLocal.Text = ListaFacturas[0].loc_c_ccod;
                    lblRucProp.Text = ListaFacturas[0].prop_c_cdoc_id;
                    lblTipoDoc.Text = ListaFacturas[0].doc_pago_c_vdesc;
                    lblFactura.Text = ListaFacturas[0].fact_c_ccod;
                    lblConcepto.Text = ListaFacturas[0].fact_c_vglosa;
                    lblDetracciones.Text = ListaFacturas[0].inm_c_vobserv;                    
                    lblmontoLetras.Text = ListaFacturas[0].cont_c_vcond_esp;
                    lblSubTotal.Text = ListaFacturas[0].fact_c_emonto_subtot.ToString();
                    lblIGV.Text = ListaFacturas[0].fact_c_emonto_igv.ToString();
                    lblTotal.Text = ListaFacturas[0].fact_c_emonto_total.ToString();
                    lblMonto.Text = ListaFacturas[0].fact_c_emonto_subtot.ToString();
                }
            }
            else if (TipoProc == 2) // impresion
            {               
                IList<ADV_SP_FACTURACION_IMPRESION_LISTAR_FACTURA_Result> ListarFactura = new List<ADV_SP_FACTURACION_IMPRESION_LISTAR_FACTURA_Result>();
                ListarFactura = _FacturacionBL.ListarFacturasImpresion(RucPropAdmin, inmueble, FecIni, FecFin, TipoDoc, "", 0, iiddoc,"",0,0);

                if (ListarFactura.Count > 0)
                {
                    if (ListarFactura[0].prop_c_cdoc_id == "20382748566") // interseguro
                    {
                        imgLogo.ImageUrl = "../../../Imagenes/interseguro.jpg";
                    }
                    else if (ListarFactura[0].prop_c_cdoc_id == "20499141051") // milenia
                    {
                        imgLogo.ImageUrl = "../../../Imagenes/milenia.png";
                    }
                    else if (ListarFactura[0].prop_c_cdoc_id == "20511315922") // real plaza
                    {
                        imgLogo.ImageUrl = "../../../Imagenes/logo_rp.png";
                    }
                    else if (ListarFactura[0].prop_c_cdoc_id == "20519398169") // patrimonio en fideicomiso
                    {
                        imgLogo.ImageUrl = "../../../Imagenes/interproperties.png";
                    }
                    else if (ListarFactura[0].prop_c_cdoc_id == "20535505684") // CC estacion central
                    {
                        imgLogo.ImageUrl = "";
                    }

                    lblFecha.Text = Convert.ToDateTime(ListarFactura[0].fact_c_dfec_emi).ToShortDateString();
                    lblCliente.Text = ListarFactura[0].cli_c_vraz_soc.ToString();
                    lblRuc.Text = ListarFactura[0].cli_c_vdoc_id;
                    lblDomicilio.Text = ListarFactura[0].cli_direc_c_vdirec;
                    lblInmueble.Text = ListarFactura[0].inm_c_vnomb;
                    lblLocal.Text = ListarFactura[0].loc_c_ccod;
                    lblRucProp.Text = ListarFactura[0].prop_c_cdoc_id;
                    lblTipoDoc.Text = ListarFactura[0].doc_pago_c_vdesc;
                    lblFactura.Text = ListarFactura[0].fact_c_ccod;                    
                    lblConcepto.Text = ListarFactura[0].fact_c_vglosa;
                    lblDetracciones.Text = ListarFactura[0].inm_c_vobserv;
                    lblServRecau.Text = ListarFactura[0].inm_ptov_serv_recau_prop;
                    lblmontoLetras.Text = ListarFactura[0].cont_c_vcond_esp;
                    lblSubTotal.Text = ListarFactura[0].fact_c_emonto_subtot.ToString();
                    lblIGV.Text = ListarFactura[0].fact_c_emonto_igv.ToString();
                    lblTotal.Text = ListarFactura[0].fact_c_emonto_total.ToString();
                    lblMonto.Text = ListarFactura[0].fact_c_emonto_subtot.ToString();
                }               

            }
        }

    }
}