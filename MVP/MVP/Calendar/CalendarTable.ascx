<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CalendarTable.ascx.cs" Inherits="MVP.Calendar.CalendarTable" %>
<%@ Register Src="~/Calendar/CalendarDay.ascx" TagPrefix="yoyo" TagName="CalendarDay" %>

<asp:Repeater ID="WeekRepeater" runat="server" OnItemDataBound="WeekRepeater_ItemDataBound">
    <ItemTemplate>
        <asp:Repeater ID="DayRepeater" runat="server" OnItemDataBound="DayRepeater_ItemDataBound" OnItemCommand="DayClick">
            <ItemTemplate>
                <yoyo:CalendarDay runat="server" ID="CalendarDay" />
            </ItemTemplate>
        </asp:Repeater>
        <div class="w-100"></div>
    </ItemTemplate>
</asp:Repeater>
