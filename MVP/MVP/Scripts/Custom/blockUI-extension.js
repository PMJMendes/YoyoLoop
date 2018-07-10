function pageLoad() {
    if (!Sys.WebForms.PageRequestManager.getInstance().get_isInAsyncPostBack()) {
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(AjaxEnd);
        Sys.WebForms.PageRequestManager.getInstance().add_initializeRequest(AjaxBegin);
    }
}

function AjaxEnd(sender, args) {
    $.unblockUI();
}

function AjaxBegin(sender, args) {
    $.blockUI({ message: $('#divBlockUI'), baseZ: 2000 });
}