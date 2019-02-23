<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cities.aspx.cs" Inherits="MVP.Pages.Cities" %>

<%@ Import Namespace="MVP.Pages" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <title>
        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Meta_Destinos_Title%>"/>
    </title>
    <meta name="description" content="<%= Resources.LocalizedText.Meta_Destinos_Description%>">
    <meta name="robots" content="index, follow">

    <style type="text/css">
        .homepage__navbar {
            background: none;
        }
        .homepage__navbar a {
            color: #fbfbfb !important;
        }
        .homepage__navbar a.nav-link--selected {
            color: #ff5f6d !important;
        }
        a:-webkit-any-link {
            text-decoration: none;
        }
     </style>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<% if (String.IsNullOrEmpty(SelectedCity))
    { %>
    <!-- DESTINATIONS -->
    <div>
        <header class="head text-center d-flex pb-5 static-page__pic-destinos">
            <div class="container-fluid d-flex align-items-center">
                <h1 class="static-page__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Cities__MainTitle%>"/></h1>
            </div>
        </header>

        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column align-items-center">
                <div class="row  align-items-center mb-5">
                    <div class="homepage__yoyoloop text-uppercase">YOYOLOOP</div>
                </div>

                <div class="row  align-items-center mb-5">
                    <div class="homepage__yoyoloop-main-description"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Cities__MainDescription%>"/></div>
                </div>

                <div class="row  align-items-center mb-5">
                    <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row  align-items-center mb-5">
                    <div class="static-page__first__sub-description">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Cities__SubDescription%>"/>
                    </div>
                </div>
            </div>
        </div>

        <asp:Repeater runat="server" DataSource="<%# AllCities %>">
            <ItemTemplate>
                <a OnClick="javascript:$.blockUI()" href="/Pages/Cities?City=<%# Eval("Name") %>" tabindex="-1" >
                        <div class="d-flex flex-wrap <%# (Container.ItemIndex % 2) == 0 ? "flex-row" : "flex-row flex-md-row-reverse" %>">
                            <div class="col-12 col-md-5 d-flex flex-column justify-content-center <%# (Container.ItemIndex % 2) == 0 ? "align-items-start pl-5" : "align-items-end pr-5" %> static-page__box-container__first">
                                <div class="p-0 static-page__box-container__first__sub-title">
                                    <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Cities__Card_Title%>"/>
                                </div>
                                <div class="p-0 static-page__box-container__first__main-title"><%# Eval("Name") %></div>
                            </div>

                            <div class="col-12 col-md-7 d-flex justify-content-center align-items-center static-page__box-container__second static-page__box-container__second--destinies-lisboa p-5 m-0">
                                <%# ((Cities)Container.Page).CityText((String)Eval("Name"), "Description") %>
                            </div>
                        </div>
                </a>
            </ItemTemplate>
        </asp:Repeater>

        <div class="homepage__container homepage__container--forth">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                    <div class="homepage__why-catch-ride"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Why_Title%>"/></div>
                </div>
                <div class="row row-no-padding">
                    <div class="homepage__why-card col-md-3 d-flex flex-column align-items-center">
                        <div class="homepage__why-card__image mb-4">
                            <img src="/img/acessivel.png" srcset="/img/acessivel@2x.png 2x, /img/acessivel@3x.png 3x">
                        </div>
                        <div class="homepage__why-card__title mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Why_Accessible_Title%>"/></div>
                        <div class="homepage__why-card__content mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Why_Accessible_Description%>"/></div>
                    </div>

                    <div class="homepage__why-card col-md-3 d-flex flex-column align-items-center">
                        <div class="homepage__why-card__image mb-4">
                            <img src="/img/conveniente.png" srcset="/img/conveniente@2x.png 2x, /img/conveniente@3x.png 3x">
                        </div>
                        <div class="homepage__why-card__title mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Why_Conveninent_Title%>"/></div>
                        <div class="homepage__why-card__content mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Why_Conveninent_Description%>"/></div>
                    </div>

                    <div class="homepage__why-card col-md-3 d-flex flex-column align-items-center">
                        <div class="homepage__why-card__image mb-4">
                            <img src="/img/fiavel.png" srcset="/img/fiavel@2x.png 2x, /img/fiavel@3x.png 3x">
                        </div>
                        <div class="homepage__why-card__title mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Why_Reliable_Title%>"/></div>
                        <div class="homepage__why-card__content mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Why_Reliable_Description%>"/></div>
                    </div>

                    <div class="homepage__why-card col-md-3 d-flex flex-column align-items-center">
                        <div class="homepage__why-card__image mb-4">
                            <img src="/img/sustentavel.png" srcset="/img/sustentavel@2x.png 2x, /img/sustentavel@3x.png 3x">
                        </div>
                        <div class="homepage__why-card__title mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Why_Sustainable_Title%>"/></div>
                        <div class="homepage__why-card__content mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Why_Sustainable_Description%>"/></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END OF DESTINATIONS -->

<% } else { %>

    <!-- CITY: <%# SelectedCity %> -->
    <div>
        <header class="head text-center d-flex pb-5 static-page__pic-destinos">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <h1 class="static-page__main-title"><%# CityText(SelectedCity, "MainTitle") %></h1>
                <div class="row justify-content-center mt-5 mb-5">
                    <a OnClick="javascript:$.blockUI()" href="/Pages/Cities" class="btn btn-default static-page__destination-btn static-page__destination-btn--white" tabindex="-1" ><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_btnBack_text%>"/></a>
                </div>
            </div>
        </header>

        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                    <div class="homepage__yoyoloop"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_Title%>"/></div>
                </div>

                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop-main-description"><%# CityText(SelectedCity, "MainDescription") %></div>
                </div>

                <div class="row justify-content-center mb-5">
                <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description"><%# CityText(SelectedCity, "SubDescription") %></div>
                </div>
            </div>
        </div>

        <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=<%# SelectedCity %>" tabindex="-1" >
            <div class="homepage__container static-page__box-container p-0 mt-5 mb-5">
                <div class="row">
                    <div class="col-md-4 static-page__box-container__first d-flex flex-column justify-content-center pl-5">
                        <div class="static-page__box-container__first__sub-title">
                            <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                            <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_Title%>"/>
                        </div>
                        <div class="static-page__box-container__first__main-title"><%# SelectedCity %></div>
                    </div>

                    <div class="col-md-8 static-page__box-container__schedules static-page__box-container__schedules--lisboa p-0 m-0">
                        <div class="row">
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/bus-white.png" srcset="/img/bus-white@2x.png 2x, /img/bus-white@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3">
                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_Stops%>"/>
                                </div>
                                <div class="static-page__box-container__schedules__text text-center"><%# CityText(SelectedCity, "LoopCard_Description") %></div>
                            </div>
    
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/horarios.png" srcset="/img/horarios@2x.png 2x, /img/horarios@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3">
                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_Schedules%>"/>
                                </div>
                        
                                <div class="static-page__box-container__schedules__text text-uppercase" style="font-weight: 600">
                                    <%# CityText(SelectedCity, "LoopCard_Schedules_Days") %>
                               </div>
                                <span class="static-page__box-container__schedules__time">
                                    <%# CityText(SelectedCity, "LoopCard_Schedules_Times1") %>
                                </span>
                                <span class="static-page__box-container__schedules__time mb-3">
                                    <%# CityText(SelectedCity, "LoopCard_Schedules_Times2") %>
                                </span>

                                <div class="static-page__box-container__schedules__text text-uppercase" style="font-weight: 600">
                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_TravelTime%>"/>
                               </div>
                                <div class="static-page__box-container__schedules__text text-center pb-2">
                                    <%# CityText(SelectedCity, "LoopCard_Schedules_TravelTime") %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </a>
    
        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                    <div class="homepage__yoyoloop">
                        <%# CityText(SelectedCity, "Stops_Title") %>
                    </div>
                </div>

                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop-main-description">
                    <%# CityText(SelectedCity, "Stops_SubTitle") %>
                </div>
                </div>

                <div class="row justify-content-center mb-5">
                <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        <%# CityText(SelectedCity, "Stops_Description") %>
                    </div>
                </div>
            </div>
        </div>

        <asp:Repeater ID="CityStopRepeater" runat="server" DataSource="<%# SelectedCityStops %>">
            <ItemTemplate>
                <div class="row static-page__box2 d-flex align-items-center justify-content-center ml-5 mr-5">
                    <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image<%# (Container.ItemIndex % 2) + 1 %> d-flex align-items-center justify-content-center flex-column">
                        <asp:PlaceHolder id="PlaceHolder1" runat="server" visible='<%# (Container.ItemIndex % 2) == 0 %>'>
                            <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                        </asp:PlaceHolder>
                        <asp:PlaceHolder id="PlaceHolder2" runat="server" visible='<%# (Container.ItemIndex % 2) == 1 %>'>
                            <img src="/img/stopyellow.png" srcset="/img/stopyellow@2x.png 2x, /img/stopyellow@3x.png 3x">
                        </asp:PlaceHolder>
                        <div class="mt-4 text-uppercase static-page__box2__image__copy">
                            <%# Eval("Name") %>
                        </div>
                    </div>

                    <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                        <%# ((Cities)Container.Page).StopText("Description", (String)Eval("Name")) %>
                    </div>

                    <div class="col-md-4 p-4">
                        <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                            <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_Stops_StopCard_HowToGet%>"/>
                        </div>

                        <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                            <%# ((Cities)Container.Page).StopText("HowToGet_Title", (String)Eval("Name")) %>
                        </div>

                        <div class="static-page__box2__text3 text-center mb-1">
                            <%# ((Cities)Container.Page).StopText("HowToGet_Details", (String)Eval("Name")) %>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <!-- END OF CITY -->
<% } %>

    <div class="static-page__container static-page__container--forth">
        <div class="container-fluid d-flex flex-column justify-content-center">    

            <div class="static-page__separator mt-5 mb-5"></div>

            <div class="row justify-content-center mb-5 align-items-center">
                <div class="static-page__any-question mr-5"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_FAQ_Questions%>"/></div>
                <a OnClick="javascript:$.blockUI()" href="/Help/Help" class="btn btn-default static-page__question-btn static-page__question-btn--white" tabindex="-1" ><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_FAQ_Questions_HelpLink%>"/></a>
            </div>
        </div>
    </div>  

</asp:Content>