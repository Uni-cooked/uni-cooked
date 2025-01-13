<?php

require_once "utils/page_system.php";

use DB\DB;
use Utilities\PageSystem;
use Utilities\Sanitizer;

$db = new DB;

$recipieName = isset($_GET['name']) ? Sanitizer::SanitizeInput($_GET['name']) : null;
$recipieCategory = isset($_GET['cat']) && $_GET['cat'] != "tutti" ? Sanitizer::SanitizeInput($_GET['cat']) : null;
$course = isset($_GET['dish']) && $_GET['dish'] != "tutti" ? Sanitizer::SanitizeInput($_GET['dish']) : null;
$grade = isset($_GET['min_rate']) ? Sanitizer::SanitizeInput(Sanitizer::IntFilter($_GET['min_rate'])) : 1;
$cost = isset($_GET['max_price']) ? Sanitizer::SanitizeInput(Sanitizer::IntFilter($_GET['max_price'])) : 25;
$order= isset($_GET['ord']) ? Sanitizer::SanitizeInput($_GET['ord']) : null;


$pageSystem = new PageSystem($db,$recipieName,$recipieCategory,$course,$grade,$cost,$order);


$paginaHtml=file_get_contents("./html/catalogue.html");

if ($db->isUserLogged()!=false) {
    $paginaHtml = str_replace('<a href="sign-in.php" class="shadow">ACCEDI</a>',"<a href=\"user.php\" class=\"shadow\">PROFILO</a>",$paginaHtml);
}

$currentPage = isset($_GET['page']) ? Sanitizer::SanitizeInput(Sanitizer::IntFilter($_GET['page'])) : 1;

$recipes = $pageSystem->GetCurrentPage($currentPage);

$d_recipes="";
if ($recipes!=null) {
    foreach ($recipes as &$recipie) {
        $d_recipes .= CreateRecipeCard($recipie["immagine"],$recipie["nome"],$recipie["voto"],ParseCategory($recipie["categoria"]),$recipie["tipo_piatto"],$recipie["prezzo"]);
    }
} else {
    $d_recipes=Message("Non ci sono ricette che soddisfano la tua richiesta");
}

$paginaHtml = str_replace("value=\"".$recipieCategory."\"","value=\"".$recipieCategory."\" selected",$paginaHtml);
$paginaHtml = str_replace("value=\"".$course."\"","value=\"".$course."\" selected",$paginaHtml);
$paginaHtml = str_replace("value=\"".$order."\"","value=\"".$order."\" selected",$paginaHtml);
$paginaHtml = str_replace("id=\"search-bar\"","id=\"search-bar\" value=\"". $recipieName ."\"",$paginaHtml);
$paginaHtml = str_replace("id=\"min-rate-filter\"","id=\"min-rate-filter\" value=\"".$grade."\"",$paginaHtml);
$paginaHtml = str_replace("id=\"max-price-filter\"","id=\"max-price-filter\" value=\"".$cost."\"",$paginaHtml);
$paginaHtml = str_replace("id=\"ord-res\" name=\"ord\"","id=\"ord-res\" name=\"ord\" onchange=\"this.form.submit()\"",$paginaHtml);


$paginaHtml = str_replace("{{HIDDEN}}",CreateOrderChanger($pageSystem->GetParamList()),$paginaHtml);
$paginaHtml = str_replace("{{RECIPES}}",$d_recipes,$paginaHtml);
$paginaHtml = str_replace("{{PAGEBUTTONS}}",$pageSystem->RenderButtons(),$paginaHtml);

echo $paginaHtml;

function CreateRecipeCard(string $img,string $title,int $grade, string $category,string $course,int $cost): string {
    global $db;
    $TEMPLATE ="<li class=\"recipe\">
                    <img class=\"catalogue-recipe-img-crop\" src=\"" . $img . "\" alt=\"\">
                    <h3 class=\"recipe-title\">" . $db->checkLang(ucfirst($title)) . "</h3>
                    <ul class=\"recipe-info\">
                        <li><img src=\"./asset/icon/grade.svg\" alt=\"voto\">" . ($grade != 31 ? $grade : "-") ." <abbr title=\"su\">/</abbr> 30</li>
                        <li><img src=\"./asset/icon/student.svg\" alt=\"categoria\">" . strtoupper($category) . "</li>
                        <li><img src=\"./asset/icon/course.svg\" alt=\"piatto\">" . strtoupper($course) . "</li>
                        <li><img src=\"./asset/icon/cost.svg\" alt=\"costo\">" . $cost . " €</li>
                    </ul>    
                    <a href=\"./recipe.php?recipe=". $title ."\" title=\"". $title ."\">Vai alla ricetta</a>
                </li>";
    return $TEMPLATE;
}

function CreateOrderChanger($filters_list) {
    $HIDDEN ="";
        while ($value = current($filters_list)) {
            $HIDDEN .= "<input type=\"hidden\" name=". key($filters_list) ." value=". $value .">";
            next($filters_list);
        }
        return $HIDDEN;
}

function ParseCategory(string $category):string{
    return strtoupper(str_replace("_"," ",$category));
}

function Message(string $text): string {
    return "<p>".$text."</p>";
}
?>