using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Signout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Request.IsSecureConnection.Equals(false) && HttpContext.Current.Request.IsLocal.Equals(false))
        {
            Response.Redirect("https://" + Request.ServerVariables["HTTP_HOST"]
        + HttpContext.Current.Request.RawUrl);
        }

        Session["username"] = null;
        Response.Redirect("Signin.aspx");
    }
}