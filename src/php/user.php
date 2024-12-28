<?php

    require_once "utility-methods.php";
    use DB\DB;

    $paginaHtml=file_get_contents("../html/user.html");
    $username="";

    $db = new DB;

    if(!isset($_GET["username"])) {
        $isLogged=$db->isUserLogged();

        if (is_bool($isLogged) && $isLogged==false) {
            header('Location: sign-in.php');
            exit();
        }

        //se è stato passato il controllo precedente l'utente è loggato e $isLogged è il nome utente
        $paginaHtml=str_replace("{{username}}",strtoupper($isLogged),$paginaHtml);
        $userInfo=$db->getUserInfo();
        if (is_string($userInfo) && (strcmp($userInfo,"ExceptionThrow")==0 || strcmp($userInfo,"genericError")==0 || strcmp($userInfo,"ConnectionFailed")==0)) {
            header('Location: 505-err.php');
            exit();
        } else if(is_string($userInfo) && strcmp($userInfo,"userIsNotLogged")==0) {
            header('Location: sign-in.php');
            exit();
        } else {
            $paginaHtml=str_replace("{{data}}",date("d/m/Y",strtotime($userInfo["data_iscrizione"])),$paginaHtml);
            $paginaHtml=str_replace("{{data-attr}}",$userInfo["data_iscrizione"],$paginaHtml);
            $paginaHtml=str_replace("{{categoria}}",str_replace("_"," ",strtoupper($userInfo["tipo_studente"])),$paginaHtml);
            if ($userInfo["biografia"]) {
                $paginaHtml=str_replace("{{biografia}}",$userInfo["biografia"],$paginaHtml);
            } else {
                $paginaHtml=str_replace("{{biografia}}","Sembra tu non abbia ancora impostato una biografia: <a href=\"user-edit.php\">modifica il tuo profilo</a>!",$paginaHtml);
            }
            if ($userInfo["immagine"]) {
                $paginaHtml=str_replace("{{profile-pic}}",$userInfo["immagine"],$paginaHtml);
            } else {
                $paginaHtml=str_replace("{{profile-pic}}","../asset/img/def-profile.png",$paginaHtml);
            }

            $favouritesList=$db->getUserFavourites($isLogged);
            if(is_string($favouritesList) && (strcmp($favouritesList,"ExceptionThrow")==0 || strcmp($favouritesList,"ConnectionFailed")==0)) {
                header('Location: 505-err.php');
                exit();
            }
            elseif(is_string($favouritesList) && strcmp($favouritesList,"noFavourites")==0) {
                $paginaHtml=str_replace("{{lista-preferiti}}","<li><p id=\"empty-fav-recipe-list\">Salva le ricette migliori, le potrai trovare qui!</p></li>",$paginaHtml);
            }
            else {
                $recipeList = "";
                foreach($favouritesList as $recipe) {
                    $recipeList.="<li class=\"fav-recipe content\">";
                    $recipeList.='<div class="fav-recipe-img-crop"><img src="'.$recipe["immagine"].'"></div>';
                    $recipeList.="<div class=\"fav-recipe-title\"> <h4>".$recipe["nome"]."</h4> </div>";
                    $average=$db->getRecipeAverage($recipe["nome"]);
                    if(is_string($average) && (strcmp($average,"ExceptionThrow")==0 || strcmp($average,"ConnectionFailed")==0)) {
                        header('Location: 505-err.php');
                        exit();
                    }
                    $recipeList.="<ul class=\"fav-recipe-info\"><li><img src=\"../asset/icon/grade.svg\" alt=\"valutato con\">".$average."<abbr title=\"su\">/</abbr>30</li>";
                    $categoria=str_replace("_"," ",$recipe["categoria"]);
                    $recipeList.="<li><img src=\"../asset/icon/student.svg\" alt=\"categoria\">".$categoria."</li>";
                    $recipeList.="<li><img src=\"../asset/icon/course.svg\" alt=\"piatto\">".$recipe["tipo_piatto"]."</li>";
                    $recipeList.="<li><img src=\"../asset/icon/cost.svg\" alt=\"costo\">".$recipe["prezzo"]."€</li></ul>";
                    $recipeList.='<a href=recipe.php?recipe='.str_replace(" ","%20",$recipe["nome"]).' title="'.$recipe["nome"].'">Vai alla ricetta</a></li>';
                }
                $paginaHtml=str_replace("{{lista-preferiti}}",$recipeList,$paginaHtml);
            }
            echo $paginaHtml;
        }
    } else {
        $username = $_GET["username"];
        unset($_GET["username"]);

        $paginaHtml=str_replace("{{username}}",strtoupper($username),$paginaHtml);
        $userInfo=$db->getUserPublicInfo($username);
        if (is_string($userInfo) && (strcmp($userInfo,"ExceptionThrow")==0 || strcmp($userInfo,"genericError")==0 || strcmp($userInfo,"ConnectionFailed")==0)) {
            header('Location: 505-err.php');
            exit();
        } elseif(is_string($userInfo) && strcmp($userInfo,"noUserFound")==0) {
            header('Location: 404-err.php');
            exit();
        } else {
            $paginaHtml=str_replace("{{data}}",date("d/m/Y",strtotime($userInfo["data_iscrizione"])),$paginaHtml);
            $paginaHtml=str_replace("{{data-attr}}",$userInfo["data_iscrizione"],$paginaHtml);
            $paginaHtml=str_replace("{{categoria}}",str_replace("_"," ",strtoupper($userInfo["tipo_studente"])),$paginaHtml);
            if ($userInfo["biografia"]) {
                $paginaHtml=str_replace("{{biografia}}",$userInfo["biografia"],$paginaHtml);
            } else {
                $paginaHtml=str_replace("{{biografia}}",$username." non ha impostato una biografia.",$paginaHtml);
            }
            if ($userInfo["immagine"]) {
                $paginaHtml=str_replace("{{profile-pic}}",$userInfo["immagine"],$paginaHtml);
            } else {
                $paginaHtml=str_replace("{{profile-pic}}","../asset/img/def-profile.png",$paginaHtml);
            }

            $favouritesList=$db->getUserFavourites($username);
            if(is_string($favouritesList) && (strcmp($favouritesList,"ExceptionThrow")==0 || strcmp($favouritesList,"ConnectionFailed")==0)) {
                header('Location: 505-err.php');
                exit();
            }
            elseif(is_string($favouritesList) && strcmp($favouritesList,"noFavourites")==0) {
                $paginaHtml=str_replace("{{lista-preferiti}}","<li><p id=\"empty-fav-recipe-list\">".$username." non ha ricette salvate.</p></li>",$paginaHtml);
            }
            else {
                $recipeList = "";
                foreach($favouritesList as $recipe) {
                    $recipeList.="<li class=\"fav-recipe content\">";
                    $recipeList.='<div class="fav-recipe-img-crop"><img src="'.$recipe["immagine"].'"></div>';
                    $recipeList.="<div class=\"fav-recipe-title\"> <h4>".$recipe["nome"]."</h4> </div>";
                    $average=$db->getRecipeAverage($recipe["nome"]);
                    if(is_string($average) && (strcmp($average,"ExceptionThrow")==0 || strcmp($average,"ConnectionFailed")==0)) {
                        header('Location: 505-err.php');
                        exit();
                    }
                    $recipeList.="<ul class=\"fav-recipe-info\"><li><img src=\"../asset/icon/grade.svg\" alt=\"valutato con\">".$average."<abbr title=\"su\">/</abbr>30</li>";
                    $categoria=str_replace("_"," ",$recipe["categoria"]);
                    $recipeList.="<li><img src=\"../asset/icon/student.svg\" alt=\"categoria\">".$categoria."</li>";
                    $recipeList.="<li><img src=\"../asset/icon/course.svg\" alt=\"piatto\">".$recipe["tipo_piatto"]."</li>";
                    $recipeList.="<li><img src=\"../asset/icon/cost.svg\" alt=\"costo\">".$recipe["prezzo"]."€</li></ul>";
                    $recipeList.='<a href=recipe.php?recipe='.str_replace(" ","%20",$recipe["nome"]).' title="'.$recipe["nome"].'">Vai alla ricetta</a></li>';
                }
                $paginaHtml=str_replace("{{lista-preferiti}}",$recipeList,$paginaHtml);
            }
            $paginaHtml=str_replace("<a href=\"./user-edit.html\" id=\"edit-profile-link\">MODIFICA PROFILO</a>","",$paginaHtml);
            $paginaHtml=str_replace("<a href=\"../php/sign-out.php\" id=\"log-out-btn\">ESCI</a>","",$paginaHtml);
            echo $paginaHtml;
        }
    }