<?php

require_once "utils/utility-methods.php";
require_once "utils/sanitizer.php";
use Utilities\DB;
use Utilities\Sanitizer;

$db = new DB;

$paginaHtml=file_get_contents("./html/recipe.html");
$isUserLogged=$db->isUserLogged();
if ($isUserLogged!=false) {
    $paginaHtml=str_replace("{{link-accesso-profilo}}","<a href=\"user.php\" class=\"a-btn-secondary shadow\">PROFILO</a>",$paginaHtml);
} else {
    $paginaHtml=str_replace("{{link-accesso-profilo}}","<a href=\"sign-in.php\" class=\"a-btn-secondary shadow\">ACCEDI</a>",$paginaHtml); 
}

if(isset($_SESSION["prev-page"])) {
    $paginaHtml=str_replace("{{prev-page}}",$_SESSION["prev-page"],$paginaHtml);
    unset($_SESSION["prev-page"]);
} else {
    $paginaHtml=str_replace("{{prev-page}}","<a href=\"./catalogue.php\">RICETTE</a>",$paginaHtml);
}

if(isset($_GET["recipe"])) {
    $recipe=$_GET["recipe"];

    unset($_GET["recipe"]);

    if(isset($_POST["add-to-favourites"])){
        unset($_POST["add-to-favourites"]);
        if($isUserLogged!=false) {
            $result=$db->addRecipeToUserFavourites($recipe);
            if(is_string($result) || (is_bool($result) && $result==false)) {
                header('Location: 500-err.php');
                exit();
            } else {
            	header('Location: recipe.php?recipe='.urlencode($recipe));
                exit();
            }
        }    
    } elseif(isset($_POST["remove-from-favourites"])) {
        unset($_POST["remove-from-favourites"]);
        if($isUserLogged!=false) {
            $result=$db->removeRecipeFromUserFavourites($recipe);
            if(is_string($result)) {
                header('Location: 500-err.php');
                exit();
            } else {
            	header('Location: recipe.php?recipe='.urlencode($recipe));
                exit();
            }
        }   
    } elseif(isset($_POST["submit-add-review"])){
        unset($_POST["submit-add-review"]);
        if($isUserLogged!=false) {
            $mark=$_POST["mark"];
            if(filter_input(INPUT_GET, 'mark', FILTER_VALIDATE_INT) === false) {
                $mark=30;
            }
            if($mark<1) {
                $mark=1;
            } elseif ($mark>30) {
                $mark=30;
            }
            $comment=Sanitizer::SanitizeText($_POST["comment"]);
            if(mb_strlen($comment)==0) {
                $_SESSION["commentError"]="Il testo della valutazione è necessario";
                header('Location: recipe.php?recipe='.urlencode($recipe));
                exit();
            }
            if(mb_strlen($comment)>200) {
                $_SESSION["commentError"]="il numero di caratteri nel testo della valutazione è superiore a 200";
                header('Location: recipe.php?recipe='.urlencode($recipe));
                exit();
            }
            $result=$db->addUserReview($recipe,$comment,$mark);
            if($result==false) {
                header('Location: 500-err.php');
                exit();
            } else {
            	header('Location: recipe.php?recipe='.urlencode($recipe));
                exit();
            }
        } 
    } elseif(isset($_POST["submit-remove-review"])){
            unset($_POST["submit-remove-review"]);
            $result=$db->removeUserComment($recipe);
            if(is_string($result)) {
                header('Location: 500-err.php');
                exit();
            } else {
            	header('Location: recipe.php?recipe='.urlencode($recipe));
                exit();
            }
    } 

    $recipeExistance=$db->doesRecipeExists($recipe);
    if(is_bool($recipeExistance) && $recipeExistance==false) {
        header('Location: 404-err.php');
        exit();
    } elseif (is_string($recipeExistance)) {
        header('Location: 500-err.php');
        exit();
    }

    $recipeDetails=$db->getRecipeDetails($recipe);
    if(is_string($recipeDetails)) {
        header('Location: 500-err.php');
        exit();
    }

    $paginaHtml=str_replace("{{recipe-image-src}}",$recipeDetails["immagine"],$paginaHtml);
    $paginaHtml=str_replace("{{Recipe-title}}",$db->checkLang(ucfirst($recipeDetails["nome"]),false),$paginaHtml);
    $paginaHtml=str_replace("{{Recipe-title-body}}",$db->checkLang(strtoupper($recipeDetails["nome"])),$paginaHtml);
    $mark=$db->getRecipeAverage($recipe);
    if(is_string($mark) && (strcmp($mark,"ExceptionThrow")==0 || strcmp($mark,"ConnectionFailed")==0)) {
        header('Location: 500-err.php');
        exit();
    }
    $paginaHtml=str_replace("{{mark}}",$mark,$paginaHtml);
    $categoria=str_replace("_"," ",strtoupper($recipeDetails["categoria"]));
    $paginaHtml=str_replace("{{category}}",$categoria,$paginaHtml);
    $paginaHtml=str_replace("{{plate-type}}",strtoupper($recipeDetails["tipo_piatto"]),$paginaHtml);
    $paginaHtml=str_replace("{{time}}",$recipeDetails["tempo"],$paginaHtml);
    $paginaHtml=str_replace("{{price}}",$recipeDetails["prezzo"],$paginaHtml);
    if($isUserLogged!=false) {
        $formFavourites="<form action=\"recipe.php?recipe=".urlencode($recipe).'"'."method=\"post\">";
        $isRecipeAUserFavourite=$db->isRecipeInUserFavourites($recipe,$isUserLogged);
        if(is_string($isRecipeAUserFavourite)) {
            header('Location: 500-err.php');
            exit();
        } elseif ($isRecipeAUserFavourite==true) {
            $formFavourites.="<button id=\"recipe-fav-btn\" type=\"submit\" name=\"remove-from-favourites\" class=\"shadow\">";
            $formFavourites.="RIMUOVI DAI PREFERITI";
        } else {
            $formFavourites.="<button id=\"recipe-fav-btn\" type=\"submit\" name=\"add-to-favourites\" class=\"shadow\">";
            $formFavourites.="AGGIUNGI AI PREFERITI";
        }
        $formFavourites.="</button></form>";
        $paginaHtml=str_replace("{{form-add-to-favourites}}",$formFavourites,$paginaHtml);
    } else {
        $paginaHtml=str_replace("{{form-add-to-favourites}}","",$paginaHtml);
    }
    $paginaHtml=str_replace("{{description}}",$db->checkLang(ucfirst($recipeDetails["descrizione"])),$paginaHtml);
    
    $ingredients=$db->getRecipeIngredients($recipe);
    if(is_string($ingredients)) {
        header('Location: 500-err.php');
        exit();
    }
    $finalList="";
    foreach($ingredients as $singleIngredient) {
        $finalList.="<li>".$db->checkLang(ucfirst($singleIngredient["ingrediente"]));
        if($singleIngredient["quanto_basta"]==true) {
            $finalList.=' <abbr title="quanto basta">q.b.</abbr>';
        } else {
            $finalList.=" ".$singleIngredient["quantita"];
            switch($singleIngredient["unita_misura"]) {
                case 'g':
                    $finalList.=' <abbr title="grammi">g</abbr>';
                    break;
                case 'ml':
                    $finalList.=' <abbr title="millilitri">ml</abbr>';
                    break;
                case 'num_el':
                    break;
                default:
                    header('Location: 500-err.php');
                    exit();
            }
        }
        if ($singleIngredient["descrizione"]) {
            $finalList.=" (".$db->checkLang($singleIngredient["descrizione"]).")";
        }
        $finalList.="</li>";
    }

    $paginaHtml=str_replace("{{ingredients-list}}",$finalList,$paginaHtml);

    $finalList="";
    $toDoList=$db->getRecipeToDoList($recipe);
    if(is_string($toDoList)) {
        header('Location: 500-err.php');
        exit();
    }
    foreach($toDoList as $element) {
        $finalList.='<li class="prep-li">'.$db->checkLang(ucfirst($element["descrizione"]))."</li>";
    }
    $paginaHtml=str_replace("{{what-to-do-list}}",$finalList,$paginaHtml);

    if($isUserLogged!=false)
    {
        $form="";
        $userInfo=$db->getUserPublicInfo($isUserLogged);
        if(is_string($userInfo)) {
            header('Location: 500-err.php');
            exit();
        }
        $immagine=$userInfo["immagine"];
        if($immagine==null) {
            $immagine="./asset/img/def-profile.png";
        }
        $userComment=$db->getUserPublicComment($isUserLogged,$recipe);
        if(is_string($userComment) && strcmp($userComment,"userLeftNoComment")==0) {
            $form.='<div id="add-comment" class="content-container-left content">';
            $form.='<img loading="lazy" src="'.$immagine.'" alt="" id="add-comment-pp">';
            if(isset($_SESSION["commentError"])) {
                $form.='<form method="post" action="recipe.php?recipe='.urlencode($recipe).'" class="content" id="first-form">'.'<fieldset><div class="input-container"><label class="form-label" for="add-comment-eval">Valuta questa ricetta (voto da 1 a 30)</label><div id="add-comment-eval-container"><input type="number" id="add-comment-eval" min="1" max="30" placeholder="18" required name="mark"><span><abbr title="su">/</abbr> 30</span></div></div><label class="form-label" for="add-comment-text">Commenta</label><textarea id="add-comment-text" maxlength="200" placeholder="Motiva la tua valutazione" required name="comment"></textarea><p class="err-msg">'.$_SESSION["commentError"].'<button class="button-input button-input-confirm" type="submit" name="submit-add-review">VALUTA</button><button class="button-input button-input-cancel" type="reset">CANCELLA</button></fieldset></form></div>';
                unset($_SESSION["commentError"]);
            } else {
                $form.='<form method="post" action="recipe.php?recipe='.urlencode($recipe).'" class="content" id="first-form">'.'<fieldset><div class="input-container"><label class="form-label" for="add-comment-eval">Valuta questa ricetta (voto da 1 a 30)</label><div id="add-comment-eval-container"><input type="number" id="add-comment-eval" min="1" max="30" placeholder="18" required name="mark"><span><abbr title="su">/</abbr> 30</span></div></div><label class="form-label" for="add-comment-text">Commenta</label><textarea id="add-comment-text" maxlength="200" placeholder="Motiva la tua valutazione" required name="comment"></textarea><p class="err-msg"><button class="button-input button-input-confirm" type="submit" name="submit-add-review">VALUTA</button><button class="button-input button-input-cancel" type="reset">CANCELLA</button></fieldset></form></div>';
            }    
        } elseif (is_string($userComment)) {
            if(isset($_SESSION["commentError"])) {
                unset($_SESSION["commentError"]);
            }
            header('Location: 500-err.php');
            exit();
        } else {
            $form.='<div class="content"><div id="user-comment">';
            $form.='<img loading="lazy" src="'.$immagine.'" alt="" class="comment-pp">';
            $form.='<a class="username" href="user.php">'.$isUserLogged."</a>";
            $form.='<p class="comment-eval"><span class="grade">'.$userComment["voto"].'</span> <abbr title="su">/</abbr> 30</p>';
            $form.='<p class="comment-text">'.$userComment["commento"].'</p>';
            $form.='<time class="comment-date" datetime="'.$userComment["data"].'">'.date("d/m/Y",strtotime($userComment["data"])).'</time></div><form method="post" action="recipe.php?recipe='.urlencode($recipe).'"><button type="submit" id="del-comment" class="load-more-btn" name="submit-remove-review">CANCELLA VALUTAZIONE</button></form></div>';
        }
        $paginaHtml=str_replace("{{leave-comment-or-personal-published-comment}}",$form,$paginaHtml);
    } else {
        $paginaHtml=str_replace("{{leave-comment-or-personal-published-comment}}","<p id=\"no-login-p\"><a href=\"sign-in.php\">Accedi</a> per poter commentare!</p>",$paginaHtml);
    }
    
    $limit=5;

    if(isset($_GET["commentLimit"])) {
        $limit=$_GET["commentLimit"];
        if(filter_input(INPUT_GET, 'commentLimit', FILTER_VALIDATE_INT) === false) {
            header('Location: 500-err.php');
            exit();
        }
        unset($_GET["commentLimit"]);
    }
    
    $comments=$db->getRecipeComments($recipe,$limit+1);
    if(is_string($comments) && strcmp($comments,"noComments")==0) {
        $paginaHtml=str_replace("{{comment-list}}","<p id=\"no-login-p\">Ancora nessun commento...</p>",$paginaHtml);
        $paginaHtml=str_replace("{{comment-more-button}}","",$paginaHtml);
    } else {
        $finalList='<ul id="comment-list" class="content">';
        $commentNumber=0;
        foreach($comments as $singleComment) {
            if($commentNumber<$limit)
            {
                $user=$db->getUserPublicInfo($singleComment["utente"]);
                if(is_string($user)) {
                    header('Location: 500-err.php');
                    exit();
                }
                $immagine=$user["immagine"];
                if($immagine==null) {
                    $immagine="./asset/img/def-profile.png";
                }
                if($commentNumber==$limit-6) {
                    $finalList.='<li id="previous-last-comment"><img loading="lazy" src="'.$immagine.'" alt="" class="comment-pp">';
                } else {
                    $finalList.='<li><img loading="lazy" src="'.$immagine.'" alt="" class="comment-pp">';
                }
                $finalList.='<a href="user.php?username='.$singleComment["utente"].'">'.$singleComment["utente"]."</a>";
                $finalList.='<p class="comment-eval"><span class="grade">'.$singleComment["voto"].'</span> <abbr title="su">/</abbr> 30</p>';
                $finalList.='<p class="comment-text">'.$singleComment["commento"]."</p>";
                $finalList.='<time class="comment-date" datetime="'.$singleComment["data"].'">'.date("d/m/Y",strtotime($singleComment["data"]))."</time></li>";
                $commentNumber=$commentNumber+1;
            }
        }
        $finalList.="</ul>";
        $paginaHtml=str_replace("{{comment-list}}",$finalList,$paginaHtml);
        $moreCommentsForm="";
        if($commentNumber<count($comments)) {
            $moreCommentsForm='<form action="recipe.php#previous-last-comment" method="get">';
            $moreCommentsForm.='<input type="hidden" name="commentLimit" value="'.$limit+5;
            $moreCommentsForm.='"><input type="hidden" name="recipe" value="'.$recipe;
            $moreCommentsForm.='"><button type="submit" id="more-comment-btn" class="load-more-btn shadow">Carica altre valutazioni</button></form>';
        }

        if($commentNumber>1) {
            $moreCommentsForm.='<a href="#comment-list" id="back-up-first-comment" class="back-up-link">Torna su al primo commento</a>';
        }

        $paginaHtml=str_replace("{{comment-more-button}}",$moreCommentsForm,$paginaHtml);
    }
    
    echo $paginaHtml;

} else {
    header('Location: catalogue.php');
    exit();
}
