﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using SIC.DataLayer;
using SIC.Data;

namespace SIC.BusinessLayer
{
    public class OrdenCompraBL
    {
        public List<SIC_T_ORDEN_DE_COMPRA> ListarOrdenDeCompra()
        {
            return new OrdenCompraDA().ListarOrdenDeCompra();
        }

        public List<SIC_T_ORDEN_DE_COMPRA> ListarOrdenDeCompra(byte? idMoneda, string idProveedor, int? idEstado)
        {
            return new OrdenCompraDA().ListarOrdenDeCompra(idMoneda, idProveedor, idEstado);
        }
        public List<SIC_T_ORDEN_DE_COMPRA> ListarOrdenDeCompraEstado(int estado)
        {
            return new OrdenCompraDA().ListarOrdenDeCompraEstado(estado);
        }

        public SIC_T_ORDEN_DE_COMPRA ObtenerOrdenCompra(int id)
        {
            return new OrdenCompraDA().ObtenerOrdenCompra(id);
        }

        public SIC_T_ORDEN_DE_COMPRA ObtenerOrdenCompraRpt(int id)
        {
            return new OrdenCompraDA().ObtenerOrdenCompraRpt(id);
        }

        public SIC_T_ORDEN_DE_COMPRA ObtenerOrdenCompraNoContext(int id)
        {
            return new OrdenCompraDA().ObtenerOrdenCompraNoContext(id);
        }


        public bool InsertarOrdenCompra(SIC_T_ORDEN_DE_COMPRA _pSIC_T_ORDEN_DE_COMPRA)
        {
            return new OrdenCompraDA().InsertarOrdenCompra(_pSIC_T_ORDEN_DE_COMPRA);
        }

        public bool ModificarOrdenCompra(SIC_T_ORDEN_DE_COMPRA _pSIC_T_ORDEN_DE_COMPRA)
        {
            return new OrdenCompraDA().ModificarOrdenCompra(_pSIC_T_ORDEN_DE_COMPRA);
        }

        //public bool DeshabilitarOrdenCompra(int id)
        //{
        //    return new OrdenCompraDA().DeshabilitarOrdenCompra(id);
        //}

        public List<SIC_T_ODC_ESTADO> ListarEstadosOrdenCompra()
        {
            return new OrdenCompraDA().ListarEstadosOrdenCompra();
        }

        public SIC_T_ORDEN_DE_COMPRA ObtenerORdenCompraPorCodigo(String codigo)
        {
            return new OrdenCompraDA().ObtenerORdenCompraPorCodigo(codigo);
        }

        public List<SIC_T_ODC_CLASE> ListarClasesOrdenCompra()
        {
            return new OrdenCompraDA().ListarClasesOrdenCompra();
        }

        public int CambiarEstadoOrdenCompra(int id, EstadoOC estado)
        {
            return new OrdenCompraDA().CambiarEstadoOrdenCompra(id, Convert.ToInt32(estado), Enum.GetName(typeof(EstadoOC), estado));
        }

        public int ObtCorrelativoPorSerieOrdenCompra(String serie)
        {
            return new OrdenCompraDA().ObtCorrelativoPorSerieOrdenCompra(serie);
        }
    }
}
