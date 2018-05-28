<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CalendarTable.ascx.cs" Inherits="MVP.Calendar.CalendarTable" %>
<%@ Register Src="~/Calendar/CalendarDay.ascx" TagPrefix="yolo" TagName="CalendarDay" %>

<asp:Repeater ID="WeekRepeater" runat="server">
    <ItemTemplate>
        <asp:Repeater ID="DayRepeater" runat="server">
            <ItemTemplate>
                <yolo:CalendarDay runat="server" ID="CalendarDay" />
            </ItemTemplate>
        </asp:Repeater>
    </ItemTemplate>
</asp:Repeater>
