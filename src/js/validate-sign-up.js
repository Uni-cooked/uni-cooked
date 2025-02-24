import { createError, eliminateError, ToggleConfirmButton,ShowPsw,RemoveAllErrors } from './utils.js'

function ValidateAll(e) {
    if (!validateUsername() || !validateStudent() || !validateEmail() || !validatePassword() || !validatePasswordConfirm()) {
        e.preventDefault();
    } 
}

function ToggleSignUpBtn() {
    const username = document.getElementById("student-name-up").value.trim();
	const student = document.getElementById("student-cat-up");
	const email = document.getElementById("student-mail-up").value.trim();
	const psw = document.getElementById('student-psw-up').value.trim();
	const rpsw = document.getElementById('student-repeat-psw-up').value.trim();

    if ((username.length < 1 || username.length > 15) || student.options[student.selectedIndex].hasAttribute("hidden") || email.length < 1 || psw.length < 4 || rpsw =="") {
		ToggleConfirmButton(0);
    } else {
		ToggleConfirmButton(1);
    }
}


function validateUsername() {
	const input = document.getElementById("student-name-up");
	const username = input.value.trim();

	const errorString = document.getElementById("err-name");
	eliminateError(errorString);

    if(username.length < 1){
		let p = createError("err-name");
	    p.innerText = "Il nome utente è un campo obbligatorio";
		const parent = input.parentNode;
		parent.appendChild(p);
		return false;
	}

	if(username.length > 15){
		let p = createError("err-name");
	    p.innerText = "Il nome utente non deve essere più lungo di 15 caratteri";
		const parent = input.parentNode;
		parent.appendChild(p);
		return false;
	}

	if (username.search(/^[a-zA-ZÀ-Ýß-ÿ0-9]{1,15}$/) == -1) {
		let p = createError("err-name");
	    p.innerHTML = "Nome utente non valido, usa solo lettere o numeri.";
		const parent = input.parentNode;
		parent.appendChild(p);
		return false;
	}
	return true;
}

function validateStudent(){
    const input = document.getElementById("student-cat-up");
	const student = input.value.trim();

	const errorString = document.getElementById("err-student");
	eliminateError(errorString);

    if(student == "Seleziona una opzione"){
		let p = createError("err-student")
        p.innerText = "Seleziona una categoria";
		const parent = input.parentNode;
		parent.appendChild(p);
        return false;
    }
    return true;
}

function validateEmail(){
    const input = document.getElementById("student-mail-up");
	const email = input.value.trim();

	const errorString = document.getElementById("err-mail");
	eliminateError(errorString);

    
    if(email.length < 1){
		let p = createError("err-mail"); 
		p.innerHTML = "L'<span lang='en'>email</span> è un campo obbligatorio";
		const parent = input.parentNode;
		parent.appendChild(p);
        return false;
	}

    if(email.search(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/) == -1){
		let p = createError("err-mail"); 
		p.innerHTML = "L'<span lang='en'>email</span> scelta non è un indirizzo valido";
		const parent = input.parentNode;
		parent.appendChild(p);
        return false;
    }
    return true;
}

function validatePassword() {
	const input  = document.getElementById('student-psw-up');
	const psw = input.value.trim();

	const errorString = document.getElementById("err-psw");
	eliminateError(errorString);
    

	if (psw.length < 4) {
		let p = createError("err-psw");
		p.innerHTML = "La <span lang='en'>password</span> deve essere lunga almeno 4 caratteri";
		const parent = input.parentNode;
		parent.appendChild(p);
		return false;
	}

	if (psw.search(/^(?=.*[a-zß-ÿ])(?=.*[A-ZÀ-Ý])(?=.*[\d])(?=.*[.,!?@+\-_€$%&^*<>]).{4,}$/) == -1) {
		let p = createError("err-psw");
		p.innerHTML = "La <span lang='en'>password</span> deve avere almeno una lettera maiuscola, una minuscola, un numero e un carattere speciale";
		const parent = input.parentNode;
		parent.appendChild(p);
		return false;
	}
	return true;
}

function validatePasswordConfirm() {
	const input = document.getElementById('student-repeat-psw-up');
	const psw = document.getElementById('student-psw-up').value.trim();
	const rpsw = document.getElementById('student-repeat-psw-up').value.trim();

	const errorString = document.getElementById("err-repeat-psw");
	eliminateError(errorString);

	if (psw != rpsw) {
		let p = createError("err-repeat-psw");
		p.innerHTML = "Le <span lang='en'>password</lang> non coincidono";
		const parent = input.parentNode;
		parent.appendChild(p);
		return false;
	}
	return true;

}

const listeners = {
	"student-name-up" : {
		"focusout": validateUsername,
		"input": ToggleSignUpBtn
	},
	"student-mail-up" : {
		"focusout": validateEmail,
		"input": ToggleSignUpBtn
	},
	"student-cat-up" : {
		"focusout": validateStudent,
		"input": ToggleSignUpBtn
	},

	"student-psw-up" : {
		"focusout": validatePassword ,
		"input": ToggleSignUpBtn
	},
	
	"student-repeat-psw-up" : {
		"focusout": validatePasswordConfirm,
		"input": ToggleSignUpBtn
	},

	"show-psw" : {"click": function () {ShowPsw(this,"student-psw-up");} },
	"show-psw-rep" : {"click": function () {ShowPsw(this,"student-repeat-psw-up");}},

	"credentials": {
		"submit": ValidateAll,
		"reset": ()=> {
			ToggleSignUpBtn();
			RemoveAllErrors();
		} 
	},
};

function InitListeners(){
    for (let id in listeners) {
		if (!document.getElementById(id)) {
			continue;
		}
        let element = document.getElementById(id);
        for(let e in listeners[id]) {
            element.addEventListener(e, listeners[id][e]);
        }
	}
}

window.addEventListener('load', () => {
	InitListeners();
	ToggleConfirmButton(0);
});

