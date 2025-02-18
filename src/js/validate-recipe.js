import { createError, eliminateError, ToggleConfirmButton } from './utils.js'

function ValidateAll(e) {
    if (!validateReview() || !validateCommento()) {
        e.preventDefault();
    } 
}

function ToggleConfirmBtn() {
    const voto = document.getElementById("add-comment-eval").value;
    const comment = document.getElementById("add-comment-text").value.trim();

    if (voto == "" && comment == "" && comment.length >= 200) {
        ToggleConfirmButton(0);
    } else {
        ToggleConfirmButton(1);
    }
}

function validateReview() {
    let input = document.getElementById("add-comment-eval");
    const voto = input.value;
    if (!voto.match(/^[0-9]+$/)) {
        input.value = Math.min(Math.max(voto, 1), 30);
        return false;
    }
    return true;
}

function validateCommento(){
    const input = document.getElementById("add-comment-text");
    const comment = input.value.trim();
    
    const errorString = document.getElementById("err-comment");
    eliminateError(errorString);


    if (comment === "") {
        let p = createError("err-comment");
        p.innerText = "Il testo della valutazione è necessario";
        const parent = input.parentNode;
        parent.insertBefore(p,input.nextSibling);
        return false;
    } else if (comment.length > 200) {
        let p = createError("err-comment");
        p.innerText = "il numero di caratteri nel testo della valutazione è superiore a 200";
        const parent = input.parentNode;
        parent.insertBefore(p,input.nextSibling);
        return false;
    }
    return true;
}

const review = {
    "add-comment-eval" : {
        "input": () => {
            validateReview();
            ToggleConfirmBtn();
        },
    },
    "add-comment-text" : {
        "change": validateCommento,
        "input": ToggleConfirmBtn
    },
    "first-form": {
        "submit": ValidateAll,
    }
}

function InitListeners(){
    for (let id in review) {
		if (!document.getElementById(id)) {
			continue;
		}
        let element = document.getElementById(id);
        for(let e in review[id]) {
            element.addEventListener(e, review[id][e]);
        }
	}
}

window.addEventListener('load', () => {
	InitListeners();
    ToggleConfirmButton(0);
});


