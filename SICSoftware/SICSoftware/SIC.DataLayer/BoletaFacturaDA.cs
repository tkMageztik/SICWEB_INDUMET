using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;

namespace SIC.DataLayer
{
    public class BoletaFacturaDA
    {

        /// <summary>
        /// Inserta la lista de documentos de boleta y factura en la base de datos y actualiza la lista de ventas.
        /// A su vez, obtiene la serie que se usarán en los documentos.
        /// </summary>
        /// <param name="listaBoleta">Lista de Boletas.</param>
        /// <param name="listaFactura">Lista de Facturas.</param>
        /// <param name="listaVenta">Lista de Ventas.</param>
        public void InsertarDocumentos(List<SIC_T_BOLETA> listaBoleta, List<SIC_T_FACTURA> listaFactura)
        {
            List<SIC_T_VENTA> listaVenta = new List<SIC_T_VENTA>();
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                foreach (SIC_T_BOLETA boleta in listaBoleta)
                {
                    boleta.bol_c_iventa = boleta.SIC_T_VENTA.ven_c_iid;                    
                    var cc = contexto.SIC_T_EMP_CENTRO_COSTO.FirstOrDefault(x => boleta.SIC_T_VENTA.SIC_T_EMP_CENTRO_COSTO.emp_cst_c_iid == x.emp_cst_c_iid);
                    if (cc != null)
                    {
                        listaVenta.Add(boleta.SIC_T_VENTA);
                        boleta.bol_c_numero = cc.emp_cst_c_inumeroboleta;
                        cc.emp_cst_c_inumeroboleta++;
                        boleta.SIC_T_VENTA = null;
                        foreach (var item in boleta.SIC_T_BOLETA_DETALLE)
                        {
                            if (item.SIC_T_ITEM != null)
                            {
                                item.bol_det_c_iitem = item.SIC_T_ITEM.itm_c_iid;
                                item.SIC_T_ITEM = null;
                            }
                        }

                        contexto.AddToSIC_T_BOLETA(boleta);
                        contexto.ApplyCurrentValues("SICDBWEBEntities.SIC_T_EMP_CENTRO_COSTO", cc);
                    }
                }

                foreach (SIC_T_FACTURA factura in listaFactura)
                {                    
                    factura.fac_c_iventa = factura.SIC_T_VENTA.ven_c_iid;                    
                    var cc = contexto.SIC_T_EMP_CENTRO_COSTO.FirstOrDefault(x => factura.SIC_T_VENTA.SIC_T_EMP_CENTRO_COSTO.emp_cst_c_iid == x.emp_cst_c_iid);
                    if (cc != null)
                    {
                        listaVenta.Add(factura.SIC_T_VENTA);
                        factura.fac_c_numero = cc.emp_cst_c_inumerofact;
                        cc.emp_cst_c_inumerofact++;
                        factura.SIC_T_VENTA = null;
                        foreach (var item in factura.SIC_T_FACTURA_DETALLE)
                        {
                            if (item.SIC_T_ITEM != null)
                            {
                                item.fac_det_c_iitem = item.SIC_T_ITEM.itm_c_iid;
                                item.SIC_T_ITEM = null;
                            }
                        }

                        contexto.AddToSIC_T_FACTURA(factura);
                        contexto.ApplyCurrentValues("SICDBWEBEntities.SIC_T_EMP_CENTRO_COSTO", cc);
                    }
                    
                }

                foreach (SIC_T_VENTA venta in listaVenta)
                {
                    var v = contexto.SIC_T_VENTA.FirstOrDefault(x => x.ven_c_iid == venta.ven_c_iid);
                    contexto.ApplyCurrentValues("SICDBWEBEntities.SIC_T_VENTA", venta);
                }

                contexto.SaveChanges();
            }
        }

        /// <summary>
        /// Obtiene una lista de Facturas desde la base de datos.
        /// </summary>
        /// <returns>List de SIC_T_FACTURA</returns>
        public List<SIC_T_FACTURA> ListarFactura()
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                return (from x in contexto.SIC_T_FACTURA
                        .Include("SIC_T_VENTA")
                        .Include("SIC_T_VENTA.SIC_T_CLIENTE")
                        select x).ToList();
            }
        }

        /// <summary>
        /// Obtiene una lista de Boletas desde la base de datos.
        /// </summary>
        /// <returns>Lista de SIC_T_BOLETA</returns>
        public List<SIC_T_BOLETA> ListarBoleta()
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                return (from x in contexto.SIC_T_BOLETA
                        .Include("SIC_T_VENTA")
                        .Include("SIC_T_VENTA.SIC_T_CLIENTE")
                        select x).ToList();
            }
        }

        /// <summary>
        /// Obtiene la Boleta por id.
        /// </summary>
        /// <returns>Objecto SIC_T_BOLETA</returns>
        public SIC_T_BOLETA ObtenerBoleta(int id)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                return (from x in contexto.SIC_T_BOLETA
                        where x.bol_c_iid == id
                        select x).FirstOrDefault();
            }
        }

        /// <summary>
        /// Obtiene la Factura por id.
        /// </summary>
        /// <returns>Objecto SIC_T_FACTURA</returns>
        public SIC_T_FACTURA ObtenerFactura(int id)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                contexto.SIC_T_ITEM.MergeOption = System.Data.Objects.MergeOption.NoTracking;
                return (from x in contexto.SIC_T_FACTURA
                        where x.fac_c_iid == id
                        select x).FirstOrDefault();
            }
        }

        public void ModificarFactura(SIC_T_FACTURA factura)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                contexto.ApplyCurrentValues("SICDBWEBEntities.SIC_T_FACTURA", factura);
                contexto.SaveChanges();
            }
        }

        public void ModificarBoleta(SIC_T_BOLETA boleta)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                contexto.ApplyCurrentValues("SICDBWEBEntities.SIC_T_BOLETA", boleta);
                contexto.SaveChanges();
            }
        }
    }
}
