<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="MVP.Pages.About" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <title>
        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Meta_About_Title%>"/>
    </title>
    <meta name="description" content="<%= Resources.LocalizedText.Meta_About_Description%>">
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
     </style>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <header class="head text-center d-flex pb-5 static-page__pic-about">
        <div class="container-fluid d-flex align-items-center">
            
        </div>
    </header>

    <div class="homepage__container static-page__center-container">
        <div class="container-fluid d-flex flex-column justify-content-center">
            <div class="row justify-content-center mb-5">
            <div class="homepage__yoyoloop"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_About_MainTitle%>"/></div>
            </div>

            <div class="row justify-content-center mb-5">
            <div class="homepage__yoyoloop-main-description"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_About_MainDescription%>"/></div>
            </div>

            <div class="row justify-content-center mb-5">
            <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
            </div>
            
            <div class="row justify-content-center mb-5">
                <div class="static-page__first__sub-description">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_About_SubDescription%>"/>
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
            <div class="homepage__why-card__title mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_About_Why_Accessible_Title%>"/></div>
            <div class="homepage__why-card__sub-title mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_About_Why_Accessible_SubTitle%>"/></div>
            <div class="homepage__why-card__separator mb-3"></div>
            <div class="homepage__why-card__content mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_About_Why_Accessible_Content%>"/></div>
          </div>

          <div class="homepage__why-card col-md-3 d-flex flex-column align-items-center">
            <div class="homepage__why-card__image mb-4">
              <img src="/img/conveniente.png" srcset="/img/conveniente@2x.png 2x, /img/conveniente@3x.png 3x">
            </div>
            <div class="homepage__why-card__title mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_About_Why_Convenient_Title%>"/></div>
            <div class="homepage__why-card__sub-title mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_About_Why_Convenient_SubTitle%>"/></div>
            <div class="homepage__why-card__separator mb-3"></div>
            <div class="homepage__why-card__content mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_About_Why_Convenient_Content%>"/></div>
          </div>

          <div class="homepage__why-card col-md-3 d-flex flex-column align-items-center">
            <div class="homepage__why-card__image mb-4">
              <img src="/img/fiavel.png" srcset="/img/fiavel@2x.png 2x, /img/fiavel@3x.png 3x">
            </div>
            <div class="homepage__why-card__title mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_About_Why_Reliable_Title%>"/></div>
            <div class="homepage__why-card__sub-title mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_About_Why_Reliable_SubTitle%>"/></div>
            <div class="homepage__why-card__separator mb-3"></div>
            <div class="homepage__why-card__content mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_About_Why_Reliable_Content%>"/></div>
          </div>

          <div class="homepage__why-card col-md-3 d-flex flex-column align-items-center">
            <div class="homepage__why-card__image mb-4">
              <img src="/img/sustentavel.png" srcset="/img/sustentavel@2x.png 2x, /img/sustentavel@3x.png 3x">
            </div>
            <div class="homepage__why-card__title mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_About_Why_Sustainable_Title%>"/></div>
            <div class="homepage__why-card__sub-title mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_About_Why_Sustainable_SubTitle%>"/></div>
            <div class="homepage__why-card__separator mb-3"></div>
            <div class="homepage__why-card__content mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_About_Why_Sustainable_Content%>"/></div>
          </div>
        </div>
      </div>
    </div>

    <div class="homepage__container static-page__box-container mt-5 mb-5">
        <div class="row">
            <div class="col-md-12 static-page__about__size static-page__about__size--big d-flex align-items-center justify-content-center flex-column">
                <div class="static-page__grid__main-title mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_About_Shuttles_Title%>"/></div>
                <div class="static-page__grid__sub-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_About_Shuttles_SubTitle%>"/></div>
            </div>
        </div>

        <div class="row static-page__about__grid">
            <div class="col-md-4 mt-1">
                <div class="static-page__about__size static-page__about__size__pic-1"></div>
            </div>
            <div class="col-md-4 mt-1">
                <div class="static-page__about__size static-page__about__size__pic-2"></div>
            </div>
            <div class="col-md-4 mt-1">
                <div class="static-page__about__size static-page__about__size__pic-3"></div>
            </div>
        </div>

        <div class="row static-page__about__grid">
            <div class="col-md-4 mt-1">
                <div class="static-page__about__size static-page__about__size__pic-4"></div>
            </div>
            <div class="col-md-4 mt-1">
                <div class="static-page__about__size static-page__about__size__pic-5"></div>
            </div>
            <div class="col-md-4 mt-1">
                <div class="static-page__about__size static-page__about__size__pic-6"></div>
            </div>
        </div>
    </div>

    <div class="static-page__container static-page__container--forth mt-5 mb-5">
        <div class="container-fluid d-flex flex-column justify-content-center">    
            <div class="row justify-content-center align-items-center">
                <div class="static-page__any-question mr-5"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_FAQ_Questions%>"/></div>
                <a OnClick="javascript:$.blockUI()" href="/Help/Help" class="btn btn-default static-page__question-btn static-page__question-btn--white" tabindex="-1" ><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_FAQ_Questions_HelpLink%>"/></a>
            </div>
        </div>
    </div>  

</asp:Content>