<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Terms.aspx.cs" Inherits="MVP.Pages.Terms" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <title>
        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Meta_Terms_Title%>"/>
    </title>
    <meta name="description" content="<%= Resources.LocalizedText.Meta_Terms_Description%>">
    <meta name="robots" content="index, follow">
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="terms">
        <div class="terms__container">
            <div class="container-fluid">
                <h1 class="terms__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_MainTitle%>"/></h1>

                <div class="terms__separator mt-5 mb-5"></div>

                <p class="terms__content terms__content--bold">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_MainDescription%>"/>
                </p>

                <p class="terms__content terms__content--bold">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_One%>"/>
                </p>
            
                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_One_One%>"/>
                </p>
                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_One_Two%>"/>
                </p>
                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_One_Three%>"/>
                </p>
            
                <p class="terms__content terms__content--bold">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Two%>"/>
                </p>
            
                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Two_One%>"/>
                </p>

                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Two_Two%>"/>
                </p>

                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Two_Three%>"/>
                </p>

                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Two_Four%>"/>
                </p>

                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Two_Five%>"/>
                </p>

                <p class="terms__content terms__content--bold">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Three%>"/>
                </p>
            
                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Three_One%>"/>
                </p>
            
                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Three_Two%>"/>
                </p>

                <div class="terms__separator mt-5 mb-5"></div>


                <div class="row justify-content-center mb-5 align-items-center mt-5">
                    <div class="static-page__any-question mr-5"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_FAQ_Questions%>"/></div>
                    <a OnClick="javascript:$.blockUI()" href="/Help/Help" class="btn btn-default static-page__question-btn static-page__question-btn--white" tabindex="-1" ><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_FAQ_Questions_HelpLink%>"/></a>
                </div>
            </div>
        </div>
    </div>
    
</asp:Content>