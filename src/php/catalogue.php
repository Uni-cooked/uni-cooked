<?php

require_once "utils/page_system.php";

use Utilities\DB;
use Utilities\PageSystem;

$db = new DB;
$pageSystem = new PageSystem($db);


$paginaHtml=file_get_contents("html/catalogue.html");

if ($db->isUserLogged()!=false) {
    echo str_replace("<a href=\"sign-in.php\">ACCEDI</a>","<a href=\"user.php\">PROFILO</a>",$paginaHtml);
}

$currentPage = isset($_GET['page']) ? $_GET['page'] : 1;

$recipes = $pageSystem->GetCurrentPage($currentPage);

$d_recipes="";
if ($recipes!=null) {
    foreach ($recipes as &$recipie) {
        $d_recipes .= CreateRecipeCard($recipie["immagine"],$recipie["nome"],$recipie["voto"],$recipie["categoria"],$recipie["tipo_piatto"],$recipie["tempo_sec"]);
    }
} else {
    $d_recipes=Message("Non ci sono ricette che soddisfano la tua richiesta");
}

$r = str_replace("{{RECIPES}}",$d_recipes,$paginaHtml);
$final = str_replace("{{PAGEBUTTONS}}",$pageSystem->RenderButtons(),$r);

echo $final;

?>