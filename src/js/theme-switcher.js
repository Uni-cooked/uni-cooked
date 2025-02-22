function SwapImgTheme(imgs,isLight) {
    if (imgs.length > 0) {
        imgs.forEach(element => {
            let src = element.getAttribute("src");
            src = src.replace(isLight ? "dark" : "light", isLight ? "light": "dark");
            element.setAttribute("src",src);
        });
    }
}

window.addEventListener('load', function () {
    const input = document.getElementById("theme-mode-input");
    const systemSettingLight = window.matchMedia("(prefers-color-scheme: light)").matches;
    const cookie = localStorage.getItem("theme");
    const label = document.getElementById("theme-mode-toggle");
    console.log(cookie);
    if (cookie && cookie === "light") {
        document.body.classList.add("light-theme");
        input.checked = true;
        SwapImgTheme(document.querySelectorAll("[src*='dark.svg']"),1);
    }
    
    if (!cookie && systemSettingLight) {
        document.body.classList.add("light-theme");
        input.checked = true;
        SwapImgTheme(document.querySelectorAll("[src*='dark.svg']"),1);
        localStorage.setItem("theme","light");
    } else if (!cookie) {
        localStorage.setItem("theme","dark");
    }


    input.addEventListener("change", (e) => {
        label.style.backgroundImage="url(sadasd)";
        label.style.backgroundImage="";
        if (input.checked) {
            document.body.classList.add("light-theme");
            localStorage.setItem("theme","light");
            SwapImgTheme(document.querySelectorAll("[src*='dark.svg']"),1);
        } else {
            document.body.classList.remove("light-theme");
            localStorage.setItem("theme","dark");
            SwapImgTheme(document.querySelectorAll("[src*='light.svg']"),0);
        }
    });
});