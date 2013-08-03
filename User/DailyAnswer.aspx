<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="Admin_DailyAnswer, App_Web_b1k606xq" %>

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="auto-styleTable" style="text-align: center">

        <tr align="center">
            <td>
                <table class="auto-style2">
                    <tr align="center">
                        <td class="auto-style3" style="vertical-align: top">
                            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" CellPadding="4" DayNameFormat="Shortest">
                                <DayHeaderStyle Font-Bold="True" Font-Size="7pt" BackColor="#CCCCCC" />
                                <NextPrevStyle VerticalAlign="Bottom" />
                                <OtherMonthDayStyle ForeColor="#808080" />
                                <SelectedDayStyle BackColor="#666666" ForeColor="White" Font-Bold="True" />
                                <SelectorStyle BackColor="#CCCCCC" />
                                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                <WeekendDayStyle BackColor="#FFFFCC" />
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
                                        <td class="auto-style5"><em>Employee ID </em></td>
                                        <span>
                                            <td class="auto-style4"><em>
                                                <asp:Label ID="lblEmployeeID" runat="server" Text='<%# Eval("employeeID") %>'></asp:Label>
                                            </em></td>
                                            <td>&nbsp;</td>
                                        </span>
                                    </tr>
                                    </span><span class="auto-style6"><span>
                                        <tr>
                                            <td class="auto-style5"><em>Name </em></td>
                                            <td class="auto-style4"><em>
                                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                            </em></td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </span></span>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:GridView ID="dgrdDailyAnswer" runat="server" AutoGenerateColumns="False" ShowHeader="False" Width="100%" EnableModelValidation="True" BorderWidth="0">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="">
                                                        <ItemTemplate>
                                                            <div class="auto-style4">
                                                                <em><strong>Question:
                                                                    <asp:Label ID="lblQuestion" runat="server" Text='<%# Eval("question") %>'></asp:Label>
                                                                    <br />
                                                                    Answer: &nbsp;
                                                                <asp:Label ID="lblAnswer" runat="server" Text='<%# Eval("answer") %>'></asp:Label>
                                                                </strong></em>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <FooterStyle />
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <FooterStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                                <RowStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                </table>
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
            </td>
        </tr>
    </table>
</asp:Content>
