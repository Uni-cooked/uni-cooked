<?php

require_once "utils/utility-methods.php";
require_once "utils/sanitizer.php";
use Utilities\DB;
use Utilities\Sanitizer;

$paginaHtml=file_get_contents("./html/sign-in.html");
$username="";
$psw="";

$db = new DB;
$isLogged=$db->isUserLogged();
if ($isLogged!=false) {
    $_POST = null;
    header('Location: user.php');
    exit();
}

if(isset($_GET["ref"])) {
    $paginaHtml=str_replace("{{ref-value}}",'?ref='.$_GET["ref"],$paginaHtml);
} else {
    $paginaHtml=str_replace("{{ref-value}}","",$paginaHtml);
}

if (isset($_POST['submit'])) {
    $username=Sanitizer::SanitizeUsername($_POST["nome"]);
    $psw=$_POST["psw"];
    $result=$db->logUser($username,$psw);

    if ($result==true && is_bool($result)) {
        $_POST = null;
        if(isset($_GET["ref"])) {
            $link="recipe.php?recipe=".$_GET["ref"];
            unset($_GET["ref"]);
            header("Location: ".$link);
            exit();
        }
        header("Location: index.php");
        exit();
    } else if ($result==false) {
        echo str_replace("{{messaggio di errore}}",'<p role="alert" class="err-msg" id="err-sign-in">Le credenziali inserite non sono corrette</p>',$paginaHtml);
    } else if (strcmp($result,"userIsAlreadyLogged")==0) {
        $_POST = null;
        header('Location: user.php');
        exit();
    } else {
        $_POST = null;
        header('Location: 500-err.php');
        exit();
    }
} else {
    echo str_replace("{{messaggio di errore}}","",$paginaHtml);
}

?>