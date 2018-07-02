<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payform.aspx.cs" Inherits="MVP.Checkout.Payform" %>

<!DOCTYPE html>
<html lang="en">

    <head runat="server">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="robots" content="noindex, nofollow">

        <title />

        <!-- Bootstrap core CSS -->
        <link href="/css/bootstrap.min.css" rel="stylesheet">
        <link href="/css/styles.min.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

    </head>

    <body>
        <div class="checkout">
            <h2 class="checkout__sub-title">Pagamento</h2>
            <div class="checkout__label">Método de pagamento</div>
            <select class="checkout__input checkout__input--payment-method">
                <option value="card">Cartão de crédito</option>
            </select>

            <div class="checkout__label">Nome do titular</div>
            <input class="checkout__input checkout__input--name" type="text" id="txtCardName" placeholder="" />
                
            <div class="row checkout__card-info">
                <div class="col-md-7">
                    <div class="checkout__label">Número do cartão</div>
                    <input class="checkout__input checkout__input--card-number" type="text" id="txtCardNumber" placeholder="0000 0000 0000 0000" />
                </div>
                <div class="col-md-3 d-flex align-items-end">
                    <input class="checkout__input checkout__input--card-expiration" type="text" id="txtCardExpiry" placeholder="MM/YY" />
                </div>
                <div class="col-md-2 d-flex align-items-end">
                    <input class="checkout__input checkout__input--card-cvv" type="text" id="txtCardSecurityCode" placeholder="CVV" />
                </div>
            </div>
        </div>
    </body>
</html>
