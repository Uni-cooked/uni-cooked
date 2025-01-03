<?php

require_once "utils/page_system.php";
require_once "utils/Sanitizer.php";

use Utilities\DB;
use Utilities\PageSystem;
use Utilities\Sanitizer;

$db = new DB;

$recipieName = isset($_GET['name']) ? Sanitizer::SanitizeInput($_GET['name']) : null;
$recipieCategory = isset($_GET['category']) && $_GET['category'] != "tutti" ? Sanitizer::SanitizeInput($_GET['category']) : null;
$course = isset($_GET['course']) && $_GET['course'] != "tutti" ? Sanitizer::SanitizeInput($_GET['course']) : null;
$grade = isset($_GET['grade']) ? Sanitizer::SanitizeInput(Sanitizer::IntFilter($_GET['grade'])) : 1;
$cost = isset($_GET['cost']) ? Sanitizer::SanitizeInput(Sanitizer::IntFilter($_GET['cost'])) : 20;
$order= Sanitizer::SanitizeInput("ca"); // cost ascending


$pageSystem = new PageSystem($db,$recipieName,$recipieCategory,$course,$grade,$cost,$order);


$paginaHtml=file_get_contents("html/catalogue.html");

if ($db->isUserLogged()!=false) {
    $paginaHtml = str_replace("<a href=\"./sign-in.php\">ACCEDI</a>","<a href=\"user.php\">PROFILO</a>",$paginaHtml);
}

$currentPage = isset($_GET['page']) ? Sanitizer::SanitizeInput(Sanitizer::IntFilter($_GET['page'])) : 1;

$recipes = $pageSystem->GetCurrentPage($currentPage);

$d_recipes="";
if ($recipes!=null) {
    foreach ($recipes as &$recipie) {
        $d_recipes .= CreateRecipeCard($recipie["immagine"],$recipie["nome"],$recipie["voto"],$recipie["categoria"],$recipie["tipo_piatto"],$recipie["prezzo"]);
    }
} else {
    $d_recipes=Message("Non ci sono ricette che soddisfano la tua richiesta");
}

$paginaHtml = str_replace("value=\"".$recipieCategory."\"","value=\"".$recipieCategory."\" selected",$paginaHtml);
$paginaHtml = str_replace("value=\"".$course."\"","value=\"".$course."\" selected",$paginaHtml);
$paginaHtml = str_replace("id=\"search-bar\"","id=\"search-bar\" value=\"". $recipieName ."\"",$paginaHtml);
$paginaHtml = str_replace("id=\"min-rate-filter\"","id=\"min-rate-filter\" value=\"".$grade."\"",$paginaHtml);
$paginaHtml = str_replace("id=\"max-price-filter\"","id=\"max-price-filter\" value=\"".$cost."\"",$paginaHtml);

$paginaHtml = str_replace("{{RECIPES}}",$d_recipes,$paginaHtml);
$paginaHtml = str_replace("{{PAGEBUTTONS}}",$pageSystem->RenderButtons(),$paginaHtml);

echo $paginaHtml;

?>