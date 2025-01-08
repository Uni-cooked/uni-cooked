<?php

require_once "utility-methods.php";
use DB\DB;
$db = new DB;

$paginaHtml=file_get_contents("../html/about-us.html");
$isUserLogged=$db->isUserLogged();

if(!isset($_POST["suggestion"])) {
    if ($isUserLogged!=false) {
        $paginaHtml=str_replace("{{link-accesso-profilo}}","<a href=\"user.php\" class=\"shadow\">PROFILO</a>",$paginaHtml);
        $paginaHtml=str_replace("{{username}}","di".$isUserLogged,$paginaHtml);
        $userInfo=$db->getUserInfo();
        if (is_string($userInfo) && (strcmp($userInfo,"ExceptionThrow")==0 || strcmp($userInfo,"genericError")==0 || strcmp($userInfo,"ConnectionFailed")==0)) {
            header('Location: 500-err.php');
            exit();
        } else if(is_string($userInfo) && strcmp($userInfo,"userIsNotLogged")==0) {
            header('Location: sign-in.php');
            exit();
        } else {
            if($userInfo["immagine"]) {
                $paginaHtml=str_replace("{{profile-pic-src}}",$userInfo["immagine"],$paginaHtml);
            } else {
                $paginaHtml=str_replace("{{profile-pic-src}}","../asset/img/def-profile.png",$paginaHtml);
            }
            
        }
    } else {
        $paginaHtml=str_replace("{{link-accesso-profilo}}","<a href=\"sign-in.php\" class=\"shadow\">ACCEDI</a>",$paginaHtml); 
        $paginaHtml=str_replace("{{profile-pic-src}}","../asset/img/placeholder.png",$paginaHtml);
        $paginaHtml=str_replace("{{username}}","generica di un utente non registrato o autenticato",$paginaHtml);
    }
    echo $paginaHtml;
} else {
    unset($_POST["suggerimento"]);
    $result="";
    if($isUserLogged!=false) {
        $result=$db->insertSuggestion(DB::pulisciNote($_POST["proposta"]),$isUserLogged);
    } else {
        $result=$db->insertSuggestion(DB::pulisciNote($_POST["proposta"]));
    }
    
    if($result==false) {
        header('Location: 500-err.php');
        exit();
    } else {
        header('Location: thanks.php');
        exit();
    }

}
