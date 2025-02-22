function FilterForm(){
    const vote = document.getElementById("min-rate-filter").value;
    const cost =  document.getElementById("max-price-filter").value;
    document.getElementById("rate").innerText = vote + " / 30";
    document.getElementById("price").innerText = cost + " €";
}

function UpdateRangeVoto(){
    const rangeVoto = document.forms["search-fields"]["min-rate-filter"].value;
    document.getElementById("rate").innerText = rangeVoto + " / 30";
}

function UpdateRangeCosto(){
    const rangeCosto = document.forms["search-fields"]["max-price-filter"].value;
    document.getElementById("price").innerText = rangeCosto + " €";
}

const sliders = {
    "min-rate-filter" : {"input": UpdateRangeVoto},
    "max-price-filter" : {"input": UpdateRangeCosto},
}

function InitListeners(){
    for (let id in sliders) {
		if (!document.getElementById(id)) {
			continue;
		}
        let element = document.getElementById(id);
        for(let e in sliders[id]) {
            element.addEventListener(e, sliders[id][e]);
        }
	}
}

window.addEventListener("load", () => {
    InitListeners();
    FilterForm();
})
