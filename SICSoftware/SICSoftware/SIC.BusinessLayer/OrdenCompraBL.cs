using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using SIC.DataLayer;

namespace SIC.BusinessLayer
{
    public class OrdenCompraBL
    {
        public List<SIC_T_ORDEN_DE_COMPRA> ListarOrdenDeCompra()
        {
            return new OrdenCompraDA().ListarOrdenDeCompra();
        }

        public List<SIC_T_ORDEN_DE_COMPRA> ListarOrdenDeCompraEstado(int estado)
        {
            return new OrdenCompraDA().ListarOrdenDeCompraEstado(estado);
        }

        public SIC_T_ORDEN_DE_COMPRA ObtenerOrdenCompra(int id)
        {
            return new OrdenCompraDA().ObtenerOrdenCompra(id);
        }

        public bool InsertarOrdenCompra(SIC_T_ORDEN_DE_COMPRA _pSIC_T_ORDEN_DE_COMPRA)
        {
            return new OrdenCompraDA().InsertarOrdenCompra(_pSIC_T_ORDEN_DE_COMPRA);
        }

        public bool ModificarOrdenCompra(SIC_T_ORDEN_DE_COMPRA _pSIC_T_ORDEN_DE_COMPRA)
        {
            return new OrdenCompraDA().ModificarOrdenCompra(_pSIC_T_ORDEN_DE_COMPRA);
        }

        public bool DeshabilitarOrdenCompra(int id)
        {
            return new OrdenCompraDA().DeshabilitarOrdenCompra(id);
        }

        public List<SIC_T_ODC_ESTADO> ListarEstadosOrdenCompra() 
        {
            return new OrdenCompraDA().ListarEstadosOrdenCompra();
        }
    }
}
