using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;

namespace SIC.BusinessLayer.Print
{
    public class ImpresionFacturaCont
    {
        private StringBuilder sb = new StringBuilder();
        private const Char ESC = '\u001B';
        private const Char Exclamation = '\u0021';
        private const Char SaltoPagina = '\u000C';
        private const Char Campana = '\u0007';
        private const Char SaltoLinea = '\u0010';

        public void ImprimirVarios(List<SIC_T_FACTURA> listaFactura, string nombreImpresora)
        {
            foreach (SIC_T_FACTURA factura in listaFactura)
            {
                this.Imprimir(factura, nombreImpresora);
            }
        }



        public void Imprimir(SIC_T_FACTURA factura, string nombreImpresora)
        {
            sb.Append('\u0027');

            sb.Append(ESC);
            sb.Append('\u0078');
            sb.Append('\u0000');

            sb.Append('\u000F');

            // Primeras 3 lineas
            sb.Append("\n");
            sb.Append("\n");
            sb.Append("\n");

            // Cabecera
            sb.Append("    " + factura.fac_c_zfecharegistro.ToString("dd/MM/yyyy") + "\n");
            sb.Append("\n");
            string razonSocial = factura.SIC_T_VENTA.SIC_T_CLIENTE.cli_c_vraz_soc;
            if (razonSocial.Length > 91)
            {
                razonSocial = razonSocial.Substring(0, 91);
            }

            sb.Append("           " + razonSocial.PadRight(91, ' ')
                + factura.SIC_T_VENTA.SIC_T_CLIENTE.cli_c_vdoc_id
                + "\n");
            var resultado = factura.SIC_T_VENTA.SIC_T_CLIENTE.SIC_T_CLI_DIRECCION.FirstOrDefault(x => x.cli_direc_c_ctipo == "3");
            String direccion = string.Empty;
            if (resultado != null)
            {
                direccion = resultado.cli_direc_c_vdirec;
            }

            if (direccion.Length > 120)
            {
                direccion = direccion.Substring(0, 120);
            }

            sb.Append("      " + direccion + "\n");

            // 
            sb.Append("\n");
            sb.Append("\n");
            //sb.Append("\n");


            // Cuerpo            
            string descripcion;
            foreach (var detalle in factura.SIC_T_FACTURA_DETALLE)
            {
                descripcion = detalle.SIC_T_ITEM.itm_c_vdescripcion;
                if (descripcion.Length > 85)
                {
                    descripcion = descripcion.Substring(0, 85);
                }

                sb.Append(detalle.SIC_T_ITEM.itm_c_ccodigo.PadRight(11, ' ')
                        + " "
                        + detalle.fac_det_c_ecantidad.ToString().PadRight(7, ' ')
                        + " "
                        + descripcion.PadLeft(85, ' ')
                        + " "
                        + detalle.fac_det_c_epreciounit.ToString().PadLeft(14, ' ')
                        + " "
                        + detalle.fac_det_c_epreciotot.ToString().PadLeft(14, ' ') + "\n");
            }

            for (int i = 0; i < 12 - factura.SIC_T_FACTURA_DETALLE.Count; i++)
            {
                sb.Append("\n");
            }

            sb.Append("".PadRight(77, ' ').PadRight(122, ' ')
                    + factura.fac_c_esubtotal.ToString().PadLeft(14, ' ')
                    + "\n");

            sb.Append("\n");
            sb.Append("".PadRight(121, ' ')
                    + factura.fac_c_eigvcal.ToString().PadLeft(14, ' ') + "\n");
            sb.Append("\n");
            sb.Append("".PadRight(121, ' ')
                    + factura.fac_c_etotal.ToString().PadLeft(14, ' ') + "\n");
            sb.Append('\u000C'); //FF

            RawPrinterHelper.SendStringToPrinter(nombreImpresora, sb.ToString());          

        }

        
    }
}