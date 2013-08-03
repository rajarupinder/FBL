<%@ page title="FBL-FEEDBACK" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="Admin_Feedback, App_Web_b1k606xq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-styleTable {
            width: 100%;
            font-family: Arial;
            font-size: 8px;
        }

        .auto-style2 {
            width: 100%;
        }

        .auto-style3 {
            text-align: right;
            width: 50%;
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
    <div id="mid_main">
        <div id="myModal" class="reveal-modal">
            <h1>Give Feedback</h1>
            <asp:UpdatePanel ID="UPanel" runat="server">

                <ContentTemplate>
                    <p>
                        <table>
                            <tr>
                                <td colspan="2">
                                    <div align="center">
                                        <asp:Label ID="lblMessage" runat="server" Style="font-family: Arial; color: #FF0000; font-size: small; font-weight: 700; font-style: italic;"></asp:Label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Select question</td>
                                <td class="auto-style4">




                                    <asp:DropDownList ID="drpQuestion" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpQuestion_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="valrQuestion" runat="server" ControlToValidate="drpQuestion" ErrorMessage="Select question" InitialValue="0">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3" style="vertical-align: top;">Answer</td>
                                <td class="auto-style4">
                                    <asp:Panel ID="Panel1" runat="server" Visible="true">
                                        <asp:TextBox ID="txtComment" runat="server" Height="150px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                                    </asp:Panel>
                                    <asp:Panel ID="Panel2" runat="server" Visible="false">
                                        <asp:CheckBoxList ID="chkMultipleAnswer" runat="server">
                                        </asp:CheckBoxList>
                                    </asp:Panel>
                                    <asp:Panel ID="Panel3" runat="server" Visible="false">
                                        <asp:RadioButtonList ID="rbtnlOnlyOneAnswer" runat="server">
                                        </asp:RadioButtonList>
                                    </asp:Panel>

                                    <asp:Panel ID="Panel4" runat="server" Visible="false">
                                        <asp:GridView ID="dgrdRanking" runat="server" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" ShowHeader="false" ShowFooter="false">
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:DropDownList ID="drpRanking" runat="server"></asp:DropDownList>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAnswer" runat="server" Text=""></asp:Label>
                                                    </ItemTemplate>

                                                </asp:TemplateField>
                                            </Columns>
                                            <EditRowStyle BackColor="#999999" />
                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="Medium" />
                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        </asp:GridView>
                                    </asp:Panel>
                                    <asp:Panel ID="Panel5" runat="server" Visible="false" Style="font-weight: 700">
                                        <asp:TextBox ID="txtRating" runat="server" Height="150px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">&nbsp;</td>
                                <td style="text-align: left">
                                    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" CssClass="blue_butn" />
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
            <a class="fancybox black_butn" data-reveal-id="myModal">View Question</a>

        </div>
        <div>
            <br />
            <br />
            <br />
            <asp:UpdatePanel ID="UPanel2" runat="server">

                <ContentTemplate>
                    <asp:GridView runat="server" AutoGenerateColumns="False"
                        ID="dgrdQuestion"
                        OnPageIndexChanging="dgrdQuestion_PageIndexChanging" Width="100%" OnRowCancelingEdit="dgrdQuestion_RowCancelingEdit" OnRowDataBound="dgrdQuestion_RowDataBound" OnRowDeleting="dgrdQuestion_RowDeleting" OnRowEditing="dgrdQuestion_RowEditing" OnRowUpdating="dgrdQuestion_RowUpdating" EnableModelValidation="True" GridLines="None">
                        <Columns>
                            <asp:TemplateField HeaderText="RECENT ANSWERS" ItemStyle-Width="90%">
                                <ItemTemplate>
                                    <asp:HiddenField ID="hfAnswerID" runat="server" Value='<%# Eval("answerID") %>'></asp:HiddenField>
                                    <asp:Label ID="lblQuestion" runat="server" Text='<%#"Q. " + Eval("question") %>' Style="font-weight: 700; font-size: medium;"></asp:Label><br />
                                    <asp:Label ID="lblAnswer" runat="server" Text='<%#"A. " + Eval("answer") %>' Style="font-size: small;"></asp:Label>

                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--   <asp:TemplateField HeaderText="Answer">
                <ItemTemplate>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtAnswer" runat="server" Height="200px" TextMode="MultiLine" Width="450px" Text='<%# Eval("answer") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>--%>
                            <%--<asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit" CausesValidation="false">Edit</asp:LinkButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Update" CausesValidation="false">Submit</asp:LinkButton>
                                <asp:LinkButton ID="linkCancel" runat="server" CommandName="Cancel" CausesValidation="false">Cancel</asp:LinkButton>
                            </EditItemTemplate>
                        </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="DELETE" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
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
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>

