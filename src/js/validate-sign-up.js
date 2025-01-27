function validateUserSignup() {

	let form = document.getElementById("credentials");

	form.addEventListener("submit", function (event) {
		if (! (validateNewUsername() && validateStudent() && validateEmail() && validatePassword() && validatePasswordConfirm()) ) {
			event.preventDefault();
			document.getElementById("btn-register").classList.add("disabled-btn");
			document.getElementById("btn-register").disabled = true;
		}
	});
}

function UltimateCheck(){
	var errorUsername = document.getElementById("err-name");
	var errorStudent = document.getElementById("err-student");
	var errorEmail = document.getElementById("err-mail");
	var errorPassword = document.getElementById("err-psw");
	var errorRepeatPassword = document.getElementById("err-repeat-psw");
	if (!(errorUsername && errorStudent && errorEmail && errorPassword && errorRepeatPassword)){
		document.getElementById("btn-register").disabled = false;
		document.getElementById("btn-register").classList.remove("disabled-btn")
	}
}

function validateNewUsername() {
	var Username = document.forms['credentials']['student-name-up'].value;
	const allowedChars = /^[A-Za-z0-9]+$/; // lettere maiuscole e minuscole, numeri
    
    if(Username.lenght < 1){
		var check = document.getElementById("err-name");
		deleteError(check);
		var p = messageError("err-name");
	    p.innerText = "Il nome utente è un campo obbligatorio";
		const parent = document.getElementById("student-name-up").parentNode;
		parent.appendChild(p);
		return false;
	}

	if(Username.length > 15){
		var check = document.getElementById("err-name");
		deleteError(check);
		var p = messageError("err-name");
	    p.innerText = "Il nome utente non deve essere più lungo di 15 caratteri";
		const parent = document.getElementById("student-name-up").parentNode;
		parent.appendChild(p);
		return false;
	}

	if (Username.search(/^[a-zA-Z0-9!\-_.]{1,15}$/) != 0 || !allowedChars.test(Username)) {
		var check = document.getElementById("err-name");
		deleteError(check);
		var p = messageError("err-name");
	    p.innerHTML = "<span lang='en'>Username</span> non valido, usa solo lettere o numeri.";
		const parent = document.getElementById("student-name-up").parentNode;
		parent.appendChild(p);
		return false;
	}
	var check = document.getElementById("err-name");
	deleteError(check);
	UltimateCheck();
	return true;
}

function validateStudent(){
    var Student = document.forms['credentials']["student-cat-up"];

    if(Student.value == "Seleziona una opzione"){
		var check = document.getElementById("err-student");
		deleteError(check);
		var p = messageError("err-student")
        p.innerText = "Seleziona una categoria";
		const parent = document.getElementById("student-cat-up").parentNode;
		parent.appendChild(p);
        return false;
    }
    var check = document.getElementById("err-student");
	deleteError(check);
	UltimateCheck();
    return true;
}

function validateEmail(){
    var Email = document.forms['credentials']["student-mail-up"].value;
    
    if(Email.lenght < 1){
		var check = document.getElementById("err-mail");
	    deleteError(check);
		var p = messageError("err-mail"); 
		p.innerHTML = "L'<span lang='en'>email</span> è un campo obbligatorio";
		const parent = document.getElementById("student-mail-up").parentNode;
		parent.appendChild(p);
        return false;
	}

    if(Email.length > 0 && Email.search(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/) != 0){
        var check = document.getElementById("err-mail");
	    deleteError(check);
		var p = messageError("err-mail"); 
		p.innerHTML = "L'<span lang='en'>email</span> scelta non è un indirizzo valido";
		const parent = document.getElementById("student-mail-up").parentNode;
		parent.appendChild(p);
        return false;
    }
    var check = document.getElementById("err-mail");
	deleteError(check);
	UltimateCheck();
    return true;
}

function validatePassword() {
	var Password  = document.forms['credentials']['student-psw-up'].value;

	if (Password.length < 4) {
		var check = document.getElementById("err-psw");
		deleteError(check);
		var p = messageError("err-psw");
		p.innerHTML = "La <span lang='en'>password</span> deve essere lunga almeno 4 caratteri";
		const parent = document.getElementById("student-psw-up").parentNode;
		parent.appendChild(p);
		return false;
	}

	if (Password.search(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[.,!?@+-_€$%&^*<>])[A-Za-z\d.,!?@+-_€$%&^*<>]{4,16}$/) !=0) {
		var check = document.getElementById("err-psw");
		deleteError(check);
		var p = messageError("err-psw");
		p.innerHTML = "La <span lang='en'>password</span> deve avere almeno una lettera maiuscola, una minuscola, un numero e un carattere speciale";
		const parent = document.getElementById("student-psw-up").parentNode;
		parent.appendChild(p);
		return false;
	}
    var check = document.getElementById("err-psw");
	deleteError(check);
	UltimateCheck();
	return true;
}

/*
 * Verifica che la conferma della password corrisponda all'originale.
 */
function validatePasswordConfirm() {
	var Password  = document.forms['credentials']['student-psw-up'].value;
	var repeatPassword = document.forms['credentials']['student-repeat-psw-up'].value;

	if (Password != repeatPassword) {
		var check = document.getElementById("err-repeat-psw");
		deleteError(check);
		var p = messageError("err-repeat-psw");
		p.innerHTML = "Le <span lang='en'>password</lang> non coincidono";
		const parent = document.getElementById("student-repeat-psw-up").parentNode;
		parent.appendChild(p);
		return false;
	}
    var check = document.getElementById("err-repeat-psw");
	deleteError(check);
	UltimateCheck();
	return true;

}
function messageError(id){
	var p = document.createElement("p");
	p.setAttribute("aria-live","assertive");
    p.setAttribute("aria-atomic","true");
	p.setAttribute("id",id);
	p.classList.add("err-msg");

	return p;
}

function deleteError(p){
	if(p) p.remove();
}

const listeners = {
	"student-name-up" : ["change", validateNewUsername ],
	"student-mail-up" : ["change", validateEmail],
	"student-cat-up" : ["blur", validateStudent],
	"student-psw-up" : ["change", validatePassword ],
	"student-repeat-psw-up" : ["change", validatePasswordConfirm ],
};

window.addEventListener('load', () => {
	checkSignUp();
	validateUserSignup();
});

function checkSignUp() {
	for (var id in listeners) {
		if (!document.getElementById(id)) {
			continue;
		}
		document.getElementById(id).addEventListener(listeners[id][0], listeners[id][1]);
	}
}
