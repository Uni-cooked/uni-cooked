<?php

    require_once "UtilityMethods.php";
    use DB\DB;

    $username="";
    $categoria="";
    $mail="";
    $psw="";
    $db = new DB;

    $paginaHtml=file_get_contents("html/sign-up.html");
    if(isset($_POST['submit'])) {
        $errorFound=false;
        $username=$_POST["nome"];
        //CONTROLLO USERNAME
        if(strlen($username)==0) {
            $paginaHtml = str_replace("{{messaggio di nome}}","Il nome utente è un campo obbligatorio.",$paginaHtml);
            $errorFound=true;
        }
        else {
            $username=DB::pulisciInput($username);
            $isUserPresent=$db->checkUserPresence($username);
            if(strcmp($isUserPresent,"ExceptionThrow")!=0 && strcmp($isUserPresent,"ConnectionFailed")!=0 && $isUserPresent==true) {
                $errorFound=true;
                $paginaHtml = str_replace("{{messaggio di nome}}","Questo nome utente non può essere utilizzato.",$paginaHtml);
            }
            elseif (strcmp($isUserPresent,"ExceptionThrow")==0 || strcmp($isUserPresent,"ConnectionFailed")==0){
                $_POST = null;
                header('Location: 505-err.php');
                exit();
            }
            else
            {
                $paginaHtml = str_replace("{{messaggio di nome}}","",$paginaHtml);
            }
        }

        //CONTROLLO CATEGORIA
        if (!isset($_POST['categoria'])){
            $errorFound=true;
            $paginaHtml = str_replace("{{messaggio di categoria}}","Seleziona una categoria.",$paginaHtml);
        }
        elseif(strcmp($_POST['categoria'],"fuorisede")==0 || strcmp($_POST['categoria'],"pendolare")==0 || strcmp($_POST['categoria'],"in-sede")==0|| strcmp($_POST['categoria'],"dad")==0){
            $paginaHtml = str_replace("{{messaggio di categoria}}","",$paginaHtml);
            $categoria=$_POST['categoria'];
        }
        else{
            $errorFound=true;
            $paginaHtml = str_replace("{{messaggio di categoria}}","La categoria inserita non è valida.",$paginaHtml);
        }

        //CONTROLLO EMAIL
        $email=$_POST['email'];
        if(strlen($email)==0){
            $errorFound=true;
            $paginaHtml = str_replace("{{messaggio di email}}","Il campo <span lang=\"en\">email</span> è un campo obbligatorio.",$paginaHtml);
        }
        else if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
            $paginaHtml = str_replace("{{messaggio di email}}","L'<span lang=\"en\">email</span> non è un indirizzo valido.",$paginaHtml);
        }
        else
        {
            $paginaHtml = str_replace("{{messaggio di email}}","",$paginaHtml);
        }

        //CONTROLLO PSW
        $psw=$_POST['psw'];
        if(strlen($psw)==0)
        {
            $errorFound=true;
            $paginaHtml = str_replace("{{messaggio di psw-ripetuta}}","",$paginaHtml);
            $paginaHtml = str_replace("{{messaggio di psw}}","Il campo <span lang=\"en\">password</span> è obbligatorio.",$paginaHtml);
        }
        elseif(strlen($psw)<4)
        {
            $errorFound=true;
            $paginaHtml = str_replace("{{messaggio di psw-ripetuta}}","",$paginaHtml);
            $paginaHtml = str_replace("{{messaggio di psw}}","La <span lang=\"en\">password</span> deve essere lunga almeno 4 caratteri",$paginaHtml);
        }
        elseif(strcmp($psw,$_POST['repeat-psw'])!=0)
        {
            $paginaHtml = str_replace("{{messaggio di psw}}","",$paginaHtml);
            $errorFound=true;
            $paginaHtml = str_replace("{{messaggio di psw-ripetuta}}","La <span lang=\"en\">password</span> non coincide.",$paginaHtml);
        }
        else
        {
            $paginaHtml = str_replace("{{messaggio di psw}}","",$paginaHtml);
            $paginaHtml = str_replace("{{messaggio di psw-ripetuta}}","",$paginaHtml);
        }

        if($errorFound==false){
            if(strcmp($categoria,"in-sede"))
            {
                $categoria="in_sede"; //fix per enum db
            }
            $db->registerUser($username,$categoria,$email,$psw);
            $_POST = null;
            header('Location: index.php');
            exit();
        }
        else
        {
            echo $paginaHtml;
        }
    }
    else {
        $paginaHtml = str_replace("{{messaggio di nome}}","",$paginaHtml);
        $paginaHtml = str_replace("{{messaggio di categoria}}","",$paginaHtml);
        $paginaHtml = str_replace("{{messaggio di email}}","",$paginaHtml);
        $paginaHtml = str_replace("{{messaggio di psw}}","",$paginaHtml);
        $paginaHtml = str_replace("{{messaggio di psw-ripetuta}}","",$paginaHtml);
        echo $paginaHtml;
    }
?>