<?php

require_once "utils/utility-methods.php";
require_once "utils/sanitizer.php";
use Utilities\DB;
$db = new DB;

$paginaHtml=file_get_contents("./html/index.html");
if ($db->isUserLogged()!=false) {
    echo str_replace("<a href=\"sign-in.php\" class=\"shadow\">ACCEDI</a>","<a href=\"user.php\" class=\"shadow\">PROFILO</a>",$paginaHtml);
} else {
    echo $paginaHtml;
}
