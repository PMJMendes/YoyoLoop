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
     </style>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

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