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
            <div class="homepage__yoyoloop text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_HowTo_MainTitle%>"/></div>
            </div>

            <div class="row justify-content-center mb-5">
            <div class="homepage__yoyoloop-main-description"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_HowTo_MainDescription%>"/></div>
            </div>

            <div class="row justify-content-center mb-5">
            <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
            </div>
            
            <div class="row justify-content-center mb-5">
                <div class="static-page__first__sub-description">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_HowTo_MainSubDescription%>"/>
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
                <h3><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_HowTo_StepOne%>"/></h3>
            </div>
        </div>
        <div class="row d-flex justify-content-center align-items-center pb-3 pt-3">
            <div class="col-2 text-right">
                <img class="static-page__how-to--icon" src="/img/card.png" srcset="/img/card@2x.png 2x, /img/card@3x.png 3x">
            </div>
            <div class="col-8 pl-5">
                <h3><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_HowTo_StepTwo%>"/></h3>
            </div>
        </div>
        <div class="row d-flex justify-content-center align-items-center pb-3 pt-3">
            <div class="col-2 text-right">
                <img class="static-page__how-to--icon" src="/img/tickets.png" srcset="/img/tickets@2x.png 2x, /img/tickets@3x.png 3x">
            </div>
            <div class="col-8 pl-5">
                <h3><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_HowTo_StepThree%>"/></h3>
            </div>
        </div>
        <div class="row d-flex justify-content-center align-items-center pb-4 pt-3">
            <div class="col-2 text-right">
                <img class="static-page__how-to--icon" src="/img/friends.png" srcset="/img/friends@2x.png 2x, /img/friends@3x.png 3x">
            </div>
            <div class="col-8 pl-5">
                <h3><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_HowTo_StepFour%>"/></h3>
            </div>
        </div>
    </div>

    <div class="text-center d-flex static-page__how-to-img">
        <img src="/img/comoviajar.jpg">
    </div>



    <div class="homepage__container homepage__container--forth mt-5">
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
    
    <div class="static-page__container static-page__container--forth mb-5">
        <div class="container-fluid d-flex flex-column justify-content-center">    

            <div class="static-page__separator mt-5 mb-5"></div>

            <div class="row justify-content-center mb-5 align-items-center">
                <div class="static-page__any-question mr-5"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_FAQ_Questions%>"/></div>
                <a OnClick="javascript:$.blockUI()" href="/Help/Help" class="btn btn-default static-page__question-btn static-page__question-btn--white" tabindex="-1" ><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_FAQ_Questions_HelpLink%>"/></a>
            </div>
        </div>
    </div>  

</asp:Content>