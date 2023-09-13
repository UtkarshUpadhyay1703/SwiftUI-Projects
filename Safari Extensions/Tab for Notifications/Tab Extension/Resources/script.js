document.addEventListener("DOMContentLoaded", function(event) {
    safari.extension.dispatchMessage("Hello World!");
});


// Listen for messages from the background script.
safari.self.addEventListener("message", function (event) {
    if (event.name === "changeBackgroundColor") {
        var color = event.message.color;
print("On Script")
        // Change the background color of the web page.
        document.body.style.backgroundColor = color;
    }
});

