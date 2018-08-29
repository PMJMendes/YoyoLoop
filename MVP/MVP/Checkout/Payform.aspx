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
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">

    </head>

    <body>
        <div class="checkout">

            <div class="checkout__label"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Checkout_Payform_tbCardHolderName_Label%>"/></div>
            <input class="checkout__input checkout__input--name" type="text" id="txtCardName" placeholder="" />
                
            <div class="row checkout__card-info">
                <div class="col-md-7">
                    <div class="checkout__label"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Checkout_Payform_tbCardNumber_Label%>"/></div>
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
