<?php

require_once "utils/utility-methods.php";
use Utilities\DB;

$paginaHtml = file_get_contents("./html/user.html");
$username = "";

$db = new DB;
$isLogged = $db->isUserLogged();

if (!isset($_GET["username"])) {

    if (is_bool($isLogged) && $isLogged == false) {
        header('Location: sign-in.php');
        exit();
    }

    $_SESSION["prev-page"] = "<a href=\"./user.php\">PROFILO UTENTE</a>";

    //se è stato passato il controllo precedente l'utente è loggato e $isLogged è il nome utente
    $paginaHtml = str_replace("{{username}}", $isLogged, $paginaHtml);
    $paginaHtml = str_replace("{{profile-list-element}}", "", $paginaHtml);
    $paginaHtml = str_replace("{{sign-out-form}}", '<form action="./sign-out.php" method="post"><button id="log-out" class="shadow" type="submit" name="sign-out" value="true">ESCI</button></form>', $paginaHtml);
    $userInfo = $db->getUserInfo();
    if (is_string($userInfo) && (strcmp($userInfo, "ExceptionThrow") == 0 || strcmp($userInfo, "genericError") == 0 || strcmp($userInfo, "ConnectionFailed") == 0)) {
        header('Location: 500-err.php');
        exit();
    } else if (is_string($userInfo) && strcmp($userInfo, "userIsNotLogged") == 0) {
        header('Location: sign-in.php');
        exit();
    } else {
        $paginaHtml = str_replace("{{data}}", date("d/m/Y", strtotime($userInfo["data_iscrizione"])), $paginaHtml);
        $paginaHtml = str_replace("{{data-attr}}", $userInfo["data_iscrizione"], $paginaHtml);
        $paginaHtml = str_replace("{{categoria}}", str_replace("_", " ", strtoupper($userInfo["tipo_studente"])), $paginaHtml);
        if ($userInfo["biografia"]) {
            $paginaHtml = str_replace("{{biografia}}", ucfirst($userInfo["biografia"]), $paginaHtml);
        } else {
            $paginaHtml = str_replace("{{biografia}}", "Sembra tu non abbia una biografia! <a href=\"user-edit.php\">Modifica il tuo profilo</a> e scrivi qualcosa di te.", $paginaHtml);
        }
        if ($userInfo["immagine"]) {
            $paginaHtml = str_replace("{{profile-pic}}", $userInfo["immagine"], $paginaHtml);
        } else {
            $paginaHtml = str_replace("{{profile-pic}}", "./asset/img/def-profile.webp", $paginaHtml);
        }

        $limit = 5;
        if (isset($_GET["prefRecipeLimit"])) {
            $limit = $_GET["prefRecipeLimit"];
            if (filter_input(INPUT_GET, 'prefRecipeLimit', FILTER_VALIDATE_INT) === false) {
                header('Location: 500-err.php');
                exit();
            }
            unset($_GET["prefRecipeLimit"]);
        }

        $favouritesList = $db->getUserFavourites($isLogged, $limit + 1);
        if (is_string($favouritesList) && (strcmp($favouritesList, "ExceptionThrow") == 0 || strcmp($favouritesList, "ConnectionFailed") == 0)) {
            header('Location: 500-err.php');
            exit();
        } elseif (is_string($favouritesList) && strcmp($favouritesList, "noFavourites") == 0) {
            $paginaHtml = str_replace("{{lista-preferiti}}", "<li><p id=\"empty-fav-recipe-list\">Salva le <a href=\"./catalogue.php\">ricette</a> migliori, le potrai trovare qui!</p></li>", $paginaHtml);
            $paginaHtml = str_replace("{{more-recipe-form}}", "", $paginaHtml);
        } else {
            $recipeList = "";
            $recipeCounter = 0;
            foreach ($favouritesList as $recipe) {
                if ($recipeCounter < $limit) {
                    if ($recipeCounter == $limit - 6) {
                        $recipeList .= "<li class=\"fav-recipe shadow\" id=\"prev-last-recipe\">";
                    } else {
                        $recipeList .= "<li class=\"fav-recipe shadow\">";
                    }
                    $recipeList .= '<a href="recipe.php?recipe=' . urlencode($recipe["nome"]) . '" title="vai alla ricetta ' . $recipe["nome"] . '" class="recipe-card">';
                    $recipeList .= '<img loading="lazy" class="fav-recipe-img-crop" src="' . $recipe["immagine"] . '" alt=""/>';
                    $recipeList .= "<div><h4 class=\"fav-recipe-title\">" . $db->checkLang(ucfirst($recipe["nome"])) . "</h4>";
                    $average = $db->getRecipeAverage($recipe["nome"]);
                    if (is_string($average) && (strcmp($average, "ExceptionThrow") == 0 || strcmp($average, "ConnectionFailed") == 0)) {
                        header('Location: 500-err.php');
                        exit();
                    }
                    $recipeList .= "<ul class=\"fav-recipe-info\"><li><img loading=\"lazy\" src=\"./asset/icon/grade.svg\" alt=\"valutato con\"/>" . $average . "<abbr title=\"su\"> / </abbr>30</li>";
                    $categoria = str_replace("_", " ", $recipe["categoria"]);
                    $recipeList .= "<li><img loading=\"lazy\" src=\"./asset/icon/student.svg\" alt=\"categoria\"/>" . strtoupper($categoria) . "</li>";
                    $recipeList .= "<li><img loading=\"lazy\" src=\"./asset/icon/course.svg\" alt=\"piatto\"/>" . strtoupper($recipe["tipo_piatto"]) . "</li>";
                    $recipeList .= "<li><img loading=\"lazy\" src=\"./asset/icon/cost.svg\" alt=\"costo\"/>" . $recipe["prezzo"] . " &euro;</li></ul>";
                    $recipeList .= '<p aria-hidden="true" class="fake-link">Vai alla ricetta</p></div></a></li>';
                    $recipeCounter = $recipeCounter + 1;
                }
            }
            $paginaHtml = str_replace("{{lista-preferiti}}", $recipeList, $paginaHtml);

            $moreRecipeForm = "";
            if ($recipeCounter < count($favouritesList)) {
                $moreRecipeForm .= '<form action="user.php#prev-last-recipe" method="get">';
                $moreRecipeForm .= '<input type="hidden" name="prefRecipeLimit" value="' . $limit + 5;
                $moreRecipeForm .= '"/><button class="load-more-btn shadow">Carica le altre ricette</button></form>';
            }

            if(count($favouritesList)>1) {
                $moreRecipeForm .= '<a href="#fav-recipe-list" id="back-up-first-fav-recipe" class="back-up-link">Torna su alla prima ricetta preferita</a>';
            }

            $paginaHtml = str_replace("{{more-recipe-form}}", $moreRecipeForm, $paginaHtml);
        }
        echo $paginaHtml;
    }
} else {
    $username = $_GET["username"];
    unset($_GET["username"]);

    $_SESSION["prev-page"] = "<a href=\"./user.php?username=" . $username . '">PROFILO UTENTE</a>';

    if (is_bool($isLogged) && $isLogged == false) {
        $paginaHtml = str_replace("{{profile-list-element}}", '<li id="profile-item"> <a href="sign-in.php" class="a-btn-secondary shadow">ACCEDI</a></li>', $paginaHtml);
    } else {
        $paginaHtml = str_replace("{{profile-list-element}}", '<li id="profile-item"> <a href="user.php" class="a-btn-secondary shadow">PROFILO</a></li>', $paginaHtml);
    }

    $paginaHtml = str_replace("{{username}}", $username, $paginaHtml);
    $userInfo = $db->getUserPublicInfo($username);
    if (is_string($userInfo) && (strcmp($userInfo, "ExceptionThrow") == 0 || strcmp($userInfo, "genericError") == 0 || strcmp($userInfo, "ConnectionFailed") == 0)) {
        header('Location: 500-err.php');
        exit();
    } elseif (is_string($userInfo) && strcmp($userInfo, "noUserFound") == 0) {
        header('Location: 404-err.php');
        exit();
    } else {
        $paginaHtml = str_replace("{{data}}", date("d/m/Y", strtotime($userInfo["data_iscrizione"])), $paginaHtml);
        $paginaHtml = str_replace("{{data-attr}}", $userInfo["data_iscrizione"], $paginaHtml);
        $paginaHtml = str_replace("{{categoria}}", str_replace("_", " ", strtoupper($userInfo["tipo_studente"])), $paginaHtml);
        if ($userInfo["biografia"]) {
            $paginaHtml = str_replace("{{biografia}}", ucfirst($userInfo["biografia"]), $paginaHtml);
        } else {
            $paginaHtml = str_replace("{{biografia}}", $username . " non ha impostato una biografia.", $paginaHtml);
        }
        if ($userInfo["immagine"]) {
            $paginaHtml = str_replace("{{profile-pic}}", $userInfo["immagine"], $paginaHtml);
        } else {
            $paginaHtml = str_replace("{{profile-pic}}", "./asset/img/def-profile.webp", $paginaHtml);
        }

        $limit = 5;
        if (isset($_GET["prefRecipeLimit"])) {
            $limit = $_GET["prefRecipeLimit"];
            if (filter_input(INPUT_GET, 'prefRecipeLimit', FILTER_VALIDATE_INT) === false) {
                header('Location: 500-err.php');
                exit();
            }
            unset($_GET["prefRecipeLimit"]);
        }

        $favouritesList = $db->getUserFavourites($username, $limit + 1);
        if (is_string($favouritesList) && (strcmp($favouritesList, "ExceptionThrow") == 0 || strcmp($favouritesList, "ConnectionFailed") == 0)) {
            header('Location: 500-err.php');
            exit();
        } elseif (is_string($favouritesList) && strcmp($favouritesList, "noFavourites") == 0) {
            $paginaHtml = str_replace("{{lista-preferiti}}", "<li><p id=\"empty-fav-recipe-list\">" . $username . " non ha ricette salvate.</p></li>", $paginaHtml);
            $paginaHtml = str_replace("{{more-recipe-form}}", "", $paginaHtml);
        } else {
            $recipeList = "";
            $recipeCounter = 0;
            foreach ($favouritesList as $recipe) {
                if ($recipeCounter < $limit) {
                    if ($recipeCounter == $limit - 6) {
                        $recipeList .= "<li class=\"fav-recipe shadow\" id=\"prev-last-recipe\">";
                    } else {
                        $recipeList .= "<li class=\"fav-recipe shadow\">";
                    }
                    $recipeList .= '<a href="recipe.php?recipe=' . urlencode($recipe["nome"]) . '" title="vai alla ricetta ' . $recipe["nome"] . '" class="recipe-card">';
                    $recipeList .= '<img loading="lazy" class="fav-recipe-img-crop" src="' . $recipe["immagine"] . '" alt=""/>';
                    $recipeList .= "<div><h4 class=\"fav-recipe-title\">" . $db->checkLang(ucfirst($recipe["nome"])) . "</h4>";
                    $average = $db->getRecipeAverage($recipe["nome"]);
                    if (is_string($average) && (strcmp($average, "ExceptionThrow") == 0 || strcmp($average, "ConnectionFailed") == 0)) {
                        header('Location: 500-err.php');
                        exit();
                    }
                    $recipeList .= "<ul class=\"fav-recipe-info\"><li><img loading=\"lazy\" src=\"./asset/icon/grade.svg\" alt=\"valutato con\"/>" . $average . "<abbr title=\"su\"> / </abbr>30</li>";
                    $categoria = str_replace("_", " ", $recipe["categoria"]);
                    $recipeList .= "<li><img loading=\"lazy\" src=\"./asset/icon/student.svg\" alt=\"categoria\"/>" . $categoria . "</li>";
                    $recipeList .= "<li><img loading=\"lazy\" src=\"./asset/icon/course.svg\" alt=\"piatto\"/>" . $recipe["tipo_piatto"] . "</li>";
                    $recipeList .= "<li><img loading=\"lazy\" src=\"./asset/icon/cost.svg\" alt=\"costo\"/>" . $recipe["prezzo"] . " &euro;</li></ul>";
                    $recipeList .= '<p aria-hidden="true" class="fake-link">Vai alla ricetta</p></div></a></li>';
                    $recipeCounter = $recipeCounter + 1;
                }
            }
            $paginaHtml = str_replace("{{lista-preferiti}}", $recipeList, $paginaHtml);

            $moreRecipeForm = "";
            if ($recipeCounter < count($favouritesList)) {
                $moreRecipeForm .= '<form action="user.php#prev-last-recipe" method="get">';
                $moreRecipeForm .= '<input type="hidden" name="username" value="' . $username;
                $moreRecipeForm .= '"/><input type="hidden" name="prefRecipeLimit" value="' . $limit + 5;
                $moreRecipeForm .= '"/><button class="load-more-btn shadow">Carica le altre ricette</button></form>';
            }

            if($recipeCounter>1) {
                $moreRecipeForm .= '<a href="#fav-recipe-list" id="back-up-first-fav-recipe" class="back-up-link">Torna su alla prima ricetta preferita</a>';
            }

            $paginaHtml = str_replace("{{more-recipe-form}}", $moreRecipeForm, $paginaHtml);
        }
        $paginaHtml = str_replace('<a href="./user-edit.php" id="edit-profile-link" class="a-btn shadow">MODIFICA PROFILO</a>', "", $paginaHtml);
        $paginaHtml = str_replace('{{sign-out-form}}', "", $paginaHtml);
        echo $paginaHtml;
    }
}

?>