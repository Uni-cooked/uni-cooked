function Button(){
    var confirm;
    if(document.getElementById("student-name-in").value == "" || document.getElementById("student-psw-in").value == "" ){
        Disable(confirm,"submit-btn");
        var check = document.getElementById("err-sign-in");
		if(check) check.remove();
        var p = document.createElement("p");
        p.setAttribute("aria-live","assertive");
        p.setAttribute("aria-atomic","true");
        p.setAttribute("id","err-sign-in");
        p.classList.add("err-msg");
        p.innerHTML = "Le credenziali inserite non sono corrette";
		const parent = document.getElementById("submit-btn").parentNode;
		parent.appendChild(p);
    }else{
        var check = document.getElementById("err-sign-in");
		if(check) check.remove();
        Enable(confirm,"submit-btn");
    }
}

function Disable(button,id){
    button = document.getElementById(id);
    button.classList.add("disabled-btn");
    button.disabled = true;
}

function Enable(button,id){
    button = document.getElementById(id);
    button.classList.remove("disabled-btn");
    button.disabled = false;
}

const controllers = {
	"student-name-in" : ["input", Button],
	"student-psw-in" : ["input", Button ],
};

function UpdateButton(){
    for (var id in controllers) {
		if (!document.getElementById(id)) {
			continue;
		}
		document.getElementById(id).addEventListener(controllers[id][0], controllers[id][1]);
	}
}

window.addEventListener("load", () => {
    Button()
    UpdateButton()
})
