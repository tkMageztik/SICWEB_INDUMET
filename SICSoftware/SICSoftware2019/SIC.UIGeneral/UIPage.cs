//---------------------------------------------------------------------------------------------------------------
//Creado: Jonnathan De La Barra			 Fecha: 19/09/2012
//Descripción: Aqui se declaran los metodos y propiedades comunes para todas las paginas construidas dentro de la 
// aplicación.
//Modificado: Nombre y Apellido 		Fecha Modificación:
//Descripción de la modificación:
//---------------------------------------------------------------------------------------------------------------

using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using System.IO;

namespace SIC.UIGeneral
{
    public class UIPage : Page
    {
        #region Properties

        public int Paginacion { get; set; }

        public string SessionActual
        {
            get
            {
                if (ViewState["SessionActual"] != null)
                    return (string)ViewState["SessionActual"];
                else
                    return string.Empty;
            }
            set { ViewState["SessionActual"] = value; }
        }

        #endregion

        #region Events

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            string str_Url = Path.Combine(Request.ApplicationPath, "/Login/frmLogin.aspx");

            try
            {
                if (Context.Session == null)
                {
                    Response.Redirect(str_Url);
                }
            }
            catch (NullReferenceException ex)
            {
                if (Context.Session == null)
                {
                    Response.Redirect(str_Url);
                }
                else
                    throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region metodos

        public static void Fill(DropDownList List, IFilterEntity[] Source, string strDataTextField,
            string strDataValueField, string strEmptyText, string strEmptyValue)
        {
            List.Items.Clear();
            List.Items.Add(new ListItem(strEmptyText, strEmptyValue));
            List.AppendDataBoundItems = true;
            Fill(List, Source, strDataTextField, strDataValueField);
            List.AppendDataBoundItems = false;
        }
        private static void Fill(DropDownList List, IFilterEntity[] source, string strDataTextField,
            string strDataValueField)
        {
            List.DataSource = source;
            List.DataValueField = strDataValueField;
            List.DataTextField = strDataTextField;
            List.DataBind();
        }

        public static void Fill(ListControl List, object source, string strEmptyText, string strEmptyValue)
        {
            List.Items.Clear();
            List.Items.Add(new ListItem(strEmptyText, strEmptyValue));
            List.AppendDataBoundItems = true;
            Fill(List, source);
            List.AppendDataBoundItems = false;
        }
        private static void Fill(ListControl List, object source)
        {
            List.DataSource = source;
            List.DataBind();
        }
        public static void Fill(Object Lst, String ValueField, String TextField, DropDownList Cbo, String strEmptyText, String strEmptyValue)
        {
            Cbo.Items.Clear();
            Cbo.DataSource = Lst;
            Cbo.DataValueField = ValueField;
            Cbo.DataTextField = TextField;

            if (strEmptyText.Length != 0 && strEmptyValue.Length != 0)
            {
                Cbo.Items.Add(new ListItem(strEmptyText, strEmptyValue));
            }

            Cbo.AppendDataBoundItems = true;
            Cbo.DataBind();
            Cbo.AppendDataBoundItems = false;
        }

        public static string FormatoMonto(decimal decMonto)
        {
            return String.Format("{0:n}", decMonto);
        }

        public string FormatoDecimal(object objValor, Int16 nCantidad0)
        {
            string strNumero = string.Empty;

            if (objValor == DBNull.Value)
                return "";

            strNumero = objValor.ToString();

            //if (strNumero.Trim().Length > 0)
            //strNumero = Decimal.Parse("0" + strNumero).ToString("N" + nCantidad0.ToString());

            return strNumero;
        }

        protected virtual void ShowMessage(string Message)
        {

        }

        #endregion
    }
}
