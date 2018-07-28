<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyTrips.aspx.cs" Inherits="MVP.MyTrips.MyTrips" %>

<%@ Register Src="Ticket.ascx" TagPrefix="yoyo" TagName="Ticket" %>
<%@ Register Src="PastTicket.ascx" TagPrefix="yoyo" TagName="PastTicket" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="travel">
        <div class="travel__container">
            <div class="container-fluid">
                <h1 class="travel__main-title">As Minhas Viagens</h1>
                <br />

                <!-- CONTA CORRENTE HIDDEN FOR NOW -->
                <div class="row travel__current mt-4 mb-4 text-center hide">
                    <div class="col-md-4 p-3 d-flex align-items-center justify-content-center">
                        <p class="travel__current--title text-uppercase">conta corrente</p>
                    </div>
                    <div class="col-md-4 p-3 d-flex align-items-center justify-content-center">
                        <p class="travel__current--amount">Tens <span class="travel__current--amount-red">35€</span> na tua conta</p>
                    </div>
                    <div class="col-md-4 p-3 d-flex align-items-center justify-content-center">
                        <button type="button" class="travel__current--book btn btn-primary text-uppercase">
                            Reservar uma viagem
                        </button>
                    </div>
                </div>
                <!-- END OF CONTA CORRENT -->

                <div id="ActiveBookings" Class="<%= RepActiveBookings.Visible ? "hide" : "" %>">
                    <div class="row p-3">
                        <div class="col-md-4 text-center">
                            <img src="/img/ticket.png"
                             srcset="/img/ticket@2x.png 2x,
                                     /img/ticket@3x.png 3x"
                             class="ticket">
                        </div>
                        <div class="col-md-8">
                            <p class="travel__empty-state-main p-2">Ainda não tem viagens.</p>
                            <p class="travel__empty-state-sub p-2">Reserva a tua primeira viagem com a Yoyoloop!</p>
                            <p class="travel__empty-state-button">
                                <a href="/Calendar/Calendar?Dest=Lisboa" class="d-flex align-items-center justify-content-center text-uppercase travel__empty-state-btn">Reserva Já</a>
                            </p>
                        </div>
                    </div>
                </div>
                <asp:Repeater runat="server" ID="RepActiveBookings" OnItemDataBound="RepActiveBookings_ItemDataBound" Visible="false">
                    <ItemTemplate>
                        <yoyo:Ticket runat="server" ID="Ticket"/>
                        <br />
                    </ItemTemplate>
                </asp:Repeater>

                <h1 class="travel__main-title-past pt-5 pb-5">Viagens anteriores</h1>

                <div id="PastBookings" Class="<%= RepPastBookings.Visible ? "hide" : "" %>">
                    <h5>Não tem viagens anteriores</h5>
                </div>
                <asp:Repeater runat="server" ID="RepPastBookings" OnItemDataBound="RepPastBookings_ItemDataBound" Visible="false">
                    <ItemTemplate>
                        <yoyo:PastTicket runat="server" ID="Ticket" />
                        <br />
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>
    </div>
    <hr class="w-75 pt-5" />
    <div class="invitefriends">
      <div class="invitefriends__container invitefriends__container--second">
        <div class="container-fluid d-flex flex-column justify-content-center pt-5 pb-5">
            <div class="row justify-content-center mt-5 mb-5">
                <div class="invitefriends__why-catch-ride text-center">
                    Como viajar por 3€ para qualquer destino
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
      </div>

      <div class="invitefriends__container invitefriends__container--third">
        <div class="container-fluid d-flex flex-column align-items-center justify-content-center p-5 invitefriends__promocode">
            <p class="invitefriends__promocode__text mb-5 text-center">Partilha o teu código promocional com todos os teus amigos e viaja por apenas 3€!</p>

            <div id="copy-link-1" class="d-flex align-items-center justify-content-center invitefriends__copy-link row">
                <div class="invitefriends__promocode__input mr-5" type="text" placeholder="#mypromocode">
                    <div class="invitefriends__promocode__label">#mypromocode</div>
                </div>
                <a href="#" id="copy-link-1-btn" class="invitefriends__promocode__reserve d-flex align-items-center justify-content-center">Copiar Link</a>
            </div>


            <div id="copy-link-2" class="d-flex align-items-center justify-content-center invitefriends__hidden invitefriends__copy-link row">
                <div class="invitefriends__popover invitefriends__popover--copied">
                    <div class="check">

                    </div>
                    Copied to clipboard
                </div>
                <div class="invitefriends__promocode__input mr-5" type="text" placeholder="#mypromocode">
                    <div class="invitefriends__promocode__label">#mypromocode</div>
                    <div class="invitefriends__promocode__copy">Copy Link</div>
                </div>
                <a href="#" id="copy-link-2-btn" class="invitefriends__promocode__reserve d-flex align-items-center justify-content-center">Partilhar</a>
                <div class="invitefriends__popover invitefriends__popover--register">
                    <div class="invitefriends__popover__link">
                        <img src="../img/face.png" srcset="../img/face@2x.png 2x, ../img/face@3x.png 3x" class="face">
                        Partilhar no facebook
                    </div>
                    
                    <div class="invitefriends__popover__separator"></div>

                    <div class="invitefriends__popover__link">
                        <img src="../img/twitter.png" srcset="../img/twitter@2x.png 2x, ../img/twitter@3x.png 3x">
                        Partilhar no twitter
                    </div>

                    <div class="invitefriends__popover__separator"></div>

                    <div class="invitefriends__popover__link">
                        <img src="../img/linkedin.png" srcset="../img/linkedin@2x.png 2x, ../img/linkedin@3x.png 3x">
                        Partilhar no linkedin
                    </div>

                    <div class="invitefriends__popover__separator"></div>

                    <div class="invitefriends__popover__link">
                        <img src="../img/email.png" srcset="../img/email@2x.png 2x, ../img/email@3x.png 3x">
                        Enviar por Email
                    </div>
                </div>
            </div>
      </div>

</asp:Content>
