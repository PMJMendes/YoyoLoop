$(document).ready(function () {
    $.blockUI.defaults.baseZ = 20000;
});

$(document).ajaxStart($.blockUI({ message: $('#divBlockUI') })).ajaxStop($.unblockUI);