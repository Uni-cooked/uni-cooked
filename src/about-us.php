<?php

require_once "utils/utility-methods.php";
require_once "utils/sanitizer.php";
use Utilities\DB;
use Utilities\Sanitizer;
$db = new DB;

$paginaHtml=file_get_contents("./html/about-us.html");
$isUserLogged=$db->isUserLogged();

if(!isset($_POST["suggestion"])) {
    if ($isUserLogged!=false) {
        $paginaHtml=str_replace("{{link-accesso-profilo}}","<a href=\"user.php\" class=\"a-btn-secondary shadow\">PROFILO</a>",$paginaHtml);
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
                $paginaHtml=str_replace("{{profile-pic-src}}","./asset/img/def-profile.png",$paginaHtml);
            }
            
        }
    } else {
        $paginaHtml=str_replace("{{link-accesso-profilo}}","<a href=\"sign-in.php\" class=\"a-btn-secondary shadow\">ACCEDI</a>",$paginaHtml); 
        $paginaHtml=str_replace("{{profile-pic-src}}","./asset/icon/student.svg",$paginaHtml);
        $paginaHtml=str_replace("{{username}}","generica di un utente non registrato o autenticato",$paginaHtml);
    }

    if(isset($_SESSION["suggestionError"])) {
        $paginaHtml=str_replace("{{suggestion-error}}",$_SESSION["suggestionError"],$paginaHtml);
        unset($_SESSION["suggestionError"]);
    } else {
        $paginaHtml=str_replace("{{suggestion-error}}","",$paginaHtml);
    }
    echo $paginaHtml;
} else {
    unset($_POST["suggerimento"]);
    $result="";

    $proposta=Sanitizer::SanitizeText($_POST["proposta"]);
    unset($_POST["proposta"]);

    if(mb_strlen($proposta)<20 || mb_strlen($proposta)>500) {
        $_SESSION["suggestionError"]='<p aria-live="assertive" aria-atomic="true" class="err-msg" id="err-request">Il suggerimento deve essere più lungo di 20 caratteri e minore di 500</p>';
        header('Location: about-us.php');
        exit();
    }

    if($isUserLogged!=false) {
        $result=$db->insertSuggestion($proposta,$isUserLogged);
    } else {
        $result=$db->insertSuggestion($proposta);
    }
    
    if($result==false) {
        header('Location: 500-err.php');
        exit();
    } else {
        header('Location: thanks.php');
        exit();
    }

}
