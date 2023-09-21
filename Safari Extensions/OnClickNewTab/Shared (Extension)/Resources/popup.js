console.log("Hello World!", browser);

document.getElementById('openNewTab').addEventListener('click', function() {
    console.log("Hello World!");
   var newTab = window.open('https://www.linkedin.com','_blank');
    if(newTab){
        newTab.focus();
    }else{
        alert("Not been opened !!!!!");
    }
});
