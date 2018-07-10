<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Register.ascx.cs" Inherits="MVP.Controls.Register" %>

<div class="login modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="registerModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <asp:UpdatePanel runat="server" ID="upRegister" UpdateMode="Always">
            <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="row text-center">
                                <div class="login__main-title text-uppercase col-12">
                                    Yoyoloop login
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <hr class="login__separator">
                                </div>
                            </div>
                            <div class="row">
                                <div class="login__facebook-row col-md-6 text-right">
                                    <button type="button" class="login__with--facebook btn btn-primary">
                                        <img src="../img/facebook-login.png"
                                        srcset="../img/facebook-login@2x.png 2x,
                                        ../img/facebook-login@3x.png 3x"
                                        class="facebook-login mr-2">
                                        com Facebook
                                    </button>
                                </div>
                                <div class="login__google-row col-md-6 text-left">
                                    <button type="button" class="login__with--google btn btn-primary">
                                        <img src="../img/google-login.png"
                                        srcset="../img/google-login@2x.png 2x,
                                        ../img/google-login@3x.png 3x"
                                        class="google-login mr-2">
                                        com Google
                                    </button>
                                </div>
                            </div>
                            <div class="d-flex flex-row align-items-center pt-3 pb-3">
                                <div class="col-5 pr-0"><hr></div>
                                <div class="login__or d-flex align-items-center justify-content-center col-2 text-uppercase p-0">or</div>
                                <div class="col-5 pl-0 text-left"><hr></div>
                            </div>
                            <div class="login__with--email row">
                                <div class="col-12 text-center text-uppercase">Para receberes o teu bilhete,<br>
                                    primeiro precisamos dos teus dados
                                </div>
                            </div>
                            <span class="text-danger"> <!-- I need styling for error message summary -->
                                <asp:Literal runat="server" ID="RegisterErrorMessage" /> 
                                <asp:ValidationSummary runat="server" ID="RegisterErrorSummary" ValidationGroup="Register" />
                            </span>
                            <div class="login__form d-flex flex-row align-items-center pt-3 pb-3">
                                <div class="col-12">
                                    <div class="form-group">
                                        <asp:TextBox runat="server" id="TbRegisterName" CssClass="form-control login__input" placeholder="Nome" />
                                        <asp:RequiredFieldValidator runat="server" ValidationGroup="Register" ControlToValidate="TbRegisterName" CssClass="text-danger" Display="Dynamic" ErrorMessage="The name field is required." /> <!-- I need a css for this -->
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" id="TbRegisterEmail" TextMode="Email" CssClass="form-control login__input" aria-describedby="emailHelp" placeholder="Endereço de email" />
                                        <asp:RequiredFieldValidator runat="server" ValidationGroup="Register" ControlToValidate="TbRegisterEmail" CssClass="text-danger" Display="Dynamic" ErrorMessage="The email field is required." /> <!-- I need a css for this -->
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" id="TbRegisterConfirmEmail" TextMode="Email" CssClass="form-control login__input" aria-describedby="emailHelp" placeholder="Repetir Endereço de email" />
                                        <asp:RequiredFieldValidator runat="server" ValidationGroup="Register" ControlToValidate="TbRegisterConfirmEmail" CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm email field is required." /> <!-- I need a css for this -->
                                        <asp:CompareValidator runat="server" ValidationGroup="Register" ControlToCompare="TbRegisterEmail" ControlToValidate="TbRegisterConfirmEmail" CssClass="text-danger" Display="Dynamic" ErrorMessage="The email and confirmation email do not match." /> <!-- I need a css for this -->
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" id="TbRegisterPassword" TextMode="Password" CssClass="form-control login__input" aria-describedby="emailHelp" placeholder="Password" />
                                        <asp:RequiredFieldValidator runat="server" ValidationGroup="Register" ControlToValidate="TbRegisterPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="The password field is required." /> <!-- I need a css for this -->
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" id="TbRegisterConfirmPassword" TextMode="Password" CssClass="form-control login__input" aria-describedby="emailHelp" placeholder="Repetir password" />
                                        <asp:RequiredFieldValidator runat="server" ValidationGroup="Register" ControlToValidate="TbRegisterConfirmPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." /> <!-- I need a css for this -->
                                        <asp:CompareValidator runat="server" ValidationGroup="Register" ControlToCompare="TbRegisterPassword" ControlToValidate="TbRegisterConfirmPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." /> <!-- I need a css for this -->
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="login__campaigns col-md-6">
                                    <div class="form-group">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input login__input--checkbox" id="campaigns">
                                            <label class="form-check-label login__input--label" for="campaigns">Quero receber campanhas <br> promocionais da Yoyoloop
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="login__log-in col-md-6">
                                    <asp:Button runat="server" Id="btnRegisterContinue" CausesValidation="true" ValidationGroup="Register" CssClass="login__login btn btn-primary" Text="Continuar" OnClientClick="javascript: if(Page_ClientValidate('Register')){ $.blockUI({ message: $('#divBlockUI'), baseZ: 20000 }) }" OnClick="CreateUser_Click"/>
                                </div>
                            </div>
                        </div>
            
                        <hr class="login__separator--grey">
                        <div class="login__with--email row pb-5 pt-3">
                            <div class="col-12 text-center text-uppercase">Já tens conta? <a class="pl-3" href="#" data-dismiss="modal" data-toggle="modal" data-target="#loginModal">Fazer login</a></div>
                        </div>
                    </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>