<?php

require_once "utils/utility-methods.php";
use Utilities\DB;
$db = new DB;

$paginaHtml=file_get_contents("./html/thanks.html");
$isUserLogged=$db->isUserLogged();

if($isUserLogged!=false) {
    echo str_replace("{{link-accesso-profilo}}","<a href=\"user.php\" class=\"shadow\">PROFILO</a>",$paginaHtml);
} else {
    echo str_replace("{{link-accesso-profilo}}","<a href=\"sign-in.php\" class=\"shadow\">ACCEDI</a>",$paginaHtml); 
}