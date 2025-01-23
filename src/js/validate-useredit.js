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

	if (Username.search(/^[a-zA-Z0-9!\-_.]{1,15}$/) != 0 || !allowedChars.test(Username)) {
		var check = document.getElementById("err-edit-nam");
		deleteError(check);
		const name = document.getElementById("nickname-edit").parentNode;
		var p = createError("err-edit-nam");
	    p.innerHTML = "<span lang='en'>Username</span> non valido, usa solo lettere o numeri.";
		name.appendChild(p);
		return false;
	}
	var nameError = document.getElementById("err-edit-nam");
	deleteError(nameError);
	document.getElementById("btn-confirm").classList.remove("disabled-btn");
	document.getElementById("btn-confirm").disabled = false;
	return true;
}

function FinalCheck(){
	var errorPassword = document.getElementById("err-new-psw");
	var errorRepeatPassword = document.getElementById("err-repeat-new-psw");
	if(!(errorPassword && errorRepeatPassword)){
		document.getElementById("second-btn-confirm").classList.remove("disabled-btn");
		document.getElementById("second-btn-confirm").disabled = false;
	}
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
		return false;
	}
	
	if (Password.search(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[.,!?@+-_€$%^*<>])[A-Za-z\d@.#$!%*?&]{4,16}$/) !=0) {
		var check = document.getElementById("err-new-psw");
		deleteError(check);
		const psw = document.getElementById("new-psw").parentNode;
		var p = createError("err-new-psw");
		p.innerHTML = "La<span lang='en'> password </span>deve avere almeno una lettera maiuscola, una minuscola, un numero e un carattere speciale";
		psw.appendChild(p);
		return false;
	}
    var check = document.getElementById("err-new-psw");
	deleteError(check);
	FinalCheck();
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
		repeatPsw.appendChild(p)
		return false;
	}
    var check = document.getElementById("err-repeat-new-psw");
	deleteError(check);
	FinalCheck();
	return true;
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
	"nickname-edit" : ["change", validateEditNewUsername],
	"new-psw" : ["change", validateEditPassword ],
	"repeat-new-psw" : ["change", validateEditPasswordConfirm ],
};

window.addEventListener('load', function () {
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