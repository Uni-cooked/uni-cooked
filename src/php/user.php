<?php

require_once "utility-methods.php";
use DB\DB;

$paginaHtml=file_get_contents($db->getHtmlPath() . "user.html");
$username="";

$db = new DB;
$isLogged=$db->isUserLogged();
if (is_bool($isLogged) && $isLogged==false) {
    header('Location: sign-in.php');
    exit();
}

//se è stato passato il controllo precedente l'utente è loggato e $isLogged è il nome utente

$paginaHtml=str_replace("{{username}}",strtoupper($isLogged),$paginaHtml);
$userInfo=$db->getUserInfo();
if (is_string($userInfo) && (strcmp($userInfo,"ExceptionThrow") || strcmp($userInfo,"genericError") || strcmp($userInfo,"ConnectionFailed"))) {
    header('Location: 505-err.php');
    exit();
} else if(is_string($userInfo) && strcmp($userInfo,"userIsNotLogged")) {
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
        $paginaHtml=str_replace("{{profile-pic}}","img/dad-image.jpg",$paginaHtml);
    } else {
        $paginaHtml=str_replace("{{profile-pic}}","img/def-profile.png",$paginaHtml);
    }
    echo $paginaHtml;
}
