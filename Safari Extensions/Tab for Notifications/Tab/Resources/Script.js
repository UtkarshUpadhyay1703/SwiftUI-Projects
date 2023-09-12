//function show(enabled) {
//    if (typeof enabled === "boolean") {
//        document.body.classList.toggle(`state-on`, enabled);
//        document.body.classList.toggle(`state-off`, !enabled);
//    } else {
//        document.body.classList.remove(`state-on`);
//        document.body.classList.remove(`state-off`);
//    }
//}
//
//function openPreferences() {
//    webkit.messageHandlers.controller.postMessage("open-preferences");
//}
//
//document.querySelector("button.open-preferences").addEventListener("click", openPreferences);

document.addEventListener("DOMContentLoaded", function () {
    var changeColorButton = document.getElementById("changeColorButton");
    
    changeColorButton.addEventListener("click", function () {
        // Change the background color of the current tab's active page to blue.
        safari.extension.dispatchMessage("changePageColor", { color: "blue" });
    });
});
