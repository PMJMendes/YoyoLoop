<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="MVP.Checkout.Checkout" %>

<%@ Register Src="~/Controls/BookingPanel.ascx" TagPrefix="yoyo" TagName="BookingPanel" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ScriptManagerProxy runat="server">
        <Scripts>
            <asp:ScriptReference Path="https://js.stripe.com/v2/" />
        </Scripts>
    </asp:ScriptManagerProxy>

    <input type="hidden" name="hfStripeToken" id="hfStripeToken" />

    <div class="checkout">
        <div class="checkout__container checkout__container--first">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <h1 class="checkout__main-title">Pagar e Confirmar</h1>

                        <h2 class="checkout__sub-title">Pagamento</h2>
                        <div class="checkout__label">Método de pagamento</div>
                        <select class="checkout__input checkout__input--payment-method">
                            <option value="card">Cartão de crédito</option>
                        </select>

                        <div class="checkout__label">Nome do titular</div>
                        <input class="checkout__input checkout__input--name" type="text" id="txtCardName" placeholder="">
                
                        <div class="row checkout__card-info">
                            <div class="col-md-7">
                                <div class="checkout__label">Número do cartão</div>
                                <input class="checkout__input checkout__input--card-number" type="text" id="txtCardNumber" placeholder="0000 0000 0000 0000">
                            </div>
                            <div class="col-md-3 d-flex align-items-end">
                                <input class="checkout__input checkout__input--card-expiration" type="text" id="txtCardExpiry" placeholder="MM/YY"> 
                            </div>
                            <div class="col-md-2 d-flex align-items-end">
                                <input class="checkout__input checkout__input--card-cvv" type="text" id="txtCardSecurityCode" placeholder="CVV"> 
                            </div>
                        </div>

                        <!-- FACTURA HIDDEN FOR NOW -->
                        <div class="hide">
                            <div class="mt-5 mb-5 checkout__separator"></div>

                            <div class="row checkout__billing">
                                <div class="col-md-8">
                                    <h2 class="checkout__sub-title">Detalhes de facturação</h2>
                                </div>
                                <div class="checkout__billing--checkbox col-md-4 d-flex align-items-middle flex-row-reverse pt-2">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="company">
                                        <label class="form-check-label" for="company">Empresa</label>
                                    </div>                        
                                </div>
                            </div>

                            <div class="checkout__label">Nome</div>
                            <input class="checkout__input checkout__input--billing-name" type="text" placeholder="Pedro Meireles">

                            <div class="checkout__label">Nome da empresa</div>
                            <input class="checkout__input checkout__input--company" type="text">

                            <div class="checkout__label">NIF</div>
                            <input class="checkout__input checkout__input--nif" type="text" placeholder="000 000 000">
                
                            <div class="checkout__label">Morada</div>
                            <input class="checkout__input checkout__input--company" type="text">

                            <div class="row ml-0">
                                <div class="row ml-0 mr-5 checkout__input--postal-code">
                                    <div class="checkout__label">Código postal</div>
                                    <input class="checkout__input" type="text" placeholder="0000-000">
                                </div>
                                <div class="row ml-0 checkout__input--city">
                                    <div class="checkout__label">Cidade</div>
                                    <select class="checkout__input checkout__input--city">
                                        <option value="Lisboa">Lisboa</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <!-- END OF FACTURA -->

                        <asp:Panel runat="server" ID="pnPromocode" Visible="true">
                            <div class="mt-5 mb-5 checkout__separator"></div>
                            <div class="checkout__label">Código promocional</div>
                            <asp:Textbox runat="server" ID="tbPromo" OnTextChanged="tbPromo_TextChanged" type="text" AutoCompleteType="None" AutoPostback="true" CssClass="checkout__input checkout__input--promocode" placeholder="Inserir codigo promocional" aria-label="Inserir codigo promocional" aria-describedby="basic-addon2" />
                            <asp:panel runat="server" ID="pnPromoError" class="input-group-append" Visible="false">
                                <span class="input-group-text">
                                    <img src="/img/alert.png"
                                        srcset="/img/alert@2x.png 2x,
                                        /img/alert@3x.png 3x">
                                </span>
                            </asp:panel>
                            <asp:panel runat="server" ID="pnPromoCheck" CssClass="input-group-append" Visible="false">
                                <span class="input-group-text">
                                    <img src="/img/check.png"
                                        srcset="/img/check@2x.png 2x,
                                        /img/check@3x.png 3x"
                                        class="check">
                                </span>
                            </asp:panel>
                        </asp:Panel>

                    </div>

                    <div class="col-md-4 left-menu">
                        <!-- BOOKING PANEL -->
                        <yoyo:BookingPanel runat="server" ID="CheckoutPanel" BookingActive="false" />
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-8">
                        <div class="mt-5 mb-5 checkout__separator"></div>

                        <h3 class="checkout__sub-title-policy">Política de cancelamento</h3>
                        <p class="checkout__policy-text">
                            Podes cancelar a tua viagem até 48 horas antes da hora de partida. 
                            O valor que pagaste será transformado em crédito e podes encontrá-lo
                            na tua conta para utilizar em futuras viagens.
                        </p>
    
                        <div class="checkout__accept-terms-condition row pt-5 pb-5">
                            <div class="col-md-6">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="terms-and-conditions">
                                    <label class="checkout__terms-conditions form-check-label" for="terms-and-conditions">Aceito os <a class="" href="">Termos & condiçōes</a></label>
                                </div>  
                            </div>
                            <div class="checkout__accept-terms-condition--pay col-md-6">
                                <button id="btnPay" class="btn btn-light btn-xl text-uppercase">Pagar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
    </div>

    <!-- Stripe Javascript -->
    <script type="text/javascript">
        $('document').ready(function () {
            Stripe.setPublishableKey('<%=stripePublishableKey%>');

            $('#btnPay').on('click', function (e) {
                e.preventDefault();
                e.stopPropagation();

                Stripe.card.createToken({
                    number: $('#txtCardNumber').val(),
                    cvc: $('#txtCardSecurityCode').val(),
                    exp: $('#txtCardExpiry').val(),
                    name: $('#txtCardName').val()
                }, stripeResponseHandler);
            });

            function stripeResponseHandler(status, response) {
                var $form = $('#MasterForm');
                if (response.error) {
                    //need something better here
                    alert(response.error.message);
                }
                else {
                    var token = response.id;
                    $('#hfStripeToken').val(token);
                    $form.get(0).submit();
                }
            }
        });
    </script>
</asp:Content>