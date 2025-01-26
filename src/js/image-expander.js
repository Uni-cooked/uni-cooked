window.addEventListener('load', function () {
    let image = this.document.getElementById("recipe-img");
    image.classList.add("expandable-img");
    image.addEventListener("click", expand = function (_) {
        let img = this;
        let containter = document.getElementById("recipe-main-info");
        img.classList.add("expandend-img");
        img.removeEventListener('click', expand);
        document.body.classList.add("overflow-none");
        let bg = document.createElement("div");
        bg.classList.add("expanded-bg");
        bg.addEventListener("click", function (_)  {
            img.classList.remove("expandend-img");
            img.addEventListener("click",expand);
            document.body.classList.remove("overflow-none");
            this.remove();
        });
        containter.appendChild(bg);
    });
});