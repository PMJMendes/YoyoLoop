<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="MVP.Checkout.Checkout" %>

<%@ Register Src="~/Controls/BookingPanel.ascx" TagPrefix="yoyo" TagName="BookingPanel" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <meta name="robots" content="noindex, follow">
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <input type="hidden" id="StripePublishableKey" value="<%=stripePublishableKey%>" />
    <input type="hidden" name="hfStripeToken" id="hfStripeToken" />
    <input type="hidden" name="hfStripeError" id="hfStripeError" />

    <div class="checkout">
        <div class="checkout__container checkout__container--first">
            <asp:PlaceHolder runat="server" ID="phError" Visible="false">
                <%--TO BE REPLACED BY AN ERROR PAGE--%>
                <div class="container-fluid">
                    <div Class="d-flex align-items-center justify-content-center mb-5">
                        <div class="col-md-12 text-center">
                            <h6 class="calendar-placeholder-text text-uppercase pt-4 pb-4"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Checkout_BookingExpired_Message%>"/></h6>
                            <p><a runat="server" id="lkErrorRedirect" OnClick="javascript:$.blockUI()" class="checkout__error-btn btn">
                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Checkout_BookingExpired_RedirectLink_Text%>"/>
                            </a></p>
                            <img class="img-responsive illustration" src="/img/illustration.png"  style="max-width: 1200px;">
                        </div>
                    </div>
                </div>
            </asp:PlaceHolder>
            <asp:PlaceHolder runat="server" ID="phCheckout" Visible="true">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-8">
                            <h1 class="checkout__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Checkout_MainTitle%>"/></h1>

                            <asp:UpdatePanel runat="server" ID="upCheckoutPaymentForm" UpdateMode="Conditional" ClientIDMode="Static">
                                <ContentTemplate>

                                    <h2 class="checkout__sub-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Checkout_SubTitle%>"/></h2>
                                    <div class="checkout__label"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Checkout_ddlCardMenu_Label%>"/></div>
                                    <asp:DropDownList runat="server" ID="ddlCardMenu" AutoPostBack="true" DataTextField="Text" DataValueField="Value" OnSelectedIndexChanged="ddlCardMenu_SelectedIndexChanged" CssClass="checkout__input checkout__input--payment-method" tabindex="-1" />

                                    <asp:PlaceHolder runat="server" ID="phCardDisplay" Visible="true">
                                        <div class="checkout__label"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Checkout_Payform_tbCardHolderName_Label%>"/></div>
                                        <asp:TextBox runat="server" ID="tbCardHolderName" Enabled="false" CssClass="checkout__input checkout__input--name" type="text" placeholder="" />
                
                                        <div class="row checkout__card-info">
                                            <div class="col-md-7">
                                                <div class="checkout__label"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Checkout_Payform_tbCardNumber_Label%>"/></div>
                                                <asp:TextBox runat="server" ID="tbCardNumber" Enabled="false" CssClass="checkout__input checkout__input--card-number" type="text" placeholder="0000 0000 0000 0000" />
                                            </div>
                                            <div class="col-md-3 d-flex align-items-end">
                                                <asp:TextBox runat="server" ID="tbCardExpiry" Enabled="false" CssClass="checkout__input checkout__input--card-expiration" type="text" placeholder="MM/YY" />
                                            </div>
                                        </div>
                                    </asp:PlaceHolder>

                                    <asp:PlaceHolder runat="server" ID="phCardEntry" Visible="false">
                                        <iframe runat="server" name="ifPayForm" src="Payform.aspx" scrolling="no" style="width:100%;border:none" />
                                        <div class="checkout checkout__billing checkout__billing--checkbox pt-1">
                                            <div class="form-check">
                                                <input runat="server" ID="cbSaveCard" class="form-check-input" type="checkbox">
                                                <label class="form-check-label" for="cbSaveCard">&nbsp;<asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Checkout_Payform_cbSaveCard_Label%>"/></label>
                                            </div>
                                        </div>
                                    </asp:PlaceHolder>

                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <!-- FACTURA -->
                            <div class="mt-5 mb-5 checkout__separator"></div>

                            <div class="row checkout__billing">
                                <div class="col-md-8">
                                    <h2 class="checkout__sub-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Checkout_Billing_Title%>"/></h2>
                                </div>
                            </div>

                            <asp:UpdatePanel runat="server" ID="upBillingForm" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div id="billingform">
                                        <div class="checkout__label"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Checkout_Billing_tbInvoiceName_Label%>"/></div>
                                        <asp:TextBox runat="server" ID="txtInvoiceName" AutoPostback="false" CssClass="checkout__input checkout__input--billing-name" type="text" name="name" autocomplete="on" Tabindex="1" />

                                        <div class="checkout__label"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Checkout_Billing_tbInvoiceCompany_Label%>"/></div>
                                        <asp:TextBox runat="server" ID="txtInvoiceCompany" AutoPostback="false" CssClass="checkout__input checkout__input--billing-name" type="text" name="company" autocomplete="on" Tabindex="1" />

                                        <div class="row ml-0">
                                            <div class="row ml-0 mr-5 checkout__input--nif">
                                                <div class="checkout__label"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Checkout_Billing_tbInvoiceNIF_Label%>"/></div>
                                                <asp:TextBox runat="server" ID="txtInvoiceNIF" AutoPostback="false" CssClass="checkout__input checkout__input--nif" type="text" name="NIF" autocomplete="on" Tabindex="0" placeholder="000 000 000" />
                                            </div>
                                            <div class="row ml-0 checkout__input--billing-name <%= pageData.Corporate ? "" : "hide" %>">
                                                <div class="profile__label"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Billing_BillingForm_tbBillingCostCenter_Label%>"/></div>
                                                <asp:TextBox runat="server" ID="txtInvoiceCostCenter" AutoPostback="false" CssClass="profile__input checkout__input--billing-name" type="text" name="CostCenter" autocomplete="off" Tabindex="0" />
                                            </div>
                                        </div>

                                        <div class="checkout__label"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Checkout_Billing_tbInvoiceAddress_Label%>"/></div>
                                        <asp:TextBox runat="server" ID="txtInvoiceAddress" AutoPostback="false" CssClass="checkout__input checkout__input--company" type="text" name="address" autocomplete="on" Tabindex="0" />

                                        <div class="row ml-0">
                                            <div class="row ml-0 mr-5 checkout__input--postal-code">
                                                <div class="checkout__label"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Checkout_Billing_tbInvoiceZIP_Label%>"/></div>
                                                <asp:TextBox runat="server" ID="txtInvoiceZIP" AutoPostback="false" CssClass="checkout__input" type="text" name="ZIP" autocomplete="on" Tabindex="0" placeholder="0000-000" />
                                            </div>
                                            <div class="row ml-0 checkout__input--city">
                                                <div class="checkout__label"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Checkout_Billing_tbInvoiceCity_Label%>"/></div>
                                                <asp:TextBox runat="server" ID="txtInvoiceCity" AutoPostback="false" CssClass="checkout__input checkout__input--company" type="text" name="city" autocomplete="on" Tabindex="0" />
                                            </div>
                                        </div>
                                        <div class="checkout__billing checkout__billing--checkbox pt-2">
                                            <div class="form-check">
                                                <input runat="server" ID="cbSaveDetails" class="form-check-input" type="checkbox">
                                                <label class="form-check-label" for="cbSaveDetails">&nbsp;<asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Checkout_Billing_cbSaveDetails_Label%>"/></label>
                                            </div>
                                        </div>

                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <!-- END OF FACTURA -->

                            <asp:UpdatePanel runat="server" ID="upPromocode" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Panel runat="server" ID="pnPromocode" CssClass="checkout__promocode checkout__promocode--active" Visible="true">
                                        <div class="mt-5 mb-5 checkout__separator"></div>
                                        <div class="checkout__label"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Checkout_Promocode_tbPromo_Label%>"/></div>
                                        <asp:Placeholder runat="server" ID="phPromoError" Visible="false">
                                            <span class="input-group-text text-center checkout__promocode checkout__promocode--promocode-error">
                                                <%= string.IsNullOrEmpty(pageData.Promocode) ? (string.IsNullOrEmpty(pageData.Code) ? string.Empty : pageData.Code) : pageData.Promocode %>
                                            </span>
                                            <span class="input-group-text checkout__promocode checkout__promocode--promocode-clean">
                                                <asp:ImageButton runat="server" ID="ibPromoError" OnClick="ClearPromo_Click" src="/img/closebtn.png"
                                                    srcset="/img/closebtn@2x.png 2x,
                                                            /img/closebtn@3x.png 3x"
                                                    class="closebtn" tabindex="-1" />
                                            </span>
                                        </asp:Placeholder>
                                        <asp:Placeholder runat="server" ID="phPromoCheck" Visible="false">
                                            <span class="input-group-text text-center checkout__promocode checkout__promocode--promocode-approved">
                                                <%= string.IsNullOrEmpty(pageData.Promocode) ? (string.IsNullOrEmpty(pageData.Code) ? string.Empty : pageData.Code) : pageData.Promocode %>
                                            </span>
                                            <span class="input-group-text checkout__promocode checkout__promocode--promocode-clean">
                                                <asp:ImageButton runat="server" ID="ibPromoCheck" OnClick="ClearPromo_Click" src="/img/closebtn.png"
                                                    srcset="/img/closebtn@2x.png 2x,
                                                            /img/closebtn@3x.png 3x"
                                                    class="closebtn" tabindex="-1" />
                                            </span>                                            
                                        </asp:Placeholder>
                                        <asp:Textbox runat="server" ID="tbPromo" OnTextChanged="tbPromo_TextChanged" type="text" AutoComplete="promocode" AutoPostback="true" CssClass="checkout__input checkout__input--promocode" placeholder="<%$ Resources:LocalizedText, Checkout_Promocode_tbPromo_placeholder%>" aria-label="<%$ Resources:LocalizedText, Checkout_Promocode_tbPromo_placeholder%>" aria-describedby="basic-addon2" />
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

                            <asp:UpdatePanel runat="server" ID="upCheckoutPayButton" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <h3 class="checkout__sub-title-policy"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Checkout_Policy_SubTitle%>"/></h3>
                                    <p class="checkout__policy-text">
                                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Checkout_Policy_Text%>"/>
                                    </p>
                                    <div class="checkout__accept-terms-condition row pt-4 pb-4">
                                        <div class="col-md-6">
                                            <div class="form-check">
                                                <input id="cbTerms" class="form-check-input" type="checkbox">
                                                <label class="checkout__terms-conditions form-check-label" for="cbTerms">&nbsp;<asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Checkout_Policy_cbTerms_Label1%>"/> <a class="" href="/Pages/Terms" target="_blank"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Checkout_Policy_cbTerms_Label2%>"/></a></label>
                                            </div>
                                            <div id="TermsError" class="checkout__terms-conditions--error checkout__terms-conditions--invisible text-danger">
                                                <label><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Checkout_Policy_cbTerms_Error%>"/></label>
                                            </div>
                                        </div>
                                        <div class="checkout__accept-terms-condition--pay col-md-6">
                                            <asp:PlaceHolder runat="server" ID="phPay" Visible="true">
                                                <asp:Button runat="server" ID="btnPay" OnClientClick="return ValidateTerms()" OnClick="btnPay_Click" CssClass="btn btn-light btn-xl text-uppercase" Text="<%$ Resources:LocalizedText, Checkout_btnPay_Text%>" />
                                            </asp:PlaceHolder>
                                            <asp:PlaceHolder runat="server" ID="phPayNew" Visible="false">
                                                <button id="btnPayNew" OnClick="createToken(event)" class="btn btn-light btn-xl text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Checkout_btnPay_Text%>"/></button>
                                            </asp:PlaceHolder>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                    </div>
                </div>
            </asp:PlaceHolder>
        </div>
    </div>
</asp:Content>