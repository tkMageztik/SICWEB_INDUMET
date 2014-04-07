using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIC.BusinessLayer.Print
{
    public static class NumberHelper
    {

        public static String DecimalToSpanishText(this decimal cantidadDecimal)
        {
            int numero = Convert.ToInt32(Math.Floor(cantidadDecimal));
            string resultado = numero.IntToSpanishText();
            int fraccion = Convert.ToInt32((cantidadDecimal - Math.Floor(cantidadDecimal)) * 100);
            resultado += " y " + fraccion + "/100";
            return resultado;
        }



        public static String IntToSpanishText(this int numero)
        {
            string words = "";
            if (numero == 0)
            {
                return "";
            }
            else if (numero < 0)
            {
                return "menos " + IntToSpanishText(Math.Abs(numero));
            }

            if ((numero / 1000000) > 0)
            {
                if (numero / 1000000 == 1)
                {
                    words += "un millón ";
                }
                else
                {
                    words += IntToSpanishText(numero / 1000000) + " millones ";
                }
                numero %= 1000000;
            }

            if ((numero / 1000) > 0)
            {
                if (numero / 1000 == 1)
                {
                    words += "mil ";
                }
                else
                {
                    words += IntToSpanishText(numero / 1000) + " mil ";
                }
                numero %= 1000;
            }

            if ((numero / 100) > 0)
            {
                if (numero == 100)
                {
                    words += "cien";
                }
                else if (numero / 100 == 1)
                {
                    words += "ciento ";
                }
                else if (numero / 100 == 5)
                {
                    words += "quinientos ";
                }
                else if (numero / 100 == 7)
                {
                    words += "setecientos ";
                }
                else if (numero / 100 == 9)
                {
                    words += "novecientos ";
                }
                else
                {
                    words += IntToSpanishText(numero / 100) + "cientos ";
                }
                numero %= 100;
            }

            if (numero > 0)
            {
                var listaUnidades = new[] { "", "uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho", "nueve", "diez", 
                                                "once", "doce", "trece", "catorce", "quince"};
                var listaDecenasSimple = new[] { "", "diez", "veinte", "treinta", "cuarenta", "cincuenta", "sesenta", "setenta", "ochenta", "noventa" };
                var listaDecenasCompuesta = new[] { "", "dieci", "veinti", "treinta y ", "cuarenta y ", "cincuenta y ", "sesenta y ", "setenta y ", "ochenta y ", "noventa y " };

                if (numero < 16)
                {
                    words += listaUnidades[numero];
                }
                else if (numero % 10 != 0)
                {
                    words += listaDecenasCompuesta[numero / 10];
                    if ((numero % 10) > 0)
                        words += "" + listaUnidades[numero % 10];
                }
                else
                {
                    words += listaDecenasSimple[numero / 10];
                }
            }

            return words.Trim(); ;
        }
    }
}
