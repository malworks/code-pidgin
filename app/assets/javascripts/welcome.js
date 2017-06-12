var​ divs = document.querySelectorAll("div.feature-img");

(function() {
for (var i = 0; i < divs.length; i++){
    if (i % 2 == 0){
        divs[i].className = "odd-features-img";
    }
}​;
}
console.log("welcome.js");
