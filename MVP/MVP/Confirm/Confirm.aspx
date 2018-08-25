<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="MVP.Confirm.Confirm" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="travel">
        <div class="travel__container">

            <!-- CONFIRMED EMAIL -->
            <div class="<%= pageData.UserEmailConfirmed ? "container-fluid" : "hide" %>">
                <h1 class="travel__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Confirm_MainTitle%>"/></h1>

                <div class="travel__sub-title mb-5">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Confirm_SubTitle%>"/>  <a OnClick="javascript:$.blockUI()" href="/MyTrips/MyTrips" class="travel__sub-title--red travel__sub-title--link"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, SiteMaster_NavBar_MyTrips%>"/></a>
                </div>

                <!-- START CARD -->
                <div class="row ml-0 pl-0 travel__card">
                    <div class="col-md-8 pr-0 travel__card__first">
                        <div class="travel__card__first__your-trip mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Controls_Ticket_YourTrip%>"/></div>
                        <div class="row">
                            <div class="col-md-1 d-flex align-items-center flex-column travel__card__first__path">
                                <div class="white-circle"></div>
                                <img src="/img/path.png" srcset="/img/path@2x.png 2x, /img/path@3x.png 3x">
                                <div class="white-circle"></div>
                            </div>
                            <div class="col-md-4">
                                <div class="travel__card__first__from">
                                    <div class="travel__card__first__point"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Controls_Ticket_Origin%>"/></div>
                                    <div class="travel__card__first__city"><%= pageData.StartRegionName.ToUpper() %></div>
                                    <div class="travel__card__first__area"><%= pageData.StartAPName %></div>
                                    <div class="travel__card__first__location"><%= "<br>" %></div>
                                </div>

                                <div class="travel__card__first__to mt-3">
                                    <div class="travel__card__first__point"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Controls_Ticket_Destination%>"/></div>
                                    <div class="travel__card__first__city"><%= pageData.EndRegionName.ToUpper() %></div>
                                    <div class="travel__card__first__area"><%= pageData.EndAPName %></div>
                                    <div class="travel__card__first__location"><%= "<br>" %></div>
                                </div>
                            </div>
                            <div class="col-md-7 pr-5">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="travel__card__first__text">
                                        <img class="mr-2" src="/img/calendar-black.png" srcset="/img/calendar-black@2x.png 2x, /img/calendar-black@3x.png 3x">
                                        <%= pageData.StartTime.ToString("dd MMMM").ToUpper() %>, <%= pageData.StartTime.ToString("ddd").ToUpper() %>
                                    </div>
                                    <div class="travel__card__first__text">
                                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Controls_Ticket_Going%>"/>
                                    </div>
                                </div>

                                <div class="travel__card__first__separator mt-2 mb-2"></div>

                                <div class="travel__card__first__text">
                                    <img class="mr-2" src="/img/clock-black.png" srcset="/img/clock-black@2x.png 2x, /img/clock-black@3x.png 3x">
                                    <%= pageData.StartTime.ToString("HH\\:mm") %>
                                </div>

                                <div class="travel__card__first__text">
                                    <img class="mr-2 cart" src="/img/cart-black.png" srcset="/img/cart-black@2x.png 2x, /img/cart-black@3x.png 3x">
                                    <%= pageData.Cost.ToString("C", ApplicationHelpers.DefaultCulture()) %>
                                </div>

                                <!-- HIDDEN FOR NOW -->
                                <div class="hide">
                                    <div class="d-flex justify-content-between align-items-center mt-4">
                                        <div class="travel__card__first__text">
                                            <img class="mr-2" src="/img/calendar-black.png" srcset="/img/calendar-black@2x.png 2x, /img/calendar-black@3x.png 3x">
                                            15 MARÇO,  QUARTA
                                        </div>
                                        <div class="travel__card__first__text">
                                            <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Controls_Ticket_Return%>"/>
                                        </div>  
                                    </div>

                                    <div class="travel__card__first__separator mt-2 mb-2"></div>

                                    <div class="travel__card__first__text">
                                        <img class="mr-2" src="/img/clock-black.png" srcset="/img/clock-black@2x.png 2x, /img/clock-black@3x.png 3x">
                                        18:00
                                    </div>

                                    <div class="travel__card__first__text">
                                        <img class="mr-2 cart" src="/img/cart-black.png" srcset="/img/cart-black@2x.png 2x, /img/cart-black@3x.png 3x">
                                        10,50€
                                    </div>  
                                </div>
                                <!-- END OF HIDE -->
                            </div>
                        </div>
                    </div>
                  
                    <div class="col-md-4 pl-0 travel__card__last text-right">
                        <img class="travel__card__separator" src="/img/path.png" srcset="/img/path@2x.png 2x, /img/path@3x.png 3x">

                        <p class="travel__card__last__gray-text"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Controls_Ticket_Ticket%>"/></p>
                        <p class="travel__card__last__ticket-number"><%= pageData.TicketCode.ToUpper() %></p>
                        <p class="travel__card__last__users">
                            <img src="/img/users-black.png" srcset="/img/users-black@2x.png 2x, /img/users-black@3x.png 3x"> <%= pageData.Seats.ToString() %> <%= pageData.Seats == 1 ? Resources.LocalizedText.General_Seat : Resources.LocalizedText.General_Seats %>
                        </p>
                        <p class="travel__card__last__gray-text"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Controls_Ticket_Total%>"/></p>
                        <p class="travel__card__last__price"><%= pageData.Cost.ToString("C", ApplicationHelpers.DefaultCulture()) %></p>
                    </div>
                </div>
                <!-- END CARD -->

                <div class="d-flex justify-content-between align-items-center mt-3">
                    <div class="travel__copy-bold"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Confirm_InvoiceSend%>"/> <span style="color: #ff5f6d;"><%= pageData.UserEmail %></span></div>
                </div>

                <div class="travel__separator mt-5 mb-5"></div>

                <div class="travel__my-tickets"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Confirm_MyTickets%>"/></div>

                <div class="row travel__get-tickets pt-5 pb-5">
                    <div class="col-md-3 pb-3 d-flex justify-content-center">
                        <asp:LinkButton runat="server" ID="btnEmail" OnClick="btnEmail_Click" CssClass="travel__white-btn text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Confirm_MyTickets_btnEmail_Text%>"/></asp:LinkButton>
                    </div>
                    <div class="col-md-3 pb-3 d-flex justify-content-center">
                        <asp:LinkButton runat="server" ID="btnSMS" OnClick="btnSMS_Click" CssClass="travel__white-btn text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Confirm_MyTickets_btnSMS_Text%>"/></asp:LinkButton>
                    </div>
                    <div class="col-md-3 pb-3 d-flex justify-content-center">
                        <a href="/Ticket/Ticket?Id=<%= pageData.BookingId.ToString() %>" target="_blank" class="travel__white-btn text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Confirm_MyTickets_btnDownload_Text%>"/></a>
                    </div>
                    <div class="col-md-3 pb-3 d-flex justify-content-center align-items-center">
                        <asp:LinkButton runat="server" ID="btnCalendar" OnClick="btnCalendar_Click" class="travel__card__first__text text-uppercase">
                            <img class="mr-2" src="/img/calendar-black.png" srcset="/img/calendar-black@2x.png 2x, /img/calendar-black@3x.png 3x">
                            <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Confirm_MyTickets_AddToCalendar%>"/>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
            <!-- END OF CONFIRMED EMAIL -->

            <!-- UNCONFIRMED EMAIL -->
            <div class="<%= pageData.UserEmailConfirmed ? "hide" : "container-fluid" %>">
                <h1 class="travel__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Confirm_MainTitle%>"/></h1>
                <div class="d-flex justify-content-between align-items-center mt-3">
                    <div class="travel__copy-bold">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Confirm_UnconfirmedEmail_Text%>"/> <span style="color: #ff5f6d;"><%= pageData.UserEmail %></span>
                    </div>
                </div>
                <div class="d-flex justify-content-between align-items-center mt-3">
                    <div class="travel__copy-bold">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Confirm_UnconfirmedEmail_Problems%>"/> <a OnClick="javascript:$.blockUI()" href="/Pages/Contact" style="color: #ff5f6d;"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Confirm_UnconfirmedEmail_Problems_ContactLink%>"/></a>.
                    </div>
                </div>
                <div class="travel__my-tickets">
                    <div class="row travel__get-tickets pt-5 pb-5">
                        <div class="col-md-3 pb-3 d-flex justify-content-center">
                            <asp:LinkButton runat="server" ID="btnConfirmEmail" OnClick="btnConfirmEmail_Click" CssClass="travel__white-btn text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Confirm_UnconfirmedEmail_btnResendLink_Text%>"/></asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END OF UNCONFIRMED EMAIL -->
        </div>

        <div class="container-fluid travel__invite-friends pt-5 pb-5">
            <div class="row pt-5 pb-5">
                <div class="col-md-12 text-center">
                    <h2 class="travel__invite-friends--title">
                        Convida mais amigos e viaja por apenas 3€
                    </h2>
                </div>
            </div>

            <div class="d-flex justify-content-center pt-5">
                <div class="col-md-6 text-right">
                    <button type="button" class="travel__invite-friends--facebook btn btn-primary text-uppercase">
                        <img src="/img/facebook-login.png"
                            srcset="/img/facebook-login@2x.png 2x,
                            /img/facebook-login@3x.png 3x"
                            class="mr-2">
                        Facebook
                    </button>
                </div>
                <div class="col-md-6 text-left">
                    <button type="button" class="travel__invite-friends--google btn btn-primary text-uppercase">
                        <img src="/img/google-login.png"
                            srcset="/img/google-login@2x.png 2x,
                            /img/google-login@3x.png 3x"
                            class="mr-2">
                        Google
                    </button>
                </div>
            </div>

            <div class="d-flex justify-content-center pt-4">
                <div class="col-md-6 text-right">
                    <button type="button" class="travel__invite-friends--twitter btn btn-primary text-uppercase">
                        <img src="/img/twiter.png"
                            srcset="/img/twiter@2x.png 2x,
                            /img/twiter@3x.png 3x"
                            class="mr-2">
                        Twitter
                    </button>
                </div>
                <div class="col-md-6 text-left">
                    <button type="button" class="travel__invite-friends--linkedin btn btn-primary text-uppercase d-flex justify-content-center align-items-center">
                        <img src="/img/linkedin-btn.png"
                            srcset="/img/linkedin-btn@2x.png 2x,
                            /img/linkedin-btn@3x.png 3x"
                            class="mr-2">
                        Linkedin
                    </button>
                </div>
            </div>

            <div class="d-flex justify-content-center align-items-center pt-4">
                <div class="col-md-6">
                    <p class="travel__invite-friends--or text-uppercase text-right">- OU -</p>
                </div>
                <div class="col-md-6 text-left">
                    <button type="button" class="travel__invite-friends--share btn btn-primary text-uppercase">
                        <img src="/img/share.png"
                            srcset="/img/share@2x.png 2x,
                            /img/share@3x.png 3x"
                            class="mr-2">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Confirm_Invite_btnShare_Text%>"/>
                    </button>
                </div>
            </div>

            <div class="row pt-5 pb-5">
                <div class="col-md-12 text-center">
                    <p class="travel__invite-friends--description">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Confirm_Invite_Description%>"/>
                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>