
// Dismiss popover when clicked outside
$('html').click(function (e) {
    if (e.target.className != 'popover-marker' && $(e.target).parents('.popover-marker').length == 0) {
        $('.day').popover('hide');
    }
})
