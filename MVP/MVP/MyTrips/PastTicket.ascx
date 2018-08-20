<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PastTicket.ascx.cs" Inherits="MVP.MyTrips.PastTicket" %>

<div class="row travel__card-past-past mb-5">
    <div class="col-md-8 pr-0 travel__card-past__first">
        <div class="travel__card-past__first__your-trip mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Controls_Ticket_YourTrip%>"/></div>
        <div class="row">
            <div class="col-md-1 d-flex align-items-center flex-column travel__card-past__first__path">
                <div class="white-circle"></div>
                <img src="/img/path.png" srcset="/img/path@2x.png 2x, /img/path@3x.png 3x">
                <div class="white-circle"></div>
            </div>
            <div class="col-md-4">
                <div class="travel__card-past__first__from">
                    <div class="travel__card-past__first__point"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Controls_Ticket_Origin%>"/></div>
                    <div class="travel__card-past__first__city"><%= TicketBooking.Trip.Departure.Route.StartRegion.Name.ToUpper() %></div>
                    <div class="travel__card-past__first__area"><%= TicketBooking.Trip.StartAccessPoint.Name %></div>
                    <div class="travel__card-past__first__location"><%= "<br>" %></div>
                </div>

                <div class="travel__card-past__first__to mt-3">
                    <div class="travel__card-past__first__point"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Controls_Ticket_Destination%>"/></div>
                    <div class="travel__card-past__first__city"><%= TicketBooking.Trip.Departure.Route.EndRegion.Name.ToUpper() %></div>
                    <div class="travel__card-past__first__area"><%= TicketBooking.Trip.EndAccessPoint.Name %></div>
                    <div class="travel__card-past__first__location"><%= "<br>" %></div>
                </div>
            </div>

            <div class="col-md-7 pr-5">
                <div class="d-flex justify-content-between align-items-center">
                    <div class="travel__card-past__first__text">
                        <img class="mr-2" src="/img/calendar-black.png" srcset="/img/calendar-black@2x.png 2x, /img/calendar-black@3x.png 3x">
                        <%= TicketBooking.Trip.StartTime.ToString("dd MMMM").ToUpper() %>, <%= TicketBooking.Trip.StartTime.ToString("ddd").ToUpper() %>
                    </div>
                    <div class="travel__card-past__first__text">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Controls_Ticket_Going%>"/>
                    </div>
                </div>

                <div class="travel__card-past__first__separator mt-2 mb-2"></div>

                <div class="travel__card-past__first__text">
                    <img class="mr-2" src="/img/clock-black.png" srcset="/img/clock-black@2x.png 2x, /img/clock-black@3x.png 3x">
                    <%= TicketBooking.Trip.StartTime.ToString("HH\\:mm") %>
                </div>

                <div class="travel__card-past__first__text">
                    <img class="mr-2 cart" src="/img/cart-black.png" srcset="/img/cart-black@2x.png 2x, /img/cart-black@3x.png 3x">
                    <%= TicketBooking.Cost.ToString("C", ApplicationHelpers.DefaultCulture()) %>
                </div>

                <div class="hide">
                    <div class="d-flex justify-content-between align-items-center mt-4">
                        <div class="travel__card-past__first__text">
                            <img class="mr-2" src="/img/calendar-black.png" srcset="/img/calendar-black@2x.png 2x, /img/calendar-black@3x.png 3x">
                            15 MARÇO,  QUARTA
                        </div>
                        <div class="travel__card-past__first__text">
                            VOLTA
                        </div>
                    </div>

                    <div class="travel__card-past__first__separator mt-2 mb-2"></div>

                    <div class="travel__card-past__first__text">
                        <img class="mr-2" src="/img/clock-black.png" srcset="/img/clock-black@2x.png 2x, /img/clock-black@3x.png 3x">
                        18:00
                    </div>

                    <div class="travel__card-past__first__text">
                        <img class="mr-2 cart" src="/img/cart-black.png" srcset="/img/cart-black@2x.png 2x, /img/cart-black@3x.png 3x">
                        10,50€
                    </div>  
                </div>
            </div>
        </div>
    </div>
            
    <div class="col-md-4 pl-0 travel__card-past__last text-right">
        <img class="travel__card-past__separator" src="/img/path.png" srcset="/img/path@2x.png 2x, /img/path@3x.png 3x">
        <div class="<%= TicketBooking.Status == MVP.Models.Entities.BookingStatus.CANCELLED ? "" : "hide" %>">
            <div class="row text-center">
                <div class="col-12">
                    <div class="travel__card-past--cancelled text-uppercase d-flex align-items-center justify-content-center">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Controls_Ticket_Canceled%>"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="<%= TicketBooking.Status == MVP.Models.Entities.BookingStatus.COMPLETED ? "" : "hide" %>">
            <div class="row text-center">
                <div class="col-12">
                    <div class="travel__card-past--cancelled text-uppercase d-flex align-items-center justify-content-center">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Controls_Ticket_Completed%>"/>
                    </div>
                </div>
            </div>
        </div>
        <p class="travel__card-past__last__users">
            <img src="/img/users-black.png" srcset="/img/users-black@2x.png 2x, /img/users-black@3x.png 3x">
            <%= TicketBooking.Seats.ToString() %> <%= TicketBooking.Seats == 1 ? " " + Resources.LocalizedText.General_Seat : " " + Resources.LocalizedText.General_Seats %>
        </p>
        <p class="travel__card-past__last__gray-text pb-0 mb-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Controls_Ticket_Total%>"/></p>
        <p class="travel__card-past__last__price"><%= TicketBooking.Cost.ToString("C", ApplicationHelpers.DefaultCulture()) %></p>
        <div class="row text-center">
            <div class="col-12">
                <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=<%= TicketBooking.Trip.Departure.Route.EndRegion.Name %>&Ori=<%= TicketBooking.Trip.Departure.Route.StartRegion.Name %>&sap=<%= TicketBooking.Trip.StartAccessPoint.Name %>&dap=<%= TicketBooking.Trip.EndAccessPoint.Name %>" class="travel__card--book-again btn btn-primary text-uppercase">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Controls_Ticket_BookAgain%>"/>
                </a>
            </div>
        </div>
        <div class="row text-center pt-2">
            <div class="col-12">
                <a href="#" class="travel__card-past--see-details text-uppercase">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Controls_Ticket_Details%>"/>
                </a>
            </div>
        </div>
    </div>
</div>

