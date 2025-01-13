function UpdateRangeVoto(){
    const rangeVoto = document.getElementById("min-rate-filter");

    rangeVoto.addEventListener("input",() => {
        document.getElementById("rate").innerText = rangeVoto.value + " / 30";
    });
}

function UpdateRangeCosto(){
    const rangeCosto = document.getElementById("max-price-filter");

    rangeCosto.addEventListener("input", () => {
        document.getElementById("price").innerText = rangeCosto.value + " €";
    });
}

window.addEventListener("load", () => {
    UpdateRangeVoto();
    UpdateRangeCosto();
})