<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CalendarTable.ascx.cs" Inherits="MVP.Calendar.CalendarTable" %>
<%@ Register Src="~/Calendar/CalendarDay.ascx" TagPrefix="yoyo" TagName="CalendarDay" %>
<%@ Register Src="~/Calendar/Popover.ascx" TagPrefix="yoyo" TagName="Popover" %>

<asp:ScriptManagerProxy runat="server">
    <Scripts>
        <asp:ScriptReference Path="~/Scripts/Custom/show-popover.js" />
        <asp:ScriptReference Path="./Scripts/calendar-table.js" /> 
    </Scripts>
</asp:ScriptManagerProxy>
         


<asp:Repeater ID="WeekRepeater" runat="server" OnItemDataBound="WeekRepeater_ItemDataBound">
    <ItemTemplate>
        <asp:Repeater ID="DayRepeater" runat="server" OnItemDataBound="DayRepeater_ItemDataBound">
            <ItemTemplate>
                <yoyo:CalendarDay runat="server" ID="CalendarDay" OnDayClicked="CalendarDay_DayClicked" />
            </ItemTemplate>
        </asp:Repeater>
        <div class="w-100"></div>
    </ItemTemplate>
</asp:Repeater>

<section>
    <div class="hide popover-marker" id="<%= PopoverWrapper %>">
        <yoyo:Popover runat="server" ID="Popover" OnTimeSelected="Popover_TimeSelected" />
    </div>
</section>