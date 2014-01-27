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
        //public List<SIC_T_VENTA> ListarVentas()
        //{
        //    return new VentaDA().ListarVentas();
        //}

        public List<SIC_T_VENTA> ListarVentas(string ruc, string razonSocial, DateTime? inicio, DateTime? fin)
        {
            return new VentaDA().ListarVentas(ruc,razonSocial,inicio,fin);
        }

        public List<SIC_T_VENTA> ListarOrdenDeCompraEstado(int estado)
        {
            return new VentaDA().ListarOrdenDeCompraEstado(estado);
        }

        public SIC_T_VENTA ObtenerOrdenCompra(int id)
        {
            return new VentaDA().ObtenerOrdenCompra(id);
        }

        public bool InsertarOrdenCompra(SIC_T_VENTA _pSIC_T_VENTA)
        {
            return new VentaDA().InsertarOrdenCompra(_pSIC_T_VENTA);
        }

        public bool ModificarOrdenCompra(SIC_T_VENTA _pSIC_T_VENTA)
        {
            return new VentaDA().ModificarOrdenCompra(_pSIC_T_VENTA);
        }

        public bool DeshabilitarOrdenCompra(int id)
        {
            return new VentaDA().DeshabilitarOrdenCompra(id);
        }

        public List<SIC_T_ODC_ESTADO> ListarEstadosOrdenCompra()
        {
            return new VentaDA().ListarEstadosOrdenCompra();
        }
    }
}
