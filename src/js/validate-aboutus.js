function validateFormRequest(){
    let form = document.getElementById("request");
    form.addEventListener("submit", (e) => {
        if(!validateRequest()){
            e.preventDefault();
            document.getElementById("confirm").classList.add("disabled-btn");
            document.getElementById("confirm").disabled = true;
        }
    });
}

function validateRequest(){
    var Request = document.forms["request"]["recipie-request-input"].value;

    if(Request.length < 20){
        var check = document.getElementById("err-request");
        if(check) check.remove();
        var p = document.createElement("p");
	    p.setAttribute("role","alert");
	    p.setAttribute("id","err-request");
	    p.classList.add("err-msg");
        p.innerText = "La lunghezza minima è di 20 caratteri";
        const parent = document.getElementById("recipie-request-input").parentNode;
        parent.appendChild(p);
        return false;

    } else if (Request.length > 500){
        var check = document.getElementById("err-request");
        if(check) check.remove();
        var p = document.createElement("p");
	    p.setAttribute("role","alert");
	    p.setAttribute("id","err-request");
	    p.classList.add("err-msg");
        p.innerText = "La lunghezza massima è di 500 caratteri";
        const parent = document.getElementById("recipie-request-input").parentNode;
        parent.appendChild(p);
        return false;
    }
    
    var check = document.getElementById("err-request");
    if(check) check.remove();
    document.getElementById("confirm").disabled = false;
    document.getElementById("confirm").classList.remove("disabled-btn");
    return true;
}

const inputRequest = {
    "recipie-request-input" : ["change", validateRequest ],
};

window.addEventListener("load", () => {
    for (var id in inputRequest) {
		if (!document.getElementById(id)) {
			continue;
		}
		document.getElementById(id).addEventListener(inputRequest[id][0], inputRequest[id][1]);
	}
    validateFormRequest();
});