<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CalendarDay.ascx.cs" Inherits="MVP.Calendar.CalendarDay" %>

<asp:Panel ID="DayWrapper" runat="server" CssClass="day col p-2 border border-left-0 border-top-0 text-truncate">
    <div onclick="javascript:__doPostBack('<%= UniqueID %>', '')" class="date d-flex align-items-center justify-content-center <%= CurrentDayTag %>"><%= DayText %></div>
    <div class="row pl-3 pr-3 d-none d-sm-block">
        <p onclick="javascript:__doPostBack('<%= UniqueID %>', '')" class="info"><%= InfoText %></p>
        <a onclick="javascript:__doPostBack('<%= UniqueID %>', '')" class="d-block rounded small align-self-start" title="Test 1"><%= PriceText %></a>
    </div>
</asp:Panel>