function validateReview(){
    let form = document.getElementById("first-form");
    if(form){
        form.addEventListener("submit", (e) => {
            if(!validateCommento()){
                e.preventDefault();
                document.getElementsByName("submit-add-review").classList.add("disabled-btn");
                document.getElementsByName("submit-add-review").disabled = true;
            }
        });
    }
}

function validateVoto(){
   var Voto = document.forms["first-form"]["add-comment-eval"].value;
   if(Voto < 1) Voto = 1;
   if(Voto > 30) Voto = 30;
}

function validateCommento(){
    var Comment = document.forms["first-form"]["add-comment-text"].value;
    if(Comment.lenght < 0){
        const check = document.getElementById("err-comment");
        eliminateError(check);
        var p = createError("err-comment")
        p.innerText = "Il commento della valutazione è necessario"
        const parent = document.getElementById("add-comment-text").parentNode;
        parent.appendChild(p);
        return false;

    } else if(Comment.lenght > 200){
        const check = document.getElementById("err-comment");
        eliminateError(check);
        var p = createError("err-comment")
        p.innerText = "Il numero di caratteri nel commento della valutazione è superiore a 200";
        const parent = document.getElementById("add-comment-text").parentNode;
        parent.appendChild(p);
        return false;
    }
    
    const check = document.getElementById("err-comment");
    eliminateError(check);
    document.getElementById("submit-add-review").disabled = false;
    document.getElementById("submit-add-review").classList.remove("disabled-btn");
    return true;
}

function createError(id){
    var p = document.createElement("p");
    p.classList.add("err-msg");
    p.setAttribute("role","alert");
	p.setAttribute("id",id);

    return p;
}

function eliminateError(p){
    if(p) p.remove();
}

const review = {
    "add-comment-eval" : ["change", validateVoto],
    "add-comment-text" : ["change", validateCommento],
}

function checkReview(){
    for (var id in review) {
		if (!document.getElementById(id)) {
			continue;
		}
		document.getElementById(id).addEventListener(review[id][0], review[id][1]);
	}
}

window.addEventListener('load', () => {
	checkReview();
	validateReview();
});


