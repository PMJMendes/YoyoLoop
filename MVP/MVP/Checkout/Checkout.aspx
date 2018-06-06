<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="MVP.Checkout.Checkout" %>

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
                <a class="nav-link js-scroll-trigger text-uppercase" href="#services">As minhas viagens</a>
            </li>
            <li class="nav-item my-auto">
                <img src="../img/userprofile-red.png"
                    srcset="../img/userprofile-red@2x.png 2x,
                            ../img/userprofile-red@3x.png 3x"
                    class="userprofile-red">
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <input type="hidden" name="hfStripeToken" id="hfStripeToken" />

    <div class="checkout">
      <div class="checkout__container checkout__container--first">
        <div class="container-fluid">
            <div class="row">
              <div class="col-md-8">
                <h1 class="checkout__main-title">Pagar e Confirmar</h1>

                <h2 class="checkout__sub-title">Pagamento</h2>
                <div class="checkout__label">Método de pagamento</div>
                <select class="checkout__input checkout__input--payment-method">
                  <option value="card">Cartão de crédito</option>
                </select>

                <div class="checkout__label">Nome do titular</div>
                <input class="checkout__input checkout__input--name" type="text" id="txtCardName" placeholder="">
                
                <div class="row checkout__card-info">
                    <div class="col-md-7">
                        <div class="checkout__label">Número do cartão</div>
                        <input class="checkout__input checkout__input--card-number" type="text" id="txtCardNumber" placeholder="0000 0000 0000 0000">
                    </div>
                    <div class="col-md-3 d-flex align-items-end">
                        <input class="checkout__input checkout__input--card-expiration" type="text" id="txtCardExpiry" placeholder="MM/YY"> 
                    </div>
                    <div class="col-md-2 d-flex align-items-end">
                        <input class="checkout__input checkout__input--card-cvv" type="text" id="txtCardSecurityCode" placeholder="CVV"> 
                    </div>
                </div>

            <!-- HIDDEN FOR NOW -->
            <div class="hide">
                <div class="mt-5 mb-5 checkout__separator"></div>

                <div class="row checkout__billing">
                    <div class="col-md-8">
                        <h2 class="checkout__sub-title">Detalhes de facturação</h2>
                    </div>
                    <div class="checkout__billing--checkbox col-md-4 d-flex align-items-middle flex-row-reverse pt-2">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="company">
                            <label class="form-check-label" for="company">Empresa</label>
                          </div>                        
                    </div>
                </div>

                <div class="checkout__label">Nome</div>
                <input class="checkout__input checkout__input--billing-name" type="text" placeholder="Pedro Meireles">

                <div class="checkout__label">Nome da empresa</div>
                <input class="checkout__input checkout__input--company" type="text">

                <div class="checkout__label">NIF</div>
                <input class="checkout__input checkout__input--nif" type="text" placeholder="000 000 000">
                
                <div class="checkout__label">Morada</div>
                <input class="checkout__input checkout__input--company" type="text">

                <div class="row ml-0">
                  <div class="row ml-0 mr-5 checkout__input--postal-code">
                    <div class="checkout__label">Código postal</div>
                    <input class="checkout__input" type="text" placeholder="0000-000">
                  </div>
                  <div class="row ml-0 checkout__input--city">
                    <div class="checkout__label">Cidade</div>
                    <select class="checkout__input checkout__input--city">
                      <option value="Lisboa">Lisboa</option>
                    </select>
                  </div>
                </div>
            </div>
            <!-- END OF HIDE -->

                <div class="mt-5 mb-5 checkout__separator"></div>

                <div class="checkout__label">Código promocional</div>
                <input class="checkout__input checkout__input--promocode" type="text" placeholder="">

            </div>

              <div class="col-md-4 left-menu">
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
                        <div class="col-8"><%= pageData.StartTime.ToString("dd") %> de <%= pageData.StartTime.ToString("MMMM") %>, <%= pageData.StartTime.ToString("dddd") %></div>
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
                            <div class="col-8"><strong><%= pageData.Seats.ToString() %> <%= pageData.Seats == 1 ? "Lugar" : "Lugares" %></strong></div>
                          </div>
      
                          <!--HORA-->
                          <div class="row p-1">
                            <div class="col-1 pl-4">
                              <img src="../img/clock.png"
                              srcset="../img/clock@2x.png 2x,
                              ../img/clock@3x.png 3x"
                              class="clock">
                            </div>
                            <div class="col-8"><strong><%= pageData.StartTime.ToString("HH\\:mm") %></strong></div>
                          </div>
      
                          <!--PREÇO-->
                          <div class="row p-1 price">
                            <div class="col-1 pl-4">
                              <img src="../img/cart.png"
                              srcset="../img/cart@2x.png 2x,
                              ../img/cart@3x.png 3x"
                              class="clock">
                            </div>
                            <div class="col-8"><strong><%= pageData.Cost.ToString("C") %></strong></div>
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
                            <div class="col-12 pl-4"><%= pageData.StartRegionName %></div>
                          </div>
      
                          <div class="row p-1 pt-0 access-point">
                            <div class="col-12 pl-4"><%= pageData.StartAPName %></div>
                          </div>
                        </div>
                      </div>
      
                      <div class="row pt-3 trip">
                        <div class="col-8">
                          <div class="row p-1 text-uppercase start-end">
                            <div class="col-12 pl-4">Destino</div>
                          </div>
      
                          <div class="row p-1 text-uppercase city-name">
                            <div class="col-12 pl-4"><%= pageData.EndRegionName %></div>
                          </div>
      
                          <div class="row p-1 pt-0 access-point">
                            <div class="col-12 pl-4"><%= pageData.EndAPName %></div>
                          </div>
                        </div>
                      </div>
      
                      <hr class="divider w-100">
      
                      <div class="row pricing">
                        <div class="col-4 pl-4 text-uppercase total">Total</div>
                        <div class="col-8 pr-4 text-right">
                          <div class="row">
                            <div class="col-12"><%= pageData.Seats.ToString() %> <%= pageData.Seats == 1 ? "Lugar" : "Lugares" %><span class="times"> x</span> <span class="price"><%= (pageData.Seats != 0 ? (pageData.Cost / pageData.Seats) : 0).ToString("C") %></span></div>
                          </div>
                          <div class="row">
                            <div class="col-12 total-price"><%= pageData.Cost.ToString("C") %></div>
                          </div>
                        </div>
                      </div>
    
                    </div>
                  </div>
              </div>
            </div>

            <div class="row">
                <div class="col-md-8">
                    <div class="mt-5 mb-5 checkout__separator"></div>

                    <h3 class="checkout__sub-title-policy">Política de cancelamento</h3>
                    <p class="checkout__policy-text">
                        Podes cancelar a tua viagem até 48 horas antes da hora de partida. 
                        O valor que pagaste será transformado em crédito e podes encontrá-lo
                        na tua conta para utilizar em futuras viagens.
                    </p>
    
                    <div class="checkout__accept-terms-condition row pt-5 pb-5">
                        <div class="col-md-6">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="terms-and-conditions">
                                <label class="checkout__terms-conditions form-check-label" for="terms-and-conditions">Aceito os <a class="" href="">Termos & condiçōes</a></label>
                            </div>  
                        </div>
                        <div class="checkout__accept-terms-condition--pay col-md-6">
                            <button class="btn btn-light btn-xl text-uppercase" id="btnPay">Pagar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>  
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

    <!-- Stripe JavaScript -->
    <script type="text/javascript" src="https://js.stripe.com/v2/"></script>

    <script type="text/javascript">

	    $('document').ready(function () {
		    Stripe.setPublishableKey('<%=stripePublishableKey%>');

            $('#btnPay').on('click', function (e)
            {
			    e.preventDefault();
       	        e.stopPropagation();

                Stripe.card.createToken({
                    number: $('#txtCardNumber').val(), 
				    cvc: $('#txtCardSecurityCode').val(),
				    exp: $('#txtCardExpiry').val(),
                    name:  $('#txtCardName').val()
			    }, stripeResponseHandler);
		    });

            function stripeResponseHandler(status, response)
            {
			    var $form = $('#form1');
                if (response.error)
                {
                    //need something better here
				    alert(response.error.message);
                }
                else
                {
				    var token = response.id;
				    $('#hfStripeToken').val(token);
				    $form.get(0).submit();
			    }
		    }
	    });
    </script>

  </body>

</html>
