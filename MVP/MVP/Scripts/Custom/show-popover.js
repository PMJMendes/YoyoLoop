function showPopover(source, target) {
    $(target).popover({
        container: 'body',
        html: true,
        content: function () {
            return $(source).removeClass('hide');
        },
        trigger: 'manual',
        placement: 'bottom',
        flip: 'bottom',
        fallbackPlacement: ['bottom']
    });
    $(target).popover('show');

    initPopover();
}