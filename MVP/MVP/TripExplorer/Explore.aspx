<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Explore.aspx.cs" Inherits="MVP.TripExplorer.Explore" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    From<br />
    <asp:DropDownList ID="DdlStartRegion" runat="server" SelectMethod="DdlStartRegion_GetData" AutoPostBack="True" DataTextField="Text" DataValueField="Value" OnSelectedIndexChanged="DdlStartRegion_SelectedIndexChanged">
    </asp:DropDownList>
    <br />
    <asp:DropDownList ID="DdlStartAP" runat="server" SelectMethod="DdlStartAP_GetData" AutoPostBack="True" DataTextField="Text" DataValueField="Value" OnSelectedIndexChanged="DdlStartAP_SelectedIndexChanged">
    </asp:DropDownList>
    <br />
    <br />
    To<br />
    <asp:DropDownList ID="DdlEndRegion" runat="server" AutoPostBack="True" DataTextField="Text" DataValueField="Value" OnSelectedIndexChanged="DdlEndRegion_SelectedIndexChanged" SelectMethod="DdlEndRegion_GetData">
    </asp:DropDownList>
    <br />
    <asp:DropDownList ID="DdlEndAP" runat="server" AutoPostBack="True" DataTextField="Text" DataValueField="Value" OnSelectedIndexChanged="DdlEndAP_SelectedIndexChanged" SelectMethod="DdlEndAP_GetData">
    </asp:DropDownList>
    <br />
    <br />
    <br />
        <asp:Calendar ID="CalDate" runat="server" AutoPostBack="True" OnSelectionChanged="CalDate_SelectionChanged" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
        <NextPrevStyle VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#808080" />
        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
        <SelectorStyle BackColor="#CCCCCC" />
        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
        <WeekendDayStyle BackColor="#FFFFCC" />
    </asp:Calendar>
    <br />
    <asp:GridView ID="GvTripSlots" runat="server" EnablePersistedSelection="True" DataKeyNames="Departure,SourceRegion,SourceAccessPoint,DestinationRegion,DestinationAccessPoint,Arrival" SelectMethod="GvTripSlots_GetData">
    </asp:GridView>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
