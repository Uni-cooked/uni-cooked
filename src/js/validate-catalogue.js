function FilterForm(){let e=document.getElementById("min-rate-filter").value,t=document.getElementById("max-price-filter").value;document.getElementById("rate").innerText=e+" / 30",document.getElementById("price").innerText=t+" €"}function UpdateRangeVoto(){let e=document.forms["search-fields"]["min-rate-filter"].value;document.getElementById("rate").innerText=e+" / 30"}function UpdateRangeCosto(){let e=document.forms["search-fields"]["max-price-filter"].value;document.getElementById("price").innerText=e+" €"}const sliders={"min-rate-filter":{input:UpdateRangeVoto},"max-price-filter":{input:UpdateRangeCosto}};function InitListeners(){for(let e in sliders){if(!document.getElementById(e))continue;let t=document.getElementById(e);for(let n in sliders[e])t.addEventListener(n,sliders[e][n])}}window.addEventListener("load",()=>{InitListeners(),FilterForm()});