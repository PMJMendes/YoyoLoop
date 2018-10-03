<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="MVP.Account.Confirm" Async="true" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <meta name="robots" content="noindex, follow">
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <div class="travel" style="height:400px;width:100%;">
        <div class="travel__container">
            <div class="container-fluid">
                <div style="position:relative;top:100px;left:-50px;text-align:center">
                    <asp:PlaceHolder runat="server" ID="successPanel" ViewStateMode="Disabled" Visible="true">
                            <h1 class="travel__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Account_ConfirmEmail_MainTitle%>"/></h1>
                            <asp:PlaceHolder runat="server" ID="redirectPanel" ViewStateMode="Disabled" Visible="false">
                                <div class="travel__copy-bold" style="position:relative;top:50px;left:-50px;text-align:center">
                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Account_ConfirmEmail_TicketRedirect%>"/>
                                </div>
                            </asp:PlaceHolder>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="errorPanel" ViewStateMode="Disabled" Visible="false">
                            <h1 class="travel__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Account_ConfirmEmail_Error%>"/></h1>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="waitPanel" ViewStateMode="Disabled" Visible="false">
                            <h1 class="travel__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Account_ConfirmEmail_Login%>"/></h1>
                    </asp:PlaceHolder>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
