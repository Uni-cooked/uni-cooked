import { createError, eliminateError, ToggleConfirmButton,RemoveAllErrors } from './utils.js'

function ValidateAll(e) {
    if (!validateRequest()) {
        e.preventDefault();
    } 
}

function ToggleRequestBtn() {
    const request = document.getElementById("recipie-request-input").value.trim();

    if (request.length < 20 || request.length > 500) {
        ToggleConfirmButton(0);
    } else {
        ToggleConfirmButton(1);
    }
}

function validateRequest(){
    const input = document.getElementById("recipie-request-input");
    const comment = input.value.trim();
    
    const errorString = document.getElementById("err-request");
    eliminateError(errorString);

    if (input.value.length == 0) {
        return true;
    }
    
    if (comment.length < 20) {
        let p = createError("err-request");
        p.innerText = "La lunghezza minima è di 20 caratteri";
        const parent = input.parentNode;
        parent.insertBefore(p,input.nextSibling);
        return false;
    } else if (comment.length > 500) {
        let p = createError("err-request");
        p.innerText = "il numero di caratteri nel testo della valutazione è superiore a 500";
        const parent = input.parentNode;
        parent.insertBefore(p,input.nextSibling);
        return false;
    }
    return true;
}

const inputRequest = {
    "recipie-request-input" : {
        "change": validateRequest,
        "input": ToggleRequestBtn
    },
    "request": {
        "submit": ValidateAll,
        "reset": () => {
            ToggleRequestBtn();
            RemoveAllErrors();
        }   
    },
};

function InitListeners(){
    for (let id in inputRequest) {
		if (!document.getElementById(id)) {
			continue;
		}
        let element = document.getElementById(id);
        for(let e in inputRequest[id]) {
            element.addEventListener(e, inputRequest[id][e]);
        }
	}
}

window.addEventListener("load", () => {
    InitListeners();
    ToggleConfirmButton(0);
});
