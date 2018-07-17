<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="MVP.Account.Confirm" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <div class="travel" style="height:400px;width:100%;">
        <div class="travel__container">
            <div class="container-fluid">
                <div style="position:relative;top:100px;left:-50px;text-align:center">
                    <asp:PlaceHolder runat="server" ID="successPanel" ViewStateMode="Disabled" Visible="true">
                            <h1 class="travel__main-title">Thank you for confirming your email.</h1>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="errorPanel" ViewStateMode="Disabled" Visible="false">
                            <h1 class="travel__main-title">An error has occurred.</h1>
                    </asp:PlaceHolder>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
