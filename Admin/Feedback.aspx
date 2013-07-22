<%@ Page Title="FBL-FEEDBACK" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Admin_Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-styleTable {
            width: 100%;
            font-family: Arial;
            font-size: small;
        }

        .auto-style2 {
            width: 100%;
        }

        .auto-style3 {
            text-align: right;
            width: 50%;
            font-weight: bold;
            font-style: italic;
        }

        .auto-style4 {
            text-align: left;
        }

        .auto-style5 {
            width: 50%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="auto-styleTable" style="text-align: center">

        <tr>
            <td>
                <table class="auto-style2">
                    <tr>
                        <td class="auto-style3">Select question</td>
                        <td class="auto-style4">
                            <asp:DropDownList ID="drpQuestion" runat="server">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Your answer</td>
                        <td class="auto-style4">
                            <asp:TextBox ID="txtAnswer" runat="server" Height="200px" TextMode="MultiLine" Width="450px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style5">&nbsp;</td>
                        <td style="text-align: left">
                            <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" Style="font-weight: 700; font-style: italic" />
                        </td>
                    </tr>
                </table>
            </td>

        </tr>
        <tr>
            <td>
                <asp:GridView runat="server" AutoGenerateColumns="False"
                    ID="dgrdQuestion"
                    OnPageIndexChanging="dgrdQuestion_PageIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" OnRowCancelingEdit="dgrdQuestion_RowCancelingEdit" OnRowDataBound="dgrdQuestion_RowDataBound" OnRowDeleting="dgrdQuestion_RowDeleting" OnRowEditing="dgrdQuestion_RowEditing" OnRowUpdating="dgrdQuestion_RowUpdating" ShowFooter="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="Question">
                            <ItemTemplate>
                                <asp:HiddenField ID="hfAnswerID" runat="server" Value='<%# Eval("answerID") %>'></asp:HiddenField>
                                <asp:Label ID="lblQuestion" runat="server" Text='<%# Eval("question") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Answer">
                            <ItemTemplate>
                                <asp:Label ID="lblAnswer" runat="server" Text='<%# Eval("answer") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAnswer" runat="server" Height="200px" TextMode="MultiLine" Width="450px" Text='<%# Eval("answer") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit" CausesValidation="false">Edit</asp:LinkButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Update" CausesValidation="false">Submit</asp:LinkButton>
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
                    <FooterStyle VerticalAlign="Top" HorizontalAlign="Left" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" VerticalAlign="Top" HorizontalAlign="Left" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

