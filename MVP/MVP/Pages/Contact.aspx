<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="MVP.Pages.Contact" %>
<%@ MasterType virtualpath="~/Site.Master" %>

<asp:Content ID="CssOverrides" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .homepage__navbar {
            background: none
        }
            .homepage__navbar a {
                color: #fbfbfb !important
            }
     </style>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <header class="head text-center d-flex pb-5 static-page__pic-contactos">
        <div class="container-fluid">

        </div>
    </header>

    <section class="contacts">
        <div class="contacts__container d-flex flex-column justify-content-center">
            <div class="container-fluid">
                <div class="row pt-5 pb-5">
                    <div class="col-md-5 pr-5 pt-5">
                        <h2 class="contacts__contacts-title text-uppercase mb-4">Contactos</h2>
                        <p class="text-uppercase">Yoyoloop Portugal, LDA</p>
                        <p>Avenida da República, 50 - 2 Piso</p>
                        <p>1050-196 Lisboa</p>
                        <p><a href="mailto:info@yoyoloop.com">info@yoyoloop.com</a></p>

                        <hr class="constacts__divider w-100 mt-5 mb-5">

                        <h2 class="contacts__contacts-title text-uppercase mb-4">Reservas</h2>
                        <p class="text-uppercase">+351 926 475 250</p>
                        <p><a href="mailto:reservas@yoyoloop.com">reservas@yoyoloop.com</a></p>
                    </div>
                    
                    <div class="contacts__message col-md-7 pl-5">
                        <div class="row pb-5 pt-5">
                            <div class="col-md-12"><h2>Deixa-nos uma mensagem</h2></div>
                        </div>

                        <asp:UpdatePanel runat="server" ID="upContactForm" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="tbName"><h3>Nome completo</h3></label>
                                            <asp:TextBox runat="server" ID="tbName" type="text" class="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <label for="tbEmail"><h3>Endereço de E-mail</h3></label>
                                            <asp:TextBox runat="server" ID="tbEmail" type="email" class="form-control" aria-describedby="emailHelp" />
                                        </div>
                                        <div class="form-group">
                                            <label for="tbSubject"><h3>Assunto</h3></label>
                                            <asp:TextBox runat="server" ID="tbSubject" type="text" class="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <label for="message"><h3>Mensagem</h3></label>
                                            <asp:TextBox runat="server" ID="tbBody" type="text" TextMode="MultiLine" Rows="8" class="form-control" />
                                        </div>
                                        <asp:Button runat="server" ID="btnSend" OnClick="btnSend_Click" class="btn btn-primary text-uppercase" Text="Enviar" TabIndex="-1" />
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="contacts__container contacts__container--forth">
        <div class="container-fluid d-flex flex-column justify-content-center">    

            <div class="contacts__separator mt-5 mb-5"></div>

            <div class="row justify-content-center mb-5 align-items-center">
                <div class="contacts__any-question mr-5">Tens alguma pergunta?</div>
                <a OnClick="javascript:$.blockUI()" href="/Help/Help" class="btn btn-default static-page__question-btn static-page__question-btn--white" tabindex="-1" >Lê as nossas Perguntas Frequentes</a>
            </div>
        </div>
    </div>  

</asp:Content>
