using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddItem : System.Web.UI.Page
{
    object username;
    protected void Page_Load(object sender, EventArgs e)
    {
        username = Session["username"];
        if (username == null)
            Response.Redirect("Signin.aspx");
        if (username.ToString() != "admin")
        {
            updateStatus.Attributes.Add("style", "display: none;");
        }

        senderName.Text = username.ToString();
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["bofaDBConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into items(senderName, receiverName, itemSource, itemDestination, senderNo, receiverNo, itemStatus) values('"
        + username.ToString() + "', '" + receiverName.Text + "', '" + source.Text + "', '" + destination.Text + "', '" + senderNo.Text + "', '" + receiverNo.Text + "', 'Processing')", con);
        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (SqlException)
        {
            Response.Write("<script>onload = function(){error_msg.innerHTML = 'Item addition was unsuccessful';}</script>");
            return;
        }
        Response.Write("<script>onload = function(){success_msg.innerHTML = 'Item added successfully, redirecting...';setTimeout('location=\"User.aspx\"', 2000);}</script>");
    }
}