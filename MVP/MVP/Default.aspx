<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MVP._Default" %>
<%@ MasterType virtualpath="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- SUGGEST TRIP -->
    <div class="login modal fade" ID="modalSuggestLoop" tabindex="-1" role="dialog" aria-labelledby="cityModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row text-center">
                        <div class="login__main-title text-uppercase col-12">
                            Não encontras a tua cidade?
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <hr class="login__separator">
                        </div>
                    </div>
                    <div class="d-flex flex-row align-items-center pt-3 pb-3">
                        <div class="homepage homepage__ suggest homepage__suggest--text d-flex align-items-center justify-content-center text-center col-12 p-0">
                            Queres que a Yoyoloop te dê boleia até à tua cidade?<br>
                            Sugere um loop e fica atento às novidades!                  
                        </div>
                    </div>
                    <div class="login__form d-flex flex-row align-items-center pt-3 pb-3">
                        <div class="col-12">
                            <div class="form-group">
                                <asp:TextBox runat="server" ID="tbSuggestEmail" TextMode="Email" CssClass="homepage homepage__suggest homepage__suggest--input form-control" aria-describedby="emailHelp" placeholder="O teu endereço de email" />
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <asp:TextBox runat="server" ID="tbSuggestBody" TextMode="MultiLine" Rows="6" CssClass="form-control"  placeholder="A tua sugestão" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="login__forgot-password col-md-6"></div>
                        <div class="login__log-in col-md-6">
                            <asp:Button runat="server" ID="btnSuggestSend" OnClientClick="javascript:$('#modalSuggestLoop').modal('hide')" OnClick="btnSuggestSend_Click" CssClass="login__login btn btn-primary" Text="Enviar" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END SUGGEST TRIP -->

    <div class="homepage">
      <div class="homepage__container homepage__container--first">
        <div class="container-fluid">
          <div class="row">
            <h1 class="homepage__main-title">Vê passar os autocarros e apanha boleia à porta de casa</h1>
            <h2 class="homepage__sub-title">Reserva o teu lugar num transfer de sete lugares conduzido por um motorista profissional e aproveita uma viagem sem paragens, com wifi a bordo e a preço de autocarro.</h2>
          </div>
  
          <div class="row row-no-padding justify-content-between mt-5">
            <div class="homepage__where-to-go">Para onde queres ir?</div>
            <a href="#" class="homepage__find-city" data-toggle="modal" data-target="#modalSuggestLoop" tabindex="-1">Não encontras a tua cidade?</a>
          </div>
  
          <div class="row row-no-padding mt-3 mb-5">
            <div class="col-md-6 col-lg-3 pl-0">
              <div class="homepage__where-to-card homepage__where-to-card--lisboa mb-2 d-flex flex-column align-items-center">
                <div class="homepage__where-to-card__header pt-3 pb-3 w-100 d-flex justify-content-between align-items-center">
                  <div class="homepage__where-to-card__header__city">Lisboa</div>
                  <div class="homepage__where-to-card__header__price d-flex align-items-center">
                    <div class="flex-column">
                      <div class="homepage__where-to-card__header__price__from">Desde</div>
                      <div class="homepage__where-to-card__header__price__symbol">€</div>
                    </div>
                    <div class="homepage__where-to-card__header__price__amount">12</div>
                  </div>
                </div>
                
                <div class="homepage__where-to-card__separator mb-3"></div>

                <div class="homepage__where-to-card__from mb-2">De leiria, Cascais e coimbra</div>
                <div class="homepage__where-to-card__when mb-4">Todos os dias</div>
                <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Lisboa" class="homepage__where-to-card__reserve mb-5 d-flex align-items-center justify-content-center">Reservar</a>
              </div>
            </div>
            
            <div class="col-md-6 col-lg-3 pl-0">
              <div class="homepage__where-to-card homepage__where-to-card--leiria mb-2 d-flex flex-column align-items-center">
                <div class="homepage__where-to-card__header pt-3 pb-3 w-100 d-flex justify-content-between align-items-center">
                  <div class="homepage__where-to-card__header__city">Leiria</div>
                  <div class="homepage__where-to-card__header__price d-flex align-items-center">
                    <div class="flex-column">
                      <div class="homepage__where-to-card__header__price__from">Desde</div>
                      <div class="homepage__where-to-card__header__price__symbol">€</div>
                    </div>
                    <div class="homepage__where-to-card__header__price__amount">10</div>
                  </div>
                </div>
                
                <div class="homepage__where-to-card__separator mb-3"></div>

                <div class="homepage__where-to-card__from mb-2">De lisboa</div>
                <div class="homepage__where-to-card__when mb-4">Todos os dias</div>
                <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Leiria" class="homepage__where-to-card__reserve mb-5 d-flex align-items-center justify-content-center">Reservar</a>
              </div>
            </div>

            <div class="col-md-6 col-lg-3 pl-0">
              <div class="homepage__where-to-card homepage__where-to-card--coimbra mb-2 d-flex flex-column align-items-center">
                <div class="homepage__where-to-card__header pt-3 pb-3 w-100 d-flex justify-content-between align-items-center">
                  <div class="homepage__where-to-card__header__city">Coimbra</div>
                  <div class="homepage__where-to-card__header__price d-flex align-items-center">
                    <div class="flex-column">
                      <div class="homepage__where-to-card__header__price__from">Desde</div>
                      <div class="homepage__where-to-card__header__price__symbol">€</div>
                    </div>
                    <div class="homepage__where-to-card__header__price__amount">12</div>
                  </div>
                </div>
                
                <div class="homepage__where-to-card__separator mb-3"></div>

                <div class="homepage__where-to-card__from mb-2">De Lisboa</div>
                <div class="homepage__where-to-card__when mb-4">Todos os dias</div>
                <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Coimbra" class="homepage__where-to-card__reserve mb-5 d-flex align-items-center justify-content-center">Reservar</a>
              </div>
            </div>

            <div class="col-md-6 col-lg-3 pl-0">
              <div class="homepage__where-to-card homepage__where-to-card--cascais mb-2 d-flex flex-column align-items-center">
                <div class="homepage__where-to-card__header pt-3 pb-3 w-100 d-flex justify-content-between align-items-center">
                  <div class="homepage__where-to-card__header__city">Cascais</div>
                  <div class="homepage__where-to-card__header__price d-flex align-items-center">
                    <div class="flex-column">
                      <div class="homepage__where-to-card__header__price__from">Desde</div>
                      <div class="homepage__where-to-card__header__price__symbol">€</div>
                    </div>
                    <div class="homepage__where-to-card__header__price__amount">5</div>
                  </div>
                </div>
                
                <div class="homepage__where-to-card__separator mb-3"></div>

                <div class="homepage__where-to-card__from mb-2">De Lisboa</div>
                <div class="homepage__where-to-card__when mb-4">Todos os dias</div>
                <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Linha%20de%20Cascais" class="homepage__where-to-card__reserve mb-5 d-flex align-items-center justify-content-center">Reservar</a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="homepage__container homepage__container--second">
        <div class="container-fluid d-flex flex-column justify-content-center">
          <div class="row justify-content-center mb-5">
            <div class="homepage__yoyoloop">YOYOLOOP</div>
          </div>

          <div class="row justify-content-center mb-5">
            <div class="homepage__yoyoloop-main-description">O único transporte ponto a ponto alternativo aos autocarros,</br> comboios e boleias tradicionais</div>
          </div>

          <div class="row justify-content-center mb-5">
              <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
          </div>
          
          <div class="row justify-content-center mb-5">
            <div class="homepage__yoyoloop-sub-description">O autocarro é demorado, há falta de comboios directos, nem sempre há boleias e não compensa levar o carro vazio. Com um transfer da Yoyoloop, podes ir para Lisboa, Cascais, Leiria e Coimbra sem paragens e a preço de autocarro.</div>
          </div>

          <div class="row justify-content-center mb-5">
            <img class="img-responsive illustration" src="/img/illustration.png">
          </div>
        </div>
      </div>

      <div class="homepage__container homepage__container--third">
        <div class="container-fluid">
          <div class="row row-no-padding justify-content-between align-items-center mb-4">
            <div class="homepage__popular-loops__title">Loops Populares</div>
            <a OnClick="javascript:$.blockUI()" href="/Pages/Loops" class="homepage__see-all">Ver todos</a>
          </div>

          <div class="row row-no-padding pb-5">
            <div class="col-lg-6 col-md-12 pl-0 mt-2">
              <div class="homepage__popular-loops homepage__popular-loops--image1">
                  <div class="row align-items-center pt-4">
                    <div class="col-sm-4 col-xs-12 d-flex justify-content-center align-items-center flex-column">
                        <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                        <span class="homepage__popular-loops__city">Cascais</span>
                    </div>
                    <div class="col-sm-4 col-xs-12 d-flex justify-content-center">
                        <img src="/img/arrows.png" srcset="/img/arrows@2x.png 2x, /img/arrows@3x.png 3x">
                    </div>
                    <div class="col-sm-4 col-xs-12 d-flex justify-content-center align-items-center flex-column">
                        <img src="/img/stopyellow.png" srcset="/img/stopyellow@2x.png 2x, /img/stopyellow@3x.png 3x">
                        <span class="homepage__popular-loops__city">Lisboa</span>
                    </div>
                  </div>
                  
                  <div class="homepage__popular-loops__separator mt-4 mb-4"></div>

                  <div class="row align-items-center pb-4 ml-5 mr-5">
                    <div class="col-md-8">
                      <div class="row">
                          <div class="col d-flex align-items-center justify-content-center flex-column">
                            <img src="/img/duracao.png" srcset="/img/duracao@2x.png 2x, /img/duracao@3x.png 3x">
                            <span class="homepage__popular-loops__features__main-title">Duracao</span>
                            <span class="homepage__popular-loops__features__sub-title">30 Min</span>
                          </div>
                          
                          <div class="col d-flex align-items-center justify-content-center flex-column">
                            <img src="/img/capacidade.png" srcset="/img/capacidade@2x.png 2x, /img/capacidade@3x.png 3x">
                            <span class="homepage__popular-loops__features__main-title">Capacidade</span>
                            <span class="homepage__popular-loops__features__sub-title">7 Lugares</span>
                          </div>
    
                          <div class="col d-flex align-items-center justify-content-center flex-column">
                            <img src="/img/wifi.png" srcset="/img/wifi@2x.png 2x, /img/wifi@3x.png 3x">
                            <span class="homepage__popular-loops__features__main-title">Wi-fi</span>
                            <span class="homepage__popular-loops__features__sub-title">Grátis</span>
                          </div>
    
                          <div class="col d-flex align-items-center justify-content-center flex-column">
                            <img src="/img/preco.png" srcset="/img/preco@2x.png 2x, /img/preco@3x.png 3x">
                            <span class="homepage__popular-loops__features__main-title">Preço</span>
                            <span class="homepage__popular-loops__features__sub-title">Desde 5€</span>
                          </div>
                      </div>
                    </div>

                    <div class="col-md-4">
                        <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Lisboa&Ori=Linha%20de%20Cascais" class="homepage__popular-loops__footer__reserve d-flex align-items-center justify-content-center">Reservar</a>
                    </div>
                  </div>
              </div>
            </div>

            <div class="col-lg-6 col-md-12 pl-0 mt-2">
              <div class="homepage__popular-loops homepage__popular-loops--image2">
                  <div class="row align-items-center pt-4">
                    <div class="col-sm-4 col-xs-12 d-flex justify-content-center align-items-center flex-column">
                        <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                        <span class="homepage__popular-loops__city">Leiria</span>
                    </div>
                    <div class="col-sm-4 col-xs-12 d-flex justify-content-center">
                        <img src="/img/arrows.png" srcset="/img/arrows@2x.png 2x, /img/arrows@3x.png 3x">
                    </div>
                    <div class="col-sm-4 col-xs-12 d-flex justify-content-center align-items-center flex-column">
                        <img src="/img/stopyellow.png" srcset="/img/stopyellow@2x.png 2x, /img/stopyellow@3x.png 3x">
                        <span class="homepage__popular-loops__city">Lisboa</span>
                    </div>
                  </div>
                  
                  <div class="homepage__popular-loops__separator mt-4 mb-4"></div>

                  <div class="row align-items-center pb-4 ml-5 mr-5">
                    <div class="col-md-8">
                      <div class="row">
                          <div class="col d-flex align-items-center justify-content-center flex-column">
                            <img src="/img/duracao.png" srcset="/img/duracao@2x.png 2x, /img/duracao@3x.png 3x">
                            <span class="homepage__popular-loops__features__main-title">Duracao</span>
                            <span class="homepage__popular-loops__features__sub-title">1 H 30</span>
                          </div>
                          
                          <div class="col d-flex align-items-center justify-content-center flex-column">
                            <img src="/img/capacidade.png" srcset="/img/capacidade@2x.png 2x, /img/capacidade@3x.png 3x">
                            <span class="homepage__popular-loops__features__main-title">Capacidade</span>
                            <span class="homepage__popular-loops__features__sub-title">7 Lugares</span>
                          </div>
    
                          <div class="col d-flex align-items-center justify-content-center flex-column">
                            <img src="/img/wifi.png" srcset="/img/wifi@2x.png 2x, /img/wifi@3x.png 3x">
                            <span class="homepage__popular-loops__features__main-title">Wi-fi</span>
                            <span class="homepage__popular-loops__features__sub-title">Grátis</span>
                          </div>
    
                          <div class="col d-flex align-items-center justify-content-center flex-column">
                            <img src="/img/preco.png" srcset="/img/preco@2x.png 2x, /img/preco@3x.png 3x">
                            <span class="homepage__popular-loops__features__main-title">Preço</span>
                            <span class="homepage__popular-loops__features__sub-title">Desde 10€</span>
                          </div>
                      </div>
                    </div>

                    <div class="col-md-4">
                        <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Lisboa&Ori=Leiria" class="homepage__popular-loops__footer__reserve d-flex align-items-center justify-content-center">Reservar</a>
                    </div>
                  </div>
              </div>
            </div>

            <div class="col-lg-6 col-md-12 pl-0 mt-2">
              <div class="homepage__popular-loops homepage__popular-loops--image3">
                <div class="row align-items-center pt-4">
                  <div class="col-sm-4 col-xs-12 d-flex justify-content-center align-items-center flex-column">
                      <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                      <span class="homepage__popular-loops__city">Coimbra</span>
                  </div>
                  <div class="col-sm-4 col-xs-12 d-flex justify-content-center">
                      <img src="/img/arrows.png" srcset="/img/arrows@2x.png 2x, /img/arrows@3x.png 3x">
                  </div>
                  <div class="col-sm-4 col-xs-12 d-flex justify-content-center align-items-center flex-column">
                      <img src="/img/stopyellow.png" srcset="/img/stopyellow@2x.png 2x, /img/stopyellow@3x.png 3x">
                      <span class="homepage__popular-loops__city">Lisboa</span>
                  </div>
                </div>
                
                <div class="homepage__popular-loops__separator mt-4 mb-4"></div>

                <div class="row align-items-center pb-4 ml-5 mr-5">
                  <div class="col-md-8">
                    <div class="row">
                        <div class="col d-flex align-items-center justify-content-center flex-column">
                          <img src="/img/duracao.png" srcset="/img/duracao@2x.png 2x, /img/duracao@3x.png 3x">
                          <span class="homepage__popular-loops__features__main-title">Duracao</span>
                          <span class="homepage__popular-loops__features__sub-title">2H</span>
                        </div>
                        
                        <div class="col d-flex align-items-center justify-content-center flex-column">
                          <img src="/img/capacidade.png" srcset="/img/capacidade@2x.png 2x, /img/capacidade@3x.png 3x">
                          <span class="homepage__popular-loops__features__main-title">Capacidade</span>
                          <span class="homepage__popular-loops__features__sub-title">7 Lugares</span>
                        </div>
  
                        <div class="col d-flex align-items-center justify-content-center flex-column">
                          <img src="/img/wifi.png" srcset="/img/wifi@2x.png 2x, /img/wifi@3x.png 3x">
                          <span class="homepage__popular-loops__features__main-title">Wi-fi</span>
                          <span class="homepage__popular-loops__features__sub-title">Grátis</span>
                        </div>
  
                        <div class="col d-flex align-items-center justify-content-center flex-column">
                          <img src="/img/preco.png" srcset="/img/preco@2x.png 2x, /img/preco@3x.png 3x">
                          <span class="homepage__popular-loops__features__main-title">Preço</span>
                          <span class="homepage__popular-loops__features__sub-title">Desde 12€</span>
                        </div>
                    </div>
                  </div>

                  <div class="col-md-4">
                      <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Lisboa&Ori=Coimbra" class="homepage__popular-loops__footer__reserve d-flex align-items-center justify-content-center">Reservar</a>
                  </div>
                </div>
              </div>
            </div>
          
            <div class="col-lg-6 col-md-12 pl-0 mt-2">
              <div class="homepage__popular-loops__search w-100 h-100 d-flex flex-column align-items-center justify-content-center">
                <img class="mt-4" src="/img/search.png" srcset="/img/search@2x.png 2x, /img/search@3x.png 3x">
                <div class="mt-3 mb-3 homepage__popular-loops__search__title">Não encontras a tua cidade?</div>
                <a href="#" class="mb-4 homepage__popular-loops__search__btn d-flex align-items-center justify-content-center" data-toggle="modal" data-target="#modalSuggestLoop" tabindex="-1">Sugere um loop</a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="homepage__container homepage__container--forth">
          <div class="container-fluid d-flex flex-column justify-content-center">
              <div class="row justify-content-center mb-5">
                <div class="homepage__why-catch-ride">Porquê apanhar boleia de um transfer da Yoyoloop?</div>
              </div>
              <div class="row row-no-padding">
                <div class="homepage__why-card col-md-3 d-flex flex-column align-items-center">
                  <div class="homepage__why-card__image mb-4">
                    <img src="/img/acessivel.png" srcset="/img/acessivel@2x.png 2x, /img/acessivel@3x.png 3x">
                  </div>
                  <div class="homepage__why-card__title mb-3">Acessível</div>
                  <div class="homepage__why-card__sub-title mb-3">Menos desgaste,<br/>mais na carteira</div>
                  <div class="homepage__why-card__separator mb-3"></div>
                  <div class="homepage__why-card__content mb-3">Por um loop, chegas a pagar 75% menos do que se levasses o teu próprio carro e exactamente o mesmo do que pagarias por ir de autocarro ou outros transportes — e ainda tens uma viagem muito mais confortável e menos desgastante.</div>
                </div>

                <div class="homepage__why-card col-md-3 d-flex flex-column align-items-center">
                  <div class="homepage__why-card__image mb-4">
                    <img src="/img/conveniente.png" srcset="/img/conveniente@2x.png 2x, /img/conveniente@3x.png 3x">
                  </div>
                  <div class="homepage__why-card__title mb-3">Conveniente</div>
                  <div class="homepage__why-card__sub-title mb-3">Pick up e drop off<br/>convenientes</div>
                  <div class="homepage__why-card__separator mb-3"></div>
                  <div class="homepage__why-card__content mb-3">Além de contar com partidas frequentes, a Yoyoloop vai pôr-te e buscar-te a pontos estratégicos da cidade, como estações de metro, supermercados, largos dos centros urbanos e as principais zonas de escritórios de Lisboa — e ainda te oferece wifi a bordo.</div>
                </div>

                <div class="homepage__why-card col-md-3 d-flex flex-column align-items-center">
                  <div class="homepage__why-card__image mb-4">
                    <img src="/img/fiavel.png" srcset="/img/fiavel@2x.png 2x, /img/fiavel@3x.png 3x">
                  </div>
                  <div class="homepage__why-card__title mb-3">Fiável</div>
                  <div class="homepage__why-card__sub-title mb-3">Lugar marcado,<br/>à hora marcada</div>
                  <div class="homepage__why-card__separator mb-3"></div>
                  <div class="homepage__why-card__content mb-3">Um motorista profissional dá-te boleia com locais e horas de partida fixas. Basta escolheres o teu ponto de saída, reservar a tua viagem, e sentares-te no teu lugar à hora marcada.</div>
                </div>

                <div class="homepage__why-card col-md-3 d-flex flex-column align-items-center">
                  <div class="homepage__why-card__image mb-4">
                    <img src="/img/sustentavel.png" srcset="/img/sustentavel@2x.png 2x, /img/sustentavel@3x.png 3x">
                  </div>
                  <div class="homepage__why-card__title mb-3">Sustentável</div>
                  <div class="homepage__why-card__sub-title mb-3">Menos carros,<br/>mais cidade</div>
                  <div class="homepage__why-card__separator mb-3"></div>
                  <div class="homepage__why-card__content mb-3">Todas as nossas viagens são feitas em veículos de sete lugares. Não só tiramos mais carros da estrada, como também ajudamos a reduzir a pegada de carbono.</div>
                </div>
              </div>
          </div>
        </div>
      </div>  
    
</asp:Content>
