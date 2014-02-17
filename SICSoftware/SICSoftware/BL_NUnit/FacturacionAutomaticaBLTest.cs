using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;
using SIC.BusinessLayer;

namespace BL_NUnit
{
    [TestFixture]
    public class FacturacionAutomaticaBLTest
    {
        /// <summary>
        /// Lista Periodo debe obtener los 12 meses del año actual
        /// </summary>
        [Test]
        public void ListaPeriodo()
        {
            FacturacionAutomaticaBL faBL = new FacturacionAutomaticaBL();
            var lista = faBL.ObtenerListaPeriodo();
            if(lista.Count !=12)
            {
                Assert.Fail("Se retorno un numero de fechas diferente a 12.");
            }
            else{
                for (int i = 0; i <= 11; i++)
                {
                    if (lista[i].Year != DateTime.Now.Year)
                    {
                        Assert.Fail("Se retorno una lista con año incorrecto.");
                    }
                    else if (lista[i].Month != i + 1)
                    {
                        Assert.Fail("Se retorno un date con mes incorrecto.");
                    }
                }
            }
        }
    }
}
