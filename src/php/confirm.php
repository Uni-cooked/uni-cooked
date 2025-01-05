<?php

require_once "utility-methods.php";
use DB\DB;

$paginaHtml=file_get_contents("../html/confirm.html");
$username="";
$userInfo=array();

$db = new DB;

$isLogged=$db->isUserLogged();

if (is_bool($isLogged) && $isLogged==false) {
    header('Location: sign-in.php');
    exit();
}

if(isset($_GET["action"])) {
    $action=$_GET["action"];
    unset($_GET["action"]);
    if(strcmp($action,"delete-account")==0) {
        $paginaHtml=str_replace("{{confirm-action}}","confirm-delete-account",$paginaHtml);
        $paginaHtml=str_replace("{{titolo}}","ELIMINA <span lang=\"en\">ACCOUNT</span>",$paginaHtml);
        $paginaHtml=str_replace("{{sottotitolo}}","Sei sicuro di voler eliminare il tuo profilo?",$paginaHtml);
        $paginaHtml=str_replace("{{messaggio}}","Confermando l'operazione cancellerai il tuo profilo permanentemente: i tuoi commenti, le ricette salvate e tutti i tuoi dati personali saranno eliminati immediatamente e non potranno più essere recuperati!",$paginaHtml);
        echo $paginaHtml;
    } elseif (strcmp($action,"delete-recipe")==0) {
        $paginaHtml=str_replace("{{confirm-action}}","confirm-delete-recipe",$paginaHtml);
        $paginaHtml=str_replace("{{titolo}}","CANCELLA RICETTE PREFERITE",$paginaHtml);
        $paginaHtml=str_replace("{{sottotitolo}}","Sei sicuro che queste ricette non facciano per te?",$paginaHtml);
        $paginaHtml=str_replace("{{messaggio}}","Confermando l'operazione cancellerai l'elenco delle tue ricette preferite. Potrai comunque aggiungerne di nuove ma il precedente elenco non sarà ripristinabile!",$paginaHtml);
        echo $paginaHtml;
    } else {
        header('Location: 500-err.php');
        exit();
    }
} elseif(isset($_GET["confirm-delete-account"])) {
    $action=$_GET["confirm-delete-account"];
    unset($_GET["confirm-delete-account"]);
    if(strcmp($action,"true")!=0) {
        header('Location: 500-err.php');
        exit();
    }

    $userPath="../user_profiles/".$_SESSION["logged_user"].'/';
	if(is_dir($userPath)) {
		$imagedef=scandir($userPath);
		$info = new SplFileInfo($imagedef[2]);
		$extension = pathinfo($info->getFilename(), PATHINFO_EXTENSION);
		$imagedef="../user_profiles/".$_SESSION["logged_user"].'/'.$_SESSION["logged_user"].".".$extension;
		unlink($imagedef);
        rmdir($userPath);
    }

    $result=$db->deleteUser();
    if(is_bool($result) && $result==true) {
        header('Location: index.php');
        exit();
    } else {
        header('Location: 500-err.php');
        exit();
    }
} elseif(isset($_GET["confirm-delete-recipe"])) {
    $action=$_GET["confirm-delete-recipe"];
    unset($_GET["confirm-delete-recipe"]);
    if(strcmp($action,"true")!=0) {
        header('Location: 500-err.php');
        exit();
    }

    $result=$db->deleteUserPreferredRecipe();
    if(is_bool($result) && $result==true) {
        header('Location: user.php');
        exit();
    } else {
        header('Location: 500-err.php');
        exit();
    }
} else {
    header('Location: 500-err.php');
    exit();
}
