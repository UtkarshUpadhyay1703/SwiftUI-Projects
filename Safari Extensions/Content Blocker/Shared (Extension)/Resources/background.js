browser.runtime.onMessage.addListener((request, sender, sendResponse) => {
    console.log("Received request: ", request);

    if (request.greeting === "hello")
        sendResponse({ farewell: "goodbye" });
});

//document.addEventListener("DOMContentLoaded", function() {
//    console.log("!!!!DOMContentLoaded!!!!!")
//});

safari.application.addEventListener("DOMContentLoaded", function(event) {
    // This event is triggered when a new window is opened or when Safari starts.
    // You can access the newly opened window using event.target.

    var newWindow = event.target;
    var windowName = newWindow.name;
    console.log("@@@@@@@@@@@@@")
    console.log("New window DOMContentLoaded. Name: " + windowName);
});

safari.application.addEventListener("onload", function(event) {
    // This event is triggered when a window or tab is activated.
    // You can access the active window using event.target.

    var activeWindow = event.target;
    var windowName = activeWindow.name;

    console.log("Window onload. Name: " + windowName);
});

safari.application.addEventListener("click", function(event) {
    // This event is triggered when a window or tab is closed.
    // You can access the closed window using event.target.

    var closedWindow = event.target;
    var windowName = closedWindow.name;

    console.log("Window click. Name: " + windowName);
});
