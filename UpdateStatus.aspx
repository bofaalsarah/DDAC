﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateStatus.aspx.cs" Inherits="UpdateStatus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Maersk Line Container Management System</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>
	<link rel="stylesheet" type="text/css" href="style.css"/>
</head>

<body>
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="Default.aspx">Maersk Line Container Management System</a>
	    </div>
	    <ul class="nav navbar-nav" style="float: right;">
		    <li><a href="Default.aspx">Home</a></li>
		    <li><a href="User.aspx">Profile</a></li>
		    <li><a href="AddItem.aspx">Add new</a></li>
			<li><a href="CheckStatus.aspx">Check Status</a></li>
			<li class="active"><a href="UpdateStatus.aspx">Update Status</a></li>
			<li><a href="Signout.aspx">Logout</a></li>
	    </ul>
	  </div>
	</nav>
    <br />
    <br />
<div class="container">
	    <h1 class="col-lg-10 well ">Update Status Form</h1>
		<div class="col-lg-10 well">
			<div class="row">
				<form  id="form1" runat="server">
					<div class="col-sm-12">
						<div class="form-group">
							<label>Container Id</label>
                            <asp:TextBox ID="container_id" class="form-control" placeholder="Enter Container Id Here.." required runat="server"></asp:TextBox>
						</div>	
						<div class="form-group">
							<label>New Status</label>
                            <asp:DropDownList ID="status" class="form-control" runat="server">
                            <asp:ListItem Value="Processing">Processing</asp:ListItem>
                            <asp:ListItem Value="Shipped">Shipped</asp:ListItem>
                            <asp:ListItem Value="Delivered">Delivered</asp:ListItem>
                        </asp:DropDownList>
						</div>
                        <asp:Button ID="update" runat="server" Text="Update" class="btn btn-lg btn-info" OnClick="update_Click" />
					</div>
				</form>
            <br /><br />
            <center><font color="green" id="success_msg"></font></center>
            <center><font color="red" id="error_msg"></font></center>
			</div>
		</div>
	</div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bofaDBConnectionString %>" SelectCommand="SELECT * FROM [items]"></asp:SqlDataSource>
</body>

</html>