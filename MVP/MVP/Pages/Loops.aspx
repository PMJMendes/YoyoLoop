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
                    <div class="city col-sm-4 mx-auto text-left">
                        <div class="">
                            <p class="loop text-uppercase">
                                <img src="/img/loopico_2@2x.png" alt="" class="img-responsive"/>
                                Loop
                            </p>
                            <p class="name"><a OnClick="javascript:$.blockUI()" href="/Pages/Loops?Loop=Lisboa-Cascais" tabindex="-1">Cascais</a></p>
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
                                        <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Lisboa&Ori=Linha%20de%20Cascais" class="btn-book text-uppercase d-flex align-items-center justify-content-center">Reservar</a>
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
                                        <p class="text-uppercase">Saidas de Coimbra</p>
                                        <p class="text-uppercase">Dias úteis</p>
                                        <p class="text-uppercase timeline-left">7:30  -  8:00  -  9:30  -  10:30</p>
                                    </div>
                                    <div class="col-md-6 text-center d-flex align-items-center justify-content-center">
                                        <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Lisboa&Ori=Coimbra" class="btn-book text-uppercase d-flex align-items-center justify-content-center">Reservar</a>
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
                                        <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Coimbra&Ori=Lisboa" class="btn-book text-uppercase d-flex align-items-center justify-content-center">Reservar</a>
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
                        <p class="price">desde 12€</p>
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
                                        <p class="text-uppercase">Saidas do Porto</p>
                                        <p class="text-uppercase">Dias úteis</p>
                                        <p class="text-uppercase timeline-left">7:30  -  8:00  -  9:30  -  10:30</p>
                                    </div>
                                    <div class="col-md-6 text-center d-flex align-items-center justify-content-center">
                                        <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Lisboa&Ori=Porto" class="btn-book text-uppercase d-flex align-items-center justify-content-center">Reservar</a>
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
                                        <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Porto&Ori=Lisboa" class="btn-book text-uppercase d-flex align-items-center justify-content-center">Reservar</a>
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
    </div>
    <!-- END OF LOOPS -->
    
    <!-- CASCAIS -->
    <div class="<%= localData.Loop == "lisboa-cascais" ? "" : "hide" %>">
        <header class="head text-center d-flex pb-5 static-page__pic-one">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <h1 class="static-page__main-title">Deixa o carro em casa e vem de transfer para Cascais</h1>
                <div class="row justify-content-center mt-5 mb-5">
                    <a OnClick="javascript:$.blockUI()" href="/Pages/Loops" class="btn btn-default static-page__destination-btn static-page__destination-btn--white" tabindex="-1" >voltar</a>
                </div>
            </div>
        </header>

        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop">YOYOLOOP</div>
                </div>

                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop-main-description">Cansado do trânsito na A5 <br/>nas viagens entre Cascais e Lisboa?</div>
                </div>

                <div class="row justify-content-center mb-5">
                <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        Quem mora em Cascais e trabalha em Lisboa está familiarizado com o caos vivido diariamente na A5. A reduzida rede de transportes na linha de Cascais deixa muito a desejar e obriga muitos a optarem por levar o seu próprio veículo — um custo que pode chegar aos 350€ mensais só em combustível, portagens e estacionamento.
                        <br/><br/>
                        A Yoyoloop oferece uma nova, mais barata e mais proveitosa forma de fazer commuting entre Cascais e Lisboa. Os nossos pontos de recolha permitem-te deixar o carro em parques de estacionamento gratuítos em Cascais e São Domingos de Rana e apanhar um transfer directo até às zonas de escritórios de Lisboa como as Amoreiras, Marquês de Pombal, Saldanha e Campo Grande — por apenas 50€ por semana.
                        <br/><br/>
                        Além de contar com partidas frequentes, a Yoyoloop ainda te oferece wifi a bordo para poderes aproveitar o teu tempo em vez de estar preso no pára-arranca da A5.
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
                            Loops com destino a
                        </div>
                        <div class="static-page__box-container__first__main-title">Cascais</div>
                        <div class="static-page__box-container__first__extra-title mt-2">
                            desde <span style="font-weight: 800">50€</span> por semana por<br/>
                            10 viagens ou <span style="font-weight: 800">8€</span> por viagem
                        </div>
                    </div>

                    <div class="col-md-8 static-page__box-container__schedules p-0 m-0 loop-cascais-img">
                        <div class="row">
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3">Paragens</div>
                                <div>
                                    <div class="static-page__box-container__schedules__text text-uppercase">→ Cascais Shopping</div>
                                    <div class="static-page__box-container__schedules__text text-uppercase">→ Hospital de Cascais</div>
                                    <div class="static-page__box-container__schedules__text text-uppercase">→ Lagoas Park</div>
                                    <div class="static-page__box-container__schedules__text text-uppercase">→ S. Domingos de Rana</div>
                                    <div class="static-page__box-container__schedules__text text-uppercase">→ Tagus Park</div>
                                </div>
                            </div>
    
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/horarios.png" srcset="/img/horarios@2x.png 2x, /img/horarios@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3">Horários</div>
                        
                                <div class="static-page__box-container__schedules__text text-uppercase" style="font-weight: 600">Dias úteis</div>
                                <span class="static-page__box-container__schedules__time">7:00  -  7:30  -  8:00  -  8:30  -  9:00  -  9:30</span>
                                <span class="static-page__box-container__schedules__time mb-3">18:00  -  18:30  -  19:00  -  19:30  -  20:00</span>

                                <div class="static-page__box-container__schedules__text text-uppercase" style="font-weight: 600">Tempo de viagem</div>
                                <div class="static-page__box-container__schedules__text text-center pb-2">O transfer da Yoyoloop leva-te de Cascais até <br/>Lisboa em apenas 30 minutos</div>
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
                    <div class="homepage__yoyoloop-main-description">Porquê apanhar um transfer entre Lisboa e Cascais em vez de outros transportes?</div>
                </div>

                <div class="row justify-content-center mb-5">
                    <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        → Conta com partidas frequentes de segunda a sexta-feira
                        <br/><br/>
                        → Usufrui de mais conforto pelo mesmo preço que o autocarro e comboio
                        <br/><br/>
                        → Desfruta de wifi a bordo para tornar a tua viagem mais útil
                        <br/><br/>
                        → Respeita o ambiente ao apanhar boleia de um veículo de sete lugares
                        <br/><br/>
                        → Aproveita uma ligação direta entre cinco pontos-chave do concelho de Cascais e as maiores estações de metro e/ou comboio de Lisboa
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="static-page__grid col-md-6 d-flex align-items-center flex-column pr-0 mr-0">
                <img src="/img/bus.png" srcset="/img/bus@2x.png 2x, /img/bus@3x.png 3x">
                <div class="static-page__grid__title mt-3">Autocarro</div>
                <div class="static-page__grid__text mt-3">
                    → Não há qualquer autocarro directo entre Cascais e Lisboa
                </div>
            </div>

            <div class="static-page__separator-vertical"></div>

            <div class="static-page__grid col-md-6 d-flex align-items-center flex-column mb-5 pl-0 ml-0 pr-0">
                <img src="/img/comboio.png" srcset="/img/comboio@2x.png 2x, /img/comboio@3x.png 3x">
                <div class="static-page__grid__title mt-3">Comboio</div>
                <div class="static-page__grid__text mt-3">
                    → Os atrasos, avarias e greves são frequentes <br/>
                    → A viagem até Lisboa conta com, pelo menos, dez paragens <br/>
                    → A viagem é barulhenta e nem sempre tens lugar para te sentar <br/>
                    → O único ponto de chegada é o Cais do Sodré que, por sua vez, só tem  <br/>
                    ligação direta com a linha verde do metro de Lisboa <br/>
                </div>
            </div>
        </div>

        <div class="static-page__separator"></div>

        <div class="row mb-5">
            <div class="static-page__grid col-md-6 d-flex align-items-center flex-column mt-5 pr-0 mr-0">
                <img src="/img/boleia.png" srcset="/img/boleia@2x.png 2x, /img/boleia@3x.png 3x">
                <div class="static-page__grid__title mt-3">Boleias tradicionais</div>
                <div class="static-page__grid__text mt-3">
                    → Demoras mais tempo se não fores pela auto-estrada <br/>
                    → Podes ter várias paragens para deixar outros passageiros<br/>
                    → Não são fiáveis: não há todos os dias e as horas de partida e o preço variam<br/>
                    → Não sendo um motorista profissional, a habilidade do condutor não é fidedigna<br/>
                </div>
            </div>

            <div class="static-page__separator-vertical"></div>

            <div class="static-page__grid col-md-6 d-flex align-items-center flex-column mt-5 pl-0 ml-0 pr-0">
                <img src="/img/carro.png" srcset="/img/carro@2x.png 2x, /img/carro@3x.png 3x">
                <div class="static-page__grid__title mt-3">Carro próprio</div>
                <div class="static-page__grid__text mt-3">
                    → Gastas 3 a 4 vezes mais dinheiro se viajares sozinho<br/>
                    → Dificuldade de encontrar um lugar de estacionamento <br/>
                    → Chegas a gastar 2 horas por dia no trânsito, sem conseguires usar esse tempo de forma útil<br/>
                </div>
            </div>
        </div>
    </div>
    <!-- END OF CASCAIS -->

    <!-- COIMBRA -->
    <div class="<%= localData.Loop == "lisboa-coimbra" ? "" : "hide" %>">
        <header class="head text-center d-flex pb-5 static-page__pic-one">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <h1 class="static-page__main-title">Deixa o carro em casa e vem de transfer para Coimbra</h1>
                <div class="row justify-content-center mt-5 mb-5">
                    <a OnClick="javascript:$.blockUI()" href="/Pages/Loops" class="btn btn-default static-page__destination-btn static-page__destination-btn--white" tabindex="-1" >voltar</a>
                </div>
            </div>
        </header>

        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop">YOYOLOOP</div>
                </div>

                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop-main-description">Cansado do trânsito na A5 <br/>nas viagens entre Cascais e Lisboa?</div>
                </div>

                <div class="row justify-content-center mb-5">
                <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        Quem mora em Cascais e trabalha em Lisboa está familiarizado com o caos vivido diariamente na A5. A reduzida rede de transportes na linha de Cascais deixa muito a desejar e obriga muitos a optarem por levar o seu próprio veículo — um custo que pode chegar aos 350€ mensais só em combustível, portagens e estacionamento.
                        <br/><br/>
                        A Yoyoloop oferece uma nova, mais barata e mais proveitosa forma de fazer commuting entre Cascais e Lisboa. Os nossos pontos de recolha permitem-te deixar o carro em parques de estacionamento gratuítos em Cascais e São Domingos de Rana e apanhar um transfer directo até às zonas de escritórios de Lisboa como as Amoreiras, Marquês de Pombal, Saldanha e Campo Grande — por apenas 50€ por semana.
                        <br/><br/>
                        Além de contar com partidas frequentes, a Yoyoloop ainda te oferece wifi a bordo para poderes aproveitar o teu tempo em vez de estar preso no pára-arranca da A5.
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
                            Loops com destino a
                        </div>
                        <div class="static-page__box-container__first__main-title">Coimbra</div>
                        <div class="static-page__box-container__first__extra-title mt-2">
                            desde <span style="font-weight: 800">50€</span> por semana por<br/>
                            10 viagens ou <span style="font-weight: 800">8€</span> por viagem
                        </div>
                    </div>

                    <div class="col-md-8 static-page__box-container__schedules p-0 m-0 loop-cascais-img">
                        <div class="row">
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3">Paragens</div>
                                <div>
                                    <div class="static-page__box-container__schedules__text text-uppercase">→ Cascais Shopping</div>
                                    <div class="static-page__box-container__schedules__text text-uppercase">→ Hospital de Cascais</div>
                                    <div class="static-page__box-container__schedules__text text-uppercase">→ Lagoas Park</div>
                                    <div class="static-page__box-container__schedules__text text-uppercase">→ S. Domingos de Rana</div>
                                    <div class="static-page__box-container__schedules__text text-uppercase">→ Tagus Park</div>
                                </div>
                            </div>
    
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/horarios.png" srcset="/img/horarios@2x.png 2x, /img/horarios@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3">Horários</div>
                        
                                <div class="static-page__box-container__schedules__text text-uppercase" style="font-weight: 600">Dias úteis</div>
                                <span class="static-page__box-container__schedules__time">7:00  -  7:30  -  8:00  -  8:30  -  9:00  -  9:30</span>
                                <span class="static-page__box-container__schedules__time mb-3">18:00  -  18:30  -  19:00  -  19:30  -  20:00</span>

                                <div class="static-page__box-container__schedules__text text-uppercase" style="font-weight: 600">Tempo de viagem</div>
                                <div class="static-page__box-container__schedules__text text-center pb-2">O transfer da Yoyoloop leva-te de Cascais até <br/>Lisboa em apenas 30 minutos</div>
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
                    <div class="homepage__yoyoloop-main-description">Porquê apanhar um transfer entre Lisboa e Cascais em vez de outros transportes?</div>
                </div>

                <div class="row justify-content-center mb-5">
                    <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        → Conta com partidas frequentes de segunda a sexta-feira
                        <br/><br/>
                        → Usufrui de mais conforto pelo mesmo preço que o autocarro e comboio
                        <br/><br/>
                        → Desfruta de wifi a bordo para tornar a tua viagem mais útil
                        <br/><br/>
                        → Respeita o ambiente ao apanhar boleia de um veículo de sete lugares
                        <br/><br/>
                        → Aproveita uma ligação direta entre cinco pontos-chave do concelho de Cascais e as maiores estações de metro e/ou comboio de Lisboa
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="static-page__grid col-md-6 d-flex align-items-center flex-column pr-0 mr-0">
                <img src="/img/bus.png" srcset="/img/bus@2x.png 2x, /img/bus@3x.png 3x">
                <div class="static-page__grid__title mt-3">Autocarro</div>
                <div class="static-page__grid__text mt-3">
                    → Não há qualquer autocarro directo entre Cascais e Lisboa
                </div>
            </div>

            <div class="static-page__separator-vertical"></div>

            <div class="static-page__grid col-md-6 d-flex align-items-center flex-column mb-5 pl-0 ml-0 pr-0">
                <img src="/img/comboio.png" srcset="/img/comboio@2x.png 2x, /img/comboio@3x.png 3x">
                <div class="static-page__grid__title mt-3">Comboio</div>
                <div class="static-page__grid__text mt-3">
                    → Os atrasos, avarias e greves são frequentes <br/>
                    → A viagem até Lisboa conta com, pelo menos, dez paragens <br/>
                    → A viagem é barulhenta e nem sempre tens lugar para te sentar <br/>
                    → O único ponto de chegada é o Cais do Sodré que, por sua vez, só tem  <br/>
                    ligação direta com a linha verde do metro de Lisboa <br/>
                </div>
            </div>
        </div>

        <div class="static-page__separator"></div>

        <div class="row mb-5">
            <div class="static-page__grid col-md-6 d-flex align-items-center flex-column mt-5 pr-0 mr-0">
                <img src="/img/boleia.png" srcset="/img/boleia@2x.png 2x, /img/boleia@3x.png 3x">
                <div class="static-page__grid__title mt-3">Boleias tradicionais</div>
                <div class="static-page__grid__text mt-3">
                    → Demoras mais tempo se não fores pela auto-estrada <br/>
                    → Podes ter várias paragens para deixar outros passageiros<br/>
                    → Não são fiáveis: não há todos os dias e as horas de partida e o preço variam<br/>
                    → Não sendo um motorista profissional, a habilidade do condutor não é fidedigna<br/>
                </div>
            </div>

            <div class="static-page__separator-vertical"></div>

            <div class="static-page__grid col-md-6 d-flex align-items-center flex-column mt-5 pl-0 ml-0 pr-0">
                <img src="/img/carro.png" srcset="/img/carro@2x.png 2x, /img/carro@3x.png 3x">
                <div class="static-page__grid__title mt-3">Carro próprio</div>
                <div class="static-page__grid__text mt-3">
                    → Gastas 3 a 4 vezes mais dinheiro se viajares sozinho<br/>
                    → Dificuldade de encontrar um lugar de estacionamento <br/>
                    → Chegas a gastar 2 horas por dia no trânsito, sem conseguires usar esse tempo de forma útil<br/>
                </div>
            </div>
        </div>
    </div>
    <!-- END OF COIMBRA -->
    
    <!-- PORTO -->
    <div class="<%= localData.Loop == "lisboa-porto" ? "" : "hide" %>">
        <header class="head text-center d-flex pb-5 static-page__pic-one">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <h1 class="static-page__main-title">Deixa o carro em casa e vem de transfer para Porto</h1>
                <div class="row justify-content-center mt-5 mb-5">
                    <a OnClick="javascript:$.blockUI()" href="/Pages/Loops" class="btn btn-default static-page__destination-btn static-page__destination-btn--white" tabindex="-1" >voltar</a>
                </div>
            </div>
        </header>

        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop">YOYOLOOP</div>
                </div>

                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop-main-description">Cansado do trânsito na A5 <br/>nas viagens entre Cascais e Lisboa?</div>
                </div>

                <div class="row justify-content-center mb-5">
                <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        Quem mora em Cascais e trabalha em Lisboa está familiarizado com o caos vivido diariamente na A5. A reduzida rede de transportes na linha de Cascais deixa muito a desejar e obriga muitos a optarem por levar o seu próprio veículo — um custo que pode chegar aos 350€ mensais só em combustível, portagens e estacionamento.
                        <br/><br/>
                        A Yoyoloop oferece uma nova, mais barata e mais proveitosa forma de fazer commuting entre Cascais e Lisboa. Os nossos pontos de recolha permitem-te deixar o carro em parques de estacionamento gratuítos em Cascais e São Domingos de Rana e apanhar um transfer directo até às zonas de escritórios de Lisboa como as Amoreiras, Marquês de Pombal, Saldanha e Campo Grande — por apenas 50€ por semana.
                        <br/><br/>
                        Além de contar com partidas frequentes, a Yoyoloop ainda te oferece wifi a bordo para poderes aproveitar o teu tempo em vez de estar preso no pára-arranca da A5.
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
                            Loops com destino a
                        </div>
                        <div class="static-page__box-container__first__main-title">Porto</div>
                        <div class="static-page__box-container__first__extra-title mt-2">
                            desde <span style="font-weight: 800">50€</span> por semana por<br/>
                            10 viagens ou <span style="font-weight: 800">8€</span> por viagem
                        </div>
                    </div>

                    <div class="col-md-8 static-page__box-container__schedules p-0 m-0 loop-cascais-img">
                        <div class="row">
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3">Paragens</div>
                                <div>
                                    <div class="static-page__box-container__schedules__text text-uppercase">→ Cascais Shopping</div>
                                    <div class="static-page__box-container__schedules__text text-uppercase">→ Hospital de Cascais</div>
                                    <div class="static-page__box-container__schedules__text text-uppercase">→ Lagoas Park</div>
                                    <div class="static-page__box-container__schedules__text text-uppercase">→ S. Domingos de Rana</div>
                                    <div class="static-page__box-container__schedules__text text-uppercase">→ Tagus Park</div>
                                </div>
                            </div>
    
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/horarios.png" srcset="/img/horarios@2x.png 2x, /img/horarios@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3">Horários</div>
                        
                                <div class="static-page__box-container__schedules__text text-uppercase" style="font-weight: 600">Dias úteis</div>
                                <span class="static-page__box-container__schedules__time">7:00  -  7:30  -  8:00  -  8:30  -  9:00  -  9:30</span>
                                <span class="static-page__box-container__schedules__time mb-3">18:00  -  18:30  -  19:00  -  19:30  -  20:00</span>

                                <div class="static-page__box-container__schedules__text text-uppercase" style="font-weight: 600">Tempo de viagem</div>
                                <div class="static-page__box-container__schedules__text text-center pb-2">O transfer da Yoyoloop leva-te de Cascais até <br/>Lisboa em apenas 30 minutos</div>
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
                    <div class="homepage__yoyoloop-main-description">Porquê apanhar um transfer entre Lisboa e Cascais em vez de outros transportes?</div>
                </div>

                <div class="row justify-content-center mb-5">
                    <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        → Conta com partidas frequentes de segunda a sexta-feira
                        <br/><br/>
                        → Usufrui de mais conforto pelo mesmo preço que o autocarro e comboio
                        <br/><br/>
                        → Desfruta de wifi a bordo para tornar a tua viagem mais útil
                        <br/><br/>
                        → Respeita o ambiente ao apanhar boleia de um veículo de sete lugares
                        <br/><br/>
                        → Aproveita uma ligação direta entre cinco pontos-chave do concelho de Cascais e as maiores estações de metro e/ou comboio de Lisboa
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="static-page__grid col-md-6 d-flex align-items-center flex-column pr-0 mr-0">
                <img src="/img/bus.png" srcset="/img/bus@2x.png 2x, /img/bus@3x.png 3x">
                <div class="static-page__grid__title mt-3">Autocarro</div>
                <div class="static-page__grid__text mt-3">
                    → Não há qualquer autocarro directo entre Cascais e Lisboa
                </div>
            </div>

            <div class="static-page__separator-vertical"></div>

            <div class="static-page__grid col-md-6 d-flex align-items-center flex-column mb-5 pl-0 ml-0 pr-0">
                <img src="/img/comboio.png" srcset="/img/comboio@2x.png 2x, /img/comboio@3x.png 3x">
                <div class="static-page__grid__title mt-3">Comboio</div>
                <div class="static-page__grid__text mt-3">
                    → Os atrasos, avarias e greves são frequentes <br/>
                    → A viagem até Lisboa conta com, pelo menos, dez paragens <br/>
                    → A viagem é barulhenta e nem sempre tens lugar para te sentar <br/>
                    → O único ponto de chegada é o Cais do Sodré que, por sua vez, só tem  <br/>
                    ligação direta com a linha verde do metro de Lisboa <br/>
                </div>
            </div>
        </div>

        <div class="static-page__separator"></div>

        <div class="row mb-5">
            <div class="static-page__grid col-md-6 d-flex align-items-center flex-column mt-5 pr-0 mr-0">
                <img src="/img/boleia.png" srcset="/img/boleia@2x.png 2x, /img/boleia@3x.png 3x">
                <div class="static-page__grid__title mt-3">Boleias tradicionais</div>
                <div class="static-page__grid__text mt-3">
                    → Demoras mais tempo se não fores pela auto-estrada <br/>
                    → Podes ter várias paragens para deixar outros passageiros<br/>
                    → Não são fiáveis: não há todos os dias e as horas de partida e o preço variam<br/>
                    → Não sendo um motorista profissional, a habilidade do condutor não é fidedigna<br/>
                </div>
            </div>

            <div class="static-page__separator-vertical"></div>

            <div class="static-page__grid col-md-6 d-flex align-items-center flex-column mt-5 pl-0 ml-0 pr-0">
                <img src="/img/carro.png" srcset="/img/carro@2x.png 2x, /img/carro@3x.png 3x">
                <div class="static-page__grid__title mt-3">Carro próprio</div>
                <div class="static-page__grid__text mt-3">
                    → Gastas 3 a 4 vezes mais dinheiro se viajares sozinho<br/>
                    → Dificuldade de encontrar um lugar de estacionamento <br/>
                    → Chegas a gastar 2 horas por dia no trânsito, sem conseguires usar esse tempo de forma útil<br/>
                </div>
            </div>
        </div>
    </div>
    <!-- END OF PORTO -->

    <div class="static-page__container static-page__container--forth">
        <div class="container-fluid d-flex flex-column justify-content-center">    

            <div class="static-page__separator mt-5 mb-5"></div>

            <div class="row justify-content-center mb-5 align-items-center">
                <div class="static-page__any-question mr-5">Tens alguma pergunta?</div>
                <a OnClick="javascript:$.blockUI()" href="/Help/Help" class="btn btn-default static-page__question-btn static-page__question-btn--white" tabindex="-1" >Lê as nossas Perguntas Frequentes</a>
            </div>
        </div>
    </div>  

</asp:Content>