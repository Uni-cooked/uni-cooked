export function createError(e){let t=document.createElement("p");return t.classList.add("err-msg"),t.setAttribute("role","alert"),t.setAttribute("id",e),t}export function eliminateError(e){e&&e.remove()}export function ToggleConfirmButton(e,t="btn-confirm"){let l=document.getElementById(t);l&&(l.disabled=!e,e?l.classList.remove("disabled-btn"):l.classList.add("disabled-btn"))}export function ToggleLabel(e,t){let l=document.getElementById(t);l&&(l.disabled=!e,e?l.classList.remove("disabled-label"):l.classList.add("disabled-label"))}export function ShowPsw(e,t){let l=document.getElementById(t);e.checked?l.type="text":l.type="password"}