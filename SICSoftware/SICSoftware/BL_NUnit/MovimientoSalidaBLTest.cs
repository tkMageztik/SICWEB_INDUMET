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
    public class MovimientoSalidaBLTest
    {
        [Test]
        public void TestDetalleMovimientoDesdeVenta()
        {
            MovimientoSalidaBL mvsBL = new MovimientoSalidaBL();
            SIC_T_MOVIMIENTO_SALIDA movSalida = new SIC_T_MOVIMIENTO_SALIDA();
            SIC_T_VENTA venta = this.CrearVenta();
            mvsBL.GenerarDetalleMoviminetoSalida(movSalida, venta);
            foreach (SIC_T_VENTA_DETALLE detalleVenta in venta.SIC_T_VENTA_DETALLE)
            {
                SIC_T_MOVIMIENTO_SALIDA_DETALLE detalleSalida = movSalida.SIC_T_MOVIMIENTO_SALIDA_DETALLE
                                        .FirstOrDefault(x => x.alm_c_iid == detalleVenta.ven_det_c_iidalmacen
                                                          && x.itm_c_iid == detalleVenta.ven_det_c_iitemid);
                Assert.IsNotNull(detalleSalida, "No se genero el detalle salida para la venta con item " + detalleVenta.ven_det_c_iitemid
                                                + " y almacen " + detalleVenta.ven_det_c_iitemid);
                Assert.AreEqual(detalleSalida.mvs_det_c_ecant, detalleVenta.ven_det_c_ecantidad, 
                                                "La cantidad del detalle salida y detalle venta no corresponden");                
            }
        }

//        [Test]
        public void TestDetalleMovimientoDesdeItemAlmacen()
        {
            MovimientoSalidaBL mvsBL = new MovimientoSalidaBL();
            SIC_T_MOVIMIENTO_SALIDA movSalida = new SIC_T_MOVIMIENTO_SALIDA();
            List<SIC_T_ITEM_ALMACEN> listaItemAlmacen = this.CrearListaItemAlmacen();
            mvsBL.ActualizarListaItems(movSalida, listaItemAlmacen);
            foreach (SIC_T_MOVIMIENTO_SALIDA_DETALLE detalleMovSal in movSalida.SIC_T_MOVIMIENTO_SALIDA_DETALLE)
            {
                SIC_T_ITEM_ALMACEN itemAlmacen = listaItemAlmacen.FirstOrDefault(x => x.itm_c_iid == detalleMovSal.itm_c_iid
                                                                                   && x.alm_c_iid == detalleMovSal.alm_c_iid);
                Assert.IsNotNull(itemAlmacen, "No se elimino el detalle salida con datos item" + detalleMovSal.itm_c_iid
                                                + " y almacen " + detalleMovSal.alm_c_iid);
                Assert.AreEqual(detalleMovSal.mvs_det_c_ecant, itemAlmacen.itm_alm_c_ecantidad,
                                               "La cantidad del detalle salida y el itemalmacen no corresponden");
            }
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

        private List<SIC_T_ITEM_ALMACEN> CrearListaItemAlmacen()
        {
            List<SIC_T_ITEM_ALMACEN> listaItemAlmacen = new List<SIC_T_ITEM_ALMACEN>();

            SIC_T_ITEM item1 = new SIC_T_ITEM();
            item1.itm_c_ccodigo = "Codigo1";
            item1.itm_c_vdescripcion = "Des1";
            SIC_T_ITEM item2 = new SIC_T_ITEM();
            item2.itm_c_ccodigo = "Codigo1";
            item2.itm_c_vdescripcion = "Des1";
            SIC_T_ITEM item3 = new SIC_T_ITEM();
            item3.itm_c_ccodigo = "Codigo1";
            item3.itm_c_vdescripcion = "Des1";

            SIC_T_ALMACEN almacen1 = new SIC_T_ALMACEN();
            almacen1.alm_c_iid = 1;
            almacen1.alm_c_vdesc = "Almacen1";
            SIC_T_ALMACEN almacen2 = new SIC_T_ALMACEN();
            almacen2.alm_c_iid = 2;
            almacen2.alm_c_vdesc = "Almacen2";

            SIC_T_ITEM_ALMACEN itemAlmacen1 = new SIC_T_ITEM_ALMACEN();
            itemAlmacen1.SIC_T_ITEM = item1;
            itemAlmacen1.SIC_T_ALMACEN = almacen1;
            itemAlmacen1.itm_c_iid = almacen1.alm_c_iid;
            itemAlmacen1.alm_c_iid = item1.itm_c_iid;
            listaItemAlmacen.Add(itemAlmacen1);

            SIC_T_ITEM_ALMACEN itemAlmacen2 = new SIC_T_ITEM_ALMACEN();
            itemAlmacen2.SIC_T_ITEM = item2;
            itemAlmacen2.SIC_T_ALMACEN = almacen1;
            itemAlmacen2.itm_c_iid = almacen1.alm_c_iid;
            itemAlmacen2.alm_c_iid = item2.itm_c_iid;
            listaItemAlmacen.Add(itemAlmacen2);

            SIC_T_ITEM_ALMACEN itemAlmacen3 = new SIC_T_ITEM_ALMACEN();
            itemAlmacen3.SIC_T_ITEM = item3;
            itemAlmacen3.SIC_T_ALMACEN = almacen2;
            itemAlmacen3.itm_c_iid = almacen2.alm_c_iid;
            itemAlmacen3.alm_c_iid = item3.itm_c_iid;
            listaItemAlmacen.Add(itemAlmacen3);

            SIC_T_ITEM_ALMACEN itemAlmacen4 = new SIC_T_ITEM_ALMACEN();
            itemAlmacen4.SIC_T_ITEM = item1;
            itemAlmacen4.SIC_T_ALMACEN = almacen2;
            itemAlmacen4.itm_c_iid = almacen2.alm_c_iid;
            itemAlmacen4.alm_c_iid = item1.itm_c_iid;
            listaItemAlmacen.Add(itemAlmacen4);

            return listaItemAlmacen;
        }
    }
}
