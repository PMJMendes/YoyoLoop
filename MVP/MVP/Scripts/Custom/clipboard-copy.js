function clipboardCopy(target) {
    var copyTextarea = document.querySelector(target);
    copyTextarea.classList.remove('hide');
    copyTextarea.focus();
    copyTextarea.select();
    document.execCommand('copy');
    copyTextarea.classList.add('hide');
}