﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Maersk Line Container Management System</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
</head>
<body>
    <div class="container">
    <div class="row" style="margin-top: 25px">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <h1 class="text-center login-title">Sign Up for Maersk Line Container Management System</h1>
            <div class="account-wall">
                <img class="profile-img" src="https://cdn.dribbble.com/users/124355/screenshots/2199042/profile_1x.png" />
                <form class="form-signin" id="form1" runat="server">
                     <asp:TextBox ID="username" class="form-control" placeholder="Username" required runat="server"></asp:TextBox><br />
                     <asp:TextBox ID="password" class="form-control" placeholder="Password" TextMode="Password" required runat="server"></asp:TextBox>
                     <asp:TextBox ID="phoneNo"  class="form-control" placeholder="Phone Number" required runat="server"></asp:TextBox><br />
                     <asp:Button ID="Button1" runat="server" Text="Sign Up" class="btn btn-lg btn-primary btn-block" OnClick="Button1_Click" />
                </form>
                <center><font color="green" id="success_msg"></font></center>
                <center><font color="red" id="error_msg"></font></center>
                <a href="Signin.aspx" class="text-center new-account">Sign In</a><br />
            </div>
        </div>
    </div>
</div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bofaDBConnectionString %>" SelectCommand="SELECT * FROM [users]"></asp:SqlDataSource>
</body>
</html>

