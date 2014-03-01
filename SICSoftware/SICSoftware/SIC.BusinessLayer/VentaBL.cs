using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using SIC.DataLayer;

namespace SIC.BusinessLayer
{
    public class VentaBL
    {
        public List<SIC_T_VENTA> ListarVentas(string ruc, string razonSocial, DateTime? inicio, DateTime? fin)
        {
            return new VentaDA().ListarVentas(ruc,razonSocial,inicio,fin);
        }

        public List<SIC_T_VENTA> ListarOrdenDeCompraEstado(int estado)
        {
            return new VentaDA().ListarOrdenDeCompraEstado(estado);
        }

        public SIC_T_VENTA ObtenerVenta(int id)
        {
            return new VentaDA().ObtenerVenta(id);
        }

        public bool InsertarVenta(SIC_T_VENTA _pSIC_T_VENTA)
        {
            return new VentaDA().InsertarVenta(_pSIC_T_VENTA);
        }

        public bool ModificarVenta(SIC_T_VENTA _pSIC_T_VENTA)
        {
            return new VentaDA().ModificarVenta(_pSIC_T_VENTA);
        }

        public bool DeshabilitarVenta(int id)
        {
            return new VentaDA().DeshabilitarOrdenCompra(id);
        }

        public List<SIC_T_ODC_ESTADO> ListarEstadosOrdenCompra()
        {
            return new VentaDA().ListarEstadosOrdenCompra();
        }

        public List<SIC_T_VEN_ESTADO> ListarEstadoVenta()
        {
            return new VentaDA().ListarEstadoVenta();
        }
    }
}
