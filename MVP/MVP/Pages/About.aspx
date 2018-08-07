<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="MVP.Pages.About" %>

<asp:Content ID="CssOverrides" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .homepage__navbar {
            background: none
        }
            .homepage__navbar a {
                color: #fbfbfb !important
            }
     </style>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <header class="head text-center d-flex pb-5 static-page__pic-three">
        <div class="container-fluid d-flex align-items-center">
            
        </div>
    </header>

    <div class="homepage__container static-page__center-container">
        <div class="container-fluid d-flex flex-column justify-content-center">
            <div class="row justify-content-center mb-5">
            <div class="homepage__yoyoloop">SOBRE NOS</div>
            </div>

            <div class="row justify-content-center mb-5">
            <div class="homepage__yoyoloop-main-description">A revolucionar as cidades, um loop de cada vez.</div>
            </div>

            <div class="row justify-content-center mb-5">
            <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
            </div>
            
            <div class="row justify-content-center mb-5">
                <div class="static-page__first__sub-description">
                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                    <br/><br/>
                    Foi por isso que criámos um serviço de transfer a preço de autocarro, alternativo aos comboios e às boleias tradicionais, com a diferença de ser mais acessível, conveniente, fiável e sustentável.
                </div>
            </div>
        </div>
    </div>

    <div class="static-page__separator mt-5 mb-5"></div>

    <div class="row homepage__container static-page__box-container mt-5 mb-5">
      <div class="container-fluid d-flex flex-column justify-content-center">
        <div class="row row-no-padding">
          <div class="homepage__why-card col-md-3 d-flex flex-column align-items-center">
            <div class="homepage__why-card__image mb-4">
              <img src="/img/acessivel.png" srcset="/img/acessivel@2x.png 2x, /img/acessivel@3x.png 3x">
            </div>
            <div class="homepage__why-card__title mb-3">Acessível</div>
            <div class="homepage__why-card__sub-title mb-3">Menos desgaste,<br/>mais na carteira</div>
            <div class="homepage__why-card__separator mb-3"></div>
            <div class="homepage__why-card__content mb-3">Por um loop, chegas a pagar 75% menos do que se levasses o teu próprio carro e exactamente o mesmo do que pagarias por ir de autocarro ou outros transportes — e ainda tens uma viagem muito mais confortável e menos desgastante.</div>
          </div>

          <div class="homepage__why-card col-md-3 d-flex flex-column align-items-center">
            <div class="homepage__why-card__image mb-4">
              <img src="/img/conveniente.png" srcset="/img/conveniente@2x.png 2x, /img/conveniente@3x.png 3x">
            </div>
            <div class="homepage__why-card__title mb-3">Conveniente</div>
            <div class="homepage__why-card__sub-title mb-3">Pick up e drop off<br/>convenientes</div>
            <div class="homepage__why-card__separator mb-3"></div>
            <div class="homepage__why-card__content mb-3">Além de contar com partidas frequentes, a Yoyoloop vai pôr-te e buscar-te a pontos estratégicos da cidade, como estações de metro, supermercados, largos dos centros urbanos e as principais zonas de escritórios de Lisboa — e ainda te oferece wifi a bordo.</div>
          </div>

          <div class="homepage__why-card col-md-3 d-flex flex-column align-items-center">
            <div class="homepage__why-card__image mb-4">
              <img src="/img/fiavel.png" srcset="/img/fiavel@2x.png 2x, /img/fiavel@3x.png 3x">
            </div>
            <div class="homepage__why-card__title mb-3">Fiável</div>
            <div class="homepage__why-card__sub-title mb-3">Lugar marcado,<br/>à hora marcada</div>
            <div class="homepage__why-card__separator mb-3"></div>
            <div class="homepage__why-card__content mb-3">Um motorista profissional dá-te boleia com locais e horas de partida fixas. Basta escolheres o teu ponto de saída, reservar a tua viagem, e sentares-te no teu lugar à hora marcada.</div>
          </div>

          <div class="homepage__why-card col-md-3 d-flex flex-column align-items-center">
            <div class="homepage__why-card__image mb-4">
              <img src="/img/sustentavel.png" srcset="/img/sustentavel@2x.png 2x, /img/sustentavel@3x.png 3x">
            </div>
            <div class="homepage__why-card__title mb-3">Sustentável</div>
            <div class="homepage__why-card__sub-title mb-3">Menos carros,<br/>mais cidade</div>
            <div class="homepage__why-card__separator mb-3"></div>
            <div class="homepage__why-card__content mb-3">Todas as nossas viagens são feitas em veículos de sete lugares. Não só tiramos mais carros da estrada, como também ajudamos a reduzir a pegada de carbono.</div>
          </div>
        </div>
      </div>
    </div>

    <div class="homepage__container static-page__box-container mt-5 mb-5">
        <div class="row">
            <div class="col-md-12 static-page__about__size static-page__about__size--big d-flex align-items-center justify-content-center flex-column">
                <div class="static-page__grid__main-title mb-3">Os nossos shuttles</div>
                <div class="static-page__grid__sub-title">Cada um dos nossos shuttles são veículos de sete lugares. Todos com wifi a bordo e conduzidos por um motorista profissional que te leva ao teu destino sem paragens para que possas fazer uma viagem mais confortável. As nossas cidades agradecem.</div>
            </div>
        </div>

        <div class="row static-page__about__grid">
            <div class="col-md-4 mt-1">
                <div class="static-page__about__size static-page__about__size__pic-2"></div>
            </div>
            <div class="col-md-4 mt-1">
                <div class="static-page__about__size static-page__about__size__pic-3"></div>
            </div>
            <div class="col-md-4 mt-1">
                <div class="static-page__about__size static-page__about__size__pic-4"></div>
            </div>
        </div>

        <div class="row static-page__about__grid">
            <div class="col-md-4 mt-1">
                <div class="static-page__about__size static-page__about__size__pic-5"></div>
            </div>
            <div class="col-md-4 mt-1">
                <div class="static-page__about__size static-page__about__size__pic-6"></div>
            </div>
            <div class="col-md-4 mt-1">
                <div class="static-page__about__size static-page__about__size__pic-7"></div>
            </div>
        </div>
    </div>

    <div class="static-page__container static-page__container--forth mt-5 mb-5">
        <div class="container-fluid d-flex flex-column justify-content-center">    
            <div class="row justify-content-center align-items-center">
                <div class="static-page__any-question mr-5">Tens alguma pergunta?</div>
                <a OnClick="javascript:$.blockUI()" href="/Help/Help" class="btn btn-default static-page__question-btn static-page__question-btn--white" tabindex="-1" >Lê as nossas Perguntas Frequentes</a>
            </div>
        </div>
    </div>  

</asp:Content>