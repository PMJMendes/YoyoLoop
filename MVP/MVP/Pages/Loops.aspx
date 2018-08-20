<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Loops.aspx.cs" Inherits="MVP.Pages.Loops" %>

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
        .name a:-webkit-any-link {
            color: inherit !important;
            text-decoration: none !important;
        }
        .homepage__container a:-webkit-any-link {
            color: inherit !important;
            text-decoration: none !important;
        }
     </style>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- LOOPS -->
    <div class="<%= string.IsNullOrEmpty(localData.Loop) ? "" : "hide" %>">
        <header class="head text-center d-flex pb-5 static-page__pic-five">
            <div class="container-fluid d-flex align-items-center">
                <h1 class="static-page__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_MainTitle%>"/></h1>
            </div>
        </header>

        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                    <div class="homepage__yoyoloop text-uppercase">YOYOLOOP</div>
                </div>

                <div class="row justify-content-center mb-5">
                    <div class="homepage__yoyoloop-main-description"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_SubTitle%>"/></div>
                </div>

                <div class="row justify-content-center mb-5">
                    <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_SubDescription%>"/>
                    </div>
                </div>
            </div>
        </div>

        <section class="yoyoloops">
            <div class="container-fluid">
    
                <!-- CASCAIS -->
                <div class="row">
                    <div class="city col-sm-4 mx-auto text-left">
                        <div class="">
                            <p class="loop text-uppercase">
                                <img src="/img/loopico_2@2x.png" alt="" class="img-responsive"/>
                                Loop
                            </p>
                            <p class="name"><a OnClick="javascript:$.blockUI()" href="/Pages/Loops?Loop=Lisboa-Cascais" tabindex="-1">Cascais</a></p>
                            <p class="price"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_From%>"/> 5€</p>
                        </div>
                    </div>
                    <div class="city-details col-sm-8 cascais">
                        <div class="row">
                            <div class="col-sm-12 text-center">
                                <div class="directions">
                                    <div class="text-center">
                                        <p><img src="/img/stopred_2@3x.png" alt="" class="img-responsive stop"/></p>
                                        <p class="city-name text-uppercase">Cascais</p>
                                    </div>
            
                                    <div class="">
                                        <img src="/img/arrows_3@2x.png" alt="" class="img-responsive arrow"/>
                                    </div>
            
                                    <div class="text-center">
                                        <p><img src="/img/stopyellow_2@3x.png" alt="" class="img-responsive stop"/></p>
                                        <p class="city-name text-uppercase">Lisboa</p>
                                    </div>
                                </div>
                            </div>
                        </div>
    
                        <div class="access-points row">
                            <div class="col p-3">
                                <p class="ap-left text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_LisboaCascais_APs_Cascais%>"/></p>
                            </div>
        
                            <div class="col p-3">
                                <p class="ap-right text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_LisboaCascais_APs_Lisboa%>"/></p>
                            </div>
                        </div>
    
                        <div class="access-points row">
                            <div class="departures-1 half">
                                <div class="row">
                                    <div class="col-md-6 text-left pb-3">
                                        <p class="text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_LisboaCascais_Departures_Cascais%>"/></p>
                                        <p class="text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_LisboaCascais_Departures_Cascais_Days%>"/></p>
                                        <p class="text-uppercase timeline-left"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_LisboaCascais_Departures_Cascais_Times%>"/></p>
                                    </div>
                                    <div class="col-md-6 text-center d-flex align-items-center justify-content-center">
                                        <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Lisboa&Ori=Linha%20de%20Cascais" class="btn-book text-uppercase d-flex align-items-center justify-content-center">Reservar</a>
                                    </div>
                                </div>
                            </div>
        
                            <div class="departures-2 half">
                                <div class="row">
                                    <div class="col-md-6 text-left pb-3">
                                        <p class="text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_LisboaCascais_Departures_Lisboa%>"/></p>
                                        <p class="text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_LisboaCascais_Departures_Lisboa_Days%>"/></p>
                                        <p class="text-uppercase timeline-right"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_LisboaCascais_Departures_Lisboa_Times%>"/></p>
                                    </div>

                                    <div class="col-md-6 text-center d-flex align-items-center justify-content-center">
                                        <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Linha%20de%20Cascais&Ori=Lisboa" class="btn-book text-uppercase d-flex align-items-center justify-content-center">Reservar</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

    
                <!-- COIMBRA -->
                <div class="row">
                    <div class="city loop-mobile col-sm-4 mx-auto text-right right-side">
                        <p class="loop text-uppercase">
                            <img src="/img/loopico_2@2x.png" alt="" class="img-responsive"/>
                            Loop
                        </p>
                        <p class="name"><a OnClick="javascript:$.blockUI()" href="/Pages/Loops?Loop=Lisboa-Coimbra" tabindex="-1">Coimbra</a></p>
                        <p class="price"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_From%>"/> 12€</p>
                    </div>
                    <div class="city-details col-sm-8 coimbra">
                        <div class="row">
                            <div class="col-sm-12 text-center">
                                <div class="directions">
                                    <div class="text-center">
                                        <p><img src="/img/stopred_2@3x.png" alt="" class="img-responsive stop"/></p>
                                        <p class="city-name text-uppercase">Coimbra</p>
                                    </div>
    
                                    <div class="">
                                        <img src="/img/arrows_3@2x.png" alt="" class="img-responsive arrow"/>
                                    </div>
    
                                    <div class="text-center">
                                        <p><img src="/img/stopyellow_2@3x.png" alt="" class="img-responsive stop"/></p>
                                        <p class="city-name text-uppercase">Lisboa</p>
                                    </div>
                                </div>
                            </div>
                        </div>
    
                        <div class="access-points row">
                            <div class="col p-3">
                                <p class="ap-left text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_LisboaCoimbra_APs_Coimbra%>"/></p>
                            </div>
    
                            <div class="col p-3">
                                <p class="ap-right text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_LisboaCoimbra_APs_Lisboa%>"/></p>
                            </div>
                        </div>

                        <div class="access-points row">
                            <div class="departures-1 half">
                                <div class="row">
                                    <div class="col-md-6 text-left pb-3">
                                        <p class="text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_LisboaCoimbra_Departures_Coimbra%>"/></p>
                                        <p class="text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_LisboaCoimbra_Departures_Coimbra_Days%>"/></p>
                                        <p class="text-uppercase timeline-left"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_LisboaCoimbra_Departures_Coimbra_Times%>"/></p>
                                    </div>
                                    <div class="col-md-6 text-center d-flex align-items-center justify-content-center">
                                        <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Lisboa&Ori=Coimbra" class="btn-book text-uppercase d-flex align-items-center justify-content-center"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_Book%>"/></a>
                                    </div>
                                </div>
                            </div>
        
                            <div class="departures-2 half">
                                <div class="row">
                                    <div class="col-md-6 text-left pb-3">
                                        <p class="text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_LisboaCoimbra_Departures_Lisboa%>"/></p>
                                        <p class="text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_LisboaCoimbra_Departures_Lisboa_Days%>"/></p>
                                        <p class="text-uppercase timeline-right"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_LisboaCoimbra_Departures_Lisboa_Times%>"/></p>
                                    </div>

                                    <div class="col-md-6 text-center d-flex align-items-center justify-content-center">
                                        <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Coimbra&Ori=Lisboa" class="btn-book text-uppercase d-flex align-items-center justify-content-center"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_Book%>"/></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="city loop-desktop col-sm-4 mx-auto text-right right-side">
                        <p class="loop text-uppercase">
                            <img src="/img/loopico_2@2x.png" alt="" class="img-responsive"/>
                            Loop
                        </p>
                        <p class="name"><a OnClick="javascript:$.blockUI()" href="/Pages/Loops?Loop=Lisboa-Coimbra" tabindex="-1">Coimbra</a></p>
                        <p class="price"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_From%>"/> 12€</p>
                    </div>
                </div>
    
                <!-- PORTO -->
                <div class="row">
                    <div class="city col-sm-4 mx-auto text-left">
                        <p class="loop text-uppercase">
                            <img src="/img/loopico_2@2x.png" alt="" class="img-responsive"/>
                            Loop
                        </p>
                        <p class="name"><a OnClick="javascript:$.blockUI()" href="/Pages/Loops?Loop=Lisboa-Porto" tabindex="-1">Porto</a></p>
                        <p class="price"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_From%>"/> 10€</p>
                    </div>
    
                    <div class="city-details col-sm-8 leiria">
                        <div class="row">
                            <div class="col-sm-12 text-center">
                                <div class="directions">
                                    <div class="text-center">
                                        <p><img src="/img/stopred_2@3x.png" alt="" class="img-responsive stop"/></p>
                                        <p class="city-name text-uppercase">Porto</p>
                                    </div>
            
                                    <div class="">
                                        <img src="/img/arrows_3@2x.png" alt="" class="img-responsive arrow"/>
                                    </div>
            
                                    <div class="text-center">
                                        <p><img src="/img/stopyellow_2@3x.png" alt="" class="img-responsive stop"/></p>
                                        <p class="city-name text-uppercase">Lisboa</p>
                                    </div>
                                </div>
                            </div>
                        </div>
    
                        <div class="access-points row">
                            <div class="col p-3">
                                <p class="ap-left text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_LisboaPorto_APs_Porto%>"/></p>
                            </div>
        
                            <div class="col p-3">
                                <p class="ap-right text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_LisboaPorto_APs_Lisboa%>"/></p>
                            </div>
                        </div>
    
                        <div class="access-points row">
                            <div class="departures-1 half">
                                <div class="row">
                                    <div class="col-md-6 text-left pb-3">
                                        <p class="text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_LisboaPorto_Departures_Porto%>"/></p>
                                        <p class="text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_LisboaPorto_Departures_Porto_Days%>"/></p>
                                        <p class="text-uppercase timeline-left"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_LisboaPorto_Departures_Porto_Times%>"/></p>
                                    </div>
                                    <div class="col-md-6 text-center d-flex align-items-center justify-content-center">
                                        <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Lisboa&Ori=Porto" class="btn-book text-uppercase d-flex align-items-center justify-content-center"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_Book%>"/></a>
                                    </div>
                                </div>
                            </div>
        
                            <div class="departures-2 half">
                                <div class="row">
                                    <div class="col-md-6 text-left pb-3">
                                        <p class="text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_LisboaPorto_Departures_Lisboa%>"/></p>
                                        <p class="text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_LisboaPorto_Departures_Lisboa_Days%>"/></p>
                                        <p class="text-uppercase timeline-right"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_LisboaPorto_Departures_Lisboa_Times%>"/></p>
                                    </div>

                                    <div class="col-md-6 text-center d-flex align-items-center justify-content-center">
                                        <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Porto&Ori=Lisboa" class="btn-book text-uppercase d-flex align-items-center justify-content-center"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LoopCard_Book%>"/></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

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
    <!-- END OF LOOPS -->
    
    <!-- CASCAIS -->
    <div class="<%= localData.Loop == "lisboa-cascais" ? "" : "hide" %>">
        <header class="head text-center d-flex pb-5 static-page__pic-one">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <h1 class="static-page__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCascais_MainTitle%>"/></h1>
                <div class="row justify-content-center mt-5 mb-5">
                    <a OnClick="javascript:$.blockUI()" href="/Pages/Loops" class="btn btn-default static-page__destination-btn static-page__destination-btn--white" tabindex="-1" ><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_btnBack_text%>"/></a>
                </div>
            </div>
        </header>

        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop">YOYOLOOP</div>
                </div>

                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop-main-description"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCascais_MainDescription%>"/></div>
                </div>

                <div class="row justify-content-center mb-5">
                <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCascais_SubDescription%>"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="homepage__container static-page__box-container p-0 mt-5 mb-5">

            <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Lisboa&Ori=Linha%20de%20Cascais">
                <div class="row">
                    <div class="col-md-4 static-page__box-container__first d-flex align-items-left flex-column justify-content-center pl-5">
                        <div class="static-page__box-container__first__sub-title">
                            <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                            <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_Title%>"/>
                        </div>
                        <div class="static-page__box-container__first__main-title">Cascais</div>
                        <div class="static-page__box-container__first__extra-title mt-2">
                            <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCascais_LoopCard_Title%>"/>
                        </div>
                    </div>

                    <div class="col-md-8 static-page__box-container__schedules p-0 m-0 loop-cascais-img">
                        <div class="row">
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_Stops%>"/></div>
                                <div>
                                    <div class="static-page__box-container__schedules__text text-uppercase">
                                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCascais_LoopCard_APs%>"/>
                                    </div>
                                </div>
                            </div>
    
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/horarios.png" srcset="/img/horarios@2x.png 2x, /img/horarios@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_Schedules%>"/></div>
                        
                                <div class="static-page__box-container__schedules__text text-uppercase" style="font-weight: 600"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCascais_LoopCard_Days%>"/></div>
                                <span class="static-page__box-container__schedules__time"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCascais_LoopCard_Times1%>"/></span>
                                <span class="static-page__box-container__schedules__time mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCascais_LoopCard_Times2%>"/></span>

                                <div class="static-page__box-container__schedules__text text-uppercase" style="font-weight: 600"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_TravelTime%>"/></div>
                                <div class="static-page__box-container__schedules__text text-center pb-2"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCascais_LoopCard__TravelTime%>"/></div>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    
        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                    <div class="homepage__yoyoloop text-uppercase">loop lisboa - cascais</div>
                </div>

                <div class="row justify-content-center mb-5">
                    <div class="homepage__yoyoloop-main-description"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCascais_Why%>"/></div>
                </div>

                <div class="row justify-content-center mb-5">
                    <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCascais_Why_Description%>"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="static-page__grid col-md-6 d-flex align-items-center flex-column pr-0 mr-0">
                <img src="/img/bus.png" srcset="/img/bus@2x.png 2x, /img/bus@3x.png 3x">
                <div class="static-page__grid__title mt-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_Details_Why_Bus%>"/></div>
                <div class="static-page__grid__text mt-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCascais_Why_Bus_Reasons%>"/>
                </div>
            </div>

            <div class="static-page__separator-vertical"></div>

            <div class="static-page__grid col-md-6 d-flex align-items-center flex-column mb-5 pl-0 ml-0 pr-0">
                <img src="/img/comboio.png" srcset="/img/comboio@2x.png 2x, /img/comboio@3x.png 3x">
                <div class="static-page__grid__title mt-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_Details_Why_Train%>"/></div>
                <div class="static-page__grid__text mt-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCascais_Why_Train_Reasons%>"/>
                </div>
            </div>
        </div>

        <div class="static-page__separator"></div>

        <div class="row mb-5">
            <div class="static-page__grid col-md-6 d-flex align-items-center flex-column mt-5 pr-0 mr-0">
                <img src="/img/boleia.png" srcset="/img/boleia@2x.png 2x, /img/boleia@3x.png 3x">
                <div class="static-page__grid__title mt-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_Details_Why_Ride%>"/></div>
                <div class="static-page__grid__text mt-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCascais_Why_Ride_Reasons%>"/>
                </div>
            </div>

            <div class="static-page__separator-vertical"></div>

            <div class="static-page__grid col-md-6 d-flex align-items-center flex-column mt-5 pl-0 ml-0 pr-0">
                <img src="/img/carro.png" srcset="/img/carro@2x.png 2x, /img/carro@3x.png 3x">
                <div class="static-page__grid__title mt-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_Details_Why_Car%>"/></div>
                <div class="static-page__grid__text mt-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCascais_Why_Car_Reasons%>"/>
                </div>
            </div>
        </div>
    </div>
    <!-- END OF CASCAIS -->

    <!-- COIMBRA -->
    <div class="<%= localData.Loop == "lisboa-coimbra" ? "" : "hide" %>">
        <header class="head text-center d-flex pb-5 static-page__pic-one">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <h1 class="static-page__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCoimbra_MainTitle%>"/></h1>
                <div class="row justify-content-center mt-5 mb-5">
                    <a OnClick="javascript:$.blockUI()" href="/Pages/Loops" class="btn btn-default static-page__destination-btn static-page__destination-btn--white" tabindex="-1" ><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_btnBack_text%>"/></a>
                </div>
            </div>
        </header>

        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                    <div class="homepage__yoyoloop">YOYOLOOP</div>
                </div>

                <div class="row justify-content-center mb-5">
                    <div class="homepage__yoyoloop-main-description"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCoimbra_MainDescription%>"/></div>
                </div>

                <div class="row justify-content-center mb-5">
                    <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCoimbra_SubDescription%>"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="homepage__container static-page__box-container p-0 mt-5 mb-5">

            <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Lisboa&Ori=Coimbra">
                <div class="row">
                    <div class="col-md-4 static-page__box-container__first d-flex align-items-left flex-column justify-content-center pl-5">
                        <div class="static-page__box-container__first__sub-title">
                            <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                            <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_Title%>"/>
                        </div>
                        <div class="static-page__box-container__first__main-title">Coimbra</div>
                        <div class="static-page__box-container__first__extra-title mt-2">
                            <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCoimbra_LoopCard_Title%>"/>
                        </div>
                    </div>

                    <div class="col-md-8 static-page__box-container__schedules p-0 m-0 loop-cascais-img">
                        <div class="row">
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_Stops%>"/></div>
                                <div>
                                    <div class="static-page__box-container__schedules__text text-uppercase">
                                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCoimbra_LoopCard_APs%>"/>
                                    </div>
                                </div>
                            </div>
    
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/horarios.png" srcset="/img/horarios@2x.png 2x, /img/horarios@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_Schedules%>"/></div>
                        
                                <div class="static-page__box-container__schedules__text text-uppercase" style="font-weight: 600"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCoimbra_LoopCard_Days%>"/></div>
                                <span class="static-page__box-container__schedules__time"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCoimbra_LoopCard_Times1%>"/></span>
                                <span class="static-page__box-container__schedules__time mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCoimbra_LoopCard_Times2%>"/></span>

                                <div class="static-page__box-container__schedules__text text-uppercase" style="font-weight: 600"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_TravelTime%>"/></div>
                                <div class="static-page__box-container__schedules__text text-center pb-2"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCoimbra_LoopCard__TravelTime%>"/></div>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    
        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                    <div class="homepage__yoyoloop text-uppercase">loop lisboa - coimbra</div>
                </div>

                <div class="row justify-content-center mb-5">
                    <div class="homepage__yoyoloop-main-description"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCoimbra_Why%>"/></div>
                </div>

                <div class="row justify-content-center mb-5">
                    <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCoimbra_Why_Description%>"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="static-page__grid col-md-6 d-flex align-items-center flex-column pr-0 mr-0">
                <img src="/img/bus.png" srcset="/img/bus@2x.png 2x, /img/bus@3x.png 3x">
                <div class="static-page__grid__title mt-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_Details_Why_Bus%>"/></div>
                <div class="static-page__grid__text mt-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCoimbra_Why_Bus_Reasons%>"/>
                </div>
            </div>

            <div class="static-page__separator-vertical"></div>

            <div class="static-page__grid col-md-6 d-flex align-items-center flex-column mb-5 pl-0 ml-0 pr-0">
                <img src="/img/comboio.png" srcset="/img/comboio@2x.png 2x, /img/comboio@3x.png 3x">
                <div class="static-page__grid__title mt-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_Details_Why_Train%>"/></div>
                <div class="static-page__grid__text mt-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCoimbra_Why_Train_Reasons%>"/>
                </div>
            </div>
        </div>

        <div class="static-page__separator"></div>

        <div class="row mb-5">
            <div class="static-page__grid col-md-6 d-flex align-items-center flex-column mt-5 pr-0 mr-0">
                <img src="/img/boleia.png" srcset="/img/boleia@2x.png 2x, /img/boleia@3x.png 3x">
                <div class="static-page__grid__title mt-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_Details_Why_Ride%>"/></div>
                <div class="static-page__grid__text mt-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCoimbra_Why_Ride_Reasons%>"/>
                </div>
            </div>

            <div class="static-page__separator-vertical"></div>

            <div class="static-page__grid col-md-6 d-flex align-items-center flex-column mt-5 pl-0 ml-0 pr-0">
                <img src="/img/carro.png" srcset="/img/carro@2x.png 2x, /img/carro@3x.png 3x">
                <div class="static-page__grid__title mt-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_Details_Why_Car%>"/></div>
                <div class="static-page__grid__text mt-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaCoimbra_Why_Car_Reasons%>"/>
                </div>
            </div>
        </div>
    </div>
    <!-- END OF COIMBRA -->
    
    <!-- PORTO -->
    <div class="<%= localData.Loop == "lisboa-porto" ? "" : "hide" %>">
        <header class="head text-center d-flex pb-5 static-page__pic-one">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <h1 class="static-page__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaPorto_MainTitle%>"/></h1>
                <div class="row justify-content-center mt-5 mb-5">
                    <a OnClick="javascript:$.blockUI()" href="/Pages/Loops" class="btn btn-default static-page__destination-btn static-page__destination-btn--white" tabindex="-1" ><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_btnBack_text%>"/></a>
                </div>
            </div>
        </header>

        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop">YOYOLOOP</div>
                </div>

                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop-main-description"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaPorto_MainDescription%>"/></div>
                </div>

                <div class="row justify-content-center mb-5">
                <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaPorto_SubDescription%>"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="homepage__container static-page__box-container p-0 mt-5 mb-5">

            <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Lisboa&Ori=Porto">
                <div class="row">
                    <div class="col-md-4 static-page__box-container__first d-flex align-items-left flex-column justify-content-center pl-5">
                        <div class="static-page__box-container__first__sub-title">
                            <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                            <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_Title%>"/>
                        </div>
                        <div class="static-page__box-container__first__main-title">Porto</div>
                        <div class="static-page__box-container__first__extra-title mt-2">
                            <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaPorto_LoopCard_Title%>"/>
                        </div>
                    </div>

                    <div class="col-md-8 static-page__box-container__schedules p-0 m-0 loop-cascais-img">
                        <div class="row">
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_Stops%>"/></div>
                                <div>
                                    <div class="static-page__box-container__schedules__text text-uppercase">
                                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaPorto_LoopCard_APs%>"/>
                                    </div>
                                </div>
                            </div>
    
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/horarios.png" srcset="/img/horarios@2x.png 2x, /img/horarios@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_Schedules%>"/></div>
                        
                                <div class="static-page__box-container__schedules__text text-uppercase" style="font-weight: 600"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaPorto_LoopCard_Days%>"/></div>
                                <span class="static-page__box-container__schedules__time"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaPorto_LoopCard_Times1%>"/></span>
                                <span class="static-page__box-container__schedules__time mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaPorto_LoopCard_Times2%>"/></span>

                                <div class="static-page__box-container__schedules__text text-uppercase" style="font-weight: 600"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Destinos_Details_LoopCard_TravelTime%>"/></div>
                                <div class="static-page__box-container__schedules__text text-center pb-2"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaPorto_LoopCard__TravelTime%>"/></div>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    
        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                    <div class="homepage__yoyoloop text-uppercase">loop lisboa - porto</div>
                </div>

                <div class="row justify-content-center mb-5">
                    <div class="homepage__yoyoloop-main-description"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaPorto_Why%>"/></div>
                </div>

                <div class="row justify-content-center mb-5">
                    <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaPorto_Why_Description%>"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="static-page__grid col-md-6 d-flex align-items-center flex-column pr-0 mr-0">
                <img src="/img/bus.png" srcset="/img/bus@2x.png 2x, /img/bus@3x.png 3x">
                <div class="static-page__grid__title mt-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_Details_Why_Bus%>"/></div>
                <div class="static-page__grid__text mt-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaPorto_Why_Bus_Reasons%>"/>
                </div>
            </div>

            <div class="static-page__separator-vertical"></div>

            <div class="static-page__grid col-md-6 d-flex align-items-center flex-column mb-5 pl-0 ml-0 pr-0">
                <img src="/img/comboio.png" srcset="/img/comboio@2x.png 2x, /img/comboio@3x.png 3x">
                <div class="static-page__grid__title mt-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_Details_Why_Train%>"/></div>
                <div class="static-page__grid__text mt-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaPorto_Why_Train_Reasons%>"/>
                </div>
            </div>
        </div>

        <div class="static-page__separator"></div>

        <div class="row mb-5">
            <div class="static-page__grid col-md-6 d-flex align-items-center flex-column mt-5 pr-0 mr-0">
                <img src="/img/boleia.png" srcset="/img/boleia@2x.png 2x, /img/boleia@3x.png 3x">
                <div class="static-page__grid__title mt-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_Details_Why_Ride%>"/></div>
                <div class="static-page__grid__text mt-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaPorto_Why_Ride_Reasons%>"/>
                </div>
            </div>

            <div class="static-page__separator-vertical"></div>

            <div class="static-page__grid col-md-6 d-flex align-items-center flex-column mt-5 pl-0 ml-0 pr-0">
                <img src="/img/carro.png" srcset="/img/carro@2x.png 2x, /img/carro@3x.png 3x">
                <div class="static-page__grid__title mt-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_Details_Why_Car%>"/></div>
                <div class="static-page__grid__text mt-3">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Loops_LisboaPorto_Why_Car_Reasons%>"/>
                </div>
            </div>
        </div>
    </div>
    <!-- END OF PORTO -->

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