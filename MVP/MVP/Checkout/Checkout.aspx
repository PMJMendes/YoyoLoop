<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="MVP.Checkout.Checkout" %>

<%@ Register Src="~/Controls/BookingPanel.ascx" TagPrefix="yoyo" TagName="BookingPanel" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ScriptManagerProxy runat="server">
        <Scripts>
            <asp:ScriptReference Path="https://js.stripe.com/v2/" />
        </Scripts>
    </asp:ScriptManagerProxy>

    <input type="hidden" id="StripePublishableKey" value="<%=stripePublishableKey%>" />
    <input type="hidden" name="hfStripeToken" id="hfStripeToken" />
    <input type="hidden" name="hfStripeError" id="hfStripeError" />

    <div class="checkout">
        <div class="checkout__container checkout__container--first">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <h1 class="checkout__main-title">Pagar e Confirmar</h1>

                        <iframe runat="server" name="ifPayForm" src="Payform.aspx" scrolling="no" style="height:290px;width:100%;border:none" />

                        <!-- FACTURA -->
                        <div class="mt-5 mb-5 checkout__separator"></div>

                        <div class="row checkout__billing">
                            <div class="col-md-8">
                                <h2 class="checkout__sub-title">Detalhes de facturação</h2>
                            </div>
                        </div>

                        <asp:UpdatePanel runat="server" ID="upBillingForm" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div id="billingform">
                                    <div class="checkout__label">Nome</div>
                                    <asp:TextBox runat="server" ID="txtInvoiceName" AutoPostback="false" CssClass="checkout__input checkout__input--billing-name" type="text" name="name" autocomplete="on" Tabindex="1" />

                                    <div class="checkout__label">Nome da Empresa</div>
                                    <asp:TextBox runat="server" ID="txtInvoiceCompany" AutoPostback="false" CssClass="checkout__input checkout__input--billing-name" type="text" name="company" autocomplete="on" Tabindex="1" />

                                    <div class="checkout__label">NIF</div>
                                    <asp:TextBox runat="server" ID="txtInvoiceNIF" AutoPostback="false" CssClass="checkout__input checkout__input--nif" type="text" name="NIF" autocomplete="on" Tabindex="0" placeholder="000 000 000" />
                
                                    <div class="checkout__label">Morada</div>
                                    <asp:TextBox runat="server" ID="txtInvoiceAddress" AutoPostback="false" CssClass="checkout__input checkout__input--company" type="text" name="address" autocomplete="on" Tabindex="0" />

                                    <div class="row ml-0">
                                        <div class="row ml-0 mr-5 checkout__input--postal-code">
                                            <div class="checkout__label">Código postal</div>
                                            <asp:TextBox runat="server" ID="txtInvoiceZIP" AutoPostback="false" CssClass="checkout__input" type="text" name="ZIP" autocomplete="on" Tabindex="0" placeholder="0000-000" />
                                        </div>
                                        <div class="row ml-0 checkout__input--city">
                                            <div class="checkout__label">Cidade</div>
                                            <asp:TextBox runat="server" ID="txtInvoiceCity" AutoPostback="false" CssClass="checkout__input checkout__input--company" type="text" name="city" autocomplete="on" Tabindex="0" />
                                        </div>
                                    </div>
                                    <div class="checkout__billing checkout__billing--checkbox pt-2">
                                        <div class="form-check">
                                            <input runat="server" ID="cbSaveDetails" class="form-check-input" type="checkbox">
                                            <label class="form-check-label" for="cbSaveDetails">&nbsp;Guardar detalhes de facturação</label>
                                        </div>
                                    </div>

                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <!-- END OF FACTURA -->

                        <asp:UpdatePanel runat="server" ID="upPromocode" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Panel runat="server" ID="pnPromocode" Visible="true">
                                    <div class="mt-5 mb-5 checkout__separator"></div>
                                    <div class="checkout__label">Código promocional</div>
                                    <asp:Textbox runat="server" ID="tbPromo" OnTextChanged="tbPromo_TextChanged" type="text" AutoComplete="promocode" AutoPostback="true" CssClass="checkout__input checkout__input--promocode" placeholder="Inserir codigo promocional" aria-label="Inserir codigo promocional" aria-describedby="basic-addon2" />
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
                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </div>

                    <div class="col-md-4 left-menu">
                        <div class="checkout__sticky">
                            <asp:UpdatePanel runat="server" ID="upCheckoutPanel" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <!-- BOOKING PANEL -->
                                    <yoyo:BookingPanel runat="server" ID="CheckoutPanel" BookingActive="false" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
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
                        <div class="checkout__accept-terms-condition row pt-4 pb-4">
                            <div class="col-md-6">
                                <div class="form-check">
                                    <input id="cbTerms" class="form-check-input" type="checkbox">
                                    <label class="checkout__terms-conditions form-check-label" for="cbTerms">&nbsp;Aceito os <a class="" href="/Pages/Terms" target="_blank">Termos & condiçōes</a></label>
                                </div>
                                <div id="TermsError" class="checkout__terms-conditions--error checkout__terms-conditions--invisible text-danger">
                                    <label>Tem de aceitar os Termos & condiçōes</label>
                                </div>
                            </div>
                            <div class="checkout__accept-terms-condition--pay col-md-6">
                                <button id="btnPay" OnClick="createToken(event)" class="btn btn-light btn-xl text-uppercase">Pagar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>