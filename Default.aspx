<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FBL-Login</title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-size: medium;
        }

        .custmer-15 {
            text-align: right;
        }

        .style6 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="font-family: Arial; font-size: small;">
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table width="990" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="990" height="68" valign="top" background="images/header.jpg">&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="990" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td valign="top">
                                    <table width="318" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="text-align: center">
                                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                                </asp:ScriptManager>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="318" height="40" background="images/login-top.jpg" class="auto-style1"><strong>Login</strong></td>
                                        </tr>
                                        <tr>
                                            <td width="318" background="images/login-top.jpg" style="text-align: center">
                                                <asp:Label ID="lblMessage" runat="server" Style="text-align: left; color: #FF0000; font-size: 9pt;"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" background="images/login-center.jpg">
                                                <table align="center" cellpadding="0" cellspacing="0" style="width: 136px">
                                                    <tr>
                                                        <td class="custmer-15">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left"><span class="custmer-15"><strong>Username</strong></span></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="219" class="style6">
                                                            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="valrUserName" runat="server" Display="None" ErrorMessage="Please enter username"
                                                                ControlToValidate="txtUserName" SetFocusOnError="True" Style="color: #FF0000">*</asp:RequiredFieldValidator>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left"><span class="custmer-15"><strong>Password</strong></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style6">
                                                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="valrPassword" runat="server" Display="None"
                                                                ErrorMessage="Please enter password" ControlToValidate="txtPassword" SetFocusOnError="True" Style="color: #FF0000">*</asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center">
                                                            <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" style="font-weight: 700" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td width="91">&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
