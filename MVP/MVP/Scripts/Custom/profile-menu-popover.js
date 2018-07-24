$(document).ready(function () {
    $('#ProfileMenuLink').popover({
        container: 'body',
        html: true,
        placement: 'bottom',
        trigger: 'focus',
        content: function () {
            return $('#ProfileMenu').clone().removeClass('hide');
        }
    });
});