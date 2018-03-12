<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Explore.aspx.cs" Inherits="MVP.TripExplorer.Explore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <table>
    <tr>
        <td>To</td>
        <td style="width:40px"></td>
        <td><asp:Label ID="LbEndAP" Visible="false" Text="Stop" runat="server"></asp:Label></td>
        <td style="width:40px"></td>
        <td><asp:Label ID="LbSeats" Visible="false" Text="Seats" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td>
            <asp:DropDownList ID="DdlEndRegion" runat="server" AutoPostBack="True" DataTextField="Text" DataValueField="Value" OnSelectedIndexChanged="DdlEndRegion_SelectedIndexChanged" SelectMethod="DdlEndRegion_GetData"
                style="width: 120px; max-width: 120px">
            </asp:DropDownList>
        </td>
        <td style="width:40px"></td>
        <td>
            <asp:DropDownList ID="DdlEndAP" runat="server" Visible="false" AutoPostBack="True" DataTextField="Text" DataValueField="Value" OnSelectedIndexChanged="DdlEndAP_SelectedIndexChanged" SelectMethod="DdlEndAP_GetData"
                style="width: 250px; max-width: 250px">
            </asp:DropDownList>
        </td>
        <td style="width:40px"></td>
        <td>
            <asp:DropDownList ID="DdlSeats" runat="server" Visible="false" AutoPostBack="True" OnSelectedIndexChanged="DdlSeats_SelectedIndexChanged" Width="45" Style="padding-left:5px">
                <asp:ListItem Text="1" Value="1"/>
                <asp:ListItem Text="2" Value="2"/>
                <asp:ListItem Text="3" Value="3"/>
                <asp:ListItem Text="4" Value="4"/>
                <asp:ListItem Text="5" Value="5"/>
                <asp:ListItem Text="6" Value="6"/>
                <asp:ListItem Text="7" Value="7"/>
            </asp:DropDownList>
        </td>
    </tr>
    <tr><td style="height:10px"></td></tr>
    <tr>
        <td>From</td>
        <td style="width:40px"></td>
        <td><asp:Label ID="LbStartAP" Visible="false" Text="Stop" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td>
            <asp:DropDownList ID="DdlStartRegion" runat="server" SelectMethod="DdlStartRegion_GetData" AutoPostBack="True" DataTextField="Text" DataValueField="Value" OnSelectedIndexChanged="DdlStartRegion_SelectedIndexChanged"
                style="width: 120px; max-width: 120px">
            </asp:DropDownList>
        </td>
        <td style="width:40px"></td>
        <td>
            <asp:DropDownList ID="DdlStartAP" runat="server" Visible="false" SelectMethod="DdlStartAP_GetData" AutoPostBack="True" DataTextField="Text" DataValueField="Value" OnSelectedIndexChanged="DdlStartAP_SelectedIndexChanged"
                style="width: 250px; max-width: 250px">
            </asp:DropDownList>
        </td>
    </tr>
    </table>
    <br />
    <br />
    <br />
    <table style="vertical-align:top">
    <tr>
        <td><asp:Label ID="LbDate" Visible="false" Text="On" runat="server"></asp:Label></td>
        <td style="width:20px"></td>
        <td></td>
    </tr>
    <tr>
        <td style="vertical-align:top"><asp:Calendar ID="CalDate" runat="server" Visible="false" OnVisibleMonthChanged="CalDate_MonthChange" OnDayRender="CalDate_DayRender" OnSelectionChanged="CalDate_SelectionChanged" BackColor="White" BorderColor="#999999" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="270px" Width="300px" CellPadding="12" Style="vertical-align:top">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt"/>
                <NextPrevStyle VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#808080" />
                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" />
                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                <WeekendDayStyle BackColor="#FFFFCC" />
            </asp:Calendar></td>
        <td style="width:20px"></td>

        <td style="vertical-align:top">
            <asp:Panel ID="PnTime" runat="server" Visible="false" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center">
                <asp:Table ID="TbDepartures" runat="server" HorizontalAlign="Center" Width="150" Height="160">
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server" ColumnSpan="2" Height="20"><asp:Label ID="LbPnTimeTextDate" text="MES DIA" runat="server"></asp:Label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server"><asp:Button ID="BtnTime1" runat="server" OnClick="BtnTime_Click" Width="60" Height="30"/></asp:TableCell>
                        <asp:TableCell runat="server"><asp:Button ID="BtnTime2" runat="server" OnClick="BtnTime_Click" Width="60" Height="30"/></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server"><asp:Button ID="BtnTime3" runat="server" OnClick="BtnTime_Click" Width="60" Height="30"/></asp:TableCell>
                        <asp:TableCell runat="server"><asp:Button ID="BtnTime4" runat="server" OnClick="BtnTime_Click" Width="60" Height="30"/></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server"><asp:Button ID="BtnTime5" runat="server" OnClick="BtnTime_Click" Width="60" Height="30"/></asp:TableCell>
                        <asp:TableCell runat="server"><asp:Button ID="BtnTime6" runat="server" OnClick="BtnTime_Click" Width="60" Height="30"/></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>
        </td>
        <td style="width:100%"></td>

        <td style="vertical-align:top">
            <asp:Panel ID="PnBook" runat="server" Visible="false" HorizontalAlign="Center" BorderStyle="Solid" BorderWidth="1px" Width="240px" Style="padding-top:5px;padding-bottom:10px;padding-left:5px;padding-right:5px">
                <asp:Table ID="TbDeparture" runat="server" HorizontalAlign="Center" Width="100%" Height="100%">
                    <asp:TableRow><asp:TableCell ColumnSpan="2" HorizontalAlign="Left"><asp:Label runat="server" text="DEPARTURE"></asp:Label></asp:TableCell></asp:TableRow>
                    <asp:TableRow Height="10px"></asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Left"><asp:Label ID="LbDepartureDate" Text="Data, Ds" runat="server"></asp:Label></asp:TableCell>
                        <asp:TableCell HorizontalAlign="Left"><asp:Label ID="LbDepartureTime" Text="Hora" runat="server"></asp:Label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Left"><asp:Label ID="LbDepartureSeats" Text="x Passenger(s)" runat="server"></asp:Label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="10px"></asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="2" HorizontalAlign="Left"><asp:Label ID="LbDepartureTo" Text="Destino" runat="server"></asp:Label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="2" HorizontalAlign="Left"><asp:Label ID="LbDepartureFrom" Text="Origem" runat="server"></asp:Label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow><asp:TableCell ColumnSpan="2" HorizontalAlign="Center"><hr style="border-top: 1px solid black"/></asp:TableCell></asp:TableRow>                    
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Left"><asp:Label ID="LbDepartureSeatCost" Text="x Seats x Cost" runat="server"></asp:Label></asp:TableCell>
                        <asp:TableCell><asp:Label ID="LbDepartureBookCost" Text="Cost" Font-Size="Larger" Font-Bold="True" runat="server"></asp:Label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow><asp:TableCell ColumnSpan="2" HorizontalAlign="Center"><hr style="border-top: 1px solid black"/></asp:TableCell></asp:TableRow>                    
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="2">
                            <asp:Button ID="BtnDepartureBook" runat="server" Text="BOOK" Width="80px" OnClick="BtnDepartureBook_Click" />
                        </asp:TableCell>
                    </asp:TableRow>                    
                </asp:Table>
            </asp:Panel>
            <br />
            <asp:Panel ID="PnDebugPay" runat="server" Visible="false" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" Width="240px" Style="padding-top:5px;padding-bottom:10px;padding-left:5px;padding-right:5px">
                <asp:Table runat="server" HorizontalAlign="Center" Width="100%" Height="100%">
                    <asp:TableRow><asp:TableCell ColumnSpan="3" Font-Size="X-Small">DEBUG<br />PAYMENT CONFIRMATION RESULT</asp:TableCell></asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell><asp:Button ID="BtnDebugPayConfirm" runat="server" Text="PAY" Width="70px" OnClick="BtnDebugPay_Click" /></asp:TableCell>
                        <asp:TableCell><asp:Button ID="BtnDebugPayCancel" runat="server" Text="CANCEL" Font-Size="Small" Width="70px" OnClick="BtnDebugPay_Click" /></asp:TableCell>
                        <asp:TableCell><asp:Button ID="BtnDebugPayIgnore" runat="server" Text="IGNORE" Font-Size="Small" Width="70px" OnClick="BtnDebugPay_Click" /></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow><asp:TableCell><asp:Label ID="LbDebugPayBookingID" runat="server" Visible="false"></asp:Label></asp:TableCell></asp:TableRow>
                </asp:Table>
            </asp:Panel>
        </td>
    </tr>
    </table>
    <br />

    <%-- Debug label --%>
            <asp:Label ID="LbDebug" visible="false" runat="server"></asp:Label><br />

    <%-- Debug gridview --%>
    <br /><asp:Button ID="BtnDebug" runat="server" Text="Debug" OnClick="BtnDebug_Click" />
    <br />
    <br />

    <asp:GridView ID="GvDebug" runat="server" Visible="false" AutoGenerateColumns="true" SelectMethod="GvDebug_GetData">
    </asp:GridView>
    <br />
    <br />
</asp:Content>
