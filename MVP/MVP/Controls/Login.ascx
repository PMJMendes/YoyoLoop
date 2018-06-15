<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="MVP.Controls.Login" %>

<div class="login modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
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
                    <div class="col-12 text-center text-uppercase">Regista-te com o teu email</div>
                </div>
                <span class="text-danger"> <!-- Need styling for this -->
                    <asp:Literal runat="server" ID="LoginErrorMessage" Visible="false" />
                </span>
                <div class="login__form d-flex flex-row align-items-center pt-3 pb-3">
                    <div class="col-12">
                        <div class="form-group">
                            <asp:TextBox runat="server" id="TbLoginEmail" TextMode="Email" CssClass="form-control login__input" aria-describedby="emailHelp" placeholder="Endereço de email" />
                            <asp:RequiredFieldValidator runat="server" ValidationGroup="Login" ControlToValidate="TbLoginEmail" CssClass="text-danger" Display="Dynamic" ErrorMessage="The email field is required." /> <!-- I need a css for this -->
                        </div>
                        <div class="row">
                            <div class="col-md-8">
                                <div class="form-group">
                                    <asp:TextBox runat="server" id="TbLoginPassword" TextMode="Password" CssClass="form-control login__input" aria-describedby="emailHelp" placeholder="Password" />
                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="Login" ControlToValidate="TbLoginPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="The password field is required." /> <!-- I need a css for this -->
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="form-check">
                                        <input type="checkbox" runat="server" id="LoginRememberMe" class="form-check-input login__input--checkbox" >
                                        <label class="form-check-label login__input--label" for="RememberMe">Lembrar-me da <br>password</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="login__forgot-password col-md-6"><a href="#">Esqueci-me da password</a></div>
                    <div class="login__log-in col-md-6">
                        <asp:Button runat="server" ID="btnLogin" CausesValidation="true" ValidationGroup="Login" OnClick="LogIn" Text="Entrar" CssClass="login__login btn btn-primary"/>
                    </div>
                </div>
            </div>
            
            <hr class="login__separator--grey">
            <div class="login__with--email row pb-5 pt-3">
                <div class="col-12 text-center text-uppercase">Ainda não tens conta? <a class="pl-3" href="#" data-dismiss="modal" data-toggle="modal" data-target="#registerModal">Registar</a></div>
            </div>
        </div>
    </div>
</div>