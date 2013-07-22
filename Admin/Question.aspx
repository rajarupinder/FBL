<%@ Page Title="FBL-QUESTION" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Question.aspx.cs" Inherits="Admin_Question" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-styleTable {
            width: 100%;
            font-family: Arial;
            font-size: small;
        }

        .auto-style5 {
            text-align: left;
        }

        .auto-style7 {
            text-align: right;
            font-weight: bold;
            font-style: italic;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="auto-styleTable" style="text-align: center">

        <tr>
            <td align="center">
                <table width="100%">
                    <tr>
                        <td class="auto-style7" width="50%" style="vertical-align: top;">Question</td>
                        <td class="auto-style5" width="50%">
                            <asp:TextBox ID="txtQuestion" runat="server" Height="150px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="valrQuestion" runat="server" Display="None" ErrorMessage="Please enter question"
                                ControlToValidate="txtQuestion" SetFocusOnError="True" Style="color: #FF0000">*</asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7">Repeat after days</td>
                        <td class="auto-style5">
                            <asp:DropDownList ID="drpQR" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7">Is active?</td>
                        <td class="auto-style5">
                            <asp:RadioButtonList ID="rbtnlStatus" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1" Selected="True">True</asp:ListItem>
                                <asp:ListItem Value="0">False</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td style="text-align: left">
                            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" style="font-weight: 700; font-style: italic" />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="text-align: left"><em><strong>Search question</strong></em>
                <asp:TextBox ID="txtSearchBox" runat="server"></asp:TextBox>
                &nbsp;<asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click"
                    Text="Search" ValidationGroup="g1" style="font-weight: 700; font-style: italic" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>

        </tr>
        <tr>
            <td align="center">
                <asp:GridView runat="server" AutoGenerateColumns="False"
                    ID="dgrdQuestion"
                    OnPageIndexChanging="dgrdQuestion_PageIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" OnRowCancelingEdit="dgrdQuestion_RowCancelingEdit" OnRowDataBound="dgrdQuestion_RowDataBound" OnRowDeleting="dgrdQuestion_RowDeleting" OnRowEditing="dgrdQuestion_RowEditing" OnRowUpdating="dgrdQuestion_RowUpdating">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label ID="lblID" runat="server" Text='<%# Eval("questionID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Question">
                            <ItemTemplate>
                                <asp:Label ID="lblQuestion" runat="server" Text='<%# Eval("question") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Post Date">
                            <ItemTemplate>
                                <asp:Label ID="lblPostDate" runat="server" Text='<%# Eval("postDate") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Repeat Days">
                            <ItemTemplate>
                                <asp:Label ID="lblDays" runat="server" Text='<%# Eval("days") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="drpQR" runat="server">
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Is Active?">
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
                        <asp:TemplateField HeaderText="">
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
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />                    
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

