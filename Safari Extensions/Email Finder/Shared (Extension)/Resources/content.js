var emails = getEmails();
console.log("emails: ", emails);

browser.runtime.sendMessage({type: "Read emails response", emails: emails == null ? [""] : emails});

function getEmails() {
    var search_in = document.body.innerHTML;
    string_context = search_in.toString();
    array_mails = string_context.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-0._-]+\.[a-zA-z0-9._-]+)/gi);
    return array_mails;
}
