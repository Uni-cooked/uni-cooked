export function createError(id){
    let p = document.createElement("p");
    p.classList.add("err-msg");
    p.setAttribute("role","alert");
	p.setAttribute("id",id);
    return p;
}

export function eliminateError(p){
    if(p) p.remove();
}

export function ToggleConfirmButton(state,id="btn-confirm") { // 1 = on ; 0 = off
    const confirm = document.getElementById(id);
    confirm.disabled = !state;
    if (!state) {
        confirm.classList.add("disabled-btn");
    } else {
        confirm.classList.remove("disabled-btn");
    }
}
export function ToggleLabel(state,id) { // 1 = on ; 0 = off
    const confirm = document.getElementById(id);
    confirm.disabled = !state;
    if (!state) {
        confirm.classList.add("disabled-label");
    } else {
        confirm.classList.remove("disabled-label");
    }
}

export function ShowPsw(checkbox,id) {
    console.log(id);
    const input = document.getElementById(id);
    if (checkbox.checked) {
        input.type = "text";
    } else {
        input.type = "password";
    }
}