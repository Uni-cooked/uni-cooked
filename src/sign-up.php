<?php

require_once "utils/utility-methods.php";
require_once "utils/sanitizer.php";
use Utilities\DB;
use Utilities\Sanitizer;

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

$paginaHtml=file_get_contents("./html/sign-up.html");
if (isset($_POST['submit'])) {
    $errorFound=false;
    $username=$_POST["nome"];
    //CONTROLLO USERNAME
    if (mb_strlen($username)==0) {
        $paginaHtml = str_replace("{{messaggio di nome}}",'<p role="alert" class="err-msg" id="err-name">Il nome utente è un campo obbligatorio</p>',$paginaHtml);
        $errorFound=true;
    } elseif (mb_strlen($username)>15) {
        $paginaHtml = str_replace("{{messaggio di nome}}",'<p role="alert" class="err-msg" id="err-name">Il nome utente non deve essere più lungo di 15 caratteri</p>',$paginaHtml);
        $errorFound=true;
    } elseif (preg_match("/^[a-zA-ZÀ-Ýß-ÿ0-9]+$/",$username)==0) {
        $errorFound=true;
        $paginaHtml = str_replace("{{messaggio di nome}}",'<p role="alert" class="err-msg" id="err-name">Il nome utente non deve contenere spazi o caratteri speciali</p>',$paginaHtml);
    } else {
        $username=Sanitizer::SanitizeUsername($username);
        $isUserPresent=$db->checkUserPresence($username,false);
        if (strcmp($isUserPresent,"ExceptionThrow")!=0 && strcmp($isUserPresent,"ConnectionFailed")!=0 && $isUserPresent==true) {
            $errorFound=true;
            $paginaHtml = str_replace("{{messaggio di nome}}",'<p role="alert" class="err-msg">Il nome utente inserito non può essere utilizzato</p>',$paginaHtml);
        } elseif (strcmp($isUserPresent,"ExceptionThrow")==0 || strcmp($isUserPresent,"ConnectionFailed")==0) {
            $_POST = null;
            header('Location: 500-err.php');
            exit();
        } else {
            $paginaHtml = str_replace("{{messaggio di nome}}","",$paginaHtml);
        }
    }

    //CONTROLLO CATEGORIA
    if (!isset($_POST['categoria'])) {
        $errorFound=true;
        $paginaHtml = str_replace("{{messaggio di categoria}}",'<p role="alert" class="err-msg" id="err-student">Seleziona una categoria</p>',$paginaHtml);
    } else if (strcmp($_POST['categoria'],"fuorisede")==0 || strcmp($_POST['categoria'],"pendolare")==0 || strcmp($_POST['categoria'],"in_sede")==0|| strcmp($_POST['categoria'],"dad")==0) {
        $paginaHtml = str_replace("{{messaggio di categoria}}","",$paginaHtml);
        $categoria=$_POST['categoria'];
    } else {
        $errorFound=true;
        $paginaHtml = str_replace("{{messaggio di categoria}}",'<p role="alert" class="err-msg">La categoria inserita non è valida</p>',$paginaHtml);
    }

    //CONTROLLO EMAIL
    $email=$_POST['email'];
    if (mb_strlen($email)==0) {
        $errorFound=true;
        $paginaHtml = str_replace("{{messaggio di email}}",'<p role="alert" class="err-msg" id="err-mail">L\'<span lang="en">email</span> è un campo obbligatorio</p>',$paginaHtml);
    }
    else if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errorFound=true;
        $paginaHtml = str_replace("{{messaggio di email}}",'<p role="alert" class="err-msg" id="err-mail">L\'<span lang="en">email</span> non è un indirizzo valido</p>',$paginaHtml);
    } else {
        $isEmailPresent=$db->checkEmailPresence($email);
        if (strcmp($isEmailPresent,"ExceptionThrow")!=0 && strcmp($isEmailPresent,"ConnectionFailed")!=0 && $isEmailPresent==true) {
            $errorFound=true;
            $paginaHtml = str_replace("{{messaggio di email}}",'<p role="alert" class="err-msg" id="err-mail">Questa <span lang="en">email</span> non può essere utilizzata</p>',$paginaHtml);
        } else if (strcmp($isEmailPresent,"ExceptionThrow")==0 || strcmp($isEmailPresent,"ConnectionFailed")==0) {
            $_POST = null;
            header('Location: 500-err.php');
            exit();
        } else {
            $paginaHtml = str_replace("{{messaggio di email}}","",$paginaHtml);
        }
    }

    //CONTROLLO PSW
    $psw=$_POST['psw'];
    if (mb_strlen($psw)==0) {
        $errorFound=true;
        $paginaHtml = str_replace("{{messaggio di psw-ripetuta}}","",$paginaHtml);
        $paginaHtml = str_replace("{{messaggio di psw}}",'<p role="alert" class="err-msg" id="err-psw">La <span lang="en">password</span> è un campo obbligatorio</p>',$paginaHtml);
    } elseif (mb_strlen($psw)<4) {
        $errorFound=true;
        $paginaHtml = str_replace("{{messaggio di psw-ripetuta}}","",$paginaHtml);
        $paginaHtml = str_replace("{{messaggio di psw}}",'<p role="alert" class="err-msg" id="err-psw">La <span lang="en">password</span> deve essere lunga almeno 4 caratteri</p>',$paginaHtml);
    } elseif (preg_match("/^(?=.*[a-zß-ÿ])(?=.*[A-ZÀ-Ý])(?=.*[\d])(?=.*[.,!?@+\-_€$%&^*<>]).+$/",$psw)==0) {
        $errorFound=true;
        $paginaHtml = str_replace("{{messaggio di psw-ripetuta}}","",$paginaHtml);
        $paginaHtml = str_replace("{{messaggio di psw}}",'<p role="alert" class="err-msg" id="err-psw">La <span lang="en">password</span> deve avere una lettera maiuscola, una lettera minuscola, un numero e un carattere speciale</p>',$paginaHtml);
    } elseif (strcmp($psw,$_POST['repeat-psw'])!=0) {
        $paginaHtml = str_replace("{{messaggio di psw}}","",$paginaHtml);
        $errorFound=true;
        $paginaHtml = str_replace("{{messaggio di psw-ripetuta}}",'<p role="alert" class="err-msg" id="err-repeat-psw">Le <span lang="en">password</span> non coincidono</p>',$paginaHtml);
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
            header('Location: 500-err.php');
            exit();
        }
    } else {
        $paginaHtml=str_replace('','',$paginaHtml);
        $paginaHtml=str_replace('id="student-name-up"','id="student-name-up" value="'.$username.'"',$paginaHtml);
        $paginaHtml=str_replace('<option hidden selected value>Seleziona una opzione</option>','<option hidden value>Seleziona una opzione</option>',$paginaHtml);
        $paginaHtml=str_replace('value="'.$categoria.'"','value="'.$categoria.'" selected',$paginaHtml);
        $paginaHtml=str_replace('id="student-mail-up"','id="student-mail-up" value="'.$email.'"',$paginaHtml);
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

?>
