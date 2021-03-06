﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckStatus.aspx.cs" Inherits="CheckStatus" %>

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
			<li class="active"><a href="CheckStatus.aspx">Check Status</a></li>
			<li id="updateStatus" runat="server"><a href="UpdateStatus.aspx">Update Status</a></li>
			<li><a href="Signout.aspx">Logout</a></li>
	    </ul>
	  </div>
	</nav>
    <br />
    <br />

		<div class="container">
			<div class="row">
		        <div class="col-md-6">
		    		<h2>Enter the container tracking no</h2><br />
		            <div id="custom-search-input">
		                <div class="input-group col-md-12">
                        <form id="form1" runat="server">
                            <asp:TextBox ID="container_id" class="form-control" placeholder="Enter Container Id Here.." required runat="server"></asp:TextBox>
		                    <span class="input-group-btn">
                            <asp:Button ID="submit" runat="server" Text="Search" class="btn btn-info" OnClick="submit_Click" />
		                    </span>
                        </form>
		                </div>
		            </div>
		        </div>
			</div>
			<br />
            <font color="red" id="error_msg" runat="server"></font>
            <br />
			<div class="row">
				<div class="col-md-6" id="info" runat="server">
					<h3 id="cid" runat="server"><b>Container Id:&nbsp;</b></h3><br /><br />
                    <h3 id="sender" runat="server"><b>Sender Name:&nbsp;</b></h3><br /><br />
                    <h3 id="receiver" runat="server"><b>Receiver Name:&nbsp;</b></h3><br /><br />
                    <h3 id="source" runat="server"><b>Container Source:&nbsp;</b></h3><br /><br />
                    <h3 id="destination" runat="server"><b>Container Destination:&nbsp;</b></h3><br /><br />
                    <h3><b>Container Status:&nbsp;</b><font id="status" runat="server"></font></h3><br /><br />
				</div>
			</div>
		</div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bofaDBConnectionString %>" SelectCommand="SELECT * FROM [items]"></asp:SqlDataSource>
</body>
</html>