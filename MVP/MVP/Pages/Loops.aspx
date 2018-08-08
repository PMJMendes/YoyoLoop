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
     </style>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <header class="head text-center d-flex pb-5 static-page__pic-five">
        <div class="container-fluid d-flex align-items-center">
            <h1 class="static-page__main-title">A Revolucionar a mobilidade entre cidades, <br>um Loop de cada vez</h1>
        </div>
    </header>

    <div class="homepage__container static-page__center-container">
        <div class="container-fluid d-flex flex-column justify-content-center">
            <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop text-uppercase">YOYOLOOP</div>
            </div>

            <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop-main-description">Loops & Horários</div>
            </div>

            <div class="row justify-content-center mb-5">
                <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
            </div>
            
            <div class="row justify-content-center mb-5">
                <div class="static-page__first__sub-description">
                    A Yoyoloop tem loops de Lisboa para a linha de Cascais, Coimbra e Porto e, ainda, loops desde a linha de Cascais, Coimbra e Porto até Lisboa.
                </div>
            </div>
        </div>
    </div>

    <section class="yoyoloops">
        <div class="container-fluid">
    
            <!-- CASCAIS -->
            <div class="row">
                <div class="city col-sm-4 mx-auto text-left" id="city-cascais">
                    <div class="">
                        <p class="loop text-uppercase">
                            <img src="/img/loopico_2@2x.png" alt="" class="img-responsive"/>
                            Loop
                        </p>
                        <p class="name">Cascais</p>
                        <p class="price">desde 5€</p>
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
                            <p class="ap-left text-uppercase">- Cascais Shopping</p>
                            <p class="ap-left text-uppercase">- E.Leclerc São Domingos de Rana  (Parque Superior)</p>
                        </div>
        
                        <div class="col p-3">
                            <p class="ap-right text-uppercase">- Amoreiras (Torre 1)</p>
                            <p class="ap-right text-uppercase">- Marquês de Pombal (Estacionamento)</p>
                            <p class="ap-right text-uppercase">- Saldanha (Estacionamento do Arco do cego)</p>
                        </div>
                    </div>
    
                    <div class="access-points row">
                        <div class="departures-1 half">
                            <div class="row">
                                <div class="col-md-6 text-left pb-3">
                                    <p class="text-uppercase">Saidas de Cascais</p>
                                    <p class="text-uppercase">Dias úteis</p>
                                    <p class="text-uppercase timeline-left">7:30  -  8:00  -  9:30  -  10:30</p>
                                </div>
                                <div class="col-md-6 text-center d-flex align-items-center justify-content-center">
                                    <a href="#" class="btn-book text-uppercase d-flex align-items-center justify-content-center">Reservar</a>
                                </div>
                            </div>
                        </div>
        
                        <div class="departures-2 half">
                            <div class="row">
                                <div class="col-md-6 text-left pb-3">
                                    <p class="text-uppercase">Saidas de Lisboa</p>
                                    <p class="text-uppercase">Dias úteis</p>
                                    <p class="text-uppercase timeline-right">7:15 - 8:15 – 8:45</p>
                                </div>

                                <div class="col-md-6 text-center d-flex align-items-center justify-content-center">
                                    <a href="#" class="btn-book text-uppercase d-flex align-items-center justify-content-center">Reservar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    
            <!-- COIMBRA -->
            <div class="row">
                <div class="city loop-mobile col-sm-4 mx-auto text-right right-side" id="city-coimbra">
                    <p class="loop text-uppercase">
                        <img src="/img/loopico_2@2x.png" alt="" class="img-responsive"/>
                        Loop
                    </p>
                    <p class="name">Coimbra</p>
                    <p class="price">desde 12€</p>
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
                            <p class="ap-left text-uppercase">- McDonald’s Av. Fernão de Magalhães</p>
                        </div>
    
                        <div class="col p-3">
                            <p class="ap-right text-uppercase">- Saldanha (Estacionamento)</p>
                            <p class="ap-right text-uppercase">- Gare do Oriente</p>
                        </div>
                    </div>

                    <div class="access-points row">
                        <div class="departures-1 half">
                            <div class="row">
                                <div class="col-md-6 text-left pb-3">
                                    <p class="text-uppercase">Saidas de Cascais</p>
                                    <p class="text-uppercase">Dias úteis</p>
                                    <p class="text-uppercase timeline-left">7:30  -  8:00  -  9:30  -  10:30</p>
                                </div>
                                <div class="col-md-6 text-center d-flex align-items-center justify-content-center">
                                    <a href="#" class="btn-book text-uppercase d-flex align-items-center justify-content-center">Reservar</a>
                                </div>
                            </div>
                        </div>
        
                        <div class="departures-2 half">
                            <div class="row">
                                <div class="col-md-6 text-left pb-3">
                                    <p class="text-uppercase">Saidas de Lisboa</p>
                                    <p class="text-uppercase">Todos os dias</p>
                                    <p class="text-uppercase timeline-right">7:15 - 8:15 – 8:45</p>
                                </div>

                                <div class="col-md-6 text-center d-flex align-items-center justify-content-center">
                                    <a href="#" class="btn-book text-uppercase d-flex align-items-center justify-content-center">Reservar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="city loop-desktop col-sm-4 mx-auto text-right right-side" id="city-coimbra">
                    <p class="loop text-uppercase">
                        <img src="/img/loopico_2@2x.png" alt="" class="img-responsive"/>
                        Loop
                    </p>
                    <p class="name">Coimbra</p>
                    <p class="price">desde 12€</p>
                </div>
            </div>
    
            <!-- LEIRIA -->
            <div class="row">
                <div class="city col-sm-4 mx-auto text-left" id="city-porto">
                    <p class="loop text-uppercase">
                        <img src="/img/loopico_2@2x.png" alt="" class="img-responsive"/>
                        Loop
                    </p>
                    <p class="name">Porto</p>
                    <p class="price">desde 10€</p>
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
                            <p class="ap-left text-uppercase">- Largo da República</p>
                        </div>
        
                        <div class="col p-3">
                            <p class="ap-right text-uppercase">- Saldanha (Estacionamento)</p>
                            <p class="ap-right text-uppercase">- Gare do Oriente</p>
                        </div>
                    </div>
    
                    <div class="access-points row">
                        <div class="departures-1 half">
                            <div class="row">
                                <div class="col-md-6 text-left pb-3">
                                    <p class="text-uppercase">Saidas de Cascais</p>
                                    <p class="text-uppercase">Dias úteis</p>
                                    <p class="text-uppercase timeline-left">7:30  -  8:00  -  9:30  -  10:30</p>
                                </div>
                                <div class="col-md-6 text-center d-flex align-items-center justify-content-center">
                                    <a href="#" class="btn-book text-uppercase d-flex align-items-center justify-content-center">Reservar</a>
                                </div>
                            </div>
                        </div>
        
                        <div class="departures-2 half">
                            <div class="row">
                                <div class="col-md-6 text-left pb-3">
                                    <p class="text-uppercase">Saidas de Lisboa</p>
                                    <p class="text-uppercase">Todos os dias</p>
                                    <p class="text-uppercase timeline-right">7:15 - 8:15 – 8:45</p>
                                </div>

                                <div class="col-md-6 text-center d-flex align-items-center justify-content-center">
                                    <a href="#" class="btn-book text-uppercase d-flex align-items-center justify-content-center">Reservar</a>
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
                <div class="homepage__why-catch-ride">Porquê apanhar boleia de um transfer da Yoyoloop?</div>
            </div>
            <div class="row row-no-padding">
                <div class="homepage__why-card col-md-3 d-flex flex-column align-items-center">
                    <div class="homepage__why-card__image mb-4">
                        <img src="/img/acessivel.png" srcset="/img/acessivel@2x.png 2x, /img/acessivel@3x.png 3x">
                    </div>
                    <div class="homepage__why-card__title mb-3">Acessível</div>
                    <div class="homepage__why-card__content mb-3">Menos desgaste, mais na carteira</div>
                </div>

                <div class="homepage__why-card col-md-3 d-flex flex-column align-items-center">
                    <div class="homepage__why-card__image mb-4">
                        <img src="/img/conveniente.png" srcset="/img/conveniente@2x.png 2x, /img/conveniente@3x.png 3x">
                    </div>
                    <div class="homepage__why-card__title mb-3">Conveniente</div>
                    <div class="homepage__why-card__content mb-3">Pick up e drop off convenientes</div>
                </div>

                <div class="homepage__why-card col-md-3 d-flex flex-column align-items-center">
                    <div class="homepage__why-card__image mb-4">
                        <img src="/img/fiavel.png" srcset="/img/fiavel@2x.png 2x, /img/fiavel@3x.png 3x">
                    </div>
                    <div class="homepage__why-card__title mb-3">Fiável</div>
                    <div class="homepage__why-card__content mb-3">Lugar marcado, à hora marcada</div>
                </div>

                <div class="homepage__why-card col-md-3 d-flex flex-column align-items-center">
                    <div class="homepage__why-card__image mb-4">
                        <img src="/img/sustentavel.png" srcset="/img/sustentavel@2x.png 2x, /img/sustentavel@3x.png 3x">
                    </div>
                    <div class="homepage__why-card__title mb-3">Sustentável</div>
                    <div class="homepage__why-card__content mb-3">Menos carros, mais cidade</div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="static-page__container static-page__container--forth">
        <div class="container-fluid d-flex flex-column justify-content-center">    

            <div class="static-page__separator mt-5 mb-5"></div>

            <div class="row justify-content-center mb-5 align-items-center">
                <div class="static-page__any-question mr-5">Tens alguma pergunta?</div>
                <button class="static-page__reserve-btn static-page__reserve-btn--white" >Lê as nossas Perguntas Frequentes</button>
            </div>
        </div>
    </div>  

</asp:Content>