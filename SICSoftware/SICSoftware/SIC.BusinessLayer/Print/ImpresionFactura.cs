using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;

namespace SIC.BusinessLayer.Print
{
    public class ImpresionFactura
    {
        private StringBuilder sb = new StringBuilder();
        private const Char SaltoPagina = '\u000C';
        private const Char Campana = '\u0007';
        private const Char SaltoLinea ='\u0010';

        public void Imprimir(SIC_T_FACTURA factura, string nombreImpresora)
        {
            // Primeras 3 lineas
            sb.Append("\n");
            sb.Append("\n");
            sb.Append("\n");

            // Cabecera
            sb.Append("    " + factura.fac_c_zfecharegistro.ToString("dd/MM/yyyy") + "\n");
            sb.Append("\n");
            string razonSocial = factura.SIC_T_VENTA.SIC_T_CLIENTE.cli_c_vraz_soc;
            if (razonSocial.Length > 52)
            {
                razonSocial = razonSocial.Substring(0, 52);
            }

            sb.Append("      " + razonSocial.PadRight(52, ' ') 
                + factura.SIC_T_VENTA.SIC_T_CLIENTE.cli_c_vdoc_id                
                + "\n");
            var resultado = factura.SIC_T_VENTA.SIC_T_CLIENTE.SIC_T_CLI_DIRECCION.FirstOrDefault(x => x.cli_direc_c_ctipo == "3");
            String direccion = string.Empty;
            if (resultado != null)
            {
                direccion = resultado.cli_direc_c_vdirec;
            }

            if (direccion.Length > 52)
            {
                direccion = direccion.Substring(0, 52);
            }

            sb.Append("      " + direccion.PadRight(52, ' ') + "\n");

            // 
            sb.Append("\n");
            sb.Append("\n");
            //sb.Append("\n");


            // Cuerpo            
            string descripcion;
            foreach (var detalle in factura.SIC_T_FACTURA_DETALLE)
            {
                descripcion = detalle.SIC_T_ITEM.itm_c_vdescripcion;
                if (descripcion.Length > 49)
                {
                    descripcion = descripcion.Substring(0, 49);
                }

                sb.Append(detalle.SIC_T_ITEM.itm_c_ccodigo.PadRight(6, ' ')
                        + " "
                        + detalle.fac_det_c_ecantidad.ToString().PadRight(4, ' ')
                        + " "
                        + descripcion.PadRight(49, ' ')
                        + " "
                        + detalle.fac_det_c_epreciounit.ToString().PadRight(8, ' ')
                        + " "
                        + detalle.fac_det_c_epreciotot.ToString() + "\n");
            }

            for (int i = 0; i < 12 - factura.SIC_T_FACTURA_DETALLE.Count; i++)
            {
                sb.Append("\n");
            }

            //sb.Append("___ Cincuenta y Cinco con Cinco y Cinco.".PadRight(44, '_').PadRight(70, ' ')
            //        + factura.fac_c_esubtotal.ToString().PadRight(8, ' ')
            //        + "\n");
            sb.Append("\n");
            sb.Append("\n");
            sb.Append("".PadRight(70, ' ')
                    + factura.fac_c_eigvcal.ToString().PadRight(8, ' ') + "\n");
            sb.Append("\n");
            sb.Append("".PadRight(70, ' ')
                    + factura.fac_c_etotal.ToString().PadRight(8, ' ') + "\n");
            sb.Append('\u000C');

            RawPrinterHelper.SendStringToPrinter(nombreImpresora, sb.ToString());          

        }

        
    }
}
