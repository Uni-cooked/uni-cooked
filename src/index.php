<?php

require_once "utils/utility-methods.php";
require_once "utils/sanitizer.php";
use Utilities\DB;
$db = new DB;

$paginaHtml=file_get_contents("./html/index.html");
if($db->isUserLogged()!=false) {
    $paginaHtml=str_replace("{{link-accesso-profilo}}","<a href=\"user.php\" class=\"a-btn-secondary\">PROFILO</a>",$paginaHtml);
} else {
    $paginaHtml=str_replace("{{link-accesso-profilo}}","<a href=\"sign-in.php\" class=\"a-btn-secondary\">ACCEDI</a>",$paginaHtml); 
}
echo $paginaHtml;
?>