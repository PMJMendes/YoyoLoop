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

    <input type="hidden" name="hfStripeToken" id="hfStripeToken" />

    <div class="profile">
      <div class="profile__container profile__container--first">
        <div class="container-fluid">
            <div class="row">
              <div class="col-md-8">
                <h1 class="profile__main-title">Pagar e Confirmar</h1>

                <h2 class="profile__sub-title">Pagamento</h2>

                <div class="profile__label">Método de pagamento</div>
                <select class="profile__input profile__input--payment-method">
                  <option value="card">Cartão de crédito</option>
                </select>

                <div class="profile__label">Nome do titular</div>
                <input class="profile__input profile__input--name" type="text" id="txtCardName" Value="<%= localData.CardName %>" placeholder="">
                
                <div class="profile__label">Número do cartão</div>
                <input class="profile__input profile__input--card-number" type="text" id="txtCardNumber" Value="<%= localData.CardNumber %>" placeholder="0000 0000 0000 0000">
                
                <div class="profile__label">Validade</div>
                <input class="profile__input profile__input--postal-code" type="text" id="txtCardExpiryMonth" Value="<%= localData.CardMonth %>" placeholder="MM">
                /
                <input class="profile__input profile__input--postal-code" type="text" id="txtCardExpiryYear" Value="<%= localData.CardYear %>" placeholder="YY">

                <div class="profile__label">CVV</div>
                <input class="profile__input profile__input--postal-code" type="text" id="txtCardSecurityCode" Value="<%= localData.CardCVV %>" placeholder="123">
              </div>


      <div class="col-lg-4 col-md-4">
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
                  <div class="col-8"><%= pageData.StartTime.ToString("dd") %> de <%= pageData.StartTime.ToString("MMMM").ToUpper() %>, <%= pageData.StartTime.ToString("dddd") %></div>
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
                      <div class="col-8"><strong><%= pageData.Seats.ToString() %> Lugar(es)</strong></div>
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
                      <div class="col-8"><strong><%= pageData.Cost.ToString() %> €</strong></div>
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
                      <div class="col-12 pl-4"><%= pageData.StartAPName  %></div>
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
                      <div class="col-12 total-price"><%= pageData.Cost %> €</div>
                    </div>
                  </div>
                </div>
            </div>
        </div>
                <div class="mt-5 mb-5 profile__separator"></div>
                <button class="mb-5 profile__btn" id="btnPay">Pagar</button>
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
				    exp_month: $('#txtCardExpiryMonth').val(),
                    exp_year: $('#txtCardExpiryYear').val(),
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
