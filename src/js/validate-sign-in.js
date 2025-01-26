function Button(){
    var confirm;
    if(document.getElementById("student-name-in").value == "" || document.getElementById("student-psw-in").value == "" ){
        Disable(confirm,"submit-btn");
    }else{
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