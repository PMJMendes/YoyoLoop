<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Billing.aspx.cs" Inherits="MVP.Profile.Billing" %>
<%@ Import Namespace="MVP.Profile" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <input type="hidden" id="StripePublishableKey" value="<%=stripePublishableKey%>" />
    <input type="hidden" name="hfStripeToken" id="hfStripeToken" />
    <input type="hidden" name="hfStripeError" id="hfStripeError" />

    <div class="profile">
        <div class="profile__container profile__container--first">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <h1 class="profile__main-title">O Meu perfil</h1>

                        <h2 class="profile__sub-title">Detalhes de Faturação</h2>

                        <asp:UpdatePanel runat="server" ID="upBillingDetails" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div id="billingform">
                                    <div class="profile__label">Nome</div>
                                    <asp:TextBox runat="server" ID="txtBillingName" AutoPostback="false" CssClass="profile__input profile__input--company" type="text" name="name" autocomplete="on" Tabindex="0" />
                                    <div class="profile__input--validator">
                                        <asp:RequiredFieldValidator runat="server" ValidationGroup="BillingDetails" ControlToValidate="txtBillingName" CssClass="text-danger" Display="Dynamic" ErrorMessage="O campo do nome é obrigatório" />
                                    </div>

                                    <div class="profile__label">Nome da Empresa</div>
                                    <asp:TextBox runat="server" ID="txtBillingCompany" AutoPostback="false" CssClass="profile__input profile__input--company" type="text" name="company" autocomplete="on" Tabindex="0" />

                                    <div class="profile__label">NIF</div>
                                    <asp:TextBox runat="server" ID="txtBillingNIF" AutoPostback="false" CssClass="profile__input profile__input--nif" type="text" name="NIF" autocomplete="on" Tabindex="0" placeholder="000 000 000" />
                                    <div class="profile__input--validator">
                                        <asp:RequiredFieldValidator runat="server" ValidationGroup="BillingDetails" ControlToValidate="txtBillingNIF" CssClass="text-danger" Display="Dynamic" ErrorMessage="O campo do NIF é obrigatório" />
                                        <asp:CompareValidator runat="server" Type="Integer" Operator="DataTypeCheck" ValidationGroup="BillingDetails" ControlToValidate="txtBillingNIF" CssClass="text-danger" Display="Dynamic" ErrorMessage="Introduza um número válido"/>
                                    </div>
                                    <div class="profile__label">Morada</div>
                                    <asp:TextBox runat="server" ID="txtBillingAddress" AutoPostback="false" CssClass="profile__input profile__input--company" type="text" name="address" autocomplete="on" Tabindex="0" />
                                    <div class="profile__input--validator">
                                        <asp:RequiredFieldValidator runat="server" ValidationGroup="BillingDetails" ControlToValidate="txtBillingAddress" CssClass="text-danger" Display="Dynamic" ErrorMessage="O campo da morada é obrigatório" />
                                    </div>

                                    <div class="row ml-0">
                                        <div class="row ml-0 mr-5 checkout__input--postal-code">
                                            <div class="profile__label">Código postal</div>
                                            <asp:TextBox runat="server" ID="txtBillingZIP" AutoPostback="false" CssClass="profile__input"  type="text" name="ZIP" autocomplete="on" Tabindex="0" placeholder="0000-000" />
                                            <asp:RequiredFieldValidator runat="server" ValidationGroup="BillingDetails" ControlToValidate="txtBillingZIP" CssClass="profile__input--validator text-danger" Display="Dynamic" ErrorMessage="Obrigatório" />
                                        </div>
                                        <div class="row ml-0 checkout__input--city">
                                            <div class="profile__label">Cidade</div>
                                            <asp:TextBox runat="server" ID="txtBillingCity" AutoPostback="false" CssClass="profile__input profile__input--city" type="text" name="city" autocomplete="on" Tabindex="0" />
                                            <asp:RequiredFieldValidator runat="server" ValidationGroup="BillingDetails" ControlToValidate="txtBillingCity" CssClass="profile__input--validator text-danger" Display="Dynamic" ErrorMessage="Obrigatório" />
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="mt-5 mb-5 profile__separator"></div>
                        <asp:button runat="server" ID="btnBillingSave" CausesValidation="true" ValidationGroup="BillingDetails" OnClick="btnBillingSave_Click" CssClass="mb-5 profile__btn" Text="Actualizar dados" Tabindex="0" />

                        <asp:UpdatePanel runat="server" ID="upPaymentMethods" UpdateMode="Conditional" ClientIDMode="Static">
                            <ContentTemplate>
                                <h2 class="profile__sub-title">Pagamento</h2>
                                <div class="profile__label">Método de pagamento</div>
                                <asp:DropDownList runat="server" ID="ddlCardMenu" AutoPostBack="true" DataTextField="Text" DataValueField="Value" OnSelectedIndexChanged="ddlCardMenu_SelectedIndexChanged" CssClass="profile__input profile__input--payment-method" tabindex="-1" />

                                <asp:PlaceHolder runat="server" ID="phCardDisplay" Visible="true">
                                    <div class="checkout__label">Nome do titular</div>
                                    <asp:TextBox runat="server" ID="tbCardHolderName" CssClass="checkout__input checkout__input--name" type="text" placeholder="" />
                
                                    <div class="row checkout__card-info">
                                        <div class="col-md-7">
                                            <div class="checkout__label">Número do cartão</div>
                                            <asp:TextBox runat="server" ID="tbCardNumber" Enabled="false" CssClass="checkout__input checkout__input--card-number" type="text" placeholder="0000 0000 0000 0000" />
                                        </div>
                                        <div class="col-md-3 d-flex align-items-end">
                                            <asp:TextBox runat="server" ID="tbCardExpiry" CssClass="checkout__input checkout__input--card-expiration" type="text" placeholder="MM/YY" />
                                        </div>
                                    </div>
                                    <div class="checkout checkout__billing checkout__billing--checkbox pt-1">
                                        <div class="form-check">
                                            <input runat="server" ID="cbDefaultCard" class="form-check-input" type="checkbox">
                                            <label class="form-check-label" for="cbDefaultCard">&nbsp;Cartão principal</label>
                                        </div>
                                    </div>

                                    <div class="mt-4 mb-5 profile__separator"></div>
                                    <asp:Button runat="server" ID="btnUpdateCard" OnClick="btnUpdateCard_Click" CssClass="mb-5 profile__btn mr-5" tabindex="-1" Text="Alterar" />
                                    <asp:Button runat="server" ID="btnRemoveCard" OnClick="btnRemoveCard_Click" CssClass="mb-5 profile__btn mr-5" tabindex="-1" Text="Remover" />
                                </asp:PlaceHolder>

                                <asp:PlaceHolder runat="server" ID="phCardEntry" Visible="false">
                                    <iframe runat="server" name="ifPayForm" src="/Checkout/Payform.aspx" scrolling="no" style="height:160px;width:100%;border:none" />
                                    <div class="mt-4 mb-5 profile__separator"></div>
                                    <button id="btnAddCard" OnClick="createToken(event)" class="mb-5 profile__btn" tabindex="-1">Adicionar</button>
                                </asp:PlaceHolder>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                    <div class="col-md-4 left-menu">
                        <div class="d-flex flex-column align-items-center text-left profile__menu sticky">
                            <a OnClick="javascript:$.blockUI()" href="/Profile/Profile" class="profile__menu__link">
                                <img class="mr-2" src="/img/profile.png" srcset="/img/profile@2x.png 2x, /img/profile@3x.png 3x">
                                Dados pessoais
                            </a>
                            <div class="mt-3 mb-3 profile__menu__separator"></div>
                            <a OnClick="javascript:$.blockUI()" href="/Profile/Billing" class="profile__menu__link profile__menu__link--selected">
                                <img class="mr-2" src="/img/billing-selected.png" srcset="/img/billing-selected@2x.png 2x, /img/billing-selected@3x.png 3x">
                                Detalhes de Faturação
                            </a>
                            <div class="mt-3 mb-3 profile__menu__separator"></div>
                            <a OnClick="javascript:$.blockUI()" href="/Profile/Invite" class="profile__menu__link">
                                <img class="mr-2" src="/img/invitefriends.png" srcset="/img/invitefriends@2x.png 2x, /img/invitefriends@3x.png 3x">
                                Convidar amigos
                            </a>
                            <div class="mt-3 mb-3 profile__menu__separator"></div>
                            <asp:LinkButton runat="server" ID="btnLogout" OnClientClick="javascript:$.blockUI()" OnClick="btnLogout_Click" CssClass="profile__menu__link">
                                <img class='mr-2' src='/img/logout.png' srcset='/img/logout@2x.png 2x, /img/logout@3x.png 3x'>
                                Logout
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
    </div>

</asp:Content>