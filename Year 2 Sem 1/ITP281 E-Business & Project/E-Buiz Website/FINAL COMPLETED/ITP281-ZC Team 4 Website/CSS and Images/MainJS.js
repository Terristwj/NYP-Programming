function dropdownFunc() {
    var x = document.getElementsByClassName("nBox0");
    var y = document.getElementsByClassName("DDNItem");
    if (x[0].style.height === 43 + 37 * y.length + 2 + "px") {
        x[0].style.height = "43px";
    } else {
        x[0].style.height = 43 + 37 * y.length + 2 + "px";
    }
}

function currentPage() {
    var x = document.getElementsByClassName("DDNItem");
    var y = document.getElementsByClassName("nItems")
    var i = getPageNum();
    if (i !== -1) {
        x[i].style.background = "rgba(255, 192, 203, 0.75)";
        y[i].style.background = "rgba(255, 192, 203, 0.75)";
        //console.log(x[i]);
        //console.log(y[i]);
    }
}