<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="MVP.Confirm.Confirm" %>

<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Yoyoloop</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/styles.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
  </head>

  <body id="">
  <form id="form1" runat="server">
    <nav class="navbar navbar-expand-lg navbar-light fixed-top homepage__navbar" id="main-nav">
      <div class="container-fluid">
        <img src="../img/yoyo-logo.png" alt="" class="img-responsive logo"/>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger text-uppercase" href="#">Loops & horarios</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger text-uppercase" href="#services">Destinos</a>
            </li>
            <li class="nav-item">
              <button class="nav-link js-scroll-trigger btn btn-light btn-xl text-uppercase" >Registar/Entrar</button>
            </li>
          </ul>
        </div>
      </div>
    </nav>
      
    <div class="travel">
        <div class="travel__container">
            <div class="container-fluid">
                <h1 class="travel__main-title">A tua viagem está confirmada</h1>
                <div class="travel__sub-title mb-4">
                    <a href="#" class="travel__sub-title--red travel__sub-title--link"> Regista-te</a> e guarda o histórico das tuas viagens
                </div>

                <div class="row ml-0 pl-0 travel__card">
                  <div class="col-md-8 pr-0 travel__card__first">
                    <div class="travel__card__first__your-trip mb-3">A tua viagem</div>
                    <div class="row">
                      <div class="col-md-1 d-flex align-items-center flex-column travel__card__first__path">
                          <div class="white-circle"></div>
                          <img src="../img/path.png" srcset="../img/path@2x.png 2x, ../img/path@3x.png 3x">
                          <div class="white-circle"></div>
                      </div>
                      <div class="col-md-4">
                        <div class="travel__card__first__from">
                            <div class="travel__card__first__point">Origem</div>
                            <div class="travel__card__first__city"><%= pageData.StartRegionName.ToUpper() %></div>
                            <div class="travel__card__first__area"><%= pageData.StartAPName %></div>
                            <div class="travel__card__first__location"><%= "<br>" %></div>
                        </div>

                        <div class="travel__card__first__to mt-3">
                            <div class="travel__card__first__point">Destino</div>
                            <div class="travel__card__first__city"><%= pageData.EndRegionName.ToUpper() %></div>
                            <div class="travel__card__first__area"><%= pageData.EndAPName %></div>
                            <div class="travel__card__first__location"><%= "<br>" %></div>
                        </div>
                      </div>
                      <div class="col-md-7 pr-5">
                          <div class="d-flex justify-content-between align-items-center">
                            <div class="travel__card__first__text">
                              <img class="mr-2" src="../img/calendar-black.png" srcset="../img/calendar-black@2x.png 2x, ../img/calendar-black@3x.png 3x">
                                <%= pageData.StartTime.ToString("dd MMMM").ToUpper() %>, <%= pageData.StartTime.ToString("ddd").ToUpper() %>
                            </div>
                            <div class="travel__card__first__text">
                              IDA
                            </div>
                          </div>

                          <div class="travel__card__first__separator mt-2 mb-2"></div>

                          <div class="travel__card__first__text">
                            <img class="mr-2" src="../img/clock-black.png" srcset="../img/clock-black@2x.png 2x, ../img/clock-black@3x.png 3x">
                            <%= pageData.StartTime.ToString("HH\\:mm") %>
                          </div>

                          <div class="travel__card__first__text">
                            <img class="mr-2 cart" src="../img/cart-black.png" srcset="../img/cart-black@2x.png 2x, ../img/cart-black@3x.png 3x">
                            <%= pageData.Cost.ToString("C") %>
                          </div>

                        <!-- HIDDEN FOR NOW -->
                        <div class="hide">
                          <div class="d-flex justify-content-between align-items-center mt-4">
                            <div class="travel__card__first__text">
                              <img class="mr-2" src="../img/calendar-black.png" srcset="../img/calendar-black@2x.png 2x, ../img/calendar-black@3x.png 3x">
                              15 MARÇO,  QUARTA
                            </div>
                            <div class="travel__card__first__text">
                              VOLTA
                            </div>
                          </div>

                          <div class="travel__card__first__separator mt-2 mb-2"></div>

                          <div class="travel__card__first__text">
                            <img class="mr-2" src="../img/clock-black.png" srcset="../img/clock-black@2x.png 2x, ../img/clock-black@3x.png 3x">
                            18:00
                          </div>

                          <div class="travel__card__first__text">
                            <img class="mr-2 cart" src="../img/cart-black.png" srcset="../img/cart-black@2x.png 2x, ../img/cart-black@3x.png 3x">
                            10,50€
                          </div>  
                        </div>
                        <!-- END OF HIDE -->
                        </div>
                    </div>
                  </div>
                  
                  <div class="col-md-4 pl-0 travel__card__last text-right">
                    <img class="travel__card__separator" src="../img/path.png" srcset="../img/path@2x.png 2x, ../img/path@3x.png 3x">

                    <p class="travel__card__last__gray-text">BILHETE</p>
                    <p class="travel__card__last__ticket-number"><%= pageData.TicketCode.ToUpper() %></p>
                    <p class="travel__card__last__users">
                      <img src="../img/users-black.png" srcset="../img/users-black@2x.png 2x, ../img/users-black@3x.png 3x"> <%= pageData.Seats.ToString() %> <%= pageData.Seats == 1 ? "Lugar" : "Lugares" %>
                    </p>
                    <p class="travel__card__last__gray-text">TOTAL</p>
                    <p class="travel__card__last__price"><%= pageData.Cost.ToString("C") %></p>
                  </div>
                </div>

                <div class="d-flex justify-content-between align-items-center mt-3">
                    <div class="travel__copy-bold">Enviámos a tua fatura para <span style="color: #ff5f6d;">youremail@gmail.com </span></div>
                    <a href="#" class="travel__white-btn">DOWNLOAD</a>
                </div>

                <div class="travel__separator mt-5 mb-5"></div>

                <!-- HACK: use the styles from invite friends. In the future we should have custom ones -->
                <div class="container-fluid d-flex flex-column justify-content-center pt-5 pb-5">
                    <div class="row justify-content-center mt-5 mb-5">
                        <div class="invitefriends__why-catch-ride text-center">
                            Poupa tempo e ganha vantagens com uma conta Yoyoloop
                        </div>
                    </div>
                    <div class="row row-no-padding">
                        <div class="invitefriends__why-card col-md-4 d-flex flex-column align-items-center">
                          <div class="invitefriends__why-card__image mb-4">
                            <img src="/img/acessivel-2.png" srcset="/img/acessivel-2@2x.png 2x, /img/acessivel-2@3x.png 3x">
                          </div>
                          <div class="invitefriends__why-card__title mb-3">Ganha viagens a 3€</div>
                          <div class="invitefriends__why-card__separator mb-3"></div>
                          <div class="invitefriends__why-card__content mb-3">Tens acesso a um promo code só para ti e podes enviar aos teus amigos para viajares a 3€</div>
                        </div>
        
                        <div class="invitefriends__why-card col-md-4 d-flex flex-column align-items-center">
                        <div class="invitefriends__why-card__image mb-4">
                            <img src="/img/reservar.png" srcset="/img/reservar@2x.png 2x, /img/reservar@3x.png 3x">
                        </div>
                        <div class="invitefriends__why-card__title mb-3">Mais fácil de reservar</div>
                        <div class="invitefriends__why-card__separator mb-3"></div>
                        <div class="invitefriends__why-card__content mb-3">Os teus dados são guardados na nossa plataforma para poderes facilmente selecioná-los sempre que reservares viagens e pedires uma fatura</div>
                        </div>
        
                        <div class="invitefriends__why-card col-md-4 d-flex flex-column align-items-center">
                        <div class="invitefriends__why-card__image mb-4">
                            <img src="/img/historico.png" srcset="/img/historico@2x.png 2x, /img/historico@3x.png 3x">
                        </div>
                        <div class="invitefriends__why-card__title mb-3">Histórico e alterações</div>
                        <div class="invitefriends__why-card__separator mb-3"></div>
                        <div class="invitefriends__why-card__content mb-3">As tuas viagens reservadas e o histórico de viagens ficam registados e permite-te efetuar alterações ou voltar a reservar viagens que fizeste no passado mais rapidamente</div>
                        </div>
                    </div>
                </div>

                <a href="#" class="travel__reserve mb-5 mt-3 d-flex align-items-center justify-content-center text-uppercase">Criar uma conta</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript -->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </form>
  </body>
</html>
