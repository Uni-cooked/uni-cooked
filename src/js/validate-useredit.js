function validateEditForm(){
	let form = document.getElementById("new-info");

	form.addEventListener("submit", function (event) {
		if (!(validateEditNewUsername())){
			event.preventDefault();
			document.getElementById("btn-confirm").classList.add("disabled-btn");
			document.getElementById("btn-confirm").disabled = true;
		}
	});
}

function validatePswForm(){
	let form = document.getElementById("credentials");

	form.addEventListener("submit", function (event) {
		if (!(validateEditPassword() && validateEditPasswordConfirm())){
			event.preventDefault();
			document.getElementById("second-btn-confirm").classList.add("disabled-btn");
			document.getElementById("second-btn-confirm").disabled = true;
		}
	});
}

function chargeNewImage() {
	const inputImage = document.getElementById("profile-img-edit");
    const imageOutput = document.getElementById("chosen-image");

    inputImage.addEventListener("change", async () => {
        let [file] = inputImage.files;

        const Reader = new FileReader();
        Reader.onload = (e) => {
		    const acceptedImgType = ["image/png","image/jpeg"];
		    sizeFile = file.size;
		    Byte = Math.round(sizeFile/1024);

		    if(Byte < 2048 ){
		        if(acceptedImgType.includes(file['type'])){
                    imageOutput.setAttribute("src", e.target.result);

					var sizeError = document.getElementById("profile-pic-err-p");
					var formatError = document.getElementById("profile-pic-err-p");

					deleteError(sizeError);
					deleteError(formatError);
				}
		        else{
					var sizeError = document.getElementById("profile-pic-err-p");
					deleteError(sizeError);

					p = createError("profile-pic-err-p");
					p.innerHTML = "L'estensione del <span lang='en'>file</span> caricato non è corretta";
					inputImage.parentNode.appendChild(p);		
				}
            }else{
				var formatError = document.getElementById("profile-pic-err-p");
				deleteError(formatError);

				p = createError("profile-pic-err-p");
				p.innerHTML = "Sono accettati solo <span lang='en'>file</span> di dimensione minore a <span lang='en' abbr='megabyte'>2MB</span>";
				inputImage.parentNode.appendChild(p);
			}
		}

        Reader.readAsDataURL(file);
    });
}

function validateEditNewUsername() {
	var Username = document.forms['new-info']['nickname-edit'].value;
	const allowedChars = /^[A-Za-z0-9]+$/; // lettere maiuscole e minuscole, numeri

	if(Username.length < 1 || Username == ""){
		var check = document.getElementById("err-edit-nam");
		deleteError(check);
		const name = document.getElementById("nickname-edit").parentNode;
		var p = createError("err-edit-nam");
	    p.innerHTML = "Il nome utente è un campo obbligatorio";
		name.appendChild(p);
		document.getElementById("btn-confirm").disabled = true;
		document.getElementById("btn-confirm").classList.add("disabled-btn");
		return false;
	}

	if(Username.length > 15){
		var check = document.getElementById("err-edit-nam");
		deleteError(check);
		const name = document.getElementById("nickname-edit").parentNode;
		var p = createError("err-edit-nam");
	    p.innerHTML = "Il nome utente non deve essere più lungo di 15 caratteri";
		name.appendChild(p);
		document.getElementById("btn-confirm").disabled = true;
		document.getElementById("btn-confirm").classList.add("disabled-btn");
		return false;
	}

	if (Username.search(/^[a-zA-Z0-9!\-_.]{1,15}$/) != 0 || !allowedChars.test(Username)) {
		var check = document.getElementById("err-edit-nam");
		deleteError(check);
		const name = document.getElementById("nickname-edit").parentNode;
		var p = createError("err-edit-nam");
	    p.innerHTML = "Il nome utente non deve contenere spazi o caratteri speciali";
		name.appendChild(p);
		document.getElementById("btn-confirm").disabled = true;
		document.getElementById("btn-confirm").classList.add("disabled-btn");
		return false;
	}
	var nameError = document.getElementById("err-edit-nam");
	deleteError(nameError);
	document.getElementById("btn-confirm").classList.remove("disabled-btn");
	document.getElementById("btn-confirm").disabled = false;
	return true;
}

function validateOldPassword(){
	var oldPsw = document.forms['credentials']['old-psw'].value;
	if(oldPsw == "" || oldPsw.length < 1){
		var check = document.getElementById("err-old-psw");
		deleteError(check);
		const psw = document.getElementById("old-psw").parentNode;
		var p = createError("err-old-psw");
		p.innerHTML = "Inserisci la <span lang='en'>password</span> attuale";
		psw.appendChild(p);
		ButtonValidator();
		return false;
	}
	var check = document.getElementById("err-old-psw");
	deleteError(check);
	ButtonValidator();
	return true;
}

function validateEditPassword() {
	var Password  = document.forms['credentials']['new-psw'].value;

	if (Password.length < 4) {
		var check = document.getElementById("err-new-psw");
		deleteError(check);
		const psw = document.getElementById("new-psw").parentNode;
		var p = createError("err-new-psw");
		p.innerHTML = "La<span lang='en'> password</span> deve essere lunga almeno 4 caratteri";
		psw.appendChild(p);
		ButtonValidator();
		return false;
	}
	
	if (Password.search(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[.,!?@+-_€$%^*<>])[A-Za-z\d@.#$!%*?&]{4,16}$/) !=0) {
		var check = document.getElementById("err-new-psw");
		deleteError(check);
		const psw = document.getElementById("new-psw").parentNode;
		var p = createError("err-new-psw");
		p.innerHTML = "La<span lang='en'> password </span>deve avere almeno una lettera maiuscola, una minuscola, un numero e un carattere speciale";
		psw.appendChild(p);
		ButtonValidator();
		return false;
	}
    var check = document.getElementById("err-new-psw");
	deleteError(check);
	ButtonValidator();
	validateEditPasswordConfirm();
	return true;
}


function validateEditPasswordConfirm() {
	var Password  = document.forms['credentials']['new-psw'].value;
	var repeatPassword = document.forms['credentials']['repeat-new-psw'].value;

	if (Password != repeatPassword) {
		var check = document.getElementById("err-repeat-new-psw");
		deleteError(check);
        var p = createError("err-repeat-new-psw");
		var html = "Le <span lang='en'>password </span> non coincidono";
		p.innerHTML = html;
		const repeatPsw = document.getElementById("repeat-new-psw").parentNode;
		repeatPsw.appendChild(p);
		ButtonValidator();
		return false;
	}
    var check = document.getElementById("err-repeat-new-psw");
	deleteError(check);
	ButtonValidator();
	return true;
}

function ButtonValidator(){
	var oldPsw = document.getElementById("old-psw").value;
	var Password  = document.forms['credentials']['new-psw'].value;
	var repeatPassword = document.forms['credentials']['repeat-new-psw'].value;
	var errPsw = document.getElementById("err-new-psw");
	var errRepPsw = document.getElementById("err-repeat-new-psw");
	if(oldPsw == "" || oldPsw.length < 1 || errPsw || errRepPsw || Password == "" || Password.length < 1 || repeatPassword == "" || repeatPassword.length < 1){
		document.getElementById("second-btn-confirm").classList.add("disabled-btn");
		document.getElementById("second-btn-confirm").disabled = true;
	}else{
		document.getElementById("second-btn-confirm").classList.remove("disabled-btn");
		document.getElementById("second-btn-confirm").disabled = false;
	}

}

function createError(id){
	var p = document.createElement("p");
	p.setAttribute("role","alert");
	p.setAttribute("id",id);
	p.classList.add("err-msg");

	return p;
}

function deleteError(p){
	if(p) p.remove();
}

const listeners = {
	"nickname-edit" : ["input", validateEditNewUsername],
	"old-psw" : ["input",validateOldPassword],
	"new-psw" : ["input", validateEditPassword ],
	"repeat-new-psw" : ["input", validateEditPasswordConfirm ],
};

window.addEventListener('load', function () {
	document.getElementById("second-btn-confirm").classList.add("disabled-btn");
	document.getElementById("second-btn-confirm").disabled = true;
	checkUserEdit();
	chargeNewImage();
	validateEditForm();
	validatePswForm();
});

function checkUserEdit() {
	for (var id in listeners) {
		if (!document.getElementById(id)) {
			continue;
		}
		document.getElementById(id).addEventListener(listeners[id][0], listeners[id][1]);
	}
}