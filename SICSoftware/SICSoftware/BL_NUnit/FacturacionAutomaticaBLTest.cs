using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;
using SIC.BusinessLayer;
using SIC.EntityLayer;
using SIC.Data;

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

        [Test]
        public void PruebaBoleta()
        {
            FacturacionAutomaticaBL faBL = new FacturacionAutomaticaBL();
            SIC_T_VENTA ventaInicial = this.CrearVenta();
            ventaInicial.ven_c_itipodoc = (int)TipoParametroDetalle.BOLETA;
            SIC_T_BOLETA boletaResultante = faBL.GenerarBoletaDesdeVenta(ventaInicial);
            Assert.AreEqual(ventaInicial.SIC_T_EMP_CENTRO_COSTO.emp_cst_c_vseriefactura, boletaResultante.bol_c_serie, "La serie no corresponde a la del centro de costo");
            Assert.AreEqual(ventaInicial.ven_c_iid, boletaResultante.bol_c_iventa, "El codigo de venta no corresponde a la venta");
            Assert.AreEqual(ventaInicial.ven_c_eigv, boletaResultante.bol_c_eigv, "El igv no corresponde a la venta.");
            Assert.AreEqual(ventaInicial.ven_c_esubtotal, boletaResultante.bol_c_esubtotal, "El subtotal no corresponde a la venta.");
            Assert.GreaterOrEqual(2, CantidadDecimales(boletaResultante.bol_c_esubtotal), "El subtotal tiene la cantidad de decimales incorrectos.");            
            Assert.AreEqual(ventaInicial.ven_c_eigvcal, boletaResultante.bol_c_eigvcal, "El calculo de igv no corresponde a la venta.");
            Assert.GreaterOrEqual(2, CantidadDecimales(boletaResultante.bol_c_eigvcal), "El calculo de igv tiene la cantidad de decimales incorrectos.");
            Assert.AreEqual(ventaInicial.ven_c_etotal, boletaResultante.bol_c_etotal, "El total no corresponde a la venta.");
            Assert.GreaterOrEqual(2, CantidadDecimales(boletaResultante.bol_c_etotal), "El total tiene la cantidad de decimales incorrectos.");
            Assert.AreEqual(ventaInicial.ven_c_ymoneda, boletaResultante.bol_c_imoneda, "La moneda no corresponde a la venta.");
            Assert.AreEqual(ventaInicial.ven_c_vdescmoneda, boletaResultante.bol_c_vdescmoneda, "La descripción de moneda no corresponde a la venta.");
            Assert.IsNotNull(boletaResultante.SIC_T_VENTA, "La venta no esta instanciada.");
            
            // Comparamos los items, debe tener los items resumidos
            foreach (var item in boletaResultante.SIC_T_BOLETA_DETALLE)
            {
                Assert.IsNotNull(item.SIC_T_ITEM, "Se requiere que el objeto item no sea nulo.");
                Assert.GreaterOrEqual(2, CantidadDecimales(item.bol_det_c_epreciotot), "El total del item tiene la cantidad de decimales incorrectos.");
                Assert.AreEqual(Decimal.Round(item.bol_det_c_ecantidad * item.bol_det_c_epreciounit, 2), item.bol_det_c_epreciotot, "El precio total del item no corresponde a la multiplicacion de unitario x cantidad");                    
                if (item.bol_det_c_ecantidad != ventaInicial.SIC_T_VENTA_DETALLE
                                            .Where(v => v.ven_det_c_iitemid == item.bol_det_c_iitem)
                                            .Select(x => x.ven_det_c_ecantidad)
                                            .Sum())
                {
                    Assert.Fail(String.Format("Fallo comparacion de item, item {0} tiene distinta cantidad en ambos.", item.bol_det_c_iitem));
                }
            }

            Assert.AreEqual(ventaInicial.ven_c_esubtotal, boletaResultante.SIC_T_BOLETA_DETALLE
                .Select(b => b.bol_det_c_epreciounit * b.bol_det_c_ecantidad).Sum(), "El subtotal de la venta no corresponde al subtotal calculado de la boleta.");
        }

        [Test]
        public void PruebaFactura()
        {
            FacturacionAutomaticaBL faBL = new FacturacionAutomaticaBL();
            SIC_T_VENTA ventaInicial = this.CrearVenta();
            ventaInicial.ven_c_itipodoc = (int)TipoParametroDetalle.FACTURA;
            SIC_T_FACTURA facturaResultante = faBL.GenerarFacturaDesdeVenta(ventaInicial);
            Assert.AreEqual(ventaInicial.SIC_T_EMP_CENTRO_COSTO.emp_cst_c_vseriefactura, facturaResultante.fac_c_serie, "La serie no corresponde a la del centro de costo");
            Assert.AreEqual(ventaInicial.ven_c_iid, facturaResultante.fac_c_iventa, "El codigo de venta no corresponde a la venta");
            Assert.AreEqual(ventaInicial.ven_c_eigv, facturaResultante.fac_c_eigv, "El igv no corresponde a la venta."  );            
            Assert.AreEqual(ventaInicial.ven_c_esubtotal, facturaResultante.fac_c_esubtotal, "El subtotal no corresponde a la venta.");
            Assert.GreaterOrEqual(2, CantidadDecimales(facturaResultante.fac_c_esubtotal), "El subtotal tiene la cantidad de decimales incorrectos.");            
            Assert.AreEqual(ventaInicial.ven_c_eigvcal, facturaResultante.fac_c_eigvcal, "El calculo de igv no corresponde a la venta.");
            Assert.GreaterOrEqual(2, CantidadDecimales(facturaResultante.fac_c_eigvcal), "El calculo de igv tiene la cantidad de decimales incorrectos.");
            Assert.AreEqual(ventaInicial.ven_c_etotal, facturaResultante.fac_c_etotal, "El total no corresponde a la venta.");
            Assert.GreaterOrEqual(2, CantidadDecimales(facturaResultante.fac_c_etotal), "El total tiene la cantidad de decimales incorrectos.");
            Assert.AreEqual(ventaInicial.ven_c_ymoneda, facturaResultante.fac_c_imoneda, "La moneda no corresponde a la venta.");
            Assert.AreEqual(ventaInicial.ven_c_vdescmoneda, facturaResultante.fac_c_vdescmoneda, "La descripción de moneda no corresponde a la venta.");
            Assert.IsNotNull(facturaResultante.SIC_T_VENTA, "La venta no esta instanciada.");

            // Comparamos los items, debe tener los items resumidos
            foreach (var item in facturaResultante.SIC_T_FACTURA_DETALLE)
            {
                Assert.IsNotNull(item.SIC_T_ITEM, "Se requiere que el objeto item no sea nulo.");
                Assert.GreaterOrEqual(2, CantidadDecimales(item.fac_det_c_epreciotot), "El total del item tiene la cantidad de decimales incorrectos.");
                Assert.AreEqual(Decimal.Round(item.fac_det_c_ecantidad * item.fac_det_c_epreciounit,2), item.fac_det_c_epreciotot, "El precio total del item no corresponde a la multiplicacion de unitario x cantidad");                
                if (item.fac_det_c_ecantidad != ventaInicial.SIC_T_VENTA_DETALLE
                                            .Where(v => v.ven_det_c_iitemid == item.fac_det_c_iitem)
                                            .Select(x => x.ven_det_c_ecantidad)
                                            .Sum())
                {
                    Assert.Fail(String.Format("Fallo comparacion de item, item {0} tiene distinta cantidad en ambos.", item.fac_det_c_iitem));
                }
            }

            Assert.AreEqual(ventaInicial.ven_c_esubtotal, facturaResultante.SIC_T_FACTURA_DETALLE
                .Select(f => f.fac_det_c_epreciounit * f.fac_det_c_ecantidad).Sum(), "El subtotal de la venta no corresponde al subtotal calculado de la factura.");
        }

        private SIC_T_VENTA CrearVenta()
        {
            SIC_T_VENTA venta = new SIC_T_VENTA();
            
            SIC_T_VENTA_DETALLE detalle;

            SIC_T_ITEM item1 = new SIC_T_ITEM();
            item1.itm_c_ccodigo = "Codigo1";
            item1.itm_c_vdescripcion = "Des1";
            SIC_T_ITEM item2 = new SIC_T_ITEM();
            item2.itm_c_ccodigo = "Codigo1";
            item2.itm_c_vdescripcion = "Des1";
            SIC_T_ITEM item3 = new SIC_T_ITEM();
            item3.itm_c_ccodigo = "Codigo1";
            item3.itm_c_vdescripcion = "Des1";

            SIC_T_EMP_CENTRO_COSTO centroCosto = new SIC_T_EMP_CENTRO_COSTO();
            centroCosto.emp_cst_c_vserieboleta = "001";
            centroCosto.emp_cst_c_vseriefactura = "001";
            centroCosto.emp_cst_c_inumerofact = 1;
            centroCosto.emp_cst_c_inumeroboleta = 1;
            centroCosto.emp_cst_c_vdesc = "Centro Costo!!";
            
            detalle = new SIC_T_VENTA_DETALLE();
            
            detalle.ven_det_c_ecantidad = 10;
            detalle.ven_det_c_epreciounit = 20;
            detalle.ven_det_c_epreciototal = Decimal.Round(detalle.ven_det_c_ecantidad * detalle.ven_det_c_epreciounit, 2);
            detalle.ven_det_c_iidalmacen = 1;
            detalle.ven_det_c_iitemid = 1;
            detalle.SIC_T_ITEM = item1;
            venta.SIC_T_VENTA_DETALLE.Add(detalle);

            detalle = new SIC_T_VENTA_DETALLE();
            detalle.ven_det_c_ecantidad = 15;
            detalle.ven_det_c_epreciounit = 20;
            detalle.ven_det_c_epreciototal = Decimal.Round(detalle.ven_det_c_ecantidad * detalle.ven_det_c_epreciounit, 2);
            detalle.ven_det_c_iidalmacen = 2;
            detalle.ven_det_c_iitemid = 1;
            detalle.SIC_T_ITEM = item1;
            venta.SIC_T_VENTA_DETALLE.Add(detalle);

            detalle = new SIC_T_VENTA_DETALLE();
            detalle.ven_det_c_ecantidad = 12.5M;
            detalle.ven_det_c_epreciounit = 13.5M;
            detalle.ven_det_c_epreciototal = Decimal.Round(detalle.ven_det_c_ecantidad * detalle.ven_det_c_epreciounit, 2);
            detalle.ven_det_c_iidalmacen = 2;
            detalle.ven_det_c_iitemid = 2;
            detalle.SIC_T_ITEM = item2;
            venta.SIC_T_VENTA_DETALLE.Add(detalle);

            detalle = new SIC_T_VENTA_DETALLE();
            detalle.ven_det_c_ecantidad = 0.7M;
            detalle.ven_det_c_epreciounit = 12;
            detalle.ven_det_c_epreciototal = Decimal.Round(detalle.ven_det_c_ecantidad * detalle.ven_det_c_epreciounit, 2);
            detalle.ven_det_c_iidalmacen = 2;
            detalle.ven_det_c_iitemid = 3;
            detalle.SIC_T_ITEM = item3;
            venta.SIC_T_VENTA_DETALLE.Add(detalle);

            venta.ven_c_eigv = 0.18M;
            venta.ven_c_esubtotal = venta.SIC_T_VENTA_DETALLE.Select(v => v.ven_det_c_epreciototal).Sum();
            venta.ven_c_eigvcal = Decimal.Round(venta.ven_c_esubtotal * venta.ven_c_eigv, 2);
            venta.ven_c_etotal = venta.ven_c_esubtotal + venta.ven_c_eigvcal;
            venta.ven_c_vdescmoneda = "SOLES";
            venta.ven_c_ymoneda = (int)TipoParametroDetalle.SOLES;
            venta.SIC_T_EMP_CENTRO_COSTO = centroCosto;
            
            return venta;
        }

        private int CantidadDecimales(decimal numero)
        {
            return BitConverter.GetBytes(decimal.GetBits(numero)[3])[2];
        }
    }
}
