<?php

require_once "utils/page_system.php";

use Utilities\DB;
use Utilities\PageSystem;
use Utilities\Sanitizer;

$db = new DB;

$recipieName = isset($_GET['name']) ? Sanitizer::SanitizeGenericInput($_GET['name']) : null;
$recipieCategory = isset($_GET['cat']) && $_GET['cat'] != "tutti" ? Sanitizer::SanitizeGenericInput($_GET['cat']) : null;
$course = isset($_GET['dish']) && $_GET['dish'] != "tutti" ? Sanitizer::SanitizeGenericInput($_GET['dish']) : null;
$grade = isset($_GET['min_rate']) ? Sanitizer::SanitizeGenericInput(Sanitizer::IntFilter($_GET['min_rate'])) : 1;
$cost = isset($_GET['max_price']) ? Sanitizer::SanitizeGenericInput(Sanitizer::IntFilter($_GET['max_price'])) : 25;
$order = isset($_GET['ord']) ? Sanitizer::SanitizeGenericInput($_GET['ord']) : null;


$pageSystem = new PageSystem($db, $recipieName, $recipieCategory, $course, $grade, $cost, $order);
$_SESSION["prev-page"]="<a href=\"./catalogue.php\">RICETTE</a>";

$paginaHtml = file_get_contents("./html/catalogue.html");

if($db->isUserLogged()!=false) {
    $paginaHtml=str_replace("{{link-accesso-profilo}}","<a href=\"user.php\" class=\"a-btn-secondary\">PROFILO</a>",$paginaHtml);
} else {
    $paginaHtml=str_replace("{{link-accesso-profilo}}","<a href=\"sign-in.php\" class=\"a-btn-secondary\">ACCEDI</a>",$paginaHtml); 
}

$currentPage = isset($_GET['page']) ? Sanitizer::SanitizeGenericInput(Sanitizer::IntFilter($_GET['page'])) : 1;

$recipes = $pageSystem->GetCurrentPage($currentPage);

$d_recipes = "";
if ($recipes != null) {
    foreach ($recipes as &$recipie) {
        $d_recipes .= CreateRecipeCard($recipie["immagine"], $recipie["nome"], $recipie["voto"], ParseCategory($recipie["categoria"]), $recipie["tipo_piatto"], $recipie["prezzo"]);
    }
} else {
    $d_recipes = Message("Non ci sono ricette che soddisfano la tua richiesta");
}

$paginaHtml = str_replace("value=\"" . $recipieCategory . "\"", "value=\"" . $recipieCategory . "\" selected", $paginaHtml);
$paginaHtml = str_replace("value=\"" . $course . "\"", "value=\"" . $course . "\" selected", $paginaHtml);
$paginaHtml = str_replace("value=\"" . $order . "\"", "value=\"" . $order . "\" selected", $paginaHtml);
$paginaHtml = str_replace("id=\"search-bar\"", "id=\"search-bar\" value=\"" . $recipieName . "\"", $paginaHtml);
$paginaHtml = str_replace("id=\"min-rate-filter\"", "id=\"min-rate-filter\" value=\"" . $grade . "\"", $paginaHtml);
$paginaHtml = str_replace("id=\"max-price-filter\"", "id=\"max-price-filter\" value=\"" . $cost . "\"", $paginaHtml);
$paginaHtml = str_replace("id=\"ord-res\" name=\"ord\"", "id=\"ord-res\" name=\"ord\" onchange=\"this.form.submit()\"", $paginaHtml);


$paginaHtml = str_replace("{{HIDDEN}}", CreateOrderChanger($pageSystem->GetParamList()), $paginaHtml);
$paginaHtml = str_replace("{{RECIPES}}", $d_recipes, $paginaHtml);
$paginaHtml = str_replace("{{PAGEBUTTONS}}", $pageSystem->RenderButtons(), $paginaHtml);
$paginaHtml = str_replace("{{DISHES}}", $pageSystem->GetTotalResultNumber(), $paginaHtml);

echo $paginaHtml;

function CreateRecipeCard(string $img, string $title, int $grade, string $category, string $course, int $cost): string
{
    global $db;
    $TEMPLATE = '<li class="recipe shadow">
                    <a href="./recipe.php?recipe='. urlencode($title) . '" title="vai alla ricetta ' . $title . '" class="recipe-card">
                        <img loading="lazy" class="catalogue-recipe-img-crop" src="' . $img . '" alt=""/>
                        <div>
                            <h3 class="recipe-title">' . $db->checkLang(ucfirst($title)) . '</h3>
                            <ul class="recipe-info">
                                <li><img loading="lazy" src="./asset/icon/grade-dark.svg" alt="voto"/>' . ($grade != 31 ? $grade : "-") . ' <abbr title="su">/</abbr> 30</li>
                                <li><img loading="lazy" src="./asset/icon/student-dark.svg" alt="categoria"/>' . ($category=="DAD" ? '<abbr title="didattica a distanza">'.$category.'</abbr>': $category) . '</li>
                                <li><img loading="lazy" src="./asset/icon/course-dark.svg" alt="piatto"/>' . strtoupper($course) . '</li>
                                <li><img loading="lazy" src="./asset/icon/cost-dark.svg" alt="costo"/>' . $cost . ' &euro;</li>
                            </ul>
                            <p aria-hidden="true" class="fake-link">Vai alla ricetta</p>
                        </div>
                    </a>
                </li>';
    return $TEMPLATE;
}

function CreateOrderChanger($filters_list)
{
    $HIDDEN = "";
    while ($value = current($filters_list)) {
        $HIDDEN .= "<input type=\"hidden\" name=" . key($filters_list) . " value=\"" . $value . "\"/>";
        next($filters_list);
    }
    return $HIDDEN;
}

function ParseCategory(string $category): string
{
    return strtoupper(str_replace("_", " ", $category));
}

function Message(string $text): string
{
    return "<p>" . $text . "</p>";
}
?>