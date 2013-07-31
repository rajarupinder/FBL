<%@ Page Title="FBL-USER" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="Admin_UserDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-styleTable {
            width: 100%;
            font-family: Arial;
            font-size: small;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="search_bar">
        <label>Search name</label>
        <asp:TextBox ID="txtSearchBox" runat="server"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click"
            Text="Search" ValidationGroup="g1" CssClass="blue_butn" />
        <br />

        <table class="auto-styleTable" style="text-align: center; width: 197%;">


            <tr>
                <td align="center">
                    <br />
                    <asp:GridView runat="server" AutoGenerateColumns="False"
                        ID="dgrdUserDetail"
                        OnPageIndexChanging="dgrdUserDetail_PageIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" OnRowCancelingEdit="dgrdUserDetail_RowCancelingEdit" OnRowDataBound="dgrdUserDetail_RowDataBound" OnRowDeleting="dgrdUserDetail_RowDeleting" OnRowEditing="dgrdUserDetail_RowEditing" OnRowUpdating="dgrdUserDetail_RowUpdating">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <%--    <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblID" runat="server" Text='<%# Eval("userID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="NAME" ItemStyle-Width="25%">
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="EMP. CODE" ItemStyle-Width="15%">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmployeeID" runat="server" Text='<%# Eval("employeeID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DESIGNATION"  ItemStyle-Width="20%">
                                <ItemTemplate>
                                    <asp:Label ID="lblDesignation" runat="server" Text='<%# Eval("designation") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="EMAIL"  ItemStyle-Width="25%">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CONTACT NO."  ItemStyle-Width="20%">
                                <ItemTemplate>
                                    <asp:Label ID="lblMobileNo" runat="server" Text='<%# Eval("mobileNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%-- <asp:TemplateField HeaderText="Username">
                            <ItemTemplate>
                                <asp:Label ID="lblUsername" runat="server" Text='<%# Eval("username") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Password">
                            <ItemTemplate>
                                <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("password") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <%--    <asp:TemplateField HeaderText="Is Admin?">
                                <ItemTemplate>
                                    <asp:Label ID="lblIsAdmin" runat="server" Text='<%# Eval("isAdmin") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Is Active?">
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                <asp:RadioButtonList ID="rbtnlStatus" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="1">True</asp:ListItem>
                                    <asp:ListItem Value="0">False</asp:ListItem>
                                </asp:RadioButtonList>
                            </EditItemTemplate>
                            </asp:TemplateField>--%>
                            <%--  <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit" CausesValidation="false">Edit</asp:LinkButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Update" CausesValidation="false">Update</asp:LinkButton>
                                <asp:LinkButton ID="linkCancel" runat="server" CommandName="Cancel" CausesValidation="false">Cancel</asp:LinkButton>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" CausesValidation="false">Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#2A8EBC" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#2A8EBC" Font-Bold="True" ForeColor="#FFFFFF" HorizontalAlign="Left" />
                        <FooterStyle VerticalAlign="Top" HorizontalAlign="Left" />
                        <PagerStyle BackColor="#2A8EBC" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#DDDDDD" ForeColor="#444444" VerticalAlign="Top" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>

