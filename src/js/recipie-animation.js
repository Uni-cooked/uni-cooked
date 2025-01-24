window.addEventListener('load', function () {
    let loadingtext = document.getElementById("loader");
    loadingtext.classList.add("d-none");
	let recipes = document.querySelectorAll(".recipe");
    recipes.forEach((r,i) => {
        this.setInterval( (_) => {
            r.classList.add("recipe-animation")
        },i*100);
    });
});