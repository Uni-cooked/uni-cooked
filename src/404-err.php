<?php

require_once "utils/utility-methods.php";
use Utilities\DB;
$db = new DB;

$paginaHtml=file_get_contents("./html/404-err.html");
if($db->isUserLogged()!=false) {
    echo str_replace("{{link-accesso-profilo}}","<a href=\"user.php\" class=\"a-btn-secondary shadow\">PROFILO</a>",$paginaHtml);
} else {
    echo str_replace("{{link-accesso-profilo}}","<a href=\"sign-in.php\" class=\"a-btn-secondary shadow\">ACCEDI</a>",$paginaHtml); 
}
