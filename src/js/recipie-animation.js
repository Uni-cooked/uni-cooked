window.addEventListener('load', function () {
    let loadingtext = document.getElementById("loader");
    loadingtext.style.display = "none";
	let recipes = document.querySelectorAll(".recipe");
    recipes.forEach((r,i) => {
        this.setInterval( (_) => {
            r.classList.add("recipe-animation")
        },i*100);
    });
});