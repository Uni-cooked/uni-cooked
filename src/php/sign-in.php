<?php

require_once "utility-methods.php";
use DB\DB;

$paginaHtml=file_get_contents($db->getHtmlPath() . "sign-in.html");
$username="";
$psw="";

$db = new DB;
$isLogged=$db->isUserLogged();
if ($isLogged!=false) {
    $_POST = null;
    header('Location: user.php');
    exit();
}

if (isset($_POST['submit'])) {
    $username=DB::pulisciInput($_POST["nome"]);
    $psw=$_POST["psw"];
    $result=$db->logUser($username,$psw);

    if ($result==true && is_bool($result)) {
        $_POST = null;
        echo $result;
        header("Location: index.php");
        exit();
    } else if ($result==false) {
        echo str_replace("{{messaggio di errore}}","Le credenziali inserite non sono corrette.",$paginaHtml);
    } else if (strcmp($result,"userIsAlreadyLogged")==0) {
        $_POST = null;
        header('Location: user.php');
        exit();
    } else {
        $_POST = null;
        header('Location: 505-err.php');
        exit();
    }
} else {
    echo str_replace("{{messaggio di errore}}","",$paginaHtml);
}
