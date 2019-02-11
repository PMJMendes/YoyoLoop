function showPopover(source, target) {

    var place;
    if (window.matchMedia("(max-width: 767.98px)").matches) {
        place = 'bottom';
    }
    else {
        place = 'auto';
    }

    $(target).popover({
        container: 'body',
        html: true,
        content: function () {
            return $(source).removeClass('hide');
        },
        trigger: 'manual',
        placement: place,
        flip: place,
        fallbackPlacement: [place]
    });
    $(target).popover('show');

    initPopover();
}