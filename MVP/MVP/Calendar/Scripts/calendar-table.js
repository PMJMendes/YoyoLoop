
// Dismiss popover when clicked outside or on an active time button
$('html').click(function (e) {
    if (e.target.className != 'popover-marker' && ($(e.target).parents('.popover-marker').length == 0 || ( $(e.target).hasClass('btn') && $(e.target).attr('href') != undefined ))) {
        $('.day').popover('hide');
    }
})
