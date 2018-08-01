function initPopover() {
    var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
        $(acc[i]).click(function () {
            $('.accordion').removeClass('active');
            $('.panel').removeClass('show');

            var panel = this.nextElementSibling;
            if ($(panel).hasClass('show')) {
                $(panel).removeClass('show')
            } else {
                this.classList.toggle("active");
                $(panel).addClass('show');
            }
        });
    }
};
