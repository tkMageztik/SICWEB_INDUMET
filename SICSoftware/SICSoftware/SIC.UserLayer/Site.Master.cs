﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SIC.UserLayer
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
            
            }

            if (Session["USUARIO"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }
}
