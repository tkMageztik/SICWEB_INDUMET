using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;

namespace SIC.DataLayer
{
    public class ImpresoraDA
    {
        public String ObtenerImpresoraDefecto()
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                var impresora = contexto.SIC_T_IMPRESORA.FirstOrDefault();
                if (impresora != null)
                {
                    return impresora.imp_c_vruta;
                }
                else
                {
                    return null;
                }
            }
        }

        public void ActualizarImpresora(String rutaImpresora)
        {
            using (SICDBWEBEntities contexto = new SICDBWEBEntities())
            {
                var impresora = contexto.SIC_T_IMPRESORA.FirstOrDefault();
                if (impresora != null)
                {
                    impresora.imp_c_vruta = rutaImpresora;
                    contexto.ApplyCurrentValues("SIC_T_IMPRESORA", impresora);
                    contexto.SaveChanges();
                }
                else
                {
                    impresora = new SIC_T_IMPRESORA();
                    impresora.imp_c_vruta = rutaImpresora;
                    contexto.AddToSIC_T_IMPRESORA(impresora);
                    contexto.SaveChanges();
                }
            }
        }
    }
}