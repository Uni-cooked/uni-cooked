window.addEventListener('load', function () {
    let blur = document.getElementById("content-blur");
    blur.addEventListener("click",()=>{
        let hamb = this.document.getElementById("ham-checkbox");
        if (hamb) {
            hamb.checked = false;
        }
    });
});