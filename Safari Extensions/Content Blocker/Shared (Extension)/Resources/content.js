browser.runtime.sendMessage({ greeting: "hello" }).then((response) => {
    console.log("Received response: ", response);
});

browser.runtime.onMessage.addListener((request, sender, sendResponse) => {
    console.log("Received request: ", request);
});

// Listen for tab activation
safari.application.addEventListener("activate", function (event) {
    var activeTab = event.target; // Get the active tab
    console.log("1111111111111Tab activated:", activeTab.url);
});

// Listen for tab deactivation
safari.application.addEventListener("deactivate", function (event) {
    var deactivatedTab = event.target; // Get the deactivated tab
    console.log("22222222222Tab deactivated:", deactivatedTab.url);
});

