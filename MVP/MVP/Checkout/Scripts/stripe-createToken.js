$('document').ready(function () {
    Stripe.setPublishableKey($('#StripePublishableKey').val());
});

function createToken(e) {
    e.preventDefault();
    e.stopPropagation();
    if (ValidateTerms()) {
        $.blockUI();
        var frame = $('iframe[name=ifPayForm]');
        Stripe.card.createToken({
            number: frame.contents().find('#txtCardNumber').val(),
            cvc: frame.contents().find('#txtCardSecurityCode').val(),
            exp: frame.contents().find('#txtCardExpiry').val(),
            name: frame.contents().find('#txtCardName').val()
        }, stripeResponseHandler);
    }
};

function stripeResponseHandler(status, response) {
    var $form = $('#MasterForm');
    if (response.error) {
        $.unblockUI();
        if (response.error.type === 'card_error') {
            $('#hfStripeError').val(response.error.code);
        }
        else {
            $('#hfStripeError').val('generic_error');
        }
        __doPostBack('upCheckoutPaymentForm', '');
    }
    else {
        var token = response.id;
        $('#hfStripeToken').val(token);
        __doPostBack('upCheckoutPaymentForm', '');
    }
};

function ValidateTerms() {
    if ($('#cbTerms').prop('checked')) {
        $('#TermsError').addClass('checkout__terms-conditions--invisible');
        return true;
    }
    else {
        $('#TermsError').removeClass('checkout__terms-conditions--invisible');
        return false;
    }
}
