import { createError, eliminateError, ToggleConfirmButton,ShowPsw,RemoveAllErrors } from './utils.js'

function ValidateAll(e) {
    if (!validateUser()) {
        e.preventDefault();
    } 
}

function ToggleLoginBtn() {
    const user = document.getElementById("student-name-in").value.trim();
    const psw = document.getElementById("student-psw-in").value.trim();

    if (user == "" || psw == "") {
        ToggleConfirmButton(0);
    } else {
        ToggleConfirmButton(1);
    }
}

function validateUser() {
    const input = document.getElementById("student-name-in");
    const user = input.value.trim();

    const errorString = document.getElementById("err-name");
    eliminateError(errorString);

    if(user.length < 1){
		let p = createError("err-name");
	    p.innerHTML = "Il nome utente è un campo obbligatorio";
		const parent = input.parentNode;
		parent.appendChild(p);
		return false;
	}
    return true;
}

function validatePsw() {
    const input = document.getElementById("student-psw-in");
    const psw = input.value.trim();

    const errorString = document.getElementById("err-psw");
    eliminateError(errorString);

    if(psw.length < 1){
		let p = createError("err-psw");
	    p.innerHTML = "La <span lang='en'>password</span> è un campo obbligatorio";
		const parent = input.parentNode;
		parent.appendChild(p);
		return false;
	}
    return true;
}

const controllers = {
	"student-name-in" : {
        "focusout": validateUser,
        "input": ToggleLoginBtn
    },
	"student-psw-in" : {
        "focusout": validatePsw,
        "input": ToggleLoginBtn 
    },
    "credentials": {
        "submit": ValidateAll,
        "reset": ()=> {
            ToggleLoginBtn();
            RemoveAllErrors();
        } 
    },
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
