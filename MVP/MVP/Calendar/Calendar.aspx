<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="MVP.Calendar.Calendar" %>

<%@ Register Src="~/Controls/DropdownMenuButton.ascx" TagPrefix="yoyo" TagName="DropdownMenuButton" %>
<%@ Register Src="~/Controls/DropdownFixed.ascx" TagPrefix="yoyo" TagName="DropdownFixed" %>
<%@ Register Src="CalendarDay.ascx" TagPrefix="yoyo" TagName="CalendarDay" %>
<%@ Register Src="CalendarTable.ascx" TagPrefix="yoyo" TagName="CalendarTable" %>
<%@ Register Src="Popover.ascx" TagPrefix="yoyo" TagName="Popover" %>


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

    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="main-nav">
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

    <header class="head text-center d-flex pb-5">
      <div class="container-fluid">
        <div class="row p-5 dropdown-menus">
          <div class="d-none d-sm-block col-lg-1 col-md-1 startend">
            <div class="start">
              <img src="../img/red-dot.png" alt="" class="img-responsive">
            </div>
            <div class="switch">
              <img src="../img/switch@2x.png" alt="" class="img-responsive">
            </div>
            <div class="path">
              <img src="../img/path@2x.png" alt="" class="img-responsive">
            </div>
            <div class="end">
              <img src="../img/end@2x.png" alt="" class="img-responsive">
            </div>
          </div>

          <div class="col-lg-9 col-md-9">
            <div class="row">
              <!-- DESTINO -->
              <div class="col-lg-4 col-md-4 text-left">
                <span class="text-uppercase">Destino</span>
                <yoyo:DropdownMenuButton runat="server" ID="DdlEndRegion" SelectionPrompt="Escolher destino" OnItemSelected="DdlEndRegion_ItemSelected" />
              </div>

              <!-- PARAGENS -->
              <div class="col-lg-8 col-md-8 mx-auto text-left">
                <span class="text-uppercase">Paragem</span>
                <yoyo:DropdownMenuButton runat="server" ID="DdlEndAP" SelectionPrompt="Escolher paragem" OnItemSelected="DdlEndAP_ItemSelected" />
              </div>
            </div>

            <div class="d-flex justify-content-center">
              <div class="col-lg-1 col-md-1 startend-mobile pt-3 pb-5">
                <div class="start">
                  <img src="../img/red-dot.png" alt="" class="img-responsive">
                </div>
                <div class="switch">
                  <img src="../img/switch@2x.png" alt="" class="img-responsive">
                </div>
                <div class="path">
                  <img src="../img/path@2x.png" alt="" class="img-responsive">
                </div>
                <div class="end">
                  <img src="../img/end@2x.png" alt="" class="img-responsive">
                </div>
              </div>
            </div>

            <div class="row mt-3">
              <!-- ORIGEM -->
              <div class="col-lg-4 col-md-4 text-left">
                <span class="text-uppercase">Origem</span>
                <yoyo:DropdownMenuButton runat="server" ID="DdlStartRegion" SelectionPrompt="Escolher origem" OnItemSelected="DdlStartRegion_ItemSelected" />
              </div>

              <!-- PARAGENS -->
              <div class="col-lg-8 col-md-8 mx-auto text-left">
                <span class="text-uppercase">Paragem</span>
                <yoyo:DropdownMenuButton runat="server" ID="DdlStartAP" SelectionPrompt="Escolher paragem" OnItemSelected="DdlStartAP_ItemSelected" />
              </div>
            </div>
          </div>

          <!-- LUGARES -->
          <div class="n-seats col-lg-2 col-md-2 mx-auto text-left">
            <div class="row">
              <div class="col col-xs-6">
                <span class="text-uppercase">Lugares</span>
                <yoyo:DropdownFixed runat="server" ID="DdlSeats" OnItemSelected="DdlSeats_ItemSelected" />
              </div>
              <!-- HIDDEN FOR NOW -->
              <div class="hide return col col-xs-6 mt-3">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                  <label class="form-check-label text-uppercase" for="defaultCheck1">
                    Ida e volta
                  </label>
                </div>
              </div>
              <!-- END OF HIDE -->
            </div>
          </div>
        </div>
      </div>      
    </header>

    <section class="pt-5" id="book">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-8 col-md-8 calendar-background">
            <!-- CALENDAR HEADER -->
            <div class="row" id="calendar-header">

              <!-- calendar-list buttons -->
              <div class="col my-auto d-none d-sm-block">
                <button class="btn btn-calendar btn--selected">
                  <img src="../img/calendar.png" srcset="../img/calendar@2x.png 2x, ../img/calendar@3x.png 3x" class="btn-calendar">
                </button>
                <button class="btn btn-list">
                  <img src="../img/list.png" srcset="../img/list@2x.png 2x, ../img/list@3x.png 3x" class="btn-calendar">
                </button>
              </div>

              <!-- Month selector -->
              <div class="col">
                <div class="d-flex flex-row">
                  <div class="my-auto col-lg-3 col-md-3 text-right">
                    <asp:ImageButton id="BtnMonthBack" runat="server" class="btn-calendar" OnClick="CalBtnMonthControl" ImageUrl="../img/arr-left.png"></asp:ImageButton>
                  </div>
                  <div class="col-lg-6 col-md-6">
                    <p class=" month m-0"><%= localData.Values.CalVisibleDate.ToString("MMMM").ToUpper() %></p>
                    <p class="d-none d-md-block year m-0"><%= localData.Values.CalVisibleDate.Year %></p>
                  </div>
                  <div class="my-auto col-lg-3 col-md-3 text-left">
                    <asp:ImageButton id="BtnMonthFwd" runat="server" class="btn-calendar" OnClick="CalBtnMonthControl" ImageUrl="../img/arr-right.png"></asp:ImageButton>
                  </div>
                </div>
              </div>

              <!-- Today button -->
              <div class="my-auto col text-right">
                <button id="BtnMonthToday" runat="server" OnServerClick="CalBtnMonthToday" class=" btn btn-today text-uppercase">Hoje</button>
              </div>
            </div>

            <!-- VIAGEM DE IDA HIDDEN FOR NOW -->
            <div class="hide container-fluid mt-3 mb-3">
              <div class="row departure-date">
                <div class="col">
                  <div class="row p-2">
                    <div class="col">
                      Viagem de ida
                    </div>
                  </div>
                  <div class="row p-2 text-uppercase">
                    <div class="col">
                      14 de Março, Quarta
                    </div>
                  </div>
                  <div class="row p-2">
                    <div class="col">
                      <button class="btn btn-time text-uppercase">09:15</button>
                    </div>
                    <div class="col d-flex justify-content-end align-items-center">
                      25,00€
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- CALENDAR TABLE -->
            <div class="container-fluid calendar-container">
              <hr class="d-block d-sm-none">
              <header>
                <div class="row p-1 text-uppercase">
                  <h5 class="col p-1 m-0 text-center d-flex align-items-center justify-content-center">Seg</h5>
                  <h5 class="col p-1 m-0 text-center d-flex align-items-center justify-content-center">Ter</h5>
                  <h5 class="col p-1 m-0 text-center d-flex align-items-center justify-content-center">Qua</h5>
                  <h5 class="col p-1 m-0 text-center d-flex align-items-center justify-content-center">Qui</h5>
                  <h5 class="col p-1 m-0 text-center d-flex align-items-center justify-content-center">Sex</h5>
                  <h5 class="col p-1 m-0 text-center d-flex align-items-center justify-content-center">Sab</h5>
                  <h5 class="col p-1 m-0 text-center d-flex align-items-center justify-content-center">Dom</h5>
                </div>
              </header>
              <hr class="d-block d-sm-none">
              <div class="row border border-bottom-0">
                  <yoyo:CalendarTable runat="server" id="CalDate" />
              </div>
              <hr class="d-block d-sm-none">
            </div>

            <!-- VIAGEM DE VOLTA HIDDEN FOR NOW -->
            <div class="hide container-fluid mt-3 mb-3">
              <div class="row return-date">
                <div class="col">
                  <div class="row p-2">
                    <div class="col">
                      Viagem de Volta
                    </div>
                  </div>
                  <div class="row p-2 text-uppercase">
                    <div class="col">
                      Escolher
                    </div>
                  </div>
                  <div class="row p-2">
                    <div class="col d-flex justify-content-end align-items-center">
                      00,00€
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="row p-3" id="calendar-footer">
              <div class="col-6 text-nowrap">
                Ocupação:
                <span class="pl-2">
                  <img src="../img/ellipse-red.png"
                    srcset="../img/ellipse-red@2x.png 2x,
                      ../img/ellipse-red@3x.png 3x"
                    class="EllipseRed">
                    Alta
                </span>
                <span class="pl-2">
                  <img src="../img/ellipse-yellow.png"
                  srcset="../img/ellipse-yellow@2x.png 2x,
                    ../img/ellipse-yellow@3x.png 3x"
                  class="EllipseRed">
                  Média
                </span>
                <span class="pl-2">
                  <img src="../img/ellipse-green.png"
                  srcset="../img/ellipse-green@2x.png 2x,
                    ../img/ellipse-green@3x.png 3x"
                  class="EllipseRed">
                  Baixa
                </span>
              </div>
            </div> 
          </div>

          <!--PROXIMA VIAGEM-->
          <div class="col-lg-4 col-md-4">
            <div class="row p-3 text-uppercase">
              <div class="col-lg-12 d-flex justify-content-center align-self-center">
                Proxima Viagem
              </div>
            </div>
            
            <!-- PROXIMA DATA -->
            <div class="row next-trip">
              <div class="col-lg-12">
                <div class="row date">
                  <div class="col-lg-12 d-flex justify-content-center">13 de Março, Hoje</div>
                </div>
                <hr class="divider">
                <div class="row time">
                  <div class="col-10">
                    <!--HORA-->
                    <div class="row">
                      <div class="col-1">
                        <img src="../img/clock.png"
                        srcset="../img/clock@2x.png 2x,
                        ../img/clock@3x.png 3x"
                        class="clock">
                      </div>
                      <div class="col-8">
                        <strong>7:30</strong>
                      </div>
                    </div>
                    <!--PREÇO-->
                    <div class="row price price--limited-availability">
                      <div class="col-1">
                        <img src="../img/cart.png"
                        srcset="../img/cart@2x.png 2x,
                        ../img/cart@3x.png 3x"
                        class="clock">
                      </div>
                      <div class="col-8">
                          <strong>20,00€</strong>
                          <span class="ml-1">Quase cheio</span>
                      </div>
                    </div>
                  </div>
                  <div class="col-2 d-flex justify-content-end">
                    <button class="btn btn-light btn-xl d-flex justify-content-center btn-cart">  
                      <img src="../img/cart-light.png"
                        srcset="../img/cart-light@2x.png 2x,
                        ../img/cart-light@3x.png 3x"
                        class="cart-light">
                    </button>
                  </div>
                </div>
              </div>
            </div>

            <!-- PROXIMA DATA -->
            <div class="row next-trip">
              <div class="col-lg-12">
                <div class="row date">
                  <div class="col-lg-12 d-flex justify-content-center">15 de Março, Quarta</div>
                </div>
                <hr class="divider">
                <div class="row time">
                  <div class="col-8">
                    <!--HORA-->
                    <div class="row">
                      <div class="col-1">
                        <img src="../img/clock.png"
                        srcset="../img/clock@2x.png 2x,
                        ../img/clock@3x.png 3x"
                        class="clock">
                      </div>
                      <div class="col-8"><strong>19:30</strong></div>
                    </div>

                    <!--PREÇO-->
                    <div class="row price">
                      <div class="col-1">
                        <img src="../img/cart.png"
                        srcset="../img/cart@2x.png 2x,
                        ../img/cart@3x.png 3x"
                        class="clock">
                      </div>
                      <div class="col-8"><strong>20,00€</strong></div>
                    </div>
                  </div>
                  <div class="col-4 d-flex justify-content-end">
                    <button class="btn btn-light btn-xl d-flex justify-content-center btn-cart">  
                      <img src="../img/cart-light.png"
                        srcset="../img/cart-light@2x.png 2x,
                        ../img/cart-light@3x.png 3x"
                        class="cart-light">
                    </button>
                  </div>
                </div>

                <hr class="divider">
                <div class="row time">
                  <div class="col-8">
                    <!--HORA-->
                    <div class="row">
                      <div class="col-1">
                        <img src="../img/clock.png"
                        srcset="../img/clock@2x.png 2x,
                        ../img/clock@3x.png 3x"
                        class="clock">
                      </div>
                      <div class="col-8"><strong>13:30</strong></div>
                    </div>

                    <!--PREÇO-->
                    <div class="row price price--fully-available">
                      <div class="col-1">
                        <img src="../img/cart.png"
                        srcset="../img/cart@2x.png 2x,
                        ../img/cart@3x.png 3x"
                        class="clock">
                      </div>
                      <div class="col-8"><strong>20,00€</strong></div>
                    </div>
                  </div>
                  <div class="col-4 d-flex justify-content-end">
                    <button class="btn btn-light btn-xl d-flex justify-content-center btn-cart">  
                      <img src="../img/cart-light.png"
                        srcset="../img/cart-light@2x.png 2x,
                        ../img/cart-light@3x.png 3x"
                        class="cart-light">
                    </button>
                  </div>
                </div>
              </div>
            </div>


            <!-- LATERAL ONE WAY -->
            <div class="row next-trip">
              <div class="col-lg-12 p-0">
                <div class="row time pt-3">
                  <div class="col-1 pl-4">
                    <img src="../img/calendar-grey.png"
                    srcset="../img/calendar-grey@2x.png 2x,
                    ../img/calendar-grey@3x.png 3x"
                    class="calendar-grey">
                  </div>
                  <div class="col-8">15 de Março, Quarta</div>
                  <div class="col-2 text-right text-uppercase direction">Ida</div>
                </div>
                <hr class="divider">
                <div class="row time">
                  <div class="col-8">

                    <!-- LUGARES -->
                    <div class="row p-1">
                      <div class="col-1 pl-4">
                        <img src="../img/users.png"
                        srcset="../img/users@2x.png 2x,
                        ../img/users@3x.png 3x"
                        class="users">
                      </div>
                      <div class="col-8"><strong>2 Lugares</strong></div>
                    </div>

                    <!--HORA-->
                    <div class="row p-1">
                      <div class="col-1 pl-4">
                        <img src="../img/clock.png"
                        srcset="../img/clock@2x.png 2x,
                        ../img/clock@3x.png 3x"
                        class="clock">
                      </div>
                      <div class="col-8"><strong>19:30</strong></div>
                    </div>

                    <!--PREÇO-->
                    <div class="row p-1 price">
                      <div class="col-1 pl-4">
                        <img src="../img/cart.png"
                        srcset="../img/cart@2x.png 2x,
                        ../img/cart@3x.png 3x"
                        class="clock">
                      </div>
                      <div class="col-8"><strong>20,00€</strong></div>
                    </div>
                  </div>
                </div>

                <hr class="divider">

                <div class="row trip">
                  <div class="col-8">
                    <div class="row p-1 text-uppercase start-end">
                      <div class="col-12 pl-4">Origem</div>
                    </div>

                    <div class="row p-1 text-uppercase city-name">
                      <div class="col-12 pl-4">Lisboa</div>
                    </div>

                    <div class="row p-1 pt-0 access-point">
                      <div class="col-12 pl-4">Marques de Pombal</div>
                    </div>
                  </div>
                </div>

                <div class="row pt-3 trip">
                  <div class="col-8">
                    <div class="row p-1 text-uppercase start-end">
                      <div class="col-12 pl-4">Destino</div>
                    </div>

                    <div class="row p-1 text-uppercase city-name">
                      <div class="col-12 pl-4">Cascais</div>
                    </div>

                    <div class="row p-1 pt-0 access-point">
                      <div class="col-12 pl-4">Cascais shopping</div>
                    </div>
                  </div>
                </div>

                <hr class="divider w-100">

                <div class="row pricing">
                  <div class="col-4 pl-4 text-uppercase total">Total</div>
                  <div class="col-8 pr-4 text-right">
                    <div class="row">
                      <div class="col-12">2 Lugares <span class="times">x</span> <span class="price">25,00€</span></div>
                    </div>
                    <div class="row">
                      <div class="col-12 total-price">50,00€</div>
                    </div>
                  </div>
                </div>

                <hr class="divider">

                <div class="row pricing">
                  <div class="col-12">
                    <div class="row">
                      <div class="col-12 text-center promocode">Tenho um código promocional</div>
                    </div>

                    <div class="row p-4">
                      <div class="col-12 text-center">
                        <button class="btn btn-light btn-xl text-uppercase" >Reservar</button>
                      </div>
                    </div>
                  </div>
                </div>

                <hr class="divider">

                <div class="row pricing">
                  <div class="col-12">
                    <div class="row">
                      <div class="col-12 text-center promocode promocode--active">Nao tenho código promocional</div>
                    </div>

                    <div class="row p-3">
                      <div class="col-12 text-center promocode promocode--active">
                        <div class="input-group mb-3">
                          <input type="text" class="form-control" placeholder="Inserir codigo promocional" aria-label="Inserir codigo promocional" aria-describedby="basic-addon2">
                          <div class="input-group-append">
                            <span class="input-group-text" id="basic-addon2">
                              <img src="../img/check.png"
                                srcset="../img/check@2x.png 2x,
                                ../img/check@3x.png 3x"
                                class="check">
                            </span>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="row pb-3">
                      <div class="col-12 text-center">
                        <button class="btn btn-light btn-xl text-uppercase" >Reservar</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
    </section>

    <!-- DESTINATION POPOVER -->
    <div class="hide" id="destinationPopover">
        <yoyo:Popover runat="server" ID="Popover" />
    </div>

</form>

    <!-- Bootstrap core JavaScript -->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
      $(window).scroll(function(){
        $('nav').toggleClass('scrolled', $(this).scrollTop() > 50);
      });
    </script>

    <script>
      $(function(){
        $('[rel="popover"]').popover({
            container: 'body',
            html: true,
            content: function () {
                var clone = $($(this).data('popover-content')).clone(true).removeClass('hide');
                return clone;
            }
          }).click(function(e) {
              e.preventDefault();
          });
      });
    </script>

    <script>
    $(function(){
      var acc = document.getElementsByClassName("accordion");
      var i;
      
      for (i = 0; i < acc.length; i++) {
        $(acc[i]).click(function() {
          this.classList.toggle("active");
          var panel = this.nextElementSibling;

          if (panel.style.display === "block") {
            panel.style.display = "none";
          } else {
            panel.style.display = "block";
          }
        });
      }
    });
    </script>

    <div class="hide p-3" id="selectPopover">
      <div class="row pt-2 pb-2">
        <div class="col-6"><button type="button" class="btn btn-select">12:00</button></div>
        <div class="col-6"><button type="button" class="btn btn-select">15:00</button></div>
      </div>
      <div class="row pt-2 pb-2">
        <div class="col-6"><button type="button" class="btn btn-select btn-select--disabled">12:00</button></div>
        <div class="col-6"><button type="button" class="btn btn-select">15:00</button></div>
      </div>
      <div class="row pt-2 pb-2">
        <div class="col-6"><button type="button" class="btn btn-select">12:00</button></div>
        <div class="col-6"><button type="button" class="btn btn-select">15:00</button></div>
      </div>
      <div class="row pt-2 pb-2">
        <div class="col-6"><button type="button" class="btn btn-select">12:00</button></div>
        <div class="col-6"><button type="button" class="btn btn-select">15:00</button></div>
      </div>
    </div>

  </body>

</html>
