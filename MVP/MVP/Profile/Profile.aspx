<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="MVP.Profile.Profile" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="profile">
        <div class="profile__container profile__container--first">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <h1 class="profile__main-title">O Meu perfil</h1>

                        <h2 class="profile__sub-title">Dados pessoais</h2>

                        <asp:UpdatePanel runat="server" ID="upProfileData" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="profile__label">Nome</div>
                                <asp:TextBox runat="server" ID="txtName" AutoPostBack="true" CssClass="profile__input profile__input--name" type="text" AutoCompleteType="DisplayName" />

                                <div class="profile__label">Data de nascimento</div>
                                <asp:TextBox runat="server" ID="txtBirthDate" AutoPostBack="true" CssClass="profile__input profile__input--birthday" type="text" placeholder="DD / MM / AAAA" />
                
                                <div class="profile__label">Endereço de email</div>
                                <div class="row ml-0">
                                    <asp:TextBox runat="server" ID="txtEmail" AutoPostBack="true" class="profile__input profile__input--email" type="text" />
                                    <div class="<%= pageData.EmailConfirmed ? "row ml-0 align-items-center justify-content-center" : "hide" %>">
                                        <div class="ml-3 mr-3 confirm-check"></div>
                                        <div class="profile__confirm-check">Confirmado</div>
                                    </div>
                                    <div class="<%= pageData.EmailConfirmed ? "hide" : "row ml-0 align-items-center justify-content-center" %>"">
                                        <div class="ml-3 mr-3 confirm-notcheck"></div>
                                        <div class="profile__confirm-check">Não Confirmado</div>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:LinkButton runat="server" ID="btnConfirmEmail" OnClick="btnConfirmEmail_Click" Text="Clique aqui para re-enviar o email de confirmação"/>
                                    </div>
                                </div>

                                <div class="profile__label">Telemóvel</div>
                                <div class="row ml-0">
                                    <select class="profile__input profile__input--country">
                                        <option value="351">+351</option>
                                    </select>
                                    <asp:TextBox runat="server" ID="txtPhoneNumber" AutoPostBack="true" CssClass="ml-2 profile__input profile__input--phone" type="text" placeholder="000 000 000" />

                                    <!-- Phone confirmation hidden for now -->
                                    <div class="hide row ml-0 align-items-center justify-content-center">
                                        <div class="ml-3 mr-3 confirm-check"></div>
                                        <div class="profile__confirm-check">Confirmado</div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <div class="mt-5 mb-5 profile__separator"></div>
                        <button class="mb-5 profile__btn">Atualizar dados</button>
                

                        <h2 class="profile__sub-title">Alterar password</h2>
                        <div class="profile__label">Password atual</div>
                        <input class="profile__input profile__input--password" type="text">

                        <div class="row ml-0">
                            <div class="row ml-0">
                                <div class="profile__label">Nova password</div>
                                <input class="profile__input profile__input--password" type="text">
                            </div>
                            <div class="row ml-0">
                                <div class="profile__label">Repetir nova password</div>
                                <input class="profile__input profile__input--password" type="text">
                            </div>
                        </div>
                
                        <div class="mt-5 mb-5 profile__separator"></div>
                        <button class="mb-5 profile__btn">Alterar</button>
                    </div>

                    <div class="col-md-4 left-menu">
                        <div class="d-flex flex-column align-items-center text-left profile__menu">
                            <a href="/Profile/Profile" OnClick="javascript:$.blockUI()" class="profile__menu__link profile__menu__link--selected">
                                <img class="mr-2" src="/img/profile-selected.png" srcset="/img/profile-selected@2x.png 2x, /img/profile-selected@3x.png 3x">
                                Dados pessoais
                            </a>
                            <div class="mt-3 mb-3 profile__menu__separator"></div>
                            <a href="/pages/profile-billing.html" class="profile__menu__link">
                                <img class="mr-2" src="/img/billing.png" srcset="/img/billing@2x.png 2x, /img/billing@3x.png 3x">
                                Detalhes de Faturação
                            </a>
                            <div class="mt-3 mb-3 profile__menu__separator"></div>
                            <a href="/pages/invitefriends.html" class="profile__menu__link">
                                <img class="mr-2" src="/img/invitefriends.png" srcset="/img/invitefriends@2x.png 2x, /img/invitefriends@3x.png 3x">
                                Convidar amigos
                            </a>
                            <div class="mt-3 mb-3 profile__menu__separator"></div>
                            <asp:LinkButton runat="server" ID="btnLogout" OnClientClick="javascript:$.blockUI()" OnClick="btnLogout_Click" CssClass="profile__menu__link">
                                <img class='mr-2' src='/img/logout.png' srcset='/img/logout@2x.png 2x, /img/logout@3x.png 3x'>
                                Logout
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
    </div>
</asp:Content>