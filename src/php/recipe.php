<?php

require_once "utility-methods.php";
use DB\DB;
$db = new DB;

$paginaHtml=file_get_contents("../html/recipe.html");
$isUserLogged=$db->isUserLogged();
if ($isUserLogged!=false) {
    $paginaHtml=str_replace("<a href=\"sign-in.php\" class=\"shadow\">ACCEDI</a>","<a href=\"user.php\" class=\"shadow\">PROFILO</a>",$paginaHtml);
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
            	header('Location: recipe.php?recipe='.$recipe);
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
            	header('Location: recipe.php?recipe='.$recipe);
                exit();
            }
        }   
    } elseif(isset($_POST["submit-add-review"])){
        unset($_POST["submit-add-review"]);
        if($isUserLogged!=false) {
            $mark=$_POST["mark"];
            if($mark<1) {
                $mark=1;
            } elseif ($mark>30) {
                $mark=30;
            }
            $comment=DB::pulisciNote($_POST["comment"]);
            $result=$db->addUserReview($recipe,$comment,$mark);
            if($result==false) {
                header('Location: 500-err.php');
                exit();
            } else {
            	header('Location: recipe.php?recipe='.$recipe);
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
            	header('Location: recipe.php?recipe='.$recipe);
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
    $paginaHtml=str_replace("{{Recipe-title}}",$recipeDetails["nome"],$paginaHtml);
    $mark=$db->getRecipeAverage($recipe);
    if(is_string($mark) && (strcmp($mark,"ExceptionThrow")==0 || strcmp($mark,"ConnectionFailed")==0)) {
        header('Location: 500-err.php');
        exit();
    }
    $paginaHtml=str_replace("{{mark}}",$mark,$paginaHtml);
    $categoria=str_replace("_"," ",$recipeDetails["categoria"]);
    $paginaHtml=str_replace("{{category}}",$categoria,$paginaHtml);
    $paginaHtml=str_replace("{{plate-type}}",$recipeDetails["tipo_piatto"],$paginaHtml);
    $paginaHtml=str_replace("{{time}}",$recipeDetails["tempo"],$paginaHtml);
    $paginaHtml=str_replace("{{price}}",$recipeDetails["prezzo"],$paginaHtml);
    if($isUserLogged!=false) {
        $formFavourites="<form action=\"recipe.php?recipe=".$recipe.'"'."method=\"post\" class=\"end-paragraph\">";
        $isRecipeAUserFavourite=$db->isRecipeInUserFavourites($recipe,$isUserLogged);
        if(is_string($isRecipeAUserFavourite)) {
            header('Location: 500-err.php');
            exit();
        } elseif ($isRecipeAUserFavourite==true) {
            $formFavourites.="<button id=\"recipe-fav-btn\" type=\"submit\" name=\"remove-from-favourites\" class=\"shadow\">";
            $formFavourites.="Rimuovi dai preferiti";
        } else {
            $formFavourites.="<button id=\"recipe-fav-btn\" type=\"submit\" name=\"add-to-favourites\" class=\"shadow\">";
            $formFavourites.="Aggiungi ai preferiti";
        }
        $formFavourites.="</button></form>";
        $paginaHtml=str_replace("{{form-add-to-favourites}}",$formFavourites,$paginaHtml);
    } else {
        $paginaHtml=str_replace("{{form-add-to-favourites}}","",$paginaHtml);
    }
    $paginaHtml=str_replace("{{description}}",$recipeDetails["descrizione"],$paginaHtml);
    
    $ingredients=$db->getRecipeIngredients($recipe);
    if(is_string($ingredients)) {
        header('Location: 500-err.php');
        exit();
    }
    $finalList="";
    foreach($ingredients as $singleIngredient) {
        $finalList.="<li>".ucfirst($singleIngredient["ingrediente"])." ";
        if($singleIngredient["quanto_basta"]==true) {
            $finalList.='<abbr title="quanto basta">q.b.</abbr>';
        } else {
            $finalList.=$singleIngredient["quantita"]." ";
            switch($singleIngredient["unita_misura"]) {
                case 'g':
                    $finalList.='<abbr title="grammi">g</abbr>';
                    break;
                case 'ml':
                    $finalList.='<abbr title="millilitri">ml</abbr>';
                    break;
                case 'num_el':
                    break;
                default:
                    header('Location: 500-err.php');
                    exit();
            }
        }
        if ($singleIngredient["descrizione"]) {
            $finalList.=" (".$singleIngredient["descrizione"].")</li>";
        } else {
            $finalList.="</li>";
        }
    }

    $paginaHtml=str_replace("{{ingredients-list}}",$finalList,$paginaHtml);

    $finalList="";
    $toDoList=$db->getRecipeToDoList($recipe);
    if(is_string($toDoList)) {
        header('Location: 500-err.php');
        exit();
    }
    foreach($toDoList as $element) {
        $finalList.='<li class="prep-li">'.$element["descrizione"]."</li>";
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
            $immagine="../asset/img/def-profile.png";
        }
        $userComment=$db->getUserPublicComment($isUserLogged,$recipe);
        if(is_string($userComment) && strcmp($userComment,"userLeftNoComment")==0) {
            $form.='<div id="add-comment" class="content-container-left content">';
            $form.='<img src="'.$immagine.'" id="add-comment-pp">';
            $form.='<form method="post" action="recipe.php?recipe='.str_replace(" ","%20",$recipe).'" class="content">'.'<fieldset><div class="input-container"><label class="form-label" for="add-comment-eval">Valuta questa ricetta (voto da 1 a 30)</label><div id="add-comment-eval-container"><input type="number" id="add-comment-eval" min="1" max="30" placeholder="18" required name="mark"><span><abbr title="su">/</abbr> 30</span></div></div><label class="form-label" for="add-comment-text">Commenta</label><textarea id="add-comment-text" maxlength="200" placeholder="Motiva la tua valutazione" required name="comment"></textarea><button class="button-input button-input-confirm" type="submit" name="submit-add-review">VALUTA</button><button class="button-input button-input-cancel" type="reset">CANCELLA</button></fieldset></form></div>';
        } elseif (is_string($userComment)) {
            header('Location: 500-err.php');
            exit();
        } else {
            $form.='<div class="content"><div id="user-comment">';
            $form.='<img src="'.$immagine.'" class="comment-pp">';
            $form.='<a href="user.php">'.$isUserLogged."</a>";
            $form.='<p class="comment-eval">'.$userComment["voto"].' <abbr title="su">/</abbr> 30</p>';
            $form.='<p class="comment-text">'.$userComment["commento"].'</p></div><form method="post" action="recipe.php?recipe='.str_replace(" ","%20",$recipe).'"><button type="submit" id="del-comment" class="load-more-btn" name="submit-remove-review">CANCELLA VALUTAZIONE</button></form></div>';
            $form.='<time class="comment-date" datetime="'.$userComment["data"].'">'.date("d/m/Y",strtotime($userComment["data"]))."</time>";
        }
        $paginaHtml=str_replace("{{leave-comment-or-personal-published-comment}}",$form,$paginaHtml);
    } else {
        $paginaHtml=str_replace("{{leave-comment-or-personal-published-comment}}","<p id=\"no-login-p\">Accedi per poter commentare!</p>",$paginaHtml);
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
                    $immagine="../asset/img/def-profile.png";
                }
                if($commentNumber==$limit-6) {
                    $finalList.='<li id="previous-last-comment"><img src="'.$immagine.'" alt="" class="comment-pp">';
                } else {
                    $finalList.='<li><img src="'.$immagine.'" alt="" class="comment-pp">';
                }
                $finalList.='<a href="user.php?username='.$singleComment["utente"].'">'.$singleComment["utente"]."</a>";
                $finalList.='<p class="comment-eval">'.$singleComment["voto"].' <abbr title="su">/</abbr> 30</p>';
                $finalList.='<p class="comment-text">'.$singleComment["commento"]."</p></li>";
                $finalList.='<time class="comment-date" datetime="'.$singleComment["data"].'">'.date("d/m/Y",strtotime($singleComment["data"]))."</time>";
                $commentNumber=$commentNumber+1;
            }
        }
        $finalList.="</ul>";
        $paginaHtml=str_replace("{{comment-list}}",$finalList,$paginaHtml);
        if($commentNumber<count($comments)) {
            $moreCommentsForm='<form action="recipe.php#previous-last-comment" method="get">';
            $moreCommentsForm.='<input type="hidden" name="commentLimit" value="'.$limit+5;
            $moreCommentsForm.='"><input type="hidden" name="recipe" value="'.$recipe;
            $moreCommentsForm.='"><button type="submit" id="more-comment-btn" class="load-more-btn shadow">Carica altre valutazioni</button></form><a href="#comment-list" class="back-up-link">Torna su</a>';
            $paginaHtml=str_replace("{{comment-more-button}}",$moreCommentsForm,$paginaHtml);
        } else {
            $paginaHtml=str_replace("{{comment-more-button}}",'<a href="#comment-list" class="back-up-link">Torna su al primo commento</a>',$paginaHtml);
        }
    }
    
    echo $paginaHtml;

} else {
    header('Location: catalogue.php');
    exit();
}