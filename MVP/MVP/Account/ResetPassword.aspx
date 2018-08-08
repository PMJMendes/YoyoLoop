<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="MVP.Account.ResetPassword" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <asp:UpdatePanel runat="server" ID="upReset">
        <ContentTemplate>
            <div class="travel" style="width:100%;">
                <div class="travel__container">
                    <div class="container-fluid">

                        <asp:PlaceHolder runat="server" ID="FormPanel" Visible="true">
                            <h5 class="travel__main-title">Enter your new password.</h5>
                            <hr />

                            <div class="form-group">
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" id="Email" TextMode="Email" CssClass="form-control login__input" aria-describedby="emailHelp" placeholder="Endereço de email" />
                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="Reset" ControlToValidate="Email" CssClass="text-danger" Display="Dynamic" ErrorMessage="The email field is required." />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" id="Password" TextMode="Password" CssClass="form-control login__input" aria-describedby="emailHelp" placeholder="Nova password" />
                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="Reset" ControlToValidate="Password" CssClass="text-danger" Display="Dynamic" ErrorMessage="The password field is required." />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" id="ConfirmPassword" TextMode="Password" CssClass="form-control login__input" aria-describedby="emailHelp" placeholder="Repetir password" />
                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="Reset" ControlToValidate="ConfirmPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                                    <asp:CompareValidator runat="server" ValidationGroup="Reset" ControlToCompare="Password" ControlToValidate="ConfirmPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="login__log-in col-md-offset-2 col-md-10">
                                    <asp:Button runat="server" CausesValidation="true" ValidationGroup="Reset" OnClick="Reset_Click" Text="Reset" CssClass="login__login btn btn-primary" />
                                </div>
                            </div>
                            <br />
                        </asp:PlaceHolder>
                        <asp:PlaceHolder runat="server" ID="successPanel" ViewStateMode="Disabled" Visible="false">
                            <div style="height:400px;width:100%;position:relative;top:100px;left:-50px;text-align:center">
                                <h1 class="travel__main-title">Your password was changed sucessfully.</h1>
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
