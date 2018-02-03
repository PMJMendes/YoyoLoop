<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Explore.aspx.cs" Inherits="MVP.TripExplorer.Explore" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    From<br />
    <asp:DropDownList ID="DdlStartRegion" runat="server" SelectMethod="DdlStartRegion_GetData" AutoPostBack="True" DataTextField="Text" DataValueField="Value" OnSelectedIndexChanged="DdlStartRegion_SelectedIndexChanged">
    </asp:DropDownList>
    <br />
    <br />
    <asp:DropDownList ID="DdlStartAP" runat="server" SelectMethod="DdlStartAP_GetData" AutoPostBack="True" DataTextField="Text" DataValueField="Value" OnSelectedIndexChanged="DdlStartAP_SelectedIndexChanged">
    </asp:DropDownList>
    <br />
    <br />
    <br />
    To<br />
    <asp:DropDownList ID="DdlEndRegion" runat="server" AutoPostBack="True" DataTextField="Text" DataValueField="Value" OnSelectedIndexChanged="DdlEndRegion_SelectedIndexChanged" SelectMethod="DdlEndRegion_GetData">
    </asp:DropDownList>
    <br />
    <br />
    <asp:DropDownList ID="DdlEndAP" runat="server" AutoPostBack="True" DataTextField="Text" DataValueField="Value" OnSelectedIndexChanged="DdlEndAP_SelectedIndexChanged" SelectMethod="DdlEndAP_GetData">
    </asp:DropDownList>
    <br />
    <br />
    <br />
    <table>
    <tr>
        <td>On</td>
        <td style="width:20px"></td>
        <td>At</td>
    </tr>
    <tr>
        <td><asp:Calendar ID="CalDate" runat="server" OnSelectionChanged="CalDate_SelectionChanged" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
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
            <asp:DropDownList ID="DdlTime" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DdlTime_SelectedIndexChanged" SelectMethod="DdlTime_GetData">
            </asp:DropDownList></td>
        <td style="width:20px"></td>

        <%-- Debug labels --%>
        <td style="vertical-align:top">
            <asp:Label ID="LbDeparture" runat="server"></asp:Label><br />
            <asp:Label ID="LbSourceRegion" runat="server"></asp:Label><br />
            <asp:Label ID="LbSourceAccessPoint" runat="server"></asp:Label><br />
            <asp:Label ID="LbDestinationRegion" runat="server"></asp:Label><br />
            <asp:Label ID="LbDestinationAccessPoint" runat="server"></asp:Label><br />
            <asp:Label ID="LbArrival" runat="server"></asp:Label>
        </td>


    </tr>
    </table>
    <br />
    <br />
    <p><asp:Button ID="BtnSearch" runat="server" Text="Search" OnClick="BtnSearch_Click" />
    </p>
    <br />
    <br />
    <asp:GridView ID="GvTripSlots" runat="server" AutoGenerateColumns="false" SelectMethod="GvTripSlots_GetData" OnRowCommand="GvTripSlots_RowCommand">
        <Columns>
            <asp:BoundField DataField="Departure" HeaderText="Departure" />
            <asp:BoundField DataField="SourceRegion" HeaderText="Origin" />
            <asp:BoundField DataField="SourceAccessPoint" HeaderText="Origin AP" />
            <asp:BoundField DataField="DestinationRegion" HeaderText="Destination" />
            <asp:BoundField DataField="DestinationAccessPoint" HeaderText="Destination AP" />
            <asp:BoundField DataField="Arrival" HeaderText="Arrival" />
            <asp:buttonfield ButtonType="Button" CommandName="Select" ShowHeader="false" Text="Book"/>
        </Columns>
    </asp:GridView>
    <br />
    <br />
</asp:Content>
