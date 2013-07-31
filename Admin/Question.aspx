<%@ Page Title="FBL-QUESTION" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Question.aspx.cs" Inherits="Admin_Question" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-styleTable {
            width: 100%;
            font-family: Arial;
            font-size: 8px;
        }

        .auto-style5 {
            text-align: left;
        }

        .auto-style7 {
            text-align: right;
        }

        .auto-style8 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="mid_main">
        <div id="myModal" class="reveal-modal">
            <h1>Add Question</h1>
            <asp:UpdatePanel ID="UPanel" runat="server">

                <ContentTemplate>
                    <p>
                        <table width="100%">
                            <tr>
                                <td class="auto-style7" width="50%" style="vertical-align: top;">Question type</td>
                                <td class="auto-style5" width="50%">
                                    <asp:DropDownList ID="drpQuestionType" runat="server" OnSelectedIndexChanged="drpQuestionType_SelectedIndexChanged" AutoPostBack="True">
                                    </asp:DropDownList>

                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7" width="50%" style="vertical-align: top;">Question</td>
                                <td class="auto-style5" width="50%">
                                    <asp:TextBox ID="txtQuestion" runat="server" Height="150px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valrQuestion" runat="server" Display="None" ErrorMessage="Please enter question"
                                        ControlToValidate="txtQuestion" SetFocusOnError="True" Style="color: #FF0000">*</asp:RequiredFieldValidator>

                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7" style="vertical-align: top;"></td>
                                <td class="auto-style5"><span class="auto-style8"><em>
                                    <asp:Label ID="lblMC" runat="server" Text="Enter each choice in a separate line." Visible="false"></asp:Label>


                                </em></span>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:Panel ID="Panel1" runat="server" Visible="true">
                                            </asp:Panel>
                                            <asp:Panel ID="Panel2" runat="server" Visible="false">
                                                <asp:TextBox ID="txtMultipleAnswer" runat="server" Height="150px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                                            </asp:Panel>
                                            <asp:Panel ID="Panel3" runat="server" Visible="false">
                                                <asp:TextBox ID="txtOnlyOneAnswer" runat="server" Height="150px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                                            </asp:Panel>
                                            <asp:Panel ID="Panel4" runat="server" Visible="false">
                                                <asp:TextBox ID="txtRanking" runat="server" Height="150px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                                            </asp:Panel>
                                            <asp:Panel ID="Panel5" runat="server" Visible="false" Style="font-weight: 700">
                                                <asp:TextBox ID="txtRating" runat="server" Height="150px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                                            </asp:Panel>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
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
            <a class="fancybox black_butn" data-reveal-id="myModal">Add Question</a>
        </div>
        <br />
        <br />
        <div>
            <table class="auto-styleTable" style="text-align: center">

                <tr>
                    <td align="center"></td>
                </tr>
                <tr>
                    <td style="text-align: left">
                        <div class="search_bar">
                            <label>Search question</label>
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
                    <td align="center">
                        <asp:UpdatePanel ID="UPanel2" runat="server">

                            <ContentTemplate>
                                <asp:GridView runat="server" AutoGenerateColumns="False"
                                    ID="dgrdQuestion"
                                    OnPageIndexChanging="dgrdQuestion_PageIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" OnRowCancelingEdit="dgrdQuestion_RowCancelingEdit" OnRowDataBound="dgrdQuestion_RowDataBound" OnRowDeleting="dgrdQuestion_RowDeleting" OnRowEditing="dgrdQuestion_RowEditing" OnRowUpdating="dgrdQuestion_RowUpdating">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="ID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblID" runat="server" Text='<%# Eval("questionID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="QUESTION">
                                            <ItemTemplate>
                                                <asp:Label ID="lblQuestion" runat="server" Text='<%# Eval("question") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DEFAULT ANSWER">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDefaultAnswers" runat="server" Text='<%# Eval("defaultAnswers") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--<asp:TemplateField HeaderText="Post Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPostDate" runat="server" Text='<%# Eval("postDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="REPEAT DAYS">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDays" runat="server" Text='<%# Eval("days") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="drpQR" runat="server">
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="IS ACTIVE?">
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
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

