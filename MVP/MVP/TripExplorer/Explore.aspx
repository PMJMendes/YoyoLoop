<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Explore.aspx.cs" Inherits="MVP.TripExplorer.Explore" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <table>
    <tr>
        <td>To</td>
        <td style="width:40px"></td>
        <td><asp:Label ID="LbEndAP" Visible="false" Text="Stop" runat="server"></asp:Label></td>
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
    <table>
    <tr>
        <td><asp:Label ID="LbDate" Visible="false" Text="On" runat="server"></asp:Label></td>
        <td style="width:20px"></td>
        <td></td>
    </tr>
    <tr>
        <td><asp:Calendar ID="CalDate" runat="server" Visible="false" OnVisibleMonthChanged="CalDate_MonthChange" OnDayRender="CalDate_DayRender" OnSelectionChanged="CalDate_SelectionChanged" BackColor="White" BorderColor="#999999" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="270px" Width="300px" CellPadding="12">
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
            <asp:Panel ID="PnTime" runat="server" Visible="false" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" Width="140px" Height="160px">
                <asp:Label ID="LbPnTimeTextDate" runat="server"></asp:Label>
                <br />
                <asp:Table ID="TbDepartures" runat="server" BorderStyle="None" CellSpacing="10" HorizontalAlign="Center" CellPadding="5">
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server"><asp:Button ID="BtnDeparture1" runat="server" OnClick="BtnDeparture_Click" /></asp:TableCell>
                        <asp:TableCell runat="server"><asp:Button ID="BtnDeparture2" runat="server" OnClick="BtnDeparture_Click" /></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server"><asp:Button ID="BtnDeparture3" runat="server" OnClick="BtnDeparture_Click" /></asp:TableCell>
                        <asp:TableCell runat="server"><asp:Button ID="BtnDeparture4" runat="server" OnClick="BtnDeparture_Click" /></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server"><asp:Button ID="BtnDeparture5" runat="server" OnClick="BtnDeparture_Click" /></asp:TableCell>
                        <asp:TableCell runat="server"><asp:Button ID="BtnDeparture6" runat="server" OnClick="BtnDeparture_Click" /></asp:TableCell>
                    </asp:TableRow>
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
