<?php

require_once "utility-methods.php";
use DB\DB;
$db = new DB;

$paginaHtml=file_get_contents("../html/404-err.html");
if ($db->isUserLogged()!=false) {
    echo str_replace("<a href=\"sign-in.php\" class=\"shadow\">ACCEDI</a>","<a href=\"sign-in.php\" class=\"shadow\">PROFILO</a>",$paginaHtml);
} else {
    echo $paginaHtml;
}
