using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Signin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void signin_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["bofaDBConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("select count(*) from users where username = '"
        + username.Text + "' and password = '" + password.Text + "'", con);
        int count = Convert.ToInt32(cmd.ExecuteScalar().ToString());
        if(count > 0)
        {
            Session["username"] = username.Text;
            Response.Redirect("Default.aspx");
        }
        else
        {
            Response.Write("<script>onload = function(){error_msg.innerHTML = 'Incorrect username/password combination';}</script>");
        }
        }
}