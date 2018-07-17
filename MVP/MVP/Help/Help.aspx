<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Help.aspx.cs" Inherits="MVP.Help.Help" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="help">
        <div class="help__container">
            <div class="container-fluid">
                <h1 class="help__main-title">Precisas de ajuda?</h1>

                <div class="pl-0 ml-0 help__input">
                    <input type="text" placeholder="Search help article">
                        <img src="/img/search.png" srcset="/img/search@2x.png 2x, /img/search@3x.png 3x" class="search">
                </div>

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
                                <p class="help__menu__text mb-0">Métodos de pagamentos?</p>
                                <a href="#" class="help__menu__see-all">&rarr; Ver todos</a>
                            </div>

                            <div class="col-md-4 pr-4">
                                <h2 class="help__menu__sub-title">
                                    User Dashboard
                                </h2>
                                <p class="help__menu__text mb-0">Como alterar dados pessoais?</p>
                                <p class="help__menu__text mb-0">Como adicionar/actualizar ou eliminar dados de pagamentos?</p>
                                <p class="help__menu__text mb-0">A minha conta corrente</p>
                                <p class="help__menu__text mb-0">As minhas viagens a 3 Euros</p>
                                <a href="#" class="help__menu__see-all">&rarr; Ver todos</a>
                            </div>

                            <div class="col-md-4 pr-4">
                                <h2 class="help__menu__sub-title">
                                    Invite
                                </h2>
                                <p class="help__menu__text mb-0">Quantos amigos posso convidar?</p>
                                <p class="help__menu__text mb-0">Posso dar o meu cupão a amigos que já tenham utilizado a Yoyoloop?</p>
                                <p class="help__menu__text mb-0">O que os meus amigos ganham por viajar com o meu cupão?</p>
                                <p class="help__menu__text mb-0">O que é que eu ganho?</p>
                                <a href="#" class="help__menu__see-all">&rarr; Ver todos</a>
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
                                <a href="#" class="help__menu__see-all">&rarr; Ver todos</a>
                            </div>

                            <div class="col-md-4 pr-4">
                                <h2 class="help__menu__sub-title">
                                    Descontos e Promoções
                                </h2>
                                <p class="help__menu__text mb-0">Posso usar dois códigos promocionais para a mesma viagem?</p>
                                <p class="help__menu__text mb-0">Tenho saldo na minha conta corrente e código promocionais disponíveis, como faço para usar um ou outro?</p>
                                <a href="#" class="help__menu__see-all">&rarr; Ver todos</a>
                            </div> 

                            <div class="col-md-4 pr-4">
                                <h2 class="help__menu__sub-title">
                                    Malas e Bagagens
                                </h2>
                                <p class="help__menu__text mb-0">Posso levar malas?</p>
                                <p class="help__menu__text mb-0">Quais os Limites de tamanhos das bagagem?</p>
                                <p class="help__menu__text mb-0">O que não posso levar comigo?</p>
                                <a href="#" class="help__menu__see-all">&rarr; Ver todos</a>
                            </div>
                        </div>

                        <div class="row pt-4">

                            <div class="col-md-4 pr-4">
                                <h2 class="help__menu__sub-title">
                                    Empresas
                                </h2>
                                <p class="help__menu__text mb-0">Posso emitir facturas com contribuinte?</p>
                                <p class="help__menu__text mb-0">Posso saber quanto gastei no total?</p>
                                <a href="#" class="help__menu__see-all">&rarr; Ver todos</a>
                            </div>

                            <div class="col-md-4 pr-4">
                                <h2 class="help__menu__sub-title">
                                    Conduzir um yoyoloop
                                </h2>
                                <p class="help__menu__text mb-0">Como posso conduzir um Yoyoloop?</p>
                                <a href="#" class="help__menu__see-all">&rarr; Ver todos</a>
                            </div> 
                        </div>
                    </div>
                </div>

                <div class="help__separator mb-5"></div>
            
                <div class="row justify-content-center mb-5 align-items-center mt-5">
                    <div class="invitefriends__any-question mr-5">Não encontras a tua pergunta?</div>
                    <button class="invitefriends__reserve-btn invitefriends__reserve-btn--white" >CONTACTA-NOS</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>