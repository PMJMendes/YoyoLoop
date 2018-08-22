<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="MVP.Confirm.Confirm" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="travel">
        <div class="travel__container">

            <!-- CONFIRMED EMAIL -->
            <div class="<%= pageData.UserEmailConfirmed ? "container-fluid" : "hide" %>">
                <h1 class="travel__main-title">A tua viagem está confirmada</h1>

                <div class="travel__sub-title mb-5">
                    Encontra o teu bilhete em  <a OnClick="javascript:$.blockUI()" href="/MyTrips/MyTrips" class="travel__sub-title--red travel__sub-title--link">As Minhas Viagens</a>
                </div>

                <!-- START CARD -->
                <div class="row ml-0 pl-0 travel__card">
                    <div class="col-md-8 pr-0 travel__card__first">
                        <div class="travel__card__first__your-trip mb-3">A tua viagem</div>
                        <div class="row">
                            <div class="col-md-1 d-flex align-items-center flex-column travel__card__first__path">
                                <div class="white-circle"></div>
                                <img src="/img/path.png" srcset="/img/path@2x.png 2x, /img/path@3x.png 3x">
                                <div class="white-circle"></div>
                            </div>
                            <div class="col-md-4">
                                <div class="travel__card__first__from">
                                    <div class="travel__card__first__point">Origem</div>
                                    <div class="travel__card__first__city"><%= pageData.StartRegionName.ToUpper() %></div>
                                    <div class="travel__card__first__area"><%= pageData.StartAPName %></div>
                                    <div class="travel__card__first__location"><%= "<br>" %></div>
                                </div>

                                <div class="travel__card__first__to mt-3">
                                    <div class="travel__card__first__point">Destino</div>
                                    <div class="travel__card__first__city"><%= pageData.EndRegionName.ToUpper() %></div>
                                    <div class="travel__card__first__area"><%= pageData.EndAPName %></div>
                                    <div class="travel__card__first__location"><%= "<br>" %></div>
                                </div>
                            </div>
                            <div class="col-md-7 pr-5">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="travel__card__first__text">
                                        <img class="mr-2" src="/img/calendar-black.png" srcset="/img/calendar-black@2x.png 2x, /img/calendar-black@3x.png 3x">
                                        <%= pageData.StartTime.ToString("dd MMMM").ToUpper() %>, <%= pageData.StartTime.ToString("ddd").ToUpper() %>
                                    </div>
                                    <div class="travel__card__first__text">
                                        IDA
                                    </div>
                                </div>

                                <div class="travel__card__first__separator mt-2 mb-2"></div>

                                <div class="travel__card__first__text">
                                    <img class="mr-2" src="/img/clock-black.png" srcset="/img/clock-black@2x.png 2x, /img/clock-black@3x.png 3x">
                                    <%= pageData.StartTime.ToString("HH\\:mm") %>
                                </div>

                                <div class="travel__card__first__text">
                                    <img class="mr-2 cart" src="/img/cart-black.png" srcset="/img/cart-black@2x.png 2x, /img/cart-black@3x.png 3x">
                                    <%= pageData.Cost.ToString("C") %>
                                </div>

                                <!-- HIDDEN FOR NOW -->
                                <div class="hide">
                                    <div class="d-flex justify-content-between align-items-center mt-4">
                                        <div class="travel__card__first__text">
                                            <img class="mr-2" src="/img/calendar-black.png" srcset="/img/calendar-black@2x.png 2x, /img/calendar-black@3x.png 3x">
                                            15 MARÇO,  QUARTA
                                        </div>
                                        <div class="travel__card__first__text">
                                            VOLTA
                                        </div>  
                                    </div>

                                    <div class="travel__card__first__separator mt-2 mb-2"></div>

                                    <div class="travel__card__first__text">
                                        <img class="mr-2" src="/img/clock-black.png" srcset="/img/clock-black@2x.png 2x, /img/clock-black@3x.png 3x">
                                        18:00
                                    </div>

                                    <div class="travel__card__first__text">
                                        <img class="mr-2 cart" src="/img/cart-black.png" srcset="/img/cart-black@2x.png 2x, /img/cart-black@3x.png 3x">
                                        10,50€
                                    </div>  
                                </div>
                                <!-- END OF HIDE -->
                            </div>
                        </div>
                    </div>
                  
                    <div class="col-md-4 pl-0 travel__card__last text-right">
                        <img class="travel__card__separator" src="/img/path.png" srcset="/img/path@2x.png 2x, /img/path@3x.png 3x">

                        <p class="travel__card__last__gray-text">BILHETE</p>
                        <p class="travel__card__last__ticket-number"><%= pageData.TicketCode.ToUpper() %></p>
                        <p class="travel__card__last__users">
                            <img src="/img/users-black.png" srcset="/img/users-black@2x.png 2x, /img/users-black@3x.png 3x"> <%= pageData.Seats.ToString() %> <%= pageData.Seats == 1 ? "Lugar" : "Lugares" %>
                        </p>
                        <p class="travel__card__last__gray-text">TOTAL</p>
                        <p class="travel__card__last__price"><%= pageData.Cost.ToString("C") %></p>
                    </div>
                </div>
                <!-- END CARD -->

                <div class="d-flex justify-content-between align-items-center mt-3">
                    <div class="travel__copy-bold">Vamos enviar a tua fatura para <span style="color: #ff5f6d;"><%= pageData.UserEmail %></span></div>
                </div>

                <div class="travel__separator mt-5 mb-5"></div>

                <div class="travel__my-tickets">Os teus Bilhetes</div>

                <div class="row travel__get-tickets pt-5 pb-5">
                    <div class="col-md-3 pb-3 d-flex justify-content-center">
                        <asp:LinkButton runat="server" ID="btnEmail" OnClick="btnEmail_Click" CssClass="travel__white-btn text-uppercase">Receber por email</asp:LinkButton>
                    </div>
                    <div class="col-md-3 pb-3 d-flex justify-content-center">
                        <asp:LinkButton runat="server" ID="btnSMS" OnClick="btnSMS_Click" CssClass="travel__white-btn text-uppercase">Receber por SMS</asp:LinkButton>
                    </div>
                    <div class="col-md-3 pb-3 d-flex justify-content-center">
                        <a href="/Ticket/Ticket?Id=<%= pageData.BookingId.ToString() %>" target="_blank" class="travel__white-btn text-uppercase">download</a>
                    </div>
                    <div class="col-md-3 pb-3 d-flex justify-content-center align-items-center">
                        <a href="#" class="travel__card__first__text text-uppercase">
                            <img class="mr-2" src="/img/calendar-black.png" srcset="/img/calendar-black@2x.png 2x, /img/calendar-black@3x.png 3x">
                            Adicionar ao calendário
                        </a>
                    </div>
                </div>
            </div>
            <!-- END OF CONFIRMED EMAIL -->

            <!-- UNCONFIRMED EMAIL -->
            <div class="<%= pageData.UserEmailConfirmed ? "hide" : "container-fluid" %>">
                <h1 class="travel__main-title">A tua viagem está confirmada</h1>
                <div class="d-flex justify-content-between align-items-center mt-3">
                    <div class="travel__copy-bold">
                        Para teres acesso ao teu bilhete, confirma por favor o teu email.<br />
                        Enviámos link de acesso ao teu bilhete para <span style="color: #ff5f6d;"><%= pageData.UserEmail %></span>
                    </div>
                </div>
                <div class="d-flex justify-content-between align-items-center mt-3">
                    <div class="travel__copy-bold">
                        Em caso de problemas, <a OnClick="javascript:$.blockUI()" href="/Pages/Contact" style="color: #ff5f6d;">contacta-nos</a>.
                    </div>
                </div>
                <div class="travel__my-tickets">
                    <div class="row travel__get-tickets pt-5 pb-5">
                        <div class="col-md-3 pb-3 d-flex justify-content-center">
                            <asp:LinkButton runat="server" ID="btnConfirmEmail" OnClick="btnConfirmEmail_Click" CssClass="travel__white-btn text-uppercase">Re-enviar Link</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END OF UNCONFIRMED EMAIL -->
        </div>

        <asp:UpdatePanel runat="server" ID="upPromoshare" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="invitefriends__container invitefriends__container--third invitefriends__container--third--checkout">

                    <div class="container-fluid d-flex flex-column align-items-center justify-content-center p-4 invitefriends__promocode">
                        <p class="invitefriends__promocode__text mb-5 text-center title">Convida os teus amigos e viaja por 3€</p>
                        <p class="invitefriends__promocode__text mb-5 text-center">Partilha o teu código promocional com todos os teus amigos e viaja por apenas 3€!</p>

                        <asp:PlaceHolder runat="server" ID="phCopyLink" Visible="true">
                            <div id="copy-link-1" class="d-flex align-items-center justify-content-center invitefriends__copy-link row">
                                <div class="invitefriends__promocode__input mr-5">
                                    <div class="invitefriends__promocode__label">promocode</div>
                                </div>
                                <%-- <asp:LinkButton runat="server" ID="btnCopyLink" OnClick="btnCopyLink_Click" CssClass="invitefriends__promocode__reserve d-flex align-items-center justify-content-center" Text="Copiar Link" />--%>
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
                                    <div class="invitefriends__promocode__label">sgdsfgdfgdfg</div>
                                    <div class="invitefriends__promocode__copy">Copy Link</div>
                                </div>
                                <%--<asp:LinkButton runat="server" ID="btnShare" OnClick="btnShare_Click" class="invitefriends__promocode__reserve d-flex align-items-center justify-content-center" Text="Partilhar" />--%>

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
                        <p class="invitefriends__promocode__text mt-5 mb-3 text-center">
                            Reserva o teu lugar num transfer de 7 lugares conduzido por um motorista profissional e<br />
                            aproveita uma viagem sem paragens, com wifi a bordo e a preço de autocarro.
                        </p>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>