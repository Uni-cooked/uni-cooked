<?php

    require_once("math.php");

    function CreateRecipeCard(string $img,string $title,int $grade, string $category,string $course,int $time): string {
        $TEMPLATE ="<li class=\"recipe\">
                        <img class=\"recipe-img-crop\" src=\"" . $img . "\" alt=\"\">
                        <h3 class=\"recipe-title\">" . $title . "</h3>
                        <ul class=\"recipe-info\">
                            <li><img src=\"asset/icon/grade.svg\" alt=\"valutato con\">" . $grade . " <abbr title=\"su\">/</abbr> 30</li>
                            <li><img src=\"asset/icon/student.svg\" alt=\"categoria\">" . $category . "</li>
                            <li><img src=\"asset/icon/course.svg\" alt=\"piatto\">" . $course . "</li>
                            <li><img src=\"asset/icon/time.svg\" alt=\"darata\">" . $time . " <abbr title=\"minuti\">min</abbr></li>
                        </ul>    
                        <a href=\"./recipe.html\" title=\"NOME RICETTA\">Vai alla ricetta</a>
                    </li>";
        return $TEMPLATE;
    }

    function CreatePageButtons(int $currentPage,int $totalPages,$filters_list):string {
        $TEMPLATE = "<button id=\"prev-page-btn\" name=\"page\" value="."\"" .  clamp($currentPage-1,1,$totalPages) . "\"" . "aria-label=\"via alla pagina precedente\"></button>
                         <span>". $currentPage ."</span><span>/</span><span>". $totalPages ."</span>
                    <button id=\"next-page-btn\" name=\"page\" value="."\"" . clamp($currentPage+1,1,$totalPages) . "\"" . "aria-label=\"vai alla pagina successiva\"></button>";
        $HIDDEN ="";
        while ($value = current($filters_list)) {
            $HIDDEN .= "<input type=\"hidden\" name=". key($filters_list) ." value=". $value .">";
            next($filters_list);
        }
        return $TEMPLATE.$HIDDEN;
    }

    function Message(string $text): string {
        return "<p>".$text."</p>";
    }

    function ErrorMessage(string $text): string {
        return "<p class=\"errormsg\">".$text."</p>";
    }

?>