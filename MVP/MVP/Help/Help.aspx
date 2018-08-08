<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Help.aspx.cs" Inherits="MVP.Help.Help" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="help">
        <div class="help__container">
            <div class="container-fluid">
                <asp:UpdatePanel runat="server" ID="upHelp" UpdateMode="Conditional">
                    <ContentTemplate>

                        <asp:PlaceHolder runat="server" ID="phHelpMain" Visible="true">
                            <h1 class="help__main-title">Precisas de ajuda?</h1>

                            <div class="help__separator mt-5 mb-5"></div>

                            <div class="row help__menu pb-5">
                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-12">
                                            <h1 class="help__menu__main-title">Perguntas frequentes</h1>
                                        </div>
                                    </div>
        
                                    <div class="row pt-4">

                                        <div class="col-md-4 pr-4">
                                            <h2 class="help__menu__sub-title">
                                                Viagens e loops
                                            </h2>
                                            <p class="help__menu__text mb-0">Loops disponíveis?</p>
                                            <p class="help__menu__text mb-0">Como solicitar um novo loop?</p>
                                            <p class="help__menu__text mb-0">Métodos de pagamentos?</p>
                                            <p class="help__menu__text mb-0">Facturas</p>
                                            <asp:LinkButton runat="server" ID="btnTopicTrip" OnClick="MainTopicSelect" CssClass="help__menu__see-all" Text="&rarr; Ver todos" />
                                        </div>

                                        <div class="col-md-4 pr-4">
                                            <h2 class="help__menu__sub-title">
                                                User Dashboard
                                            </h2>
                                            <p class="help__menu__text mb-0">Como alterar dados pessoais?</p>
                                            <p class="help__menu__text mb-0">Como adicionar/actualizar ou eliminar dados de pagamentos?</p>
                                            <p class="help__menu__text mb-0">A minha conta corrente</p>
                                            <p class="help__menu__text mb-0">As minhas viagens a 3 Euros</p>
                                            <asp:LinkButton runat="server" ID="btnTopicDashboard" OnClick="MainTopicSelect" CssClass="help__menu__see-all" Text="&rarr; Ver todos" />
                                        </div>

                                        <div class="col-md-4 pr-4">
                                            <h2 class="help__menu__sub-title">
                                                Invite
                                            </h2>
                                            <p class="help__menu__text mb-0">Quantos amigos posso convidar?</p>
                                            <p class="help__menu__text mb-0">Posso dar o meu cupão a amigos que já tenham utilizado a Yoyoloop?</p>
                                            <p class="help__menu__text mb-0">O que os meus amigos ganham por viajar com o meu cupão?</p>
                                            <p class="help__menu__text mb-0">O que é que eu ganho?</p>
                                            <asp:LinkButton runat="server" ID="btnTopicInvite" OnClick="MainTopicSelect" CssClass="help__menu__see-all" Text="&rarr; Ver todos" />
                                        </div>
                                    </div>
                    
                                    <div class="row pt-4">

                                        <div class="col-md-4 pr-4">
                                            <h2 class="help__menu__sub-title">
                                                Os Carros Yoyoloop
                                            </h2>
                                            <p class="help__menu__text mb-0">Todos os carros yoyoloop tem wifi?</p>
                                            <p class="help__menu__text mb-0">O Motorista é mesmo profissional?</p>
                                            <p class="help__menu__text mb-0">Quantos lugares tem um carro da yoyoloop?</p>
                                            <p class="help__menu__text mb-0">Os carros da Yoyoloop são eléctricos?</p>
                                            <asp:LinkButton runat="server" ID="btnTopicVehicle" OnClick="MainTopicSelect" CssClass="help__menu__see-all" Text="&rarr; Ver todos" />
                                        </div>

                                        <div class="col-md-4 pr-4">
                                            <h2 class="help__menu__sub-title">
                                                Descontos e Promoções
                                            </h2>
                                            <p class="help__menu__text mb-0">Posso usar dois códigos promocionais para a mesma viagem?</p>
                                            <p class="help__menu__text mb-0">Tenho saldo na minha conta corrente e código promocionais disponíveis, como faço para usar um ou outro?</p>
                                            <asp:LinkButton runat="server" ID="btnTopicPromo" OnClick="MainTopicSelect" CssClass="help__menu__see-all" Text="&rarr; Ver todos" />
                                        </div> 

                                        <div class="col-md-4 pr-4">
                                            <h2 class="help__menu__sub-title">
                                                Malas e Bagagens
                                            </h2>
                                            <p class="help__menu__text mb-0">Posso levar malas?</p>
                                            <p class="help__menu__text mb-0">Quais os Limites de tamanhos das bagagem?</p>
                                            <p class="help__menu__text mb-0">O que não posso levar comigo?</p>
                                            <asp:LinkButton runat="server" ID="btnTopicLuggage" OnClick="MainTopicSelect" CssClass="help__menu__see-all" Text="&rarr; Ver todos" />
                                        </div>
                                    </div>

                                    <div class="row pt-4">

                                        <div class="col-md-4 pr-4">
                                            <h2 class="help__menu__sub-title">
                                                Empresas
                                            </h2>
                                            <p class="help__menu__text mb-0">Posso emitir facturas com contribuinte?</p>
                                            <p class="help__menu__text mb-0">Posso saber quanto gastei no total?</p>
                                            <asp:LinkButton runat="server" ID="btnTopicCorporate" OnClick="MainTopicSelect" CssClass="help__menu__see-all" Text="&rarr; Ver todos" />
                                        </div>

                                        <div class="col-md-4 pr-4">
                                            <h2 class="help__menu__sub-title">
                                                Conduzir um yoyoloop
                                            </h2>
                                            <p class="help__menu__text mb-0">Como posso conduzir um Yoyoloop?</p>
                                            <asp:LinkButton runat="server" ID="btnTopicDrive" OnClick="MainTopicSelect" CssClass="help__menu__see-all" Text="&rarr; Ver todos" />
                                        </div> 
                                    </div>
                                </div>
                            </div>
                            <div class="help__separator mb-5"></div>
            
                            <div class="row justify-content-center mb-5 align-items-center mt-5">
                                <div class="invitefriends__any-question mr-5">Não encontras a tua pergunta?</div>
                                <a OnClick="javascript:$.blockUI()" href="/Pages/Contact" class="btn btn-default static-page__question-btn static-page__question-btn--white" tabindex="-1" >CONTACTA-NOS</a>
                            </div>
                        </asp:PlaceHolder>

                        <asp:PlaceHolder runat="server" ID="phHelpList" Visible="false">
                            <h1 class="help__main-title">
                                Precisas de ajuda?

                                <asp:LinkButton runat="server" ID="btnBack" OnClick="btnBack_Click" CssClass="help__main-title__btn" Text="Voltar" />
                            </h1>

                            <div class="help__separator mt-5 mb-5"></div>

                            <div class="row">
                                <div class="col-md-4">

                                    <div class="left-menu mb-5">
                                        <div class="left-menu__entry <%= localData.SelectedTopic == "Trip" ? "left-menu__entry--selected" : "" %>"><asp:LinkButton runat="server" ID="btnMenuTopicTrip" OnClick="ListTopicSelect">Viagens e Loops</asp:LinkButton></div>
                                        <div class="left-menu__entry <%= localData.SelectedTopic == "Dashboard" ? "left-menu__entry--selected" : "" %>"><asp:LinkButton runat="server" ID="btnMenuTopicDashboard" OnClick="ListTopicSelect">Dashboard</asp:LinkButton></div>
                                        <div class="left-menu__entry <%= localData.SelectedTopic == "Invite" ? "left-menu__entry--selected" : "" %>"><asp:LinkButton runat="server" ID="btnMenuTopicInvite" OnClick="ListTopicSelect">Convites</asp:LinkButton></div>
                                        <div class="left-menu__entry <%= localData.SelectedTopic == "Vehicle" ? "left-menu__entry--selected" : "" %>"><asp:LinkButton runat="server" ID="btnMenuTopicVehicle" OnClick="ListTopicSelect">Veículos Yoyoloop</asp:LinkButton></div>
                                        <div class="left-menu__entry <%= localData.SelectedTopic == "Promo" ? "left-menu__entry--selected" : "" %>"><asp:LinkButton runat="server" ID="btnMenuTopicPromo" OnClick="ListTopicSelect">Descontos e Promoções</asp:LinkButton></div>
                                        <div class="left-menu__entry <%= localData.SelectedTopic == "Luggage" ? "left-menu__entry--selected" : "" %>"><asp:LinkButton runat="server" ID="btnMenuTopicLuggage" OnClick="ListTopicSelect">Malas e Bagagens</asp:LinkButton></div>
                                        <div class="left-menu__entry <%= localData.SelectedTopic == "Corporate" ? "left-menu__entry--selected" : "" %>"><asp:LinkButton runat="server" ID="btnMenuTopicCorporate" OnClick="ListTopicSelect">Empresas</asp:LinkButton></div>
                                        <div class="left-menu__entry <%= localData.SelectedTopic == "Drive" ? "left-menu__entry--selected" : "" %>"><asp:LinkButton runat="server" ID="btnMenuTopicDrive" OnClick="ListTopicSelect">Conduzir um Yoyoloop</asp:LinkButton></div>
                                    </div>

                                    <div class="left-menu-mobile mb-5">
                                        <select runat="server" id="ddlMobileMenu" onchange="javascript:__doPostBack('<%= upHelp.ClientID %>', '');" onserverchange="ddlMobileMenu_ServerChange" class="left-menu-mobile__select" tabindex="-1">
                                            <option value="Trip">Viagens e Loops</option>
                                            <option value="Dashboard">Dashboard</option>
                                            <option value="Invite">Convites</option>
                                            <option value="Vehicle">Veículos Yoyoloop</option>
                                            <option value="Promo">Descontos e Promoções</option>
                                            <option value="Luggage">Malas e Bagagens</option>
                                            <option value="Corporate">Empresas</option>
                                            <option value="Drive">Conduzir um Yoyoloop</option>
                                        </select>

                                        <img src="/img/arr.png" srcset="/img/arr@2x.png 2x, /img/arr@3x.png 3x" class="arr">
                                    </div>

                                </div>

                                <div class="col-md-8">

                                    <!-- Topic Trip -->
                                    <div class="panel-group <%= localData.SelectedTopic == "Trip" ? "panel-group__show" : "" %>">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#collapse1-1">Loops disponiveis?</a>
                                                </h4>
                                            </div>

                                            <div id="collapse1-1" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                    Foi por isso que criámos um serviço de transfer a preço de autocarro, alternativo aos comboios e às boleias tradicionais, com a diferença de ser mais acessível, conveniente, fiável e sustentável.
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#collapse1-2">Como solicitar um novo loop?</a>
                                                </h4>
                                            </div>

                                            <div id="collapse1-2" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#collapse1-3">Métodos de pagamentos?</a>
                                                </h4>
                                            </div>

                                            <div id="collapse1-3" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#collapse1-4">Facturas</a>
                                                </h4>
                                            </div>

                                            <div id="collapse1-4" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#collapse1-5">Quanto custa um loop?</a>
                                                </h4>
                                            </div>

                                            <div id="collapse1-5" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#collapse1-6">Cancelas um loop?</a>
                                                </h4>
                                            </div>

                                            <div id="collapse1-6" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#collapse1-7">Nao consegui marcar a viagem online, e agora?</a>
                                                </h4>
                                            </div>

                                            <div id="collapse1-7" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#collapse1-8">Posso comprar a viagem no ponto de partida?</a>
                                                </h4>
                                            </div>

                                            <div id="collapse1-8" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                    Foi por isso que criámos um serviço de transfer a preço de autocarro, alternativo aos comboios e às boleias tradicionais, com a diferença de ser mais acessível, conveniente, fiável e sustentável.
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#collapse1-9">Como faço download do meu bilhete?</a>
                                                </h4>
                                            </div>

                                            <div id="collapse1-9" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of Topic Trip -->

                                    <!-- Topic Dashboard -->
                                    <div class="panel-group <%= localData.SelectedTopic == "Dashboard" ? "panel-group__show" : "" %>">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#2-1">Como alterar dados pessoais?</a>
                                                </h4>
                                            </div>

                                            <div id="2-1" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#2-2">Como adicionar/actualizar ou eliminar dados de pagamentos?</a>
                                                </h4>
                                            </div>

                                            <div id="2-2" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#2-3">A minha conta corrente</a>
                                                </h4>
                                            </div>

                                            <div id="2-3" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#2-4">As minhas viagens a 3 Euros</a>
                                                </h4>
                                            </div>

                                            <div id="2-4" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of Topic Dashboard -->

                                    <!-- Topic Invite -->
                                    <div class="panel-group <%= localData.SelectedTopic == "Invite" ? "panel-group__show" : "" %>">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#3-1">Quantos amigos posso convidar?</a>
                                                </h4>
                                            </div>

                                            <div id="3-1" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#3-2">Posso dar o meu cupão a amigos que já tenham utilizado a Yoyoloop?</a>
                                                </h4>
                                            </div>

                                            <div id="3-2" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#3-3">O que os meus amigos ganham por viajar com o meu cupão?</a>
                                                </h4>
                                            </div>

                                            <div id="3-3" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#3-4">O que é que eu ganho?</a>
                                                </h4>
                                            </div>

                                            <div id="3-4" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of Topic Invite -->

                                    <!-- Topic Vehicle -->
                                    <div class="panel-group <%= localData.SelectedTopic == "Vehicle" ? "panel-group__show" : "" %>">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#4-1">Todos os carros yoyoloop tem wifi?</a>
                                                </h4>
                                            </div>

                                            <div id="4-1" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#4-2">O motorista é mesmo profissional?</a>
                                                </h4>
                                            </div>

                                            <div id="4-2" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#4-3">Quantos lugares tem um carro da yoyoloop?</a>
                                                </h4>
                                            </div>

                                            <div id="4-3" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#4-4">Os carros da Yoyoloop são eléctricos?</a>
                                                </h4>
                                            </div>

                                            <div id="4-4" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of Topic Vehicle -->

                                    <!-- Topic Promo -->
                                    <div class="panel-group <%= localData.SelectedTopic == "Promo" ? "panel-group__show" : "" %>">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#5-1">Posso usar dois códigos promocionais para a mesma viagem?</a>
                                                </h4>
                                            </div>

                                            <div id="5-1" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#5-2">Tenho saldo na minha conta corrente e código promocionais disponíveis, como faço para usar um ou outro?</a>
                                                </h4>
                                            </div>

                                            <div id="5-2" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of Topic Promo -->

                                    <!-- Topic Luggage -->
                                    <div class="panel-group <%= localData.SelectedTopic == "Luggage" ? "panel-group__show" : "" %>">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#6-1">Posso levar malas?</a>
                                                </h4>
                                            </div>

                                            <div id="6-1" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#6-2">Quais os limites de tamanhos das bagagem?</a>
                                                </h4>
                                            </div>

                                            <div id="6-2" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#6-3">O que não posso levar comigo?</a>
                                                </h4>
                                            </div>

                                            <div id="6-3" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of Topic Luggage -->

                                    <!-- Topic Corporate -->
                                    <div class="panel-group <%= localData.SelectedTopic == "Corporate" ? "panel-group__show" : "" %>">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#7-1">Posso emitir facturas com contribuinte?</a>
                                                </h4>
                                            </div>

                                            <div id="7-1" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#7-2">Posso saber quanto gastei no total?</a>
                                                </h4>
                                            </div>

                                            <div id="7-2" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of Topic Corporate -->

                                    <!-- Topic Drive -->
                                    <div class="panel-group <%= localData.SelectedTopic == "Drive" ? "panel-group__show" : "" %>">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#8-1">Como posso conduzir um Yoyoloop?</a>
                                                </h4>
                                            </div>

                                            <div id="8-1" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento. A Yoyoloop tem a ambição de revolucionar a mobilidade entre cidades. Acreditamos que as cidades devem ser mais do que engarrafamentos, horas de ponta e parques de estacionamento.
                                                    </br>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of Topic Drive -->

                                </div>
                            </div>
                            <div class="help__separator mb-5 mt-5"></div>
            
                            <div class="row justify-content-center mb-5 align-items-center mt-5">
                                <div class="invitefriends__any-question mr-5">Não encontras a tua pergunta?</div>
                                <a OnClick="javascript:$.blockUI()" href="/Pages/Contact" class="btn btn-default static-page__question-btn static-page__question-btn--white" tabindex="-1" >CONTACTA-NOS</a>
                            </div>
                        </asp:PlaceHolder>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

</asp:Content>