<%@ Page Title="Yoyoloop" Language="C#" AutoEventWireup="true" CodeBehind="Ticket.aspx.cs" Inherits="MVP.Ticket.Ticket" %>

<!DOCTYPE html>

<html lang="en">

<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="robots" content="noindex, nofollow">

    <title><%: Page.Title %></title>

    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />

    <!-- CSS -->
    <link href="<%= Context.VersionedContent("/css/bootstrap.min.css") %>"  rel="stylesheet">
    <link href="<%= Context.VersionedContent("/css/styles.min.css") %>" rel="stylesheet">
    <link href="<%= Context.VersionedContent("/css/terms_and_conditions.min.css") %>" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
</head>

<body>
    <form id="Ticket" runat="server">
        <asp:ScriptManager runat="server" EnablePartialRendering="true">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see https://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="respond" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts loaded by codebehind for version control cache handling --%>
            </Scripts>
        </asp:ScriptManager>
        
        <div class="travel">
            <div class="travel__container">
                <div class="container-fluid">

                    <asp:PlaceHolder runat="server" ID="phError" Visible="false">
                        <h1 class="travel__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, DownloadTicket_ErrorMessage%>"/></h1>
                    </asp:PlaceHolder>

                    <asp:Placeholder runat="server" ID="phSucess" Visible="false">
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
                                      VOLTA
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
                              <img src="/img/users-black.png" srcset="/img/users-black@2x.png 2x, /img/users-black@3x.png 3x"> <%= pageData.Seats.ToString() %> <%= pageData.Seats == 1 ? " " + Resources.LocalizedText.General_Seat : " " + Resources.LocalizedText.General_Seats %>
                            </p>
                            <p class="travel__card__last__gray-text"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Controls_Ticket_Total%>"/></p>
                            <p class="travel__card__last__price"><%= pageData.Cost.ToString("C", ApplicationHelpers.DefaultCulture()) %></p>
                          </div>
                        </div>
                        <!-- END CARD -->
                    </asp:Placeholder>

                </div>
            </div>
        </div>
    </form>

</body>
</html>
