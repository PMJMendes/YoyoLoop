<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Terms.aspx.cs" Inherits="MVP.Pages.Terms" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="terms">
        <div class="terms__container">
            <div class="container-fluid">
                <h1 class="terms__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_MainTitle%>"/></h1>

                <div class="terms__separator mt-5 mb-5"></div>

                <p class="terms__content terms__content--bold">
                    Condições gerais para utilizadores da goodlife! em ofertas disponíveis no site www.yoyoloop.com
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
            
                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_One_Three_One%>"/>
                </p>
            
                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_One_Three_Two%>"/>
                </p>
            
                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_One_Four%>"/>
                </p>
            
                <p class="terms__content terms__content--bold">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Two%>"/>
                </p>
            
                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Two_A%>"/>
                </p>
            
                <p class="terms__content terms__content--bold">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Three%>"/>
                </p>
            
                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Three_One%>"/>
                </p>
            
                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Three_One_A%>"/>
                </p>
            
                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Three_One_B%>"/>
                </p>
            
                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Three_One_B_a%>"/>
                </p>
              
                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Three_One_B_b%>"/>
                </p>
            
                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Three_One_B_c%>"/>
                </p>
            
                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Three_One_B_d%>"/>
                </p>
            
                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Three_One_B_e%>"/>
                </p>
            
                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Three_One_C%>"/>
                </p>
            
                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Three_One_D%>"/>
                </p>

                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Three_One_E%>"/>
                </p>

                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Three_One_F%>"/>
                </p>
            
                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Three_One_G%>"/>
                </p>
            
                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Three_One_H%>"/>
                </p>
            
                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Three_One_I%>"/>
                </p>
            
                <p class="terms__content">
                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_Terms_Three_One_J%>"/>
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