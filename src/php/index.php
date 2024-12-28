<?php

require_once "utilityMethods.php";
use DB\DB;
$db = new DB;

$paginaHtml=file_get_contents("../html/index.html");
if ($db->isUserLogged()!=false) {
    echo str_replace("<a href=\"sign-in.php\">ACCEDI</a>","<a href=\"user.php\">PROFILO</a>",$paginaHtml);
} else {
    echo $paginaHtml;
}
