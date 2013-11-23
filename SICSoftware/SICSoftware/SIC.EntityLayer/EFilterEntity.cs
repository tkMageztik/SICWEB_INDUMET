//---------------------------------------------------------------------------------------------------------------
//Creado: Jonnathan De La Barra			 
//Fecha: 18/09/2012
//Descripción: Se creó la clase para mapear las entidades para seleccionadores en formularios o filtros de búsqueda, 
//              que solo necesiten de el ID y un Name o Description para visualizar.
//Modificado: Nombre y Apellido 		Fecha Modificación:
//Descripción de la modificación:
//---------------------------------------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Text;

namespace SIC.EntityLayer
{
    public interface IFilterEntity
    {
        string Id { get; set; }
        string Name { get; set; }
    }

    public class EFilterEntity : IFilterEntity
    {
        #region Attributes

        private string _id;
        private string _name;

        #endregion

        #region Mapper

        public EFilterEntity() { }
        public EFilterEntity(string pstrID, string pstrName)
        {
            this._id = pstrID;
            this._name = pstrName;
        }
        #endregion

        #region IFilterEntity Members

        public string Id
        {
            get
            {
                return _id;
            }
            set
            {
                _id = value;
            }
        }

        public string Name
        {
            get
            {
                return _name;
            }
            set
            {
                _name = value;
            }
        }

        #endregion
    }
}
