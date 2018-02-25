using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.ApplicationInsights;


public partial class UpdateStatus : System.Web.UI.Page
{
    private TelemetryClient telemetry = new TelemetryClient();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Request.IsSecureConnection.Equals(false) && HttpContext.Current.Request.IsLocal.Equals(false))
        {
            Response.Redirect("https://" + Request.ServerVariables["HTTP_HOST"]
        + HttpContext.Current.Request.RawUrl);
        }

        object username = Session["username"];
        if (username == null)
            Response.Redirect("Signin.aspx");
        if (username.ToString() != "admin")
        {
            Response.Redirect("Default.aspx");
        }


    }

    protected void update_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["bofaDBConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("select count(*) from items where id = '"
       + container_id.Text  + "'", con);
        int count = Convert.ToInt32(cmd.ExecuteScalar().ToString());
        if (count > 0)
        {
            SqlCommand cmd2 = new SqlCommand("update dbo.items set itemStatus ='" + status.SelectedValue + "' where id =" + container_id.Text, con);
            try
            {
                cmd2.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                Response.Write("<script>onload = function(){error_msg.innerHTML = 'Item update was unsuccessful';}</script>");
                telemetry.TrackException(ex);
                return;
            }
            Response.Write("<script>onload = function(){success_msg.innerHTML = 'Item updated successfully, redirecting...';setTimeout('location=\"CheckStatus.aspx?cid=" + container_id.Text + "\"', 2000);}</script>");
        }
        else
        {
            Response.Write("<script>onload = function(){error_msg.innerHTML = 'Item update was unsuccessful';}</script>");
        }
        
    }
}