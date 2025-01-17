function FilterForm(){
    let form = document.getElementById("search-fields");
    var vote = Calculation(localStorage.getItem(vote),document.getElementById("min-rate-filter").value);
    var cost =  Calculation(localStorage.getItem(cost),document.getElementById("max-price-filter").value);
    form.addEventListener("submit", () => { 
        localStorage.setItem(vote , document.getElementById("min-rate-filter").value);
        localStorage.setItem(cost , document.getElementById("max-price-filter").value);
    });
    if(localStorage.getItem(vote) >= 1 && localStorage.getItem(cost) >= 1){
        document.getElementById("min-rate-filter").value = localStorage.getItem(vote);
        document.getElementById("max-price-filter").value = localStorage.getItem(cost);
        document.getElementById("rate").innerText = localStorage.getItem(vote) + " / 30";
        document.getElementById("price").innerText = localStorage.getItem(cost) + " €";
        localStorage.clear();
    }
}

function Calculation(x,y){
    if(x) return x;
    else return y;
}

function UpdateRangeVoto(){
    const rangeVoto = document.forms["search-fields"]["min-rate-filter"].value;
    document.getElementById("rate").innerText = rangeVoto + " / 30";
    return rangeVoto;
}

function UpdateRangeCosto(){
    const rangeCosto = document.forms["search-fields"]["max-price-filter"].value;
    document.getElementById("price").innerText = rangeCosto + " €";
    return rangeCosto;
}

const filters = {
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
