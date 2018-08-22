<%@ Page Title="Yoyoloop"  Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Invite.aspx.cs" Inherits="MVP.Profile.Invite" %>

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
    <header class="head text-center d-flex pb-5 invitefriends--image">
        <div class="container-fluid">
            <div class="row">
                <div class="invitefriends__main-title">Convida os teus amigos e viaja por apenas 3€</div>
            </div>
        </div>
    </header>

    <div class="invitefriends">

        <div class="invitefriends__container invitefriends__container--second">

            <div class="container-fluid d-flex flex-column justify-content-center pt-5 pb-5">
                <div class="row justify-content-center mt-5 mb-5">
                    <div class="invitefriends__why-catch-ride text-center">
                        Já poupaste <%= pageData.AmountSaved %>€! <br/>
                        Ainda tens <%= pageData.MGMTrips %> viagens de 3€ para aproveitar
                    </div>
                </div>
                <div class="row row-no-padding">
                    <div class="invitefriends__why-card col-md-4 d-flex flex-column align-items-center">
                        <div class="invitefriends__why-card__image mb-4">
                            <img src="/img/recommend.png" srcset="/img/recommend@2x.png 2x, /img/recommend@3x.png 3x">
                        </div>
                        <div class="invitefriends__why-card__title mb-3">Recomenda a Yoyoloop</div>
                        <div class="invitefriends__why-card__separator mb-3"></div>
                        <div class="invitefriends__why-card__content mb-3">Recomenda a Yoyoloop aos teus amigos ao partilhar o teu código promocional</div>
                    </div>

                    <div class="invitefriends__why-card col-md-4 d-flex flex-column align-items-center">
                        <div class="invitefriends__why-card__image mb-4">
                            <img src="/img/friends.png" srcset="/img/friends@2x.png 2x, /img/friends@3x.png 3x">
                        </div>
                        <div class="invitefriends__why-card__title mb-3">Oferece viagens</div>
                        <div class="invitefriends__why-card__separator mb-3"></div>
                        <div class="invitefriends__why-card__content mb-3">Os teus amigos viajam para qualquer destino por apenas 3€.</div>
                    </div>

                    <div class="invitefriends__why-card col-md-4 d-flex flex-column align-items-center">
                        <div class="invitefriends__why-card__image mb-4">
                            <img src="/img/transfer.png" srcset="/img/transfer@2x.png 2x, /img/transfer@3x.png 3x">
                        </div>
                        <div class="invitefriends__why-card__title mb-3">Viaja por 3€!</div>
                        <div class="invitefriends__why-card__separator mb-3"></div>
                        <div class="invitefriends__why-card__content mb-3">Recebe uma viagem a 3€ para qualquer destino por cada amigo que utilizar a Yoyoloop pela primeira vez</div>
                    </div>
                </div>
            </div>

        </div>

        <asp:UpdatePanel runat="server" ID="upPromoshare" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="invitefriends__container invitefriends__container--third">

                    <div class="container-fluid d-flex flex-column align-items-center justify-content-center p-4 invitefriends__promocode">
                        <p class="invitefriends__promocode__text mb-5 text-center">Partilha o teu código promocional com todos os teus amigos e viaja por apenas 3€!</p>

                        <asp:PlaceHolder runat="server" ID="phCopyLink" Visible="true">
                            <div id="copy-link-1" class="d-flex align-items-center justify-content-center invitefriends__copy-link row">
                                <div class="invitefriends__promocode__input mr-5">
                                    <div class="invitefriends__promocode__label"><%= pageData.MGMCode %></div>
                                </div>
                                <asp:LinkButton runat="server" ID="btnCopyLink" OnClick="btnCopyLink_Click" CssClass="invitefriends__promocode__reserve d-flex align-items-center justify-content-center" Text="Copiar Link" />
                            </div>
                        </asp:PlaceHolder>

                        <asp:PlaceHolder runat="server" ID="phLinkCopied" Visible="false">
                            <div id="copy-link-2" class="d-flex align-items-center justify-content-center invitefriends__copy-link row">

                                <!-- Copied popover -->
                                <div class="invitefriends__popover invitefriends__popover--copied">
                                    <div class="check">

                                    </div>
                                    Copied to clipboard
                                </div>
                                <!-- End of copied popover -->

                                <div runat="server" id="PromocodeInput" class="invitefriends__promocode__input mr-5">
                                    <div class="invitefriends__promocode__label"><%= pageData.MGMCode %></div>
                                    <div class="invitefriends__promocode__copy">Copy Link</div>
                                </div>
                                <asp:LinkButton runat="server" ID="btnShare" OnClick="btnShare_Click" class="invitefriends__promocode__reserve d-flex align-items-center justify-content-center" Text="Partilhar" />

                                <asp:PlaceHolder runat="server" ID="phSharePopover" Visible="false">
                                    <!-- Share Popover -->
                                    <div class="invitefriends__popover invitefriends__popover--register">
                                        <div class="invitefriends__popover__link">
                                            <img src="/img/face.png" srcset="/img/face@2x.png 2x, /img/face@3x.png 3x" class="face">
                                            Partilhar no facebook
                                        </div>
                    
                                        <div class="invitefriends__popover__separator"></div>

                                        <div class="invitefriends__popover__link">
                                            <img src="/img/twitter.png" srcset="/img/twitter@2x.png 2x, /img/twitter@3x.png 3x">
                                            Partilhar no twitter
                                        </div>

                                        <div class="invitefriends__popover__separator"></div>

                                        <div class="invitefriends__popover__link">
                                            <img src="/img/linkedin.png" srcset="/img/linkedin@2x.png 2x, /img/linkedin@3x.png 3x">
                                            Partilhar no linkedin
                                        </div>

                                        <div class="invitefriends__popover__separator"></div>

                                        <div class="invitefriends__popover__link">
                                            <img src="/img/email.png" srcset="/img/email@2x.png 2x, /img/email@3x.png 3x">
                                            Enviar por Email
                                        </div>
                                    </div>
                                    <!-- End of Share Popover -->
                                </asp:PlaceHolder>
                            </div>
                        </asp:PlaceHolder>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <div class="invitefriends__container invitefriends__container--forth">
            <div class="container-fluid d-flex flex-column justify-content-center">    
                <div class="row justify-content-center mb-5">
                    <div class="invitefriends__yoyoloop-main-description">Porquê apanhar boleia de um transfer da Yoyoloop?</div>
                </div>
    
                <div class="row justify-content-center mb-5">
                    <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="invitefriends__yoyoloop-sub-description">O autocarro é demorado, há falta de comboios directos, nem sempre há boleias e não compensa levar o carro vazio. Com um transfer da Yoyoloop, podes ir para Lisboa, Cascais, Porto e Coimbra sem paragens e a preço de autocarro.</div>
                </div>
    
                <div class="invitefriends__separator mt-5 mb-5"></div>

                <div class="row justify-content-center mb-5 align-items-center">
                    <div class="invitefriends__any-question mr-5">Tens alguma pergunta?</div>
                    <a OnClick="javascript:$.blockUI()" href="/Help/Help" class="btn btn-default static-page__question-btn static-page__question-btn--white" tabindex="-1" >Lê as nossas Perguntas Frequentes</a>
                </div>
            </div>
        </div>

    </div>

</asp:Content>