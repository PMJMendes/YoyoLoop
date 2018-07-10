$('document').ready(function () {
    Stripe.setPublishableKey($('#StripePublishableKey').val());
});

function createToken(e) {
    e.preventDefault();
    e.stopPropagation();
    $.blockUI();

    var frame = $('iframe[name=ifPayForm]');
    Stripe.card.createToken({
        number: frame.contents().find('#txtCardNumber').val(),
        cvc: frame.contents().find('#txtCardSecurityCode').val(),
        exp: frame.contents().find('#txtCardExpiry').val(),
        name: frame.contents().find('#txtCardName').val()
    }, stripeResponseHandler);
};

function stripeResponseHandler(status, response) {
    var $form = $('#MasterForm');
    if (response.error) {
        //need something better here
        $.unblockUI();
        alert(response.error.message);
    }
    else {
        var token = response.id;
        $('#hfStripeToken').val(token);
        $form.get(0).submit();
    }
};
