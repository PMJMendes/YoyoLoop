// THIS BLOCKS ON ANY AJAX CALLS
$.extend({
    initializeUiBlocking: function () {
        $.blockUI.defaults.baseZ = 20000;
        var request = Sys.WebForms.PageRequestManager.getInstance();
        request.add_initializeRequest(function (sender, args) {
            request.get_isInAsyncPostBack() && args.set_cancel(true);
        });
        request.add_beginRequest(function () { $.blockUI({ message: $('#divBlockUI') }); });
        request.add_endRequest(function () { $.unblockUI(); });
    }
});

$(document).ready(function () {
    $.initializeUiBlocking();
});