$('document').ready(function () {
    Stripe.setPublishableKey($('#StripePublishableKey').val());
});

function createToken(e) {
    e.preventDefault();
    e.stopPropagation();
    if ($('#cbTerms').prop('checked')) {
        $('#TermsError').addClass('checkout__terms-conditions--invisible');
        $.blockUI();

        var frame = $('iframe[name=ifPayForm]');
        Stripe.card.createToken({
            number: frame.contents().find('#txtCardNumber').val(),
            cvc: frame.contents().find('#txtCardSecurityCode').val(),
            exp: frame.contents().find('#txtCardExpiry').val(),
            name: frame.contents().find('#txtCardName').val()
        }, stripeResponseHandler);
    }
    else {
        $('#TermsError').removeClass('checkout__terms-conditions--invisible');
    }
};

function stripeResponseHandler(status, response) {
    var $form = $('#MasterForm');
    if (response.error) {
        $.unblockUI();
        $('#hfStripeError').val(response.error.message);
        $form.get(0).submit();
    }
    else {
        var token = response.id;
        $('#hfStripeToken').val(token);
        $form.get(0).submit();
    }
};
