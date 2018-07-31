<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="MVP.Account.Confirm" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <div class="travel" style="height:400px;width:100%;">
        <div class="travel__container">
            <div class="container-fluid">
                <div style="position:relative;top:100px;left:-50px;text-align:center">
                    <asp:PlaceHolder runat="server" ID="successPanel" ViewStateMode="Disabled" Visible="true">
                            <h1 class="travel__main-title">Obrigado por confirmares o teu email.</h1>
                            <asp:PlaceHolder runat="server" ID="redirectPanel" ViewStateMode="Disabled" Visible="false">
                                <div class="travel__copy-bold" style="position:relative;top:50px;left:-50px;text-align:center">
                                    Vais ser redirecionado para o teu bilhete dentro de segundos.
                                </div>
                            </asp:PlaceHolder>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="errorPanel" ViewStateMode="Disabled" Visible="false">
                            <h1 class="travel__main-title">An error has occurred.</h1>
                    </asp:PlaceHolder>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
