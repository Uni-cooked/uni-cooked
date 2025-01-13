<?php

require_once "utility-methods.php";
use DB\DB;
$db = new DB;

$paginaHtml=file_get_contents("./html/thanks.html");
$isUserLogged=$db->isUserLogged();

if($isUserLogged!=false) {
    echo str_replace("{{link-accesso-profilo}}","<a href=\"user.php\" class=\"shadow\">PROFILO</a>",$paginaHtml);
} else {
    echo str_replace("{{link-accesso-profilo}}","<a href=\"sign-in.php\" class=\"shadow\">ACCEDI</a>",$paginaHtml); 
}