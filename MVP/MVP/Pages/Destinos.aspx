<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Destinos.aspx.cs" Inherits="MVP.Pages.Destinos" %>

<asp:Content ID="CssOverrides" ContentPlaceHolderID="HeadContent" runat="server">
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

    <!-- DESTINATIONS -->
    <div class="<%= string.IsNullOrEmpty(localData.Destino) ? "" : "hide" %>">
        <header class="head text-center d-flex pb-5 static-page__pic-four">
            <div class="container-fluid d-flex align-items-center">
                <h1 class="static-page__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_MainTitle%>"/></h1>
            </div>
        </header>

        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                    <div class="homepage__yoyoloop text-uppercase">YOYOLOOP</div>
                </div>

                <div class="row justify-content-center mb-5">
                    <div class="homepage__yoyoloop-main-description"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_MainDescription%>"/></div>
                </div>

                <div class="row justify-content-center mb-5">
                    <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_SubDescription%>"/>
                    </div>
                </div>
            </div>
        </div>
        <a OnClick="javascript:$.blockUI()" href="/Pages/Destinos?Destino=Lisboa" tabindex="-1" >
            <div class="homepage__container static-page__box-container p-0 mt-5">
                <div class="row">
                    <div class="col-md-5 static-page__box-container__first d-flex flex-column justify-content-center pl-5">
                        <div class="static-page__box-container__first__sub-title">
                            <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                            <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_DestinationCard_Title%>"/>
                        </div>
                        <div class="static-page__box-container__first__main-title">Lisboa</div>
                    </div>

                    <div class="col-md-7 static-page__box-container__second static-page__box-container__second--destinies-lisboa p-5 m-0 d-flex justify-content-center align-items-center">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_DestinationCard_Lisboa_Description%>"/>
                    </div>
                </div>
            </div>
        </a>

        <a OnClick="javascript:$.blockUI()" href="/Pages/Destinos?Destino=Porto" tabindex="-1" >
            <div class="homepage__container static-page__box-container p-0">
                <div class="row">
                    <div class="col-md-7 static-page__box-container__second static-page__box-container__second--destinies-porto static-page__box-container__second--destinies-porto--desktop p-5 m-0 d-flex justify-content-center align-items-center">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_DestinationCard_Porto_Description%>"/>
                    </div>
                    <div class="col-md-5 static-page__box-container__first d-flex flex-column justify-content-center align-items-end pr-5">
                        <div class="static-page__box-container__first__sub-title">
                            <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_DestinationCard_Title%>"/>
                            <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                        </div>
                        <div class="static-page__box-container__first__main-title">Porto</div>
                    </div>
                    <div class="col-md-7 static-page__box-container__second static-page__box-container__second--destinies-porto static-page__box-container__second--destinies-porto--mobile p-5 m-0 d-flex justify-content-center align-items-center">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_DestinationCard_Porto_Description%>"/>
                    </div>
                </div>
            </div>
        </a>

        <a OnClick="javascript:$.blockUI()" href="/Pages/Destinos?Destino=Leiria" tabindex="-1" >
            <div class="homepage__container static-page__box-container p-0">
                <div class="row">
                    <div class="col-md-5 static-page__box-container__first d-flex flex-column justify-content-center pl-5">
                        <div class="static-page__box-container__first__sub-title">
                            <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                            <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_DestinationCard_Title%>"/>
                        </div>
                        <div class="static-page__box-container__first__main-title">Leiria</div>
                    </div>
                    <div class="col-md-7 static-page__box-container__second static-page__box-container__second--destinies-leiria p-5 m-0 d-flex justify-content-center align-items-center">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_DestinationCard_Leiria_Description%>"/>
                    </div>
                </div>
            </div>
        </a>
        
        <a OnClick="javascript:$.blockUI()" href="/Pages/Destinos?Destino=Coimbra" tabindex="-1" >
            <div class="homepage__container static-page__box-container p-0 mb-5">
                <div class="row">
                    <div class="col-md-7 static-page__box-container__second static-page__box-container__second--destinies-coimbra static-page__box-container__second--destinies-coimbra--desktop p-5 m-0 d-flex justify-content-center align-items-center">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_DestinationCard_Coimbra_Description%>"/>
                    </div>
                    <div class="col-md-5 static-page__box-container__first d-flex flex-column justify-content-center align-items-end pr-5">
                        <div class="static-page__box-container__first__sub-title">
                            <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_DestinationCard_Title%>"/>
                            <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                        </div>
                        <div class="static-page__box-container__first__main-title">Coimbra</div>
                    </div>
                    <div class="col-md-7 static-page__box-container__second static-page__box-container__second--destinies-coimbra static-page__box-container__second--destinies-coimbra--mobile p-5 m-0 d-flex justify-content-center align-items-center">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_DestinationCard_Coimbra_Description%>"/>
                    </div>
                </div>
            </div>   
        </a>

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

    <!-- LISBOA -->
    <div class="<%= localData.Destino == "lisboa" ? "" : "hide" %>">
        <header class="head text-center d-flex pb-5 static-page__pic-four">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <h1 class="static-page__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_MainTitle%>"/></h1>
                <div class="row justify-content-center mt-5 mb-5">
                    <a OnClick="javascript:$.blockUI()" href="/Pages/Destinos" class="btn btn-default static-page__destination-btn static-page__destination-btn--white" tabindex="-1" ><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_btnBack_text%>"/></a>
                </div>
            </div>
        </header>

        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                    <div class="homepage__yoyoloop"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_Title%>"/></div>
                </div>

                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop-main-description"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_MainDescription%>"/></div>
                </div>

                <div class="row justify-content-center mb-5">
                <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_SubDescription%>"/>
                    </div>
                </div>
            </div>
        </div>

        <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Lisboa" tabindex="-1" >
            <div class="homepage__container static-page__box-container p-0 mt-5 mb-5">
                <div class="row">
                    <div class="col-md-4 static-page__box-container__first d-flex flex-column justify-content-center pl-5">
                        <div class="static-page__box-container__first__sub-title">
                            <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                            <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_Title%>"/>
                        </div>
                        <div class="static-page__box-container__first__main-title">Lisboa</div>
                    </div>

                    <div class="col-md-8 static-page__box-container__schedules p-0 m-0">
                        <div class="row">
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/bus-white.png" srcset="/img/bus-white@2x.png 2x, /img/bus-white@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_Stops%>"/></div>
                                <div class="static-page__box-container__schedules__text text-center">
                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_LoopCard_Description%>"/>
                                </div>
                            </div>
    
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/horarios.png" srcset="/img/horarios@2x.png 2x, /img/horarios@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_Schedules%>"/></div>
                        
                                <div class="static-page__box-container__schedules__text text-uppercase" style="font-weight: 600"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_LoopCard_Schedules_Days%>"/></div>
                                <span class="static-page__box-container__schedules__time"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_LoopCard_Schedules_Times1%>"/></span>
                                <span class="static-page__box-container__schedules__time mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_LoopCard_Schedules_Times2%>"/></span>

                                <div class="static-page__box-container__schedules__text text-uppercase" style="font-weight: 600"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_TravelTime%>"/></div>
                                <div class="static-page__box-container__schedules__text text-center pb-2"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_LoopCard_Schedules_TravelTime%>"/></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </a>
    
        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_Stops_Title%>"/></div>
                </div>

                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop-main-description"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_Stops_SubTitle%>"/></div>
                </div>

                <div class="row justify-content-center mb-5">
                <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_Stops_Description%>"/>
                    </div>
                </div>
            </div>
        </div>


        <div class="row static-page__box2 d-flex align-items-center justify-content-center ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image1 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_Stops_StopCard_First_Title%>"/></div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_Stops_StopCard_First_Description%>"/>
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_Stops_StopCard_HowToGet%>"/>
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_Stops_StopCard_First_HowToGet_Title%>"/>
                </div>

                <div class="static-page__box2__text3 text-center mb-1">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_Stops_StopCard_First_HowToGet_Details%>"/>
                </div>
            </div>
        </div>

        <div class="row static-page__box2 d-flex align-items-center justify-content-center mt-3 ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image2 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopyellow.png" srcset="/img/stopyellow@2x.png 2x, /img/stopyellow@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_Stops_StopCard_Second_Title%>"/></div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_Stops_StopCard_Second_Description%>"/>
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_Stops_StopCard_HowToGet%>"/>
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_Stops_StopCard_Second_HowToGet_Title%>"/>
                </div>

                <div class="static-page__box2__text3 text-center mb-1">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_Stops_StopCard_Second_HowToGet_Details%>"/>
                </div>
            </div>
        </div>

        <div class="row static-page__box2 d-flex align-items-center justify-content-center mt-3 ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image3 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_Stops_StopCard_Third_Title%>"/></div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_Stops_StopCard_Third_Description%>"/>
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_Stops_StopCard_HowToGet%>"/>
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_Stops_StopCard_Third_HowToGet_Title%>"/>
                </div>
                <div class="static-page__box2__text3 text-center mb-1">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_Stops_StopCard_Third_HowToGet_Details%>"/>
                </div>
            </div>
        </div>

        <div class="row static-page__box2 d-flex align-items-center justify-content-center mt-3 ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image4 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopyellow.png" srcset="/img/stopyellow@2x.png 2x, /img/stopyellow@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_Stops_StopCard_Fourth_Title%>"/></div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_Stops_StopCard_Fourth_Description%>"/>
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_Stops_StopCard_HowToGet%>"/>
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_Stops_StopCard_Fourth_HowToGet_Title%>"/>
                </div>

                <div class="static-page__box2__text3 text-center mb-1">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_Stops_StopCard_Fourth_HowToGet_Details%>"/>
                </div>
            
            </div>
        </div>

        <div class="row static-page__box2 d-flex align-items-center justify-content-center mt-3 ml-5 mr-5 mb-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image5 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_Stops_StopCard_Fifth_Title%>"/></div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_Stops_StopCard_Fifth_Description%>"/>
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_Stops_StopCard_HowToGet%>"/>
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_Stops_StopCard_Fifth_HowToGet_Title%>"/>
                </div>

                <div class="static-page__box2__text3 text-center mb-1">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Lisboa_Stops_StopCard_Fifth_HowToGet_Details%>"/>
                </div>
            </div>
        </div>
    </div>
    <!-- END OF LISBOA -->
    
    <!-- PORTO -->
    <div class="<%= localData.Destino == "porto" ? "" : "hide" %>">
        <header class="head text-center d-flex pb-5 static-page__pic-four">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <h1 class="static-page__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_MainTitle%>"/></h1>
                <div class="row justify-content-center mt-5 mb-5">
                    <a OnClick="javascript:$.blockUI()" href="/Pages/Destinos" class="btn btn-default static-page__destination-btn static-page__destination-btn--white" tabindex="-1" ><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_btnBack_text%>"/></a>
                </div>
            </div>
        </header>

        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                    <div class="homepage__yoyoloop"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_Title%>"/></div>
                </div>

                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop-main-description"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_MainDescription%>"/></div>
                </div>

                <div class="row justify-content-center mb-5">
                <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_SubDescription%>"/>
                    </div>
                </div>
            </div>
        </div>

        <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Porto" tabindex="-1" >
            <div class="homepage__container static-page__box-container p-0 mt-5 mb-5">
                <div class="row">
                    <div class="col-md-4 static-page__box-container__first d-flex flex-column justify-content-center pl-5">
                        <div class="static-page__box-container__first__sub-title">
                            <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                            <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_Title%>"/>
                        </div>
                        <div class="static-page__box-container__first__main-title">Porto</div>
                    </div>

                    <div class="col-md-8 static-page__box-container__schedules p-0 m-0">
                        <div class="row">
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/bus-white.png" srcset="/img/bus-white@2x.png 2x, /img/bus-white@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_Stops%>"/></div>
                                <div class="static-page__box-container__schedules__text text-center">
                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_LoopCard_Description%>"/>
                                </div>
                            </div>
    
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/horarios.png" srcset="/img/horarios@2x.png 2x, /img/horarios@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_Schedules%>"/></div>
                        
                                <div class="static-page__box-container__schedules__text text-uppercase" style="font-weight: 600"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_LoopCard_Schedules_Days%>"/></div>
                                <span class="static-page__box-container__schedules__time"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_LoopCard_Schedules_Times1%>"/></span>
                                <span class="static-page__box-container__schedules__time mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_LoopCard_Schedules_Times2%>"/></span>

                                <div class="static-page__box-container__schedules__text text-uppercase" style="font-weight: 600"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_TravelTime%>"/></div>
                                <div class="static-page__box-container__schedules__text text-center pb-2"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_LoopCard_Schedules_TravelTime%>"/></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </a>
    
        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_Stops_Title%>"/></div>
                </div>

                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop-main-description"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_Stops_SubTitle%>"/></div>
                </div>

                <div class="row justify-content-center mb-5">
                <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_Stops_Description%>"/>
                    </div>
                </div>
            </div>
        </div>


        <div class="row static-page__box2 d-flex align-items-center justify-content-center ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image1 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_Stops_StopCard_First_Title%>"/></div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_Stops_StopCard_First_Description%>"/>
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_Stops_StopCard_HowToGet%>"/>
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_Stops_StopCard_First_HowToGet_Title%>"/>
                </div>

                <div class="static-page__box2__text3 text-center mb-1">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_Stops_StopCard_First_HowToGet_Details%>"/>
                </div>
            </div>
        </div>

        <div class="row static-page__box2 d-flex align-items-center justify-content-center mt-3 ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image2 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopyellow.png" srcset="/img/stopyellow@2x.png 2x, /img/stopyellow@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_Stops_StopCard_Second_Title%>"/></div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_Stops_StopCard_Second_Description%>"/>               
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_Stops_StopCard_HowToGet%>"/>
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_Stops_StopCard_Second_HowToGet_Title%>"/>
                </div>

                <div class="static-page__box2__text3 text-center mb-1">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_Stops_StopCard_Second_HowToGet_Details%>"/>
                </div>
            </div>
        </div>

        <div class="row static-page__box2 d-flex align-items-center justify-content-center mt-3 ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image3 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_Stops_StopCard_Third_Title%>"/></div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_Stops_StopCard_Third_Description%>"/>
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_Stops_StopCard_HowToGet%>"/>
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_Stops_StopCard_Third_HowToGet_Title%>"/>
                </div>

                <div class="static-page__box2__text3 text-center mb-1">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_Stops_StopCard_Third_HowToGet_Details%>"/>
                </div>
            </div>
        </div>

        <div class="row static-page__box2 d-flex align-items-center justify-content-center mt-3 ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image4 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopyellow.png" srcset="/img/stopyellow@2x.png 2x, /img/stopyellow@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_Stops_StopCard_Fourth_Title%>"/></div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_Stops_StopCard_Fourth_Description%>"/>
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_Stops_StopCard_HowToGet%>"/>
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_Stops_StopCard_Fourth_HowToGet_Title%>"/>
                </div>

                <div class="static-page__box2__text3 text-center mb-1">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_Stops_StopCard_Fourth_HowToGet_Details%>"/>
                </div>
            </div>
        </div>

        <div class="row static-page__box2 d-flex align-items-center justify-content-center mt-3 ml-5 mr-5 mb-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image5 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_Stops_StopCard_Fifth_Title%>"/></div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_Stops_StopCard_Fifth_Description%>"/>
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_Stops_StopCard_HowToGet%>"/>
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_Stops_StopCard_Fifth_HowToGet_Title%>"/>
                </div>

                <div class="static-page__box2__text3 text-center mb-1">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Porto_Stops_StopCard_Fifth_HowToGet_Details%>"/>
                </div>
            </div>
        </div>
    </div>
    <!-- END OF PORTO -->

    <!-- COIMBRA -->
    <div class="<%= localData.Destino == "coimbra" ? "" : "hide" %>">
        <header class="head text-center d-flex pb-5 static-page__pic-four">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <h1 class="static-page__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Coimbra_MainTitle%>"/></h1>
                <div class="row justify-content-center mt-5 mb-5">
                    <a OnClick="javascript:$.blockUI()" href="/Pages/Destinos" class="btn btn-default static-page__destination-btn static-page__destination-btn--white" tabindex="-1" ><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_btnBack_text%>"/></a>
                </div>
            </div>
        </header>

        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                    <div class="homepage__yoyoloop"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_Title%>"/></div>
                </div>

                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop-main-description"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Coimbra_MainDescription%>"/></div>
                </div>

                <div class="row justify-content-center mb-5">
                <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Coimbra_SubDescription%>"/>
                    </div>
                </div>
            </div>
        </div>

        <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Coimbra" tabindex="-1" >
            <div class="homepage__container static-page__box-container p-0 mt-5 mb-5">
                <div class="row">
                    <div class="col-md-4 static-page__box-container__first d-flex flex-column justify-content-center pl-5">
                        <div class="static-page__box-container__first__sub-title">
                            <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                            <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_Title%>"/>
                        </div>
                        <div class="static-page__box-container__first__main-title">Coimbra</div>
                    </div>

                    <div class="col-md-8 static-page__box-container__schedules p-0 m-0">
                        <div class="row">
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/bus-white.png" srcset="/img/bus-white@2x.png 2x, /img/bus-white@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_Stops%>"/></div>
                                <div class="static-page__box-container__schedules__text text-center">
                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Coimbra_LoopCard_Description%>"/>
                                </div>
                            </div>
    
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/horarios.png" srcset="/img/horarios@2x.png 2x, /img/horarios@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_Schedules%>"/></div>
                        
                                <div class="static-page__box-container__schedules__text text-uppercase" style="font-weight: 600"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Coimbra_LoopCard_Schedules_Days%>"/></div>
                                <span class="static-page__box-container__schedules__time"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Coimbra_LoopCard_Schedules_Times1%>"/></span>
                                <span class="static-page__box-container__schedules__time mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Coimbra_LoopCard_Schedules_Times2%>"/></span>

                                <div class="static-page__box-container__schedules__text text-uppercase" style="font-weight: 600"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_TravelTime%>"/></div>
                                <div class="static-page__box-container__schedules__text text-center pb-2"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Coimbra_LoopCard_Schedules_TravelTime%>"/></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </a>
    
        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Coimbra_Stops_Title%>"/></div>
                </div>

                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop-main-description"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Coimbra_Stops_SubTitle%>"/></div>
                </div>

                <div class="row justify-content-center mb-5">
                <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Coimbra_Stops_Description%>"/>
                    </div>
                </div>
            </div>
        </div>


        <div class="row static-page__box2 d-flex align-items-center justify-content-center ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image1 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Coimbra_Stops_StopCard_First_Title%>"/></div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Coimbra_Stops_StopCard_First_Description%>"/>
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_Stops_StopCard_HowToGet%>"/>
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Coimbra_Stops_StopCard_First_HowToGet_Title%>"/>
                </div>

                <div class="static-page__box2__text3 text-center mb-1">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Coimbra_Stops_StopCard_First_HowToGet_Details%>"/>
                </div>
            </div>
        </div>

        <div class="row static-page__box2 d-flex align-items-center justify-content-center mt-3 ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image2 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopyellow.png" srcset="/img/stopyellow@2x.png 2x, /img/stopyellow@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Coimbra_Stops_StopCard_Second_Title%>"/></div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Coimbra_Stops_StopCard_Second_Description%>"/>             
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_Stops_StopCard_HowToGet%>"/>
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Coimbra_Stops_StopCard_Second_HowToGet_Title%>"/>
                </div>

                <div class="static-page__box2__text3 text-center mb-1">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Coimbra_Stops_StopCard_Second_HowToGet_Details%>"/>
                </div>
            </div>
        </div>

    </div>
    <!-- END OF COIMBRA -->

    <!-- LEIRIA -->
    <div class="<%= localData.Destino == "leiria" ? "" : "hide" %>">
        <header class="head text-center d-flex pb-5 static-page__pic-four">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <h1 class="static-page__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Leiria_MainTitle%>"/></h1>
                <div class="row justify-content-center mt-5 mb-5">
                    <a OnClick="javascript:$.blockUI()" href="/Pages/Destinos" class="btn btn-default static-page__destination-btn static-page__destination-btn--white" tabindex="-1" ><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_btnBack_text%>"/></a>
                </div>
            </div>
        </header>

        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                    <div class="homepage__yoyoloop"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_Title%>"/></div>
                </div>

                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop-main-description"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Leiria_MainDescription%>"/></div>
                </div>

                <div class="row justify-content-center mb-5">
                <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Leiria_SubDescription%>"/>
                    </div>
                </div>
            </div>
        </div>

        <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Leiria" tabindex="-1" >
            <div class="homepage__container static-page__box-container p-0 mt-5 mb-5">
                <div class="row">
                    <div class="col-md-4 static-page__box-container__first d-flex flex-column justify-content-center pl-5">
                        <div class="static-page__box-container__first__sub-title">
                            <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                            <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_Title%>"/>
                        </div>
                        <div class="static-page__box-container__first__main-title">Leiria</div>
                    </div>

                    <div class="col-md-8 static-page__box-container__schedules p-0 m-0">
                        <div class="row">
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/bus-white.png" srcset="/img/bus-white@2x.png 2x, /img/bus-white@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_Stops%>"/></div>
                                <div class="static-page__box-container__schedules__text text-center">
                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Leiria_LoopCard_Description%>"/>
                                </div>
                            </div>
    
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/horarios.png" srcset="/img/horarios@2x.png 2x, /img/horarios@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_Schedules%>"/></div>
                        
                                <div class="static-page__box-container__schedules__text text-uppercase" style="font-weight: 600"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Leiria_LoopCard_Schedules_Days%>"/></div>
                                <span class="static-page__box-container__schedules__time"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Leiria_LoopCard_Schedules_Times1%>"/></span>
                                <span class="static-page__box-container__schedules__time mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Leiria_LoopCard_Schedules_Times2%>"/></span>

                                <div class="static-page__box-container__schedules__text text-uppercase" style="font-weight: 600"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_TravelTime%>"/></div>
                                <div class="static-page__box-container__schedules__text text-center pb-2"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Leiria_LoopCard_Schedules_TravelTime%>"/></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </a>
    
        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Leiria_Stops_Title%>"/></div>
                </div>

                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop-main-description"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Leiria_Stops_SubTitle%>"/></div>
                </div>

                <div class="row justify-content-center mb-5">
                <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Leiria_Stops_Description%>"/>
                    </div>
                </div>
            </div>
        </div>


        <div class="row static-page__box2 d-flex align-items-center justify-content-center ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image1 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Leiria_Stops_StopCard_First_Title%>"/></div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Leiria_Stops_StopCard_First_Description%>"/>
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_Stops_StopCard_HowToGet%>"/>
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Leiria_Stops_StopCard_First_HowToGet_Title%>"/>
                </div>

                <div class="static-page__box2__text3 text-center mb-1">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Leiria_Stops_StopCard_First_HowToGet_Details%>"/>
                </div>
            </div>
        </div>

    </div>
    <!-- END OF LEIRIA -->
    
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