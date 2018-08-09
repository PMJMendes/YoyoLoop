<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HowTo.aspx.cs" Inherits="MVP.Pages.HowTo" %>

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
        <header class="head text-center d-flex pb-5 pt-5 static-page__pic-six">
        <div class="container-fluid d-flex align-items-center pb-5 pt-5">
        </div>
    </header>

    <div class="homepage__container static-page__center-container">
        <div class="container-fluid d-flex flex-column justify-content-center">
            <div class="row justify-content-center mb-5">
            <div class="homepage__yoyoloop text-uppercase">como apanhar boleia da yoyoloop?</div>
            </div>

            <div class="row justify-content-center mb-5">
            <div class="homepage__yoyoloop-main-description">Reserva o teu lugar online e aproveita a tua viagem 
                sem paragens, com wifi a bordo 
                e a preço de autocarro</div>
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

    <div class="container-fluid static-page__how-to p-5">
        <div class="row d-flex justify-content-center align-items-center pb-3 pt-4">
            <div class="col-2 text-right">
                <img class="static-page__how-to--icon" src="/img/pontos.png" srcset="/img/pontos@2x.png 2x, /img/pontos@3x.png 3x">
            </div>
            <div class="col-8 pl-5">
                <h3>1 - Escolhe onde queres ir e o teu ponto de partida e chegada preferidos.</h3>
            </div>
        </div>
        <div class="row d-flex justify-content-center align-items-center pb-3 pt-3">
            <div class="col-2 text-right">
                <img class="static-page__how-to--icon" src="/img/card.png" srcset="/img/card@2x.png 2x, /img/card@3x.png 3x">
            </div>
            <div class="col-8 pl-5">
                <h3>2 - Paga o teu bilhete com cartão de crédito e com 100% segurança.</h3>
            </div>
        </div>
        <div class="row d-flex justify-content-center align-items-center pb-3 pt-3">
            <div class="col-2 text-right">
                <img class="static-page__how-to--icon" src="/img/tickets.png" srcset="/img/tickets@2x.png 2x, /img/tickets@3x.png 3x">
            </div>
            <div class="col-8 pl-5">
                <h3>3 - Faz o download do teu bilhete e apresenta-o ao motorista no ponto de partida.</h3>
            </div>
        </div>
        <div class="row d-flex justify-content-center align-items-center pb-4 pt-3">
            <div class="col-2 text-right">
                <img class="static-page__how-to--icon" src="/img/friends.png" srcset="/img/friends@2x.png 2x, /img/friends@3x.png 3x">
            </div>
            <div class="col-8 pl-5">
                <h3>4 - Lembra-te de partilhar a Yoyoloop com os teus amigos e ganha viagens ilimitadas a 3€. <br>Quantos mais amigos se juntarem, mais ganhas!</h3>
            </div>
        </div>
    </div>

    <div class="text-center d-flex static-page__how-to-img">
        <img src="/img/comoviajar.jpg">
    </div>



    <div class="homepage__container homepage__container--forth mt-5">
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
    
    <div class="static-page__container static-page__container--forth mb-5">
        <div class="container-fluid d-flex flex-column justify-content-center">    

            <div class="static-page__separator mt-5 mb-5"></div>

            <div class="row justify-content-center mb-5 align-items-center">
                <div class="static-page__any-question mr-5">Tens alguma pergunta?</div>
                <a OnClick="javascript:$.blockUI()" href="/Help/Help" class="btn btn-default static-page__question-btn static-page__question-btn--white" tabindex="-1" >Lê as nossas Perguntas Frequentes</a>
            </div>
        </div>
    </div>  

</asp:Content>