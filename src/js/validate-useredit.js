import { createError, eliminateError, ToggleConfirmButton, ShowPsw, ToggleLabel,RemoveAllErrors } from './utils.js'

function ValidateProfile(e) {
	if (!validateUsername()) {
		e.preventDefault();
	}
}

function ValidateNewPsw(e) {
	if (!validateOldPassword() || !validateNewPassword() || !validateNewPasswordConfirm()) {
		e.preventDefault();
	}
}

function ToggleConfirmModButton() {
    const username = document.getElementById("nickname-edit").value.trim();

    if (username.length < 1 || username.length > 15) {
		ToggleConfirmButton(0);
    } else {
		ToggleConfirmButton(1);
    }
}

function ToggleConfirmPswButton() {
	const oldPsw = document.getElementById('old-psw').value.trim();
	const psw = document.getElementById('new-psw').value.trim();
	const rpsw = document.getElementById('repeat-new-psw').value.trim();

    if (oldPsw == ""  || psw.length < 4 || rpsw =="") {
		ToggleConfirmButton(0,"second-btn-confirm");
    } else {
		ToggleConfirmButton(1,"second-btn-confirm");
    }
}

function validateUsername() {
	const input = document.getElementById("nickname-edit");
	const username = input.value.trim();

	const errorString = document.getElementById("err-edit-nam");
	eliminateError(errorString);
    
    if(username.length < 1){
		let p = createError("err-edit-nam");
	    p.innerText = "Il nome utente è un campo obbligatorio";
		const parent = input.parentNode;
		parent.appendChild(p);
		return false;
	}

	if(username.length > 15){
		let p = createError("err-edit-nam");
	    p.innerText = "Il nome utente non deve essere più lungo di 15 caratteri";
		const parent = input.parentNode;
		parent.appendChild(p);
		return false;
	}

	if (username.search(/^[a-zA-ZÀ-Ýß-ÿ0-9]{1,15}$/) == -1) {
		let p = createError("err-edit-nam");
	    p.innerHTML = "Nome utente non valido, usa solo lettere o numeri.";
		const parent = input.parentNode;
		parent.appendChild(p);
		return false;
	}
	return true;
}

async function ChangeImage() {
	const inputImage = document.getElementById("profile-img-edit");
	const [file] = inputImage.files;

	document.getElementById("del-pp-radio").checked = false;
	
	const imageOutput = document.getElementById("chosen-image");
	const Reader = new FileReader();
	Reader.onload = (e) => {
		const acceptedImgType = ["image/png","image/jpeg"];
		const sizeFile = file.size;
		const Byte = Math.round(sizeFile/1024);
		const errorString = document.getElementById("profile-pic-err-p");
		eliminateError(errorString);
		if(Byte < 2048 ){
			if(acceptedImgType.includes(file['type'])){
				imageOutput.setAttribute("src", e.target.result);
				ToggleLabel(1,"del-pp-radio");
				ToggleLabel(1,"del-pp");
			}
			else{
				let p = createError("profile-pic-err-p");
				p.innerHTML = "L'estensione del <span lang='en'>file</span> caricato non è corretta";
				const parent = document.getElementById("edit-pp");
				parent.append(p);
				inputImage.value = null;	
			}
		}else{
			let p = createError("profile-pic-err-p");
			p.innerHTML = "Sono accettati solo <span lang='en'>file</span> di dimensione minore a 2<span lang='en' abbr='megabyte'>MB</span>";
			const parent = document.getElementById("edit-pp");
			parent.append(p);
		}
	}
	Reader.readAsDataURL(file);
}

function ToggleChangeImage() {
	ToggleLabel(0,"del-pp");
	

	const img = document.getElementById("chosen-image");
	img.setAttribute("src","./asset/img/def-profile.webp");
}

function validateOldPassword() {
    const input = document.getElementById("old-psw");
    const psw = input.value.trim();

    const errorString = document.getElementById("err-old-psw");
    eliminateError(errorString);

    if(psw.length < 1){
		let p = createError("err-old-psw");
	    p.innerHTML = "La <span lang='en'>password</span> è un campo obbligatorio";
		const parent = input.parentNode;
		parent.appendChild(p);
		return false;
	}
    return true;
}

function validateNewPassword() {
	const input = document.getElementById('new-psw');
	const psw = input.value.trim();

	const errorString = document.getElementById("err-new-psw");
	eliminateError(errorString);
    

	if (psw.length < 4) {
		let p = createError("err-new-psw");
		p.innerHTML = "La <span lang='en'>password</span> deve essere lunga almeno 4 caratteri";
		const parent = input.parentNode;
		parent.appendChild(p);
		return false;
	}

	if (psw.search(/^(?=.*[a-zß-ÿ])(?=.*[A-ZÀ-Ý])(?=.*[\d])(?=.*[.,!?@+\-_€$%&^*<>]).{4,}$/) == -1) {
		let p = createError("err-new-psw");
		p.innerHTML = "La <span lang='en'>password</span> deve avere almeno una lettera maiuscola, una minuscola, un numero e un carattere speciale";
		const parent = input.parentNode;
		parent.appendChild(p);
		return false;
	}
	return true;
}

function validateNewPasswordConfirm() {
	const input = document.getElementById("repeat-new-psw");
	const psw = document.getElementById('new-psw').value.trim();
	const rpsw = input.value.trim();

	const errorString = document.getElementById("err-repeat-new-psw");
	eliminateError(errorString);

	if (psw != rpsw) {
		let p = createError("err-repeat-new-psw");
		p.innerHTML = "Le <span lang='en'>password</lang> non coincidono";
		const parent = input.parentNode;
		parent.appendChild(p);
		return false;
	}
	return true;

}

const listeners = {
	"nickname-edit" : {
		"focusout": validateUsername,
		"input": ToggleConfirmModButton
	},
	"profile-img-edit": {
		"change":ChangeImage,
		"input": ToggleConfirmModButton
	},
	"del-pp-radio" : {
		"change": ToggleChangeImage
	},
	"old-psw" : {
		"focusout": validateOldPassword,
		"input":ToggleConfirmPswButton
	},
	"new-psw" : {
		"focusout": validateNewPassword,
		"input": ToggleConfirmPswButton
	},
	"repeat-new-psw" : {
		"focusout": validateNewPasswordConfirm,
		"input": ToggleConfirmPswButton
		
	},

	"show-old-psw" : {"click": function () {ShowPsw(this,"old-psw");} },
	"show-new-psw" : {"click": function () {ShowPsw(this,"new-psw");} },
	"show-rep-psw" : {"click": function () {ShowPsw(this,"repeat-new-psw");} },
	"new-info": {
		"submit": ValidateProfile
	},
	"credentials": {
		"submit": ValidateNewPsw,
		"reset": () => {
			ToggleConfirmPswButton();
			RemoveAllErrors("#credentials");
		}
	}
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
	const form = document.getElementById("new-info");
	const img = document.getElementById("chosen-image");
	const original = img.getAttribute("src");
	const initState = document.getElementById("del-pp-radio").disabled;
	form.addEventListener("reset", () => {
		if(!initState) {
			ToggleLabel(1,"del-pp-radio");
			ToggleLabel(1,"del-pp");
		} else {
			ToggleLabel(0,"del-pp-radio");
			ToggleLabel(0,"del-pp");
		}
		
		ToggleLabel(1,"profile-img-edit");
		ToggleLabel(1,"mod-pp");

		img.setAttribute("src",original);

		RemoveAllErrors("#new-info");
	});
}

window.addEventListener('load', function () {
	InitListeners();
	ToggleConfirmButton(0,"second-btn-confirm");
});
