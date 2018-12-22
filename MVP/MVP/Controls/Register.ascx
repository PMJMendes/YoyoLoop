<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Register.ascx.cs" Inherits="MVP.Controls.Register" %>

<div class="login modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="registerModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <asp:UpdatePanel runat="server" ID="upRegister" UpdateMode="Always">
            <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="row text-center">
                                <div class="login__main-title text-uppercase col-12">
                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Controls_Register_MainTitle%>"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <hr class="login__separator">
                                </div>
                            </div>
                            <div class="row">
                                <div class="login__facebook-row col-md-6 text-right">
                                    <button runat="server" ID="btnLoginFacebook" onserverclick="btnLoginFacebook_ServerClick" type="button" class="login__with--facebook btn btn-primary">
                                        <img src="../img/facebook-login.png"
                                        srcset="../img/facebook-login@2x.png 2x,
                                        ../img/facebook-login@3x.png 3x"
                                        class="facebook-login mr-2">
                                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Controls_Register_WithFacebook%>"/>
                                    </button>
                                </div>
                                <div class="login__google-row col-md-6 text-left">
                                    <button runat="server" ID="btnLoginGoogle" onserverclick="btnLoginGoogle_ServerClick" type="button" class="login__with--google btn btn-primary">
                                        <img src="../img/google-login.png"
                                        srcset="../img/google-login@2x.png 2x,
                                        ../img/google-login@3x.png 3x"
                                        class="google-login mr-2">
                                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Controls_Register_WithGoogle%>"/>
                                    </button>
                                </div>
                            </div>
                            <div class="d-flex flex-row align-items-center pt-3 pb-3">
                                <div class="col-5 pr-0"><hr></div>
                                <div class="login__or d-flex align-items-center justify-content-center col-2 text-uppercase p-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Controls_Register_RegisterOr%>"/></div>
                                <div class="col-5 pl-0 text-left"><hr></div>
                            </div>
                            <div class="login__with--email row">
                                <div class="col-12 text-center text-uppercase">
                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Controls_Register_WithEmail%>"/>
                                </div>
                                <div class="col-12 text-center text-danger">
                                    <asp:Literal runat="server" ID="RegisterErrorMessage" /> 
                                </div>
                            </div>
                            <span class="text-danger">
                                <asp:ValidationSummary runat="server" ID="RegisterErrorSummary" ValidationGroup="Register" />
                            </span>
                            <div class="login__form d-flex flex-row align-items-center pt-3 pb-3">
                                <div class="col-12">
                                    <div class="form-group">
                                        <asp:TextBox runat="server" id="TbRegisterName" CssClass="form-control login__input" placeholder="<%$ Resources:LocalizedText, Controls_Register_tbRegisterName_placeholder%>" />
                                        <asp:RequiredFieldValidator runat="server" ValidationGroup="Register" ControlToValidate="TbRegisterName" CssClass="text-danger" Display="Dynamic" ErrorMessage="<%$ Resources:LocalizedText, Controls_Register_tbRegisterName_Validator_ErrorMessage%>" /> <!-- I need a css for this -->
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" id="TbRegisterEmail" TextMode="Email" CssClass="form-control login__input" aria-describedby="emailHelp" placeholder="<%$ Resources:LocalizedText, Controls_Register_tbRegisterEmail_placeholder%>" />
                                        <asp:RequiredFieldValidator runat="server" ValidationGroup="Register" ControlToValidate="TbRegisterEmail" CssClass="text-danger" Display="Dynamic" ErrorMessage="The email field is required." /> <!-- I need a css for this -->
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" id="TbRegisterConfirmEmail" TextMode="Email" OnPaste="return false" CssClass="form-control login__input" aria-describedby="emailHelp" placeholder="<%$ Resources:LocalizedText, Controls_Register_tbRegisterConfirmEmail_placeholder%>" />
                                        <asp:RequiredFieldValidator runat="server" ValidationGroup="Register" ControlToValidate="TbRegisterConfirmEmail" CssClass="text-danger" Display="Dynamic" ErrorMessage="<%$ Resources:LocalizedText, Controls_Register_tbRegisterConfirmEmail_Validator_ErrorMessage%>" /> <!-- I need a css for this -->
                                        <asp:CompareValidator runat="server" ValidationGroup="Register" ControlToCompare="TbRegisterEmail" ControlToValidate="TbRegisterConfirmEmail" CssClass="text-danger" Display="Dynamic" ErrorMessage="<%$ Resources:LocalizedText, Controls_Register_tbRegisterConfirmEmail_CompareValidator_ErrorMessage%>" /> <!-- I need a css for this -->
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" id="TbRegisterPassword" TextMode="Password" CssClass="form-control login__input" aria-describedby="emailHelp" placeholder="<%$ Resources:LocalizedText, Controls_Register_tbRegisterPassword_placeholder%>" />
                                        <asp:RequiredFieldValidator runat="server" ValidationGroup="Register" ControlToValidate="TbRegisterPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="<%$ Resources:LocalizedText, Controls_Register_tbRegisterPassword_Validator_ErrorMessage%>" /> <!-- I need a css for this -->
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" id="TbRegisterConfirmPassword" TextMode="Password" OnPaste="return false" CssClass="form-control login__input" aria-describedby="emailHelp" placeholder="<%$ Resources:LocalizedText, Controls_Register_tbRegisterConfirmPassword_placeholder%>" />
                                        <asp:RequiredFieldValidator runat="server" ValidationGroup="Register" ControlToValidate="TbRegisterConfirmPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="<%$ Resources:LocalizedText, Controls_Register_tbRegisterConfirmPassword_Validator_ErrorMessage%>" /> <!-- I need a css for this -->
                                        <asp:CompareValidator runat="server" ValidationGroup="Register" ControlToCompare="TbRegisterPassword" ControlToValidate="TbRegisterConfirmPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="<%$ Resources:LocalizedText, Controls_Register_tbRegisterConfirmPassword_CompareValidator_ErrorMessage%>" /> <!-- I need a css for this -->
                                    </div>
                                    <div class="form-group login__input__phone">
                                        <select class="form-control login__input login__input__phone--prefix" tabindex="-1">
                                            <option value="351">+351</option>
                                        </select>
                                        <asp:TextBox runat="server" ID="tbRegisterPhoneNumber" AutoPostBack="false" CssClass="form-control login__input login__input__phone--number" type="text" autocomplete="tel-national" Tabindex="0" placeholder="<%$ Resources:LocalizedText, Profile_PersonalDetails_ProfileDataForm_tbPhoneNumber_Label%>" />
                                        <div class="login__input__phone--note"><asp:Label runat="server" CssClass="" Text="<%$ Resources:LocalizedText, Controls_Register_tbRegisterPhoneNumber_Note %>"/></div>
                                        <asp:CompareValidator runat="server" Type="Integer" Operator="DataTypeCheck" ValidationGroup="Register" ControlToValidate="tbRegisterPhoneNumber" CssClass="text-danger" Style="white-space:normal" Display="Dynamic" ErrorMessage="<%$ Resources:LocalizedText, Profile_PersonalDetails_ProfileDataForm_tbPhoneNumber_CompareValidator_ErrorMessage%>"/>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="login__campaigns col-md-6">
                                    <div class="form-group">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input login__input--checkbox" id="campaigns">
                                            <label class="form-check-label login__input--label" for="campaigns"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Controls_Register_cbRegisterCampaigns%>"/></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="login__log-in col-md-6">
                                    <asp:Button runat="server" Id="btnRegisterContinue" CausesValidation="true" ValidationGroup="Register" CssClass="login__login btn btn-primary" Text="<%$ Resources:LocalizedText, Controls_Register_btnRegisterContinue_Text%>" OnClick="CreateUser_Click"/>
                                </div>
                            </div>
                        </div>
            
                        <hr class="login__separator--grey">
                        <div class="login__with--email row pb-5 pt-3">
                            <div class="col-12 text-center text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Controls_Register_HaveAccount%>"/> <a class="pl-3" href="#" data-dismiss="modal" data-toggle="modal" data-target="#loginModal"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Controls_Register_LoginLink%>"/></a></div>
                        </div>
                    </div>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnLoginFacebook" />
                <asp:PostBackTrigger ControlID="btnLoginGoogle" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</div>