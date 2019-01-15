using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;

namespace SIC.BusinessLayer.Print
{
    public class ImpresionBoletaSimple
    {
        private StringBuilder sb = new StringBuilder();

        private const Char ESC = '\u001B';
        private const Char Exclamation = '\u0021';
        private const Char SaltoPagina = '\u000C';
        private const Char Campana = '\u0007';
        private const Char SaltoLinea = '\u0010';

        public void ImprimirVarios(List<SIC_T_BOLETA> listaBoleta, string nombreImpresora)
        {
            foreach (SIC_T_BOLETA boleta in listaBoleta)
            {
                this.Imprimir(boleta, nombreImpresora);
            }
        }

        public void Imprimir(SIC_T_BOLETA boleta, string nombreImpresora)
        {
            sb.Append('\u0027');

            sb.Append(ESC);
            sb.Append('\u0078');
            sb.Append('\u0000');
            
            sb.Append('\u000F');

            sb.Append("\n");
            sb.Append("\n");
            sb.Append("\n");
            sb.Append("\n");
            sb.Append("\n");
            sb.Append("\n");


            // Primeras 3 lineas
            sb.Append("\n");
            sb.Append("\n");
            sb.Append("\n");
                        
            // Cabecera
            sb.Append("      " + boleta.bol_c_zfecharegistro.ToString("dd/MM/yyyy") + "\n");
            sb.Append("\n");
            string razonSocial = boleta.SIC_T_VENTA.SIC_T_CLIENTE.cli_c_vraz_soc;
            if (razonSocial.Length > 81)
            {
                razonSocial = razonSocial.Substring(0, 81);
            }

            sb.Append("           " + razonSocial.PadRight(81, ' ')
                + boleta.SIC_T_VENTA.SIC_T_CLIENTE.cli_c_vdoc_id
                + "\n");
            var resultado = boleta.SIC_T_VENTA.SIC_T_CLIENTE.SIC_T_CLI_DIRECCION.FirstOrDefault(x => x.cli_direc_c_ctipo == "3");
            String direccion = string.Empty;
            if (resultado != null)
            {
                direccion = resultado.cli_direc_c_vdirec;
            }
            if (direccion.Length > 120)
            {
                direccion = direccion.Substring(0, 120);
            }

            sb.Append("           " + direccion + "\n");

            // 1 Lineas
            sb.Append("\n");
            sb.Append("\n");
            //sb.Append("\n");
            //sb.Append("\n");

            // Cuerpo    
            string descripcion;
            foreach (var detalle in boleta.SIC_T_BOLETA_DETALLE)
            {
                descripcion = detalle.SIC_T_ITEM.itm_c_vdescripcion;
                if (descripcion.Length > 83)
                {
                    descripcion = descripcion.Substring(0, 83);
                }

                sb.Append(detalle.SIC_T_ITEM.itm_c_ccodigo.PadRight(11, ' ')
                        + " "
                        + detalle.bol_det_c_ecantidad.ToString().PadLeft(8, ' ')
                        + " "
                        + descripcion.PadRight(83, ' ')
                        + " "
                        + detalle.bol_det_c_epreciounit.ToString().PadLeft(15, ' ')
                        + " "
                        + detalle.bol_det_c_epreciotot.ToString().PadLeft(15,' ') + "\n");
            }

            for (int i = 0; i < 12 - boleta.SIC_T_BOLETA_DETALLE.Count; i++)
            {
                sb.Append("\n");
            }

            sb.Append("\n");
            sb.Append("\n");
            sb.Append("\n");
            //sb.Append("\n");
            sb.Append("".PadRight(121, ' ')
                    + boleta.bol_c_etotal.ToString().PadLeft(15, ' ') + "\n");
            sb.Append('\u000C'); //FF

            RawPrinterHelper.SendStringToPrinter(nombreImpresora, sb.ToString());

        }


    }
}
