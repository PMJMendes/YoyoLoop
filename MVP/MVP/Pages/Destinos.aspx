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
                <h1 class="static-page__main-title">A Revolucionar a mobilidade entre cidades, <br> Loop de cada vez</h1>
            </div>
        </header>

        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                    <div class="homepage__yoyoloop text-uppercase">YOYOLOOP</div>
                </div>

                <div class="row justify-content-center mb-5">
                    <div class="homepage__yoyoloop-main-description">Destinos populares</div>
                </div>

                <div class="row justify-content-center mb-5">
                    <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        Apanha boleia para Lisboa a preço de autocarro
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
                            Destino a
                        </div>
                        <div class="static-page__box-container__first__main-title">Lisboa</div>
                    </div>

                    <div class="col-md-7 static-page__box-container__second static-page__box-container__second--destinies-lisboa p-5 m-0 d-flex justify-content-center align-items-center">
                        Com mais de 2 milhões de habitantes na Grande Lisboa, <br>todos os dias entram 370 mil carros na capital num constante pára-arranca.
                    </div>
                </div>
            </div>
        </a>

        <a OnClick="javascript:$.blockUI()" href="/Pages/Destinos?Destino=Porto" tabindex="-1" >
            <div class="homepage__container static-page__box-container p-0">
                <div class="row">
                    <div class="col-md-7 static-page__box-container__second static-page__box-container__second--destinies-porto static-page__box-container__second--destinies-porto--desktop p-5 m-0 d-flex justify-content-center align-items-center">
                        Com mais de 2 milhões de habitantes na Grande Lisboa, todos os dias entram 370 mil carros na capital num constante pára-arranca.
                    </div>
                    <div class="col-md-5 static-page__box-container__first d-flex flex-column justify-content-center align-items-end pr-5">
                        <div class="static-page__box-container__first__sub-title">
                            Destino a
                            <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                        </div>
                        <div class="static-page__box-container__first__main-title">Porto</div>
                    </div>
                    <div class="col-md-7 static-page__box-container__second static-page__box-container__second--destinies-porto static-page__box-container__second--destinies-porto--mobile p-5 m-0 d-flex justify-content-center align-items-center">
                        Com mais de 2 milhões de habitantes na Grande Lisboa, todos os dias entram 370 mil carros na capital num constante pára-arranca.
                    </div>
                </div>
            </div>
        </a>

        <a OnClick="javascript:$.blockUI()" href="/Pages/Destinos?Destino=Cascais" tabindex="-1" >
            <div class="homepage__container static-page__box-container p-0">
                <div class="row">
                    <div class="col-md-5 static-page__box-container__first d-flex flex-column justify-content-center pl-5">
                        <div class="static-page__box-container__first__sub-title">
                            <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                            Destino a
                        </div>
                        <div class="static-page__box-container__first__main-title">Cascais</div>
                    </div>
                    <div class="col-md-7 static-page__box-container__second static-page__box-container__second--destinies-cascais p-5 m-0 d-flex justify-content-center align-items-center">
                        Com 210 mil habitantes, Cascais é um dos principais subúrbios<br> da cidade de Lisboa e o quinto maior concelho do país em termos de população.
                    </div>
                </div>
            </div>
        </a>
        
        <a OnClick="javascript:$.blockUI()" href="/Pages/Destinos?Destino=Coimbra" tabindex="-1" >
            <div class="homepage__container static-page__box-container p-0 mb-5">
                <div class="row">
                    <div class="col-md-7 static-page__box-container__second static-page__box-container__second--destinies-coimbra static-page__box-container__second--destinies-coimbra--desktop p-5 m-0 d-flex justify-content-center align-items-center">
                        Com mais de 2 milhões de habitantes na Grande Lisboa, todos os dias entram 370 mil carros na capital num constante pára-arranca.
                    </div>
                    <div class="col-md-5 static-page__box-container__first d-flex flex-column justify-content-center align-items-end pr-5">
                        <div class="static-page__box-container__first__sub-title">
                            Destino a
                            <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                        </div>
                        <div class="static-page__box-container__first__main-title">Coimbra</div>
                    </div>
                    <div class="col-md-7 static-page__box-container__second static-page__box-container__second--destinies-coimbra static-page__box-container__second--destinies-coimbra--mobile p-5 m-0 d-flex justify-content-center align-items-center">
                        Com mais de 2 milhões de habitantes na Grande Lisboa, todos os dias entram 370 mil carros na capital num constante pára-arranca.
                    </div>
                </div>
            </div>   
        </a>

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
    <!-- END OF DESTINATIONS -->

    <!-- LISBOA -->
    <div class="<%= localData.Destino == "lisboa" ? "" : "hide" %>">
        <header class="head text-center d-flex pb-5 static-page__pic-four">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <h1 class="static-page__main-title">Deixa o carro em casa e vem de transfer para Lisboa</h1>
                <div class="row justify-content-center mt-5 mb-5">
                    <a OnClick="javascript:$.blockUI()" href="/Pages/Destinos" class="btn btn-default static-page__destination-btn static-page__destination-btn--white" tabindex="-1" >voltar</a>
                </div>
            </div>
        </header>

        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                    <div class="homepage__yoyoloop">DESTINO POPULAR</div>
                </div>

                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop-main-description">Apanha um transfer da Yoyoloop para Cascais, a alternativa ao carro e ao comboio</div>
                </div>

                <div class="row justify-content-center mb-5">
                <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        Com 210 mil habitantes, Cascais é um dos principais subúrbios da cidade de Lisboa e o quinto maior concelho do país em termos de população. Apesar de ser uma zona predominantemente residencial e apesar das excelentes iniciativas municipais no concelho, ainda existem deficiências graves na ligação por transporte público entre Cascais e Lisboa.
                        <br/><br/>
                        O comboio serve apenas a orla costeira e a maioria dos pontos de acesso contam com parques de estacionamento pagos. Adicionalmente, o Metropolitano de Lisboa é uma alternativa complicada para quem vem de Cascais e se dirige às zonas nobre de escritórios como as Amoreiras, Saldanha ou Marquês de Pombal.
                        <br/><br/>
                        Por todos estes motivos, não é surpreendente que 66% dos residentes do concelho usem o carro nas suas deslocações diárias. A A5 é, inclusivamente, a auto-estrada mais movimentada do país, por onde passam 80 mil viaturas por dia e 25 milhões de passageiros por ano. De outra maneira seria impossível, até agora.
                        <br/><br/>
                        Com a Yoyoloop, podes apanhar um transfer de sete lugares de Lisboa até Cascais — uma alternativa mais acessível do que o carro e mais fiável do que o comboio. Aproveita uma viagem mais rápida e confortável até quatro pontos estratégicos do concelho, do Cascais Shopping ao E. Leclerc de São Domingos de Rana.
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
                            Loops com destino a
                        </div>
                        <div class="static-page__box-container__first__main-title">Lisboa</div>
                    </div>

                    <div class="col-md-8 static-page__box-container__schedules p-0 m-0">
                        <div class="row">
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/bus-white.png" srcset="/img/bus-white@2x.png 2x, /img/bus-white@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3">Paragens</div>
                                <div class="static-page__box-container__schedules__text text-center">
                                    A Yoyoloop dá-te boleia para Cascais a partir de Lisboa. Escolhe o dia e as horas em que queres viajar, marca a tua viagem e espera que o nosso motorista profissional te apanhe na tua paragem de escolha.
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
            </div>
        </a>
    
        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop">LOOP CASCAIS</div>
                </div>

                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop-main-description">Paragens em Cascais</div>
                </div>

                <div class="row justify-content-center mb-5">
                <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        Se apanhares um transfer para Cascais a partir de Lisboa, podes escolher partir de seis paragens diferentes até ao Cascais Shopping, Hospital de Cascais, Lagoas Park, São Domingos de Rana ou Tagus Park. Do Marquês de Pombal à Gare do Oriente, saído do trabalho ou da faculdade, lembra-te que tens lugar marcado à hora marcada com a Yoyoloop!
                    </div>
                </div>
            </div>
        </div>


        <div class="row static-page__box2 d-flex align-items-center justify-content-center ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image1 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy">Cascais Shopping</div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                O Cascais Shopping é o principal estabelecimento comercial do concelho de Cascais com mais de 200 lojas, cinema e hipermercado Continente. <br/><br/>
                Localizado na freguesia de Alcabideche, o centro comercial é um dos pontos de chegada da Yoyoloop para quem vem de Lisboa.
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    Como chegar até ao teu transfer da Yoyoloop
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    Autocarro Scotturb:
                </div>

                <div class="static-page__box2__text3 text-center mb-1">
                    406, 417, 418, 455, 456, 462, 
                </div>

                <div class="static-page__box2__text3 text-center mb-1">Giro 400</div>
                <div class="static-page__box2__text3 text-center mb-1">Giro 401</div>
                <div class="static-page__box2__text3 text-center mb-1">busCas Estoril</div>
            </div>
        </div>

        <div class="row static-page__box2 d-flex align-items-center justify-content-center mt-3 ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image2 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopyellow.png" srcset="/img/stopyellow@2x.png 2x, /img/stopyellow@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy">Hospital de Cascais</div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                Inaugurado em 2010, o novo Hospital de Cascais Dr. José de Almeida serve a população do concelho de Cascais e oito freguesias do concelho de Sintra. 
                <br/><br/>
                Localizado na freguesia de Alcabideche, o estabelecimento de saúde é um dos pontos de chegada da Yoyoloop para quem vem de Lisboa.                
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    Como chegar até ao teu transfer da Yoyoloop
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    Autocarro Scotturb:
                </div>

                <div class="static-page__box2__text3 text-center mb-1">
                    411, 417, 456, 462, 490
                </div>

                <div class="static-page__box2__text3 text-center mb-1">busCas Malveira Hospital</div>
                <div class="static-page__box2__text3 text-center mb-1">busCas Cascais Hospital</div>
            </div>
        </div>

        <div class="row static-page__box2 d-flex align-items-center justify-content-center mt-3 ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image3 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy">Lagoas Park</div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                O Lagoas Park, situado em Porto Salvo, no concelho de Oeiras, alberga cerca de 100 empresas, tais como a SAP Portugal, a Teixeira Duarte ou a Pfizer.
                <br/><br/>
                O Lagoas Park é um dos pontos de chegada da Yoyoloop para quem vem de Lisboa.
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    Como chegar até ao teu transfer da Yoyoloop
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    Autocarro Vimeca:
                </div>

                <div class="static-page__box2__text3 text-center mb-1">129</div>
            </div>
        </div>

        <div class="row static-page__box2 d-flex align-items-center justify-content-center mt-3 ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image4 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopyellow.png" srcset="/img/stopyellow@2x.png 2x, /img/stopyellow@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy">São Domingos de Rana</div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                O E. Leclerc de São Domingos de Rana é um dos maiores hipermercados do concelho de Cascais e conta com estacionamento grátis. 
                <br/><br/>
                É um dos pontos de chegada da Yoyoloop para quem vem de Lisboa.
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    Como chegar até ao teu transfer da Yoyoloop
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    Autocarro Scotturb:
                </div>

                <div class="static-page__box2__text3 text-center mb-1">busCas SDR,</div>
                <div class="static-page__box2__text3 text-center mb-1">busCas SDR Norte</div>
            
            </div>
        </div>

        <div class="row static-page__box2 d-flex align-items-center justify-content-center mt-3 ml-5 mr-5 mb-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image5 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy">TAGUS PARK</div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                O Tagus Park é um parque de ciência e tecnologia localizado no epicentro dos concelhos de Oeiras, Sintra e Cascais. 
                <br/><br/>
                Aqui encontra-se de tudo um pouco, desde empresas de vários ramos a duas universidades, uma incubadora de startups e algumas das maiores empresas nacionais como o Millennium BCP ou o Novo Banco, uma farmácia, restaurantes, agências bancárias e ginásios.
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    Como chegar até ao teu transfer da Yoyoloop
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    Autocarro Vimeca:
                </div>

                <div class="static-page__box2__text3 text-center mb-1">23, 112, 119, 125</div>
            </div>
        </div>
    </div>
    <!-- END OF LISBOA -->
    
    <!-- PORTO -->
    <div class="<%= localData.Destino == "porto" ? "" : "hide" %>">
        <header class="head text-center d-flex pb-5 static-page__pic-four">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <h1 class="static-page__main-title">Deixa o carro em casa e vem de transfer para o Porto</h1>
                <div class="row justify-content-center mt-5 mb-5">
                    <a OnClick="javascript:$.blockUI()" href="/Pages/Destinos" class="btn btn-default static-page__destination-btn static-page__destination-btn--white" tabindex="-1" >voltar</a>
                </div>
            </div>
        </header>

        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                    <div class="homepage__yoyoloop">DESTINO POPULAR</div>
                </div>

                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop-main-description">Apanha um transfer da Yoyoloop para Cascais, a alternativa ao carro e ao comboio</div>
                </div>

                <div class="row justify-content-center mb-5">
                <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        Com 210 mil habitantes, Cascais é um dos principais subúrbios da cidade de Lisboa e o quinto maior concelho do país em termos de população. Apesar de ser uma zona predominantemente residencial e apesar das excelentes iniciativas municipais no concelho, ainda existem deficiências graves na ligação por transporte público entre Cascais e Lisboa.
                        <br/><br/>
                        O comboio serve apenas a orla costeira e a maioria dos pontos de acesso contam com parques de estacionamento pagos. Adicionalmente, o Metropolitano de Lisboa é uma alternativa complicada para quem vem de Cascais e se dirige às zonas nobre de escritórios como as Amoreiras, Saldanha ou Marquês de Pombal.
                        <br/><br/>
                        Por todos estes motivos, não é surpreendente que 66% dos residentes do concelho usem o carro nas suas deslocações diárias. A A5 é, inclusivamente, a auto-estrada mais movimentada do país, por onde passam 80 mil viaturas por dia e 25 milhões de passageiros por ano. De outra maneira seria impossível, até agora.
                        <br/><br/>
                        Com a Yoyoloop, podes apanhar um transfer de sete lugares de Lisboa até Cascais — uma alternativa mais acessível do que o carro e mais fiável do que o comboio. Aproveita uma viagem mais rápida e confortável até quatro pontos estratégicos do concelho, do Cascais Shopping ao E. Leclerc de São Domingos de Rana.
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
                            Loops com destino ao
                        </div>
                        <div class="static-page__box-container__first__main-title">Porto</div>
                    </div>

                    <div class="col-md-8 static-page__box-container__schedules p-0 m-0">
                        <div class="row">
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/bus-white.png" srcset="/img/bus-white@2x.png 2x, /img/bus-white@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3">Paragens</div>
                                <div class="static-page__box-container__schedules__text text-center">
                                    A Yoyoloop dá-te boleia para Cascais a partir de Lisboa. Escolhe o dia e as horas em que queres viajar, marca a tua viagem e espera que o nosso motorista profissional te apanhe na tua paragem de escolha.
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
            </div>
        </a>
    
        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop">LOOP CASCAIS</div>
                </div>

                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop-main-description">Paragens em Cascais</div>
                </div>

                <div class="row justify-content-center mb-5">
                <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        Se apanhares um transfer para Cascais a partir de Lisboa, podes escolher partir de seis paragens diferentes até ao Cascais Shopping, Hospital de Cascais, Lagoas Park, São Domingos de Rana ou Tagus Park. Do Marquês de Pombal à Gare do Oriente, saído do trabalho ou da faculdade, lembra-te que tens lugar marcado à hora marcada com a Yoyoloop!
                    </div>
                </div>
            </div>
        </div>


        <div class="row static-page__box2 d-flex align-items-center justify-content-center ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image1 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy">Cascais Shopping</div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                O Cascais Shopping é o principal estabelecimento comercial do concelho de Cascais com mais de 200 lojas, cinema e hipermercado Continente. <br/><br/>
                Localizado na freguesia de Alcabideche, o centro comercial é um dos pontos de chegada da Yoyoloop para quem vem de Lisboa.
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    Como chegar até ao teu transfer da Yoyoloop
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    Autocarro Scotturb:
                </div>

                <div class="static-page__box2__text3 text-center mb-1">
                    406, 417, 418, 455, 456, 462, 
                </div>

                <div class="static-page__box2__text3 text-center mb-1">Giro 400</div>
                <div class="static-page__box2__text3 text-center mb-1">Giro 401</div>
                <div class="static-page__box2__text3 text-center mb-1">busCas Estoril</div>
            </div>
        </div>

        <div class="row static-page__box2 d-flex align-items-center justify-content-center mt-3 ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image2 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopyellow.png" srcset="/img/stopyellow@2x.png 2x, /img/stopyellow@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy">Hospital de Cascais</div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                Inaugurado em 2010, o novo Hospital de Cascais Dr. José de Almeida serve a população do concelho de Cascais e oito freguesias do concelho de Sintra. 
                <br/><br/>
                Localizado na freguesia de Alcabideche, o estabelecimento de saúde é um dos pontos de chegada da Yoyoloop para quem vem de Lisboa.                
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    Como chegar até ao teu transfer da Yoyoloop
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    Autocarro Scotturb:
                </div>

                <div class="static-page__box2__text3 text-center mb-1">
                    411, 417, 456, 462, 490
                </div>

                <div class="static-page__box2__text3 text-center mb-1">busCas Malveira Hospital</div>
                <div class="static-page__box2__text3 text-center mb-1">busCas Cascais Hospital</div>
            </div>
        </div>

        <div class="row static-page__box2 d-flex align-items-center justify-content-center mt-3 ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image3 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy">Lagoas Park</div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                O Lagoas Park, situado em Porto Salvo, no concelho de Oeiras, alberga cerca de 100 empresas, tais como a SAP Portugal, a Teixeira Duarte ou a Pfizer.
                <br/><br/>
                O Lagoas Park é um dos pontos de chegada da Yoyoloop para quem vem de Lisboa.
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    Como chegar até ao teu transfer da Yoyoloop
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    Autocarro Vimeca:
                </div>

                <div class="static-page__box2__text3 text-center mb-1">129</div>
            </div>
        </div>

        <div class="row static-page__box2 d-flex align-items-center justify-content-center mt-3 ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image4 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopyellow.png" srcset="/img/stopyellow@2x.png 2x, /img/stopyellow@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy">São Domingos de Rana</div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                O E. Leclerc de São Domingos de Rana é um dos maiores hipermercados do concelho de Cascais e conta com estacionamento grátis. 
                <br/><br/>
                É um dos pontos de chegada da Yoyoloop para quem vem de Lisboa.
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    Como chegar até ao teu transfer da Yoyoloop
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    Autocarro Scotturb:
                </div>

                <div class="static-page__box2__text3 text-center mb-1">busCas SDR,</div>
                <div class="static-page__box2__text3 text-center mb-1">busCas SDR Norte</div>
            
            </div>
        </div>

        <div class="row static-page__box2 d-flex align-items-center justify-content-center mt-3 ml-5 mr-5 mb-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image5 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy">TAGUS PARK</div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                O Tagus Park é um parque de ciência e tecnologia localizado no epicentro dos concelhos de Oeiras, Sintra e Cascais. 
                <br/><br/>
                Aqui encontra-se de tudo um pouco, desde empresas de vários ramos a duas universidades, uma incubadora de startups e algumas das maiores empresas nacionais como o Millennium BCP ou o Novo Banco, uma farmácia, restaurantes, agências bancárias e ginásios.
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    Como chegar até ao teu transfer da Yoyoloop
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    Autocarro Vimeca:
                </div>

                <div class="static-page__box2__text3 text-center mb-1">23, 112, 119, 125</div>
            </div>
        </div>
    </div>
    <!-- END OF PORTO -->

    <!-- COIMBRA -->
    <div class="<%= localData.Destino == "coimbra" ? "" : "hide" %>">
        <header class="head text-center d-flex pb-5 static-page__pic-four">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <h1 class="static-page__main-title">Deixa o carro em casa e vem de transfer para Coimbra</h1>
                <div class="row justify-content-center mt-5 mb-5">
                    <a OnClick="javascript:$.blockUI()" href="/Pages/Destinos" class="btn btn-default static-page__destination-btn static-page__destination-btn--white" tabindex="-1" >voltar</a>
                </div>
            </div>
        </header>

        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                    <div class="homepage__yoyoloop">DESTINO POPULAR</div>
                </div>

                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop-main-description">Apanha um transfer da Yoyoloop para Cascais, a alternativa ao carro e ao comboio</div>
                </div>

                <div class="row justify-content-center mb-5">
                <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        Com 210 mil habitantes, Cascais é um dos principais subúrbios da cidade de Lisboa e o quinto maior concelho do país em termos de população. Apesar de ser uma zona predominantemente residencial e apesar das excelentes iniciativas municipais no concelho, ainda existem deficiências graves na ligação por transporte público entre Cascais e Lisboa.
                        <br/><br/>
                        O comboio serve apenas a orla costeira e a maioria dos pontos de acesso contam com parques de estacionamento pagos. Adicionalmente, o Metropolitano de Lisboa é uma alternativa complicada para quem vem de Cascais e se dirige às zonas nobre de escritórios como as Amoreiras, Saldanha ou Marquês de Pombal.
                        <br/><br/>
                        Por todos estes motivos, não é surpreendente que 66% dos residentes do concelho usem o carro nas suas deslocações diárias. A A5 é, inclusivamente, a auto-estrada mais movimentada do país, por onde passam 80 mil viaturas por dia e 25 milhões de passageiros por ano. De outra maneira seria impossível, até agora.
                        <br/><br/>
                        Com a Yoyoloop, podes apanhar um transfer de sete lugares de Lisboa até Cascais — uma alternativa mais acessível do que o carro e mais fiável do que o comboio. Aproveita uma viagem mais rápida e confortável até quatro pontos estratégicos do concelho, do Cascais Shopping ao E. Leclerc de São Domingos de Rana.
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
                            Loops com destino a
                        </div>
                        <div class="static-page__box-container__first__main-title">Coimbra</div>
                    </div>

                    <div class="col-md-8 static-page__box-container__schedules p-0 m-0">
                        <div class="row">
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/bus-white.png" srcset="/img/bus-white@2x.png 2x, /img/bus-white@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3">Paragens</div>
                                <div class="static-page__box-container__schedules__text text-center">
                                    A Yoyoloop dá-te boleia para Cascais a partir de Lisboa. Escolhe o dia e as horas em que queres viajar, marca a tua viagem e espera que o nosso motorista profissional te apanhe na tua paragem de escolha.
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
            </div>
        </a>
    
        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop">LOOP CASCAIS</div>
                </div>

                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop-main-description">Paragens em Cascais</div>
                </div>

                <div class="row justify-content-center mb-5">
                <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        Se apanhares um transfer para Cascais a partir de Lisboa, podes escolher partir de seis paragens diferentes até ao Cascais Shopping, Hospital de Cascais, Lagoas Park, São Domingos de Rana ou Tagus Park. Do Marquês de Pombal à Gare do Oriente, saído do trabalho ou da faculdade, lembra-te que tens lugar marcado à hora marcada com a Yoyoloop!
                    </div>
                </div>
            </div>
        </div>


        <div class="row static-page__box2 d-flex align-items-center justify-content-center ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image1 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy">Cascais Shopping</div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                O Cascais Shopping é o principal estabelecimento comercial do concelho de Cascais com mais de 200 lojas, cinema e hipermercado Continente. <br/><br/>
                Localizado na freguesia de Alcabideche, o centro comercial é um dos pontos de chegada da Yoyoloop para quem vem de Lisboa.
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    Como chegar até ao teu transfer da Yoyoloop
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    Autocarro Scotturb:
                </div>

                <div class="static-page__box2__text3 text-center mb-1">
                    406, 417, 418, 455, 456, 462, 
                </div>

                <div class="static-page__box2__text3 text-center mb-1">Giro 400</div>
                <div class="static-page__box2__text3 text-center mb-1">Giro 401</div>
                <div class="static-page__box2__text3 text-center mb-1">busCas Estoril</div>
            </div>
        </div>

        <div class="row static-page__box2 d-flex align-items-center justify-content-center mt-3 ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image2 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopyellow.png" srcset="/img/stopyellow@2x.png 2x, /img/stopyellow@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy">Hospital de Cascais</div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                Inaugurado em 2010, o novo Hospital de Cascais Dr. José de Almeida serve a população do concelho de Cascais e oito freguesias do concelho de Sintra. 
                <br/><br/>
                Localizado na freguesia de Alcabideche, o estabelecimento de saúde é um dos pontos de chegada da Yoyoloop para quem vem de Lisboa.                
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    Como chegar até ao teu transfer da Yoyoloop
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    Autocarro Scotturb:
                </div>

                <div class="static-page__box2__text3 text-center mb-1">
                    411, 417, 456, 462, 490
                </div>

                <div class="static-page__box2__text3 text-center mb-1">busCas Malveira Hospital</div>
                <div class="static-page__box2__text3 text-center mb-1">busCas Cascais Hospital</div>
            </div>
        </div>

        <div class="row static-page__box2 d-flex align-items-center justify-content-center mt-3 ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image3 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy">Lagoas Park</div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                O Lagoas Park, situado em Porto Salvo, no concelho de Oeiras, alberga cerca de 100 empresas, tais como a SAP Portugal, a Teixeira Duarte ou a Pfizer.
                <br/><br/>
                O Lagoas Park é um dos pontos de chegada da Yoyoloop para quem vem de Lisboa.
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    Como chegar até ao teu transfer da Yoyoloop
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    Autocarro Vimeca:
                </div>

                <div class="static-page__box2__text3 text-center mb-1">129</div>
            </div>
        </div>

        <div class="row static-page__box2 d-flex align-items-center justify-content-center mt-3 ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image4 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopyellow.png" srcset="/img/stopyellow@2x.png 2x, /img/stopyellow@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy">São Domingos de Rana</div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                O E. Leclerc de São Domingos de Rana é um dos maiores hipermercados do concelho de Cascais e conta com estacionamento grátis. 
                <br/><br/>
                É um dos pontos de chegada da Yoyoloop para quem vem de Lisboa.
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    Como chegar até ao teu transfer da Yoyoloop
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    Autocarro Scotturb:
                </div>

                <div class="static-page__box2__text3 text-center mb-1">busCas SDR,</div>
                <div class="static-page__box2__text3 text-center mb-1">busCas SDR Norte</div>
            
            </div>
        </div>

        <div class="row static-page__box2 d-flex align-items-center justify-content-center mt-3 ml-5 mr-5 mb-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image5 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy">TAGUS PARK</div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                O Tagus Park é um parque de ciência e tecnologia localizado no epicentro dos concelhos de Oeiras, Sintra e Cascais. 
                <br/><br/>
                Aqui encontra-se de tudo um pouco, desde empresas de vários ramos a duas universidades, uma incubadora de startups e algumas das maiores empresas nacionais como o Millennium BCP ou o Novo Banco, uma farmácia, restaurantes, agências bancárias e ginásios.
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    Como chegar até ao teu transfer da Yoyoloop
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    Autocarro Vimeca:
                </div>

                <div class="static-page__box2__text3 text-center mb-1">23, 112, 119, 125</div>
            </div>
        </div>
    </div>
    <!-- END OF COIMBRA -->

    <!-- CASCAIS -->
    <div class="<%= localData.Destino == "cascais" ? "" : "hide" %>">
        <header class="head text-center d-flex pb-5 static-page__pic-four">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <h1 class="static-page__main-title">Deixa o carro em casa e vem de transfer para Cascais</h1>
                <div class="row justify-content-center mt-5 mb-5">
                    <a OnClick="javascript:$.blockUI()" href="/Pages/Destinos" class="btn btn-default static-page__destination-btn static-page__destination-btn--white" tabindex="-1" >voltar</a>
                </div>
            </div>
        </header>

        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                    <div class="homepage__yoyoloop">DESTINO POPULAR</div>
                </div>

                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop-main-description">Apanha um transfer da Yoyoloop para Cascais, a alternativa ao carro e ao comboio</div>
                </div>

                <div class="row justify-content-center mb-5">
                <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        Com 210 mil habitantes, Cascais é um dos principais subúrbios da cidade de Lisboa e o quinto maior concelho do país em termos de população. Apesar de ser uma zona predominantemente residencial e apesar das excelentes iniciativas municipais no concelho, ainda existem deficiências graves na ligação por transporte público entre Cascais e Lisboa.
                        <br/><br/>
                        O comboio serve apenas a orla costeira e a maioria dos pontos de acesso contam com parques de estacionamento pagos. Adicionalmente, o Metropolitano de Lisboa é uma alternativa complicada para quem vem de Cascais e se dirige às zonas nobre de escritórios como as Amoreiras, Saldanha ou Marquês de Pombal.
                        <br/><br/>
                        Por todos estes motivos, não é surpreendente que 66% dos residentes do concelho usem o carro nas suas deslocações diárias. A A5 é, inclusivamente, a auto-estrada mais movimentada do país, por onde passam 80 mil viaturas por dia e 25 milhões de passageiros por ano. De outra maneira seria impossível, até agora.
                        <br/><br/>
                        Com a Yoyoloop, podes apanhar um transfer de sete lugares de Lisboa até Cascais — uma alternativa mais acessível do que o carro e mais fiável do que o comboio. Aproveita uma viagem mais rápida e confortável até quatro pontos estratégicos do concelho, do Cascais Shopping ao E. Leclerc de São Domingos de Rana.
                    </div>
                </div>
            </div>
        </div>

        <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Linha%20de%20Cascais" tabindex="-1" >
            <div class="homepage__container static-page__box-container p-0 mt-5 mb-5">
                <div class="row">
                    <div class="col-md-4 static-page__box-container__first d-flex flex-column justify-content-center pl-5">
                        <div class="static-page__box-container__first__sub-title">
                            <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                            Loops com destino a
                        </div>
                        <div class="static-page__box-container__first__main-title">Cascais</div>
                    </div>

                    <div class="col-md-8 static-page__box-container__schedules p-0 m-0">
                        <div class="row">
                            <div class="col-md-6 d-flex align-items-center flex-column pt-4">
                                <img src="/img/bus-white.png" srcset="/img/bus-white@2x.png 2x, /img/bus-white@3x.png 3x">
                                <div class="static-page__box-container__schedules__label pt-3 pb-3">Paragens</div>
                                <div class="static-page__box-container__schedules__text text-center">
                                    A Yoyoloop dá-te boleia para Cascais a partir de Lisboa. Escolhe o dia e as horas em que queres viajar, marca a tua viagem e espera que o nosso motorista profissional te apanhe na tua paragem de escolha.
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
            </div>
        </a>
    
        <div class="homepage__container static-page__center-container">
            <div class="container-fluid d-flex flex-column justify-content-center">
                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop">LOOP CASCAIS</div>
                </div>

                <div class="row justify-content-center mb-5">
                <div class="homepage__yoyoloop-main-description">Paragens em Cascais</div>
                </div>

                <div class="row justify-content-center mb-5">
                <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="static-page__first__sub-description">
                        Se apanhares um transfer para Cascais a partir de Lisboa, podes escolher partir de seis paragens diferentes até ao Cascais Shopping, Hospital de Cascais, Lagoas Park, São Domingos de Rana ou Tagus Park. Do Marquês de Pombal à Gare do Oriente, saído do trabalho ou da faculdade, lembra-te que tens lugar marcado à hora marcada com a Yoyoloop!
                    </div>
                </div>
            </div>
        </div>


        <div class="row static-page__box2 d-flex align-items-center justify-content-center ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image1 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy">Cascais Shopping</div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                O Cascais Shopping é o principal estabelecimento comercial do concelho de Cascais com mais de 200 lojas, cinema e hipermercado Continente. <br/><br/>
                Localizado na freguesia de Alcabideche, o centro comercial é um dos pontos de chegada da Yoyoloop para quem vem de Lisboa.
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    Como chegar até ao teu transfer da Yoyoloop
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    Autocarro Scotturb:
                </div>

                <div class="static-page__box2__text3 text-center mb-1">
                    406, 417, 418, 455, 456, 462, 
                </div>

                <div class="static-page__box2__text3 text-center mb-1">Giro 400</div>
                <div class="static-page__box2__text3 text-center mb-1">Giro 401</div>
                <div class="static-page__box2__text3 text-center mb-1">busCas Estoril</div>
            </div>
        </div>

        <div class="row static-page__box2 d-flex align-items-center justify-content-center mt-3 ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image2 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopyellow.png" srcset="/img/stopyellow@2x.png 2x, /img/stopyellow@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy">Hospital de Cascais</div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                Inaugurado em 2010, o novo Hospital de Cascais Dr. José de Almeida serve a população do concelho de Cascais e oito freguesias do concelho de Sintra. 
                <br/><br/>
                Localizado na freguesia de Alcabideche, o estabelecimento de saúde é um dos pontos de chegada da Yoyoloop para quem vem de Lisboa.                
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    Como chegar até ao teu transfer da Yoyoloop
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    Autocarro Scotturb:
                </div>

                <div class="static-page__box2__text3 text-center mb-1">
                    411, 417, 456, 462, 490
                </div>

                <div class="static-page__box2__text3 text-center mb-1">busCas Malveira Hospital</div>
                <div class="static-page__box2__text3 text-center mb-1">busCas Cascais Hospital</div>
            </div>
        </div>

        <div class="row static-page__box2 d-flex align-items-center justify-content-center mt-3 ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image3 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy">Lagoas Park</div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                O Lagoas Park, situado em Porto Salvo, no concelho de Oeiras, alberga cerca de 100 empresas, tais como a SAP Portugal, a Teixeira Duarte ou a Pfizer.
                <br/><br/>
                O Lagoas Park é um dos pontos de chegada da Yoyoloop para quem vem de Lisboa.
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    Como chegar até ao teu transfer da Yoyoloop
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    Autocarro Vimeca:
                </div>

                <div class="static-page__box2__text3 text-center mb-1">129</div>
            </div>
        </div>

        <div class="row static-page__box2 d-flex align-items-center justify-content-center mt-3 ml-5 mr-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image4 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopyellow.png" srcset="/img/stopyellow@2x.png 2x, /img/stopyellow@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy">São Domingos de Rana</div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                O E. Leclerc de São Domingos de Rana é um dos maiores hipermercados do concelho de Cascais e conta com estacionamento grátis. 
                <br/><br/>
                É um dos pontos de chegada da Yoyoloop para quem vem de Lisboa.
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    Como chegar até ao teu transfer da Yoyoloop
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    Autocarro Scotturb:
                </div>

                <div class="static-page__box2__text3 text-center mb-1">busCas SDR,</div>
                <div class="static-page__box2__text3 text-center mb-1">busCas SDR Norte</div>
            
            </div>
        </div>

        <div class="row static-page__box2 d-flex align-items-center justify-content-center mt-3 ml-5 mr-5 mb-5">
            <div class="col-md-4 m-0 p-0 static-page__box2__image static-page__box2--image5 d-flex align-items-center justify-content-center flex-column">
                <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                <div class="mt-4 text-uppercase static-page__box2__image__copy">TAGUS PARK</div>
            </div>

            <div class="col-md-4 static-page__box2__text1 pt-5 pb-5 pr-4 pl-4">
                O Tagus Park é um parque de ciência e tecnologia localizado no epicentro dos concelhos de Oeiras, Sintra e Cascais. 
                <br/><br/>
                Aqui encontra-se de tudo um pouco, desde empresas de vários ramos a duas universidades, uma incubadora de startups e algumas das maiores empresas nacionais como o Millennium BCP ou o Novo Banco, uma farmácia, restaurantes, agências bancárias e ginásios.
            </div>

            <div class="col-md-4 p-4">
                <div class="static-page__box2__text2 text-uppercase text-center mb-3">
                    Como chegar até ao teu transfer da Yoyoloop
                </div>

                <div class="static-page__box2__text3 static-page__box2__text3--bold text-center mb-3">
                    Autocarro Vimeca:
                </div>

                <div class="static-page__box2__text3 text-center mb-1">23, 112, 119, 125</div>
            </div>
        </div>
    </div>
    <!-- END OF CASCAIS -->
    
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