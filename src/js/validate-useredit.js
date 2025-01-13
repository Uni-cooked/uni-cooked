function validateEditForm(){
	let form = document.getElementById("new-info");

	form.addEventListener("submit", function (event) {
		if (!(validateEditNewUsername())){
			event.preventDefault();
			alert("Prima form fallita");
		} else alert("Prima form compilata correttamente");
	});
}

function validatePswForm(){
	let form = document.getElementById("credentials");

	form.addEventListener("submit", function (event) {
		if (!(validateEditPassword() && validateEditPasswordConfirm())){
			event.preventDefault();
			alert("Seconda form fallita");
		} else alert("Seconda form compilata correttamente");
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

					var sizeError = document.getElementById("err-size");
					var formatError = document.getElementById("err-format");

					deleteError(sizeError);
					deleteError(formatError);
				}
		        else{
					var sizeError = document.getElementById("err-size");
					deleteError(sizeError);

					p = createError("err-format");
					p.innerText = "Sono accettati solo file jpeg o png";
					inputImage.parentNode.appendChild(p);		
				}
            }else{
				var formatError = document.getElementById("err-format");
				deleteError(formatError);

				p = createError("err-size");
				p.innerText = "Sono accettati solo file di dimensione minore a 2MB";
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
	    p.innerText = "Username non valido, usa solo lettere o numeri.";
		name.appendChild(p);
		return false;
	}
	var nameError = document.getElementById("err-edit-nam");
	deleteError(nameError);
	return true;
}

function validateEditPassword() {
	var Password  = document.forms['credentials']['new-psw'].value;

	if (Password.length < 4) {
		var check = document.getElementById("err-new-psw");
		deleteError(check);
		const psw = document.getElementById("new-psw").parentNode;
		var p = createError("err-new-psw");
		p.innerText = "La lunghezza minima della password è di 4 caratteri";
		psw.appendChild(p);
		return false;
	}
	
	if (Password.search(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@.#$!%*?&])[A-Za-z\d@.#$!%*?&]{4,16}$/) !=0) {
		var check = document.getElementById("err-new-psw");
		deleteError(check);
		const psw = document.getElementById("new-psw").parentNode;
		var p = createError("err-new-psw");
		p.innerText = "Sintassi password errata";
		psw.appendChild(p);
		return false;
	}
    var check = document.getElementById("err-new-psw");
	deleteError(check);
	return true;
}


function validateEditPasswordConfirm() {
	var Password  = document.forms['credentials']['new-psw'].value;
	var repeatPassword = document.forms['credentials']['repeat-new-psw'].value;

	if (Password != repeatPassword) {
		var check = document.getElementById("err-repeat-new-psw");
		deleteError(check);
        var p = createError("err-repeat-new-psw");
		p.innerText = "Le password non coincidono";
		const rpPsw = document.getElementById("repeat-new-psw").parentNode;
		rpPsw.appendChild(p);
		return false;
	}
    var check = document.getElementById("err-repeat-new-psw");
	deleteError(check);
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