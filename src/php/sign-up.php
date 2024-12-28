<?php

require_once "utilityMethods.php";
use DB\DB;

$username="";
$categoria="";
$mail="";
$psw="";
$db = new DB;

$isLogged=$db->isUserLogged();
if ($isLogged!=false) {
    $_POST = null;
    header('Location: user.php');
    exit();
}

$paginaHtml=file_get_contents("../html/sign-up.html");
if (isset($_POST['submit'])) {
    $errorFound=false;
    $username=$_POST["nome"];
    //CONTROLLO USERNAME
    if (strlen($username)==0) {
        $paginaHtml = str_replace("{{messaggio di nome}}","Il nome utente è un campo obbligatorio.",$paginaHtml);
        $errorFound=true;
    } else {
        $username=DB::pulisciInput($username);
        $isUserPresent=$db->checkUserPresence($username);
        if (strcmp($isUserPresent,"ExceptionThrow")!=0 && strcmp($isUserPresent,"ConnectionFailed")!=0 && $isUserPresent==true) {
            $errorFound=true;
            $paginaHtml = str_replace("{{messaggio di nome}}","Questo nome utente non può essere utilizzato.",$paginaHtml);
        } else if (strcmp($isUserPresent,"ExceptionThrow")==0 || strcmp($isUserPresent,"ConnectionFailed")==0) {
            $_POST = null;
            header('Location: 505-err.php');
            exit();
        } else {
            $paginaHtml = str_replace("{{messaggio di nome}}","",$paginaHtml);
        }
    }

    //CONTROLLO CATEGORIA
    if (!isset($_POST['categoria'])) {
        $errorFound=true;
        $paginaHtml = str_replace("{{messaggio di categoria}}","Seleziona una categoria.",$paginaHtml);
    } else if (strcmp($_POST['categoria'],"fuorisede")==0 || strcmp($_POST['categoria'],"pendolare")==0 || strcmp($_POST['categoria'],"in_sede")==0|| strcmp($_POST['categoria'],"dad")==0) {
        $paginaHtml = str_replace("{{messaggio di categoria}}","",$paginaHtml);
        $categoria=$_POST['categoria'];
    } else {
        $errorFound=true;
        $paginaHtml = str_replace("{{messaggio di categoria}}","La categoria inserita non è valida.",$paginaHtml);
    }

    //CONTROLLO EMAIL
    $email=$_POST['email'];
    if (strlen($email)==0) {
        $errorFound=true;
        $paginaHtml = str_replace("{{messaggio di email}}","L'<span lang=\"en\">email</span> è un campo obbligatorio.",$paginaHtml);
    }
    else if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errorFound=true;
        $paginaHtml = str_replace("{{messaggio di email}}","L'<span lang=\"en\">email</span> non è un indirizzo valido.",$paginaHtml);
    } else {
        $isEmailPresent=$db->checkEmailPresence($email);
        if (strcmp($isEmailPresent,"ExceptionThrow")!=0 && strcmp($isEmailPresent,"ConnectionFailed")!=0 && $isEmailPresent==true) {
            $errorFound=true;
            $paginaHtml = str_replace("{{messaggio di email}}","Questa <span lang=\"en\">email</span> non può essere utilizzata.",$paginaHtml);
        } else if (strcmp($isEmailPresent,"ExceptionThrow")==0 || strcmp($isEmailPresent,"ConnectionFailed")==0) {
            $_POST = null;
            header('Location: 505-err.php');
            exit();
        } else {
            $paginaHtml = str_replace("{{messaggio di email}}","",$paginaHtml);
        }
    }

    //CONTROLLO PSW
    $psw=$_POST['psw'];
    if (strlen($psw)==0) {
        $errorFound=true;
        $paginaHtml = str_replace("{{messaggio di psw-ripetuta}}","",$paginaHtml);
        $paginaHtml = str_replace("{{messaggio di psw}}","La <span lang=\"en\">password</span> è un campo obbligatorio.",$paginaHtml);
    } else if (strlen($psw)<4) {
        $errorFound=true;
        $paginaHtml = str_replace("{{messaggio di psw-ripetuta}}","",$paginaHtml);
        $paginaHtml = str_replace("{{messaggio di psw}}","La <span lang=\"en\">password</span> deve essere lunga almeno 4 caratteri",$paginaHtml);
    } else if (strcmp($psw,$_POST['repeat-psw'])!=0) {
        $paginaHtml = str_replace("{{messaggio di psw}}","",$paginaHtml);
        $errorFound=true;
        $paginaHtml = str_replace("{{messaggio di psw-ripetuta}}","Le <span lang=\"en\">password</span> non coincidono.",$paginaHtml);
    } else {
        $paginaHtml = str_replace("{{messaggio di psw}}","",$paginaHtml);
        $paginaHtml = str_replace("{{messaggio di psw-ripetuta}}","",$paginaHtml);
    }

    if ($errorFound==false) {
        $result=$db->registerUser($username,$categoria,$email,$psw);
        if($result) {
            $_POST = null;
            header('Location: index.php');
            exit();
        } else {
            $_POST = null;
            header('Location: 505-err.php');
            exit();
        }
    } else {
        echo $paginaHtml;
    }
} else {
    $paginaHtml = str_replace("{{messaggio di nome}}","",$paginaHtml);
    $paginaHtml = str_replace("{{messaggio di categoria}}","",$paginaHtml);
    $paginaHtml = str_replace("{{messaggio di email}}","",$paginaHtml);
    $paginaHtml = str_replace("{{messaggio di psw}}","",$paginaHtml);
    $paginaHtml = str_replace("{{messaggio di psw-ripetuta}}","",$paginaHtml);
    echo $paginaHtml;
}
