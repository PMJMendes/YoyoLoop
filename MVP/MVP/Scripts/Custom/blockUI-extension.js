function pageLoad() {
    $.blockUI.defaults.message = $('#divBlockUI');
    $.blockUI.defaults.baseZ = 2000;
    $.blockUI.defaults.css = {
        padding: 0,
        margin: 0,
        width: '30%',
        top: '40%',
        left: '35%',
        textAlign: 'center',
        cursor: 'wait'
    }
    $.blockUI.defaults.overlayCSS = {
        backgroundColor: '#000',
        opacity: 0.3,
        cursor: 'wait'
    }

    if (!Sys.WebForms.PageRequestManager.getInstance().get_isInAsyncPostBack()) {
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(AjaxEnd);
        Sys.WebForms.PageRequestManager.getInstance().add_initializeRequest(AjaxBegin);
    }
}