<%@ Page Title="FBL-USER" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="Admin_UserDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-styleTable {
            width: 100%;
            font-family: Arial;
            font-size: small;
        }

        .auto-style2 {
            text-align: left;
        }

        .auto-style5 {
            text-align: left;
        }

        .auto-style6 {
            width: 50%;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="mid_main">
        <div id="myModal" class="reveal-modal">
            <h1>Add User</h1>
            <asp:UpdatePanel ID="UPanel" runat="server">

                <ContentTemplate>
                    <p>
                        <table width="100%">
                            <tr>
                                <td class="auto-style6">Employee ID</td>
                                <td class="auto-style5">
                                    <asp:TextBox ID="txtEmployeeID" runat="server" Width="100px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valrEmployeeID" runat="server" Display="None" ErrorMessage="Please enter employee ID"
                                        ControlToValidate="txtEmployeeID" SetFocusOnError="True" Style="color: #FF0000">*</asp:RequiredFieldValidator>

                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6">Name</td>
                                <td class="auto-style5">
                                    <asp:TextBox ID="txtName" runat="server" Width="300px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valrName" runat="server" Display="None" ErrorMessage="Please enter name"
                                        ControlToValidate="txtName" SetFocusOnError="True" Style="color: #FF0000">*</asp:RequiredFieldValidator>

                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6">Designation</td>
                                <td class="auto-style5">
                                    <asp:TextBox ID="txtDesignation" runat="server" Width="300px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valrDesignation" runat="server" Display="None" ErrorMessage="Please enter designation"
                                        ControlToValidate="txtDesignation" SetFocusOnError="True" Style="color: #FF0000">*</asp:RequiredFieldValidator>

                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6">Email ID</td>
                                <td class="auto-style5">
                                    <asp:TextBox ID="txtEmail" runat="server" Width="300px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valrEmail" runat="server" Display="None" ErrorMessage="Please enter email"
                                        ControlToValidate="txtEmail" SetFocusOnError="True" Style="color: #FF0000">*</asp:RequiredFieldValidator>

                                    <asp:RegularExpressionValidator ID="valreEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Is't valid email." Style="color: #FF0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6">Mobile No.</td>
                                <td class="auto-style5">
                                    <asp:TextBox ID="txtMobile" runat="server" Width="150px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valrMobile" runat="server" Display="None" ErrorMessage="Please enter mobile no."
                                        ControlToValidate="txtMobile" SetFocusOnError="True" Style="color: #FF0000">*</asp:RequiredFieldValidator>

                                    &nbsp;(eg: 919876543210)</td>
                            </tr>
                            <tr>
                                <td class="auto-style6">Username</td>
                                <td class="auto-style5">
                                    <asp:TextBox ID="txtUsername" runat="server" Width="150px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valrUsername" runat="server" Display="None" ErrorMessage="Please enter username"
                                        ControlToValidate="txtUsername" SetFocusOnError="True" Style="color: #FF0000">*</asp:RequiredFieldValidator>

                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6">Password</td>
                                <td class="auto-style5">
                                    <asp:TextBox ID="txtPassword" runat="server" Width="150px" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valrPassword" runat="server" Display="None" ErrorMessage="Please enter password"
                                        ControlToValidate="txtPassword" SetFocusOnError="True" Style="color: #FF0000">*</asp:RequiredFieldValidator>

                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6">Confirm Password</td>
                                <td class="auto-style5">
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" Width="150px" TextMode="Password"></asp:TextBox>
                                    <asp:CompareValidator ID="valcConfirmPassword" runat="server" ErrorMessage="Password is't match" Style="color: #FF0000" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6">Is admin?</td>
                                <td class="auto-style5">
                                    <asp:RadioButtonList ID="rbtnlIsAdmin" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1" Selected="True">True</asp:ListItem>
                                        <asp:ListItem Value="0">False</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6">Is active?</td>
                                <td class="auto-style2">
                                    <asp:RadioButtonList ID="rbtnlStatus" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="1" Selected="True">True</asp:ListItem>
                                        <asp:ListItem Value="0">False</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td style="text-align: left">
                                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="blue_butn" />
                                </td>
                            </tr>
                        </table>
                    </p>
                </ContentTemplate>
            </asp:UpdatePanel>
            <a class="close-reveal-modal">&#215;</a>
        </div>
    </div>
    <div id="table_content">
        <div class="add_ques">
            <a class="fancybox black_butn" data-reveal-id="myModal">Add User</a>
        </div>
        <br />
        <br />
        <div>
            <table class="auto-styleTable" style="text-align: center">


                <tr>
                    <td style="text-align: left">
                        <div class="search_bar">
                            <label>Search name</label>
                            <asp:TextBox ID="txtSearchBox" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click"
                                Text="Search" ValidationGroup="g1" CssClass="blue_butn" />
                        </div>

                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>

                </tr>
                <tr>
                    <td align="center">  <asp:UpdatePanel ID="UPanel2" runat="server">

                <ContentTemplate>
                        <asp:GridView runat="server" AutoGenerateColumns="False"
                            ID="dgrdUserDetail"
                            OnPageIndexChanging="dgrdUserDetail_PageIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" OnRowCancelingEdit="dgrdUserDetail_RowCancelingEdit" OnRowDataBound="dgrdUserDetail_RowDataBound" OnRowDeleting="dgrdUserDetail_RowDeleting" OnRowEditing="dgrdUserDetail_RowEditing" OnRowUpdating="dgrdUserDetail_RowUpdating">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:TemplateField HeaderText="ID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("userID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EMP. ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmployeeID" runat="server" Text='<%# Eval("employeeID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="NAME">
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DESIGNATION">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDesignation" runat="server" Text='<%# Eval("designation") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EMAIL">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CONTACT NO.">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMobileNo" runat="server" Text='<%# Eval("mobileNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="USERNAME">
                                    <ItemTemplate>
                                        <asp:Label ID="lblUsername" runat="server" Text='<%# Eval("username") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PASSWORD">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("password") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ADMIN?">
                                    <ItemTemplate>
                                        <asp:Label ID="lblIsAdmin" runat="server" Text='<%# Eval("isAdmin") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ACTIVE?">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:HiddenField ID="hfStatus" runat="server" Value='<%# Eval("status") %>'></asp:HiddenField>
                                        <asp:RadioButtonList ID="rbtnlStatus" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Value="1">True</asp:ListItem>
                                            <asp:ListItem Value="0">False</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EDIT">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="lnkEdit" runat="server" CommandName="Edit" CausesValidation="false" ImageUrl="imgs/edit.png" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Update" CausesValidation="false">Update</asp:LinkButton>
                                        <asp:LinkButton ID="linkCancel" runat="server" CommandName="Cancel" CausesValidation="false">Cancel</asp:LinkButton>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DELETE">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="lnkDelete" runat="server" CommandName="Delete" CausesValidation="false" ImageUrl="imgs/del.png" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#2A8EBC" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#2A8EBC" Font-Bold="True" ForeColor="#FFFFFF" HorizontalAlign="Left" />
                            <FooterStyle VerticalAlign="Top" HorizontalAlign="Left" />
                            <PagerStyle BackColor="#2A8EBC" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#DDDDDD" ForeColor="#444444" VerticalAlign="Top" HorizontalAlign="Left" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        </asp:GridView>  </ContentTemplate>
            </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

