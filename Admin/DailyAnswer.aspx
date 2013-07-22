<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="DailyAnswer.aspx.cs" Inherits="Admin_DailyAnswer" %>

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
        }

        .auto-style4 {
            text-align: left;
        }

        .auto-style5 {
            text-align: left;
            font-weight: bold;
        }

        .auto-style6 {
            font-size: x-small;
        }

        .auto-style7 {
            text-align: left;
            font-size: 9pt;
        }

        .auto-style8 {
            text-align: left;
            font-weight: bold;
            font-size: 9pt;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="auto-styleTable" style="text-align: center">

        <tr>
            <td>
                <table class="auto-style2">
                    <tr>
                        <td class="auto-style3" style="vertical-align: top">
                            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                <TodayDayStyle BackColor="#CCCCCC" />
                            </asp:Calendar>

                        </td>
                    </tr>
                </table>
            </td>

        </tr>
        <tr>
            <td>
                <asp:GridView runat="server" AutoGenerateColumns="False"
                    ID="dgrdEmployee" Width="100%" OnRowDataBound="dgrdEmployee_RowDataBound" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="False">
                    <FooterStyle VerticalAlign="Top" HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:HiddenField ID="hfUserID" runat="server" Value='<%# Eval("userId") %>'></asp:HiddenField>
                                <table>
                                    <tr>
                                        <td class="auto-style5"><em>Employee ID</em></td>
                                        <span>
                                            <td class="auto-style4"><em>
                                                <asp:Label ID="lblEmployeeID" runat="server" Text='<%# Eval("employeeID") %>'></asp:Label>
                                            </em></td>
                                            <td>&nbsp;</td>
                                        </span>
                                    </tr>
                                    </span><span class="auto-style6"><span>
                                        <tr>
                                            <td class="auto-style5"><em>Name</em></td>
                                        </tr>
                                    </span></span>
                                    <td class="auto-style4"><em>
                                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                    </em></td>
                                    <td>&nbsp;</td>
                                    <tr>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:GridView runat="server" AutoGenerateColumns="False"
                                                ID="dgrdDailyAnswer"
                                                CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" ShowHeader="False">
                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="">
                                                        <ItemTemplate>
                                                            Question:&nbsp; 
                                                            <asp:Label ID="lblQuestion" runat="server" Text='<%# Eval("question") %>'></asp:Label>
                                                            <br />
                                                            Answer:&nbsp;
                                                            <asp:Label ID="lblAnswer" runat="server" Text='<%# Eval("answer") %>'></asp:Label>
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
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle HorizontalAlign="Left" BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle VerticalAlign="Top" HorizontalAlign="Left" BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />                   
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
