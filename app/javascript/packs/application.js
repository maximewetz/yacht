import "bootstrap";

window.onscroll = function() {scrollFunction()};

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        document.getElementById("btn btn-primary btn-lg").style.display = "block";
    } else {
        document.getElementById("btn btn-primary btn-lg").style.display = "none";
    }
}
