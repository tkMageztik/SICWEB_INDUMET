
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using SIC.DataLayer;

namespace SIC.BusinessLayer
{
    public class IgvBL
    {
	
		// Comentario
        public SIC_T_IGV ObtenerIgv(DateTime fecha)
        {
            return new IgvDA().ObtenerIgv(fecha); 
        }
    }
}
