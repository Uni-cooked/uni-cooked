import { createError, eliminateError, ToggleConfirmButton,ShowPsw } from './utils.js'

function ValidateAll(e) {
    if (!validateUser()) {
        e.preventDefault();
    } 
}

function ToggleLoginBtn() {
    const user = document.getElementById("student-name-in").value.trim();
    const psw = document.getElementById("student-psw-in").value.trim();

    if (user == "" && psw == "") {
        ToggleConfirmButton(0);
    } else {
        ToggleConfirmButton(1);
    }
}

function validateUser() {
    const user = document.getElementById("student-name-in").value.trim();

    const errorString = document.getElementById("err-sign-in");
    eliminateError(errorString);

    if (user.search(/^[a-zA-ZÀ-Ýß-ÿ0-9]{1,15}$/) == -1) {
        let p = createError("err-sign-in");
        p.innerText = "Le credenziali inserite non sono corrette";
        const beforeElement = document.getElementById("submit-btn")
        const parent = beforeElement.parentNode;
        parent.insertBefore(p,beforeElement);
        return false;
    }
    return true;
}


const controllers = {
	"student-name-in" : {
        "change": validateUser,
        "input": ToggleLoginBtn
    },
	"student-psw-in" : {"input": ToggleLoginBtn },
    "credentials": {"submit": ValidateAll},
    "show-psw" : {"click": function () {ShowPsw(this,"student-psw-in");} }
};

function InitListeners(){
    for (let id in controllers) {
		if (!document.getElementById(id)) {
			continue;
		}
        let element = document.getElementById(id);
        for(let e in controllers[id]) {
            element.addEventListener(e, controllers[id][e]);
        }
	}
}

window.addEventListener("load", () => {
    InitListeners();
    ToggleConfirmButton(0);
})
