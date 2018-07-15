<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Forgot.ascx.cs" Inherits="MVP.Controls.Forgot" %>

<div class="login modal fade" id="forgotModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <asp:UpdatePanel runat="server" ID="upForgot" UpdateMode="Always">
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
                        <div class="login__with--email row">
                            <div class="col-12 text-center text-uppercase">Esqueceste a password?</div>
                            <div class="col-12 text-center text-uppercase">Introduz o teu email</div>
                        </div>
                        <div class="login__form d-flex flex-row align-items-center pt-3 pb-3">
                            <div class="col-12">
                                <div class="form-group">
                                    <asp:TextBox runat="server" id="TbForgotEmail" TextMode="Email" CssClass="form-control login__input" aria-describedby="emailHelp" placeholder="Endereço de email" />
                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="Forgot" ControlToValidate="TbForgotEmail" CssClass="text-danger" Display="Dynamic" ErrorMessage="The email field is required." /> <!-- I need a css for this -->
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="login__log-in col-md-6">
                                <asp:Button runat="server" ID="btnForgot" CausesValidation="true" ValidationGroup="Forgot" OnClick="btnForgot_Click" Text="Enviar" CssClass="login__login btn btn-primary"/>
                            </div>
                            <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                <p class="text-danger">
                                    <asp:Literal runat="server" ID="FailureText" />
                                </p>
                            </asp:PlaceHolder>
                            <asp:PlaceHolder runat="server" ID="DisplayEmail" Visible="false">
                                <p class="text-info">
                                    Please check your email to reset your password.
                                </p>
                            </asp:PlaceHolder>
                        </div>
                    </div>
            
                    <hr class="login__separator--grey">
                    <div class="login__with--email row pb-5 pt-3">
                        <div class="col-12 text-center text-uppercase">Ainda não tens conta? <a class="pl-3" href="#" data-dismiss="modal" data-toggle="modal" data-target="#registerModal">Registar</a></div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>