
// Dismiss popover when clicked outside
$('html').click(function (e) {
    if (e.target.className != 'popover-marker' && $(e.target).parents('.popover-marker').length == 0 && e.target.className != 'day col p-2 border border-left-0 border-top-0 text-truncate') {
        $('.day').popover('hide');
    }
})
