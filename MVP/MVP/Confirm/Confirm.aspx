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

        <asp:UpdatePanel runat="server" ID="upPromoshare" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="invitefriends__container invitefriends__container--third invitefriends__container--third--checkout">

                    <textarea class="clipboard hide"><%= pageData.UserMGMCode %></textarea>
                    <script type="text/javascript">
                        var FacebookShareUrl = 'https://www.facebook.com/sharer/sharer.php?u=' + '<%= Request.Url.Authority %>';
                        var TwitterShareUrl = 'https://twitter.com/home?status=' + '<%= Resources.LocalizedText.Profile_Invite_Promoshare_ShareMessage1%> ' + '<%= pageData.UserMGMCode %>' + ' <%= Resources.LocalizedText.Profile_Invite_Promoshare_ShareMessage2%> ' + '<%= Request.Url.Scheme + "://" + Request.Url.Authority %>' + ' <%= Resources.LocalizedText.Profile_Invite_Promoshare_ShareMessage3%>';
                        var LinkedInShareUrl = 'https://www.linkedin.com/sharing/share-offsite/?url=' + '<%= Request.Url.Authority %>';
                        var EmailShareUrl = ('mailto:?&subject=&body=' + '<%= Resources.LocalizedText.Profile_Invite_Promoshare_ShareMessage1%> ' + '<%= pageData.UserMGMCode %>' + ' <%= Resources.LocalizedText.Profile_Invite_Promoshare_ShareMessage2%> ' + '<%= Request.Url.Scheme + "://" + Request.Url.Authority %>' + ' <%= Resources.LocalizedText.Profile_Invite_Promoshare_ShareMessage3%>').replace(' ', '%20');
                    </script>

                    <div class="container-fluid d-flex flex-column align-items-center justify-content-center p-4 invitefriends__promocode">
                        <p class="invitefriends__promocode__text mb-5 text-center title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_MainTitle%>"/></p>
                        <p class="invitefriends__promocode__text mb-5 text-center"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_Promoshare_Title%>"/></p>

                        <asp:PlaceHolder runat="server" ID="phCopyLink" Visible="true">
                            <div id="copy-link-1" class="d-flex align-items-center justify-content-center invitefriends__copy-link row">
                                <div class="invitefriends__promocode__input mr-5">
                                    <div class="invitefriends__promocode__label"><%= pageData.UserMGMCode %></div>
                                </div>
                                <asp:LinkButton runat="server" ID="btnCopyLink" OnClientClick="javascript:clipboardCopy('.clipboard')" OnClick="btnCopyLink_Click" CssClass="invitefriends__promocode__reserve d-flex align-items-center justify-content-center" Text="<%$ Resources:LocalizedText, Profile_Invite_Promoshare_btnCopyLink_Text%>" />
                            </div>
                        </asp:PlaceHolder>

                        <asp:PlaceHolder runat="server" ID="phLinkCopied" Visible="false">
                            <div id="copy-link-2" class="d-flex align-items-center justify-content-center invitefriends__copy-link row">

                                <!-- Copied popover -->
                                <div class="invitefriends__popover invitefriends__popover--copied">
                                    <div class="check">

                                    </div>
                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_Promoshare_CopiedPopover%>"/>
                                </div>
                                <!-- End of copied popover -->

                                <div runat="server" id="PromocodeInput" class="invitefriends__promocode__input mr-5">
                                    <div class="invitefriends__promocode__label"><%= pageData.UserMGMCode %></div>
                                    <div class="invitefriends__promocode__copy"><asp:LinkButton ID="btnInlineCopyLink" runat="server" OnClientClick="javascript:clipboardCopy('.clipboard')" OnClick="btnInlineCopyLink_Click" Text="<%$ Resources:LocalizedText, Profile_Invite_Promoshare_btnCopyLink_Text%>"/></div>
                                </div>
                                <asp:LinkButton runat="server" ID="btnShare" OnClick="btnShare_Click" class="invitefriends__promocode__reserve d-flex align-items-center justify-content-center" Text="Partilhar" />

                                <asp:PlaceHolder runat="server" ID="phSharePopover" Visible="false">
                                    <!-- Share Popover -->
                                    <div class="invitefriends__popover invitefriends__popover--register">
                                        <div class="invitefriends__popover__link">
                                            <img src="/img/face.png" srcset="/img/face@2x.png 2x, /img/face@3x.png 3x" class="face">
                                            <asp:LinkButton runat="server" ID="btnShareFacebook" OnClick="btnShareTarget_Click" OnClientClick="window.open(FacebookShareUrl, '', 'width=100, height=100, left=24, top=24, scrollbars, resizable');">
                                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_Promoshare_ShareMenu_facebook%>"/>
                                            </asp:LinkButton>
                                        </div>
                    
                                        <div class="invitefriends__popover__separator"></div>

                                        <div class="invitefriends__popover__link">
                                            <img src="/img/twitter.png" srcset="/img/twitter@2x.png 2x, /img/twitter@3x.png 3x">
                                            <asp:LinkButton runat="server" ID="btnShareTwitter" OnClick="btnShareTarget_Click" OnClientClick="window.open(TwitterShareUrl, '', 'width=500, height=250, left=24, top=24, scrollbars, resizable');">
                                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_Promoshare_ShareMenu_twitter%>"/>
                                            </asp:LinkButton>
                                        </div>

                                        <div class="invitefriends__popover__separator"></div>

                                        <div class="invitefriends__popover__link">
                                            <img src="/img/linkedin.png" srcset="/img/linkedin@2x.png 2x, /img/linkedin@3x.png 3x">
                                            <asp:LinkButton runat="server" ID="btnShareLinkedin" OnClick="btnShareTarget_Click" OnClientClick="window.open(LinkedInShareUrl, '', 'width=600, height=400, left=24, top=24, scrollbars, resizable');">
                                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_Promoshare_ShareMenu_linkedin%>"/>
                                            </asp:LinkButton>
                                        </div>

                                        <div class="invitefriends__popover__separator"></div>

                                        <div class="invitefriends__popover__link">
                                            <img src="/img/email.png" srcset="/img/email@2x.png 2x, /img/email@3x.png 3x">
                                            <asp:LinkButton runat="server" ID="btnShareEmail" OnClientClick="location.href=EmailShareUrl" OnClick="btnShareTarget_Click">
                                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_Promoshare_ShareMenu_email%>"/>
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                    <!-- End of Share Popover -->
                                </asp:PlaceHolder>
                            </div>
                        </asp:PlaceHolder>
                        <p class="invitefriends__promocode__text mt-5 mb-3 text-center">
                            <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Confirm_Invite_Description%>"/>
                        </p>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>