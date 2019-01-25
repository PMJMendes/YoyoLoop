<%@ Page Title="ADMIN CP" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Office.aspx.cs" Inherits="MVP.BackOffice.Office" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <meta name="robots" content="noindex, nofollow">
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="profile">
        <div class="profile__container profile__container--first">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <h1 class="profile__main-title"><asp:Literal runat="server" Text="YOYOLOOP ADMIN CP"/></h1>

                        <h2 class="profile__sub-title"><asp:Literal runat="server" Text="Selecione uma opção do menu"/></h2>

                        <div class="row" style="min-height:300px"></div>
                    </div>

                    <div class="col-md-4 left-menu">
                        <div class="d-flex flex-column align-items-center text-left profile__menu sticky">
                            <a OnClick="javascript:$.blockUI()" href="/BackOffice/Office" class="profile__menu__link profile__menu__link--selected">
                                <asp:Literal runat="server" Text="Admin CP"/>
                            </a>
                            <div class="mt-3 mb-3 profile__menu__separator"></div>
                            <a OnClick="return false" href="/BackOffice/Routes" class="profile__menu__link">
                                <asp:Literal runat="server" Text="Routes"/>
                            </a>
                            <div class="mt-3 mb-3 profile__menu__separator"></div>
                            <a OnClick="return false" href="/BackOffice/AccessPoints" class="profile__menu__link">
                                <asp:Literal runat="server" Text="Access Points"/>
                            </a>
                            <div class="mt-3 mb-3 profile__menu__separator"></div>
                            <a OnClick="javascript:$.blockUI()" href="/BackOffice/AssignDriver" class="profile__menu__link">
                                <asp:Literal runat="server" Text="Assign Drivers"/>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
    </div>
</asp:Content>
