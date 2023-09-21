document.addEventListener("DOMContentLoaded", function() {
    console.log("#@@#@#@#@##@##@");
    findEmails();
});

function findEmails() {
    browser.tabs.executeScript({file:"content.js"});
}

browser.runtime.onMessage.addListener((request) => {
    if(request.type == "Read emails response") {
        let countDiv = document.getElementById("email_list");
        
        var unique = request.emails.filter(onlyUnique);
        
        var filtered = unique.filter(function (el) {
            return el != null && el != "" && el != " ";
        });
        
        if (filtered != null && filtered.length > 0) {
            
            var ul = document.createElement('ul');
            ul.setAttribute('id','proList');
            
            countDiv.appendChild(ul);
            
            filtered.forEach(renderProdectList);
            
            function renderProdectList(element, index, arr) {
                var li = document.createElement('li');
                li.setAttribute('class','item');
                
                ul.appendChild(li);
                
                li.innerHTML=li.innerHTML + element;
            }
        }
        else {
            countDiv.appendChild(document.createTextNode('No emails on this page.'));
        }
    }
});

function onlyUnique(value, index, self) {
    return self.indexOf(value) === index;
}
