<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="MVP.Account.ResetPassword" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <asp:UpdatePanel runat="server" ID="upReset">
        <ContentTemplate>
            <div class="travel" style="width:100%;">
                <div class="travel__container">
                    <div class="container-fluid">

                        <asp:PlaceHolder runat="server" ID="FormPanel" Visible="true">
                            <h5 class="travel__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Account_ResetPassword_MainTitle%>"/></h5>
                            <hr />

                            <div class="form-group">
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" id="Email" TextMode="Email" CssClass="form-control login__input" aria-describedby="emailHelp" placeholder="<%$ Resources:LocalizedText, Account_ResetPassword_tbEmail_placeholder%>" />
                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="Reset" ControlToValidate="Email" CssClass="text-danger" Display="Dynamic" ErrorMessage="<%$ Resources:LocalizedText, Account_ResetPassword_tbEmail_Validator_ErrorMessage%>" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" id="Password" TextMode="Password" CssClass="form-control login__input" aria-describedby="emailHelp" placeholder="<%$ Resources:LocalizedText, Account_ResetPassword_tbPassword_placeholder%>" />
                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="Reset" ControlToValidate="Password" CssClass="text-danger" Display="Dynamic" ErrorMessage="<%$ Resources:LocalizedText, Account_ResetPassword_tbPassword_Validator_ErrorMessage%>" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" id="ConfirmPassword" TextMode="Password" CssClass="form-control login__input" aria-describedby="emailHelp" placeholder="<%$ Resources:LocalizedText, Account_ResetPassword_tbConfirmPassword_placeholder%>" />
                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="Reset" ControlToValidate="ConfirmPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="<%$ Resources:LocalizedText, Account_ResetPassword_tbConfirmPassword_Validator_ErrorMessage%>" />
                                    <asp:CompareValidator runat="server" ValidationGroup="Reset" ControlToCompare="Password" ControlToValidate="ConfirmPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="<%$ Resources:LocalizedText, Account_ResetPassword_tbConfirmPassword_CompareValidator_ErrorMessage%>" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="login__log-in col-md-offset-2 col-md-10">
                                    <asp:Button runat="server" CausesValidation="true" ValidationGroup="Reset" OnClick="Reset_Click" Text="<%$ Resources:LocalizedText, Account_ResetPassword_btnReset_Text%>" CssClass="login__login btn btn-primary" />
                                </div>
                            </div>
                            <br />
                        </asp:PlaceHolder>
                        <asp:PlaceHolder runat="server" ID="successPanel" ViewStateMode="Disabled" Visible="false">
                            <div style="height:400px;width:100%;position:relative;top:100px;left:-50px;text-align:center">
                                <h1 class="travel__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Account_ResetPassword_SuccessMessage%>"/></h1>
                            </div>
                        </asp:PlaceHolder>
                        <asp:PlaceHolder runat="server" ID="errorPanel" ViewStateMode="Disabled" Visible="false">
                            <div style="height:400px;width:100%;position:relative;top:100px;left:-50px;text-align:center">
                                <h1 class="travel__main-title"><asp:Literal runat="server" ID="ErrorMessage" /></h1>
                            </div>
                        </asp:PlaceHolder>

                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
