<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CalendarDay.ascx.cs" Inherits="MVP.Calendar.CalendarDay" %>
<div class="day col p-2 border border-left-0 border-top-0 text-truncate <%= DayBackgroundTag %>" rel="popover" data-popover-content="#destinationPopover">
    <div class="date d-flex align-items-center justify-content-center <%= CurrentDayTag %>"><%= DayText %></div>
    <div class="row pl-3 pr-3 d-none d-sm-block">
        <p class="info"><%= InfoText %></p>
        <a class="d-block rounded small align-self-start" title="Test 1"><%= PriceText %></a>
    </div>
</div>