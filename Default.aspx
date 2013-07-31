<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FBL</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".username").focus(function () {
                $(".user-icon").css("left", "-48px");
            });
            $(".username").blur(function () {
                $(".user-icon").css("left", "0px");
            });

            $(".password").focus(function () {
                $(".pass-icon").css("left", "-48px");
            });
            $(".password").blur(function () {
                $(".pass-icon").css("left", "0px");
            });
        });
    </script>

</head>
<body>
    <div id="main">
        <div id="container">
            <div id="innercontainer">
                <div class="logo">
                    <a href="index.html">
                        <img src="imgs/logo.png" /></a>
                </div>
                <div id="wrapper">
                    <div class="user-icon"></div>
                    <div class="pass-icon"></div>
                    <form id="form1" runat="server" name="login-form" class="login-form">
                        <div style="text-align: center">
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <h1>
                                <asp:Label ID="lblMessage" runat="server" Style="font-family: Arial; color: #FFFFFF; font-size: 8pt; font-weight: 700; background-color: #000000;"></asp:Label>
                            </h1>
                        </div>
                        <div class="content">
                            <label>Username</label>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="input username"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="valrUserName" runat="server" Display="None" ErrorMessage="Please enter username"
                                ControlToValidate="txtUserName" SetFocusOnError="True" Style="color: #FF0000">*</asp:RequiredFieldValidator>
                            <label class="password_label">Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="valrPassword" runat="server" Display="None"
                                ErrorMessage="Please enter password" ControlToValidate="txtPassword" SetFocusOnError="True" Style="color: #FF0000">*</asp:RequiredFieldValidator>
                        </div>
                        <div class="footer">
                            <asp:Button ID="btnLogin" runat="server" CssClass="button" OnClick="btnLogin_Click" Text="Login" Style="font-weight: 700" />
                        </div>
                    </form>
                </div>
                <div class="gradient"></div>
            </div>
        </div>
    </div>
</body>
</html>
