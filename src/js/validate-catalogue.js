function FilterForm(){
    let form = document.getElementById("search-fields");
    form.addEventListener("submit", () => {
        UpdateRangeCosto();
        UpdateRangeVoto();
    })
}

function UpdateRangeVoto(){
    const rangeVoto = document.forms["search-fields"]["min-rate-filter"].value;
    document.getElementById("rate").innerText = rangeVoto + " / 30";
}

function UpdateRangeCosto(){
    const rangeCosto = document.forms["search-fields"]["max-price-filter"].value;
    document.getElementById("price").innerText = rangeCosto + " €";
}

const filters = {
    "min-rate-filter" : ["change", UpdateRangeVoto],
    "max-price-filter" : ["change", UpdateRangeCosto],
    "min-rate-filter" : ["input", UpdateRangeVoto],
    "max-price-filter" : ["input", UpdateRangeCosto],
}

function Update(){
    for (var id in filters) {
		if (!document.getElementById(id)) {
			continue;
		}
		document.getElementById(id).addEventListener(filters[id][0], filters[id][1]);
	}
}

window.addEventListener("load", () => {
    Update();
    FilterForm();
})
