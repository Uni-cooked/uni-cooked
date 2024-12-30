<?php

require_once "utility-methods.php";
use DB\DB;

$paginaHtml=file_get_contents("../html/user-edit.html");
$username="";
$userInfo=array();

$db = new DB;

$isLogged=$db->isUserLogged();

if (is_bool($isLogged) && $isLogged==false) {
    header('Location: sign-in.php');
    exit();
}

//se è stato passato il controllo precedente l'utente è loggato e $isLogged è il nome utente

$userBasePath="../user_profiles/";
$userPath=$isLogged."/";
$image="";
$userInfo=$db->getUserInfo();
$isProfilePicChanged=false;

if(!isset($_POST["submit-profile-changes"]) && !isset($_POST["delete-recipe"]) && !isset($_POST["delete-account"])) {
    if (is_string($userInfo) && (strcmp($userInfo,"ExceptionThrow")==0 || strcmp($userInfo,"genericError")==0 || strcmp($userInfo,"ConnectionFailed")==0)) {
        header('Location: 500-err.php');
        exit();
    } else if(is_string($userInfo) && strcmp($userInfo,"userIsNotLogged")==0) {
        header('Location: sign-in.php');
        exit();
    } else {
        $paginaHtml=str_replace("{{username}}",$isLogged,$paginaHtml);
        $paginaHtml=str_replace("{{nickname-error}}","",$paginaHtml);
        $paginaHtml=str_replace("{{stud-cat-edit-error}}","",$paginaHtml);
        if ($userInfo["immagine"]) {
            $paginaHtml=str_replace("{{profile-pic}}",$userInfo["immagine"],$paginaHtml);
        } else {
            $paginaHtml=str_replace("{{profile-pic}}","../asset/img/def-profile.png",$paginaHtml);
        }
        $categoria=$userInfo["tipo_studente"];
        $paginaHtml=str_replace('value="'.$userInfo["tipo_studente"].'"','value="'.$userInfo["tipo_studente"].'"'.' selected',$paginaHtml);
        if ($userInfo["biografia"]) {
            $paginaHtml=str_replace("{{biografia}}",$userInfo["biografia"],$paginaHtml);
        } else {
            $paginaHtml=str_replace("{{biografia}}","",$paginaHtml);
        }
        echo str_replace("{{profile-pic-error}}","",$paginaHtml);
    }
} elseif(isset($_POST["delete-recipe"])) {
    unset($_POST["delete-recipe"]);
    $result=$db->deleteUserPreferredRecipe();
    if(is_bool($result) && $result==true) {
        header('Location: user.php');
        exit();
    } else {
        header('Location: 500-err.php');
        exit();
    }
} elseif (isset($_POST["delete-account"])) {
    unset($_POST["delete-account"]);
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
} else {
    $errorFound=false;
    $username=$_POST["nickname-edit"];
    //CONTROLLO USERNAME
    if (strlen($username)==0) {
        $paginaHtml = str_replace("{{nickname-error}}","Il nome utente è un campo obbligatorio.",$paginaHtml);
        $errorFound=true;
    } else {
        $username=DB::pulisciInput($username);
        $isUserPresent=$db->checkUserPresence($username);
        if (strcmp($isUserPresent,"ExceptionThrow")!=0 && strcmp($isUserPresent,"ConnectionFailed")!=0 && $isUserPresent==true && strcmp($username,$isLogged)!=0) {
            $errorFound=true;
            $paginaHtml = str_replace("{{nickname-error}}","Il nome utente inserito non può essere utilizzato.",$paginaHtml);
        } else if (strcmp($isUserPresent,"ExceptionThrow")==0 || strcmp($isUserPresent,"ConnectionFailed")==0) {
            $_POST = null;
            header('Location: 500-err.php');
            exit();
        } else {
            $paginaHtml = str_replace("{{nickname-error}}","",$paginaHtml);
        }
    }

    $biografia=DB::pulisciNote($_POST["bio-edit"]); //[FIX] NON SONO CONSENTITI I TAG ANCHE SE DOVREBBERO

    if (!isset($_POST['stud-cat-edit'])) {
        $errorFound=true;
        $paginaHtml = str_replace("{{stud-cat-edit-error}}","Seleziona una categoria.",$paginaHtml);
    } else if (strcmp($_POST['stud-cat-edit'],"fuorisede")==0 || strcmp($_POST['stud-cat-edit'],"pendolare")==0 || strcmp($_POST['stud-cat-edit'],"in_sede")==0|| strcmp($_POST['stud-cat-edit'],"dad")==0) {
        $paginaHtml = str_replace("{{stud-cat-edit-error}}","",$paginaHtml);
        $categoria=$_POST['stud-cat-edit'];
    } else {
        $errorFound=true;
        $paginaHtml = str_replace("{{stud-cat-edit-error}}","La categoria inserita non è valida.",$paginaHtml);
    }

    if(isset($_FILES["profile-img-edit"]) && $_FILES["profile-img-edit"]["error"]==0) {
        $tmpFile='/tmp//'.$_FILES["profile-img-edit"]["name"];
        rename($_FILES["profile-img-edit"]["tmp_name"],'/tmp//'.$_FILES["profile-img-edit"]["name"]);
        $info = new SplFileInfo($tmpFile);
        $extension = pathinfo($info->getFilename(), PATHINFO_EXTENSION);
        $extensionArray = array("jpg","jpeg","png");
        if(strlen($extension)==0 || !in_array($extension,$extensionArray)) {
            $errorFound=true;
            $paginaHtml = str_replace("{{profile-pic-error}}","L'estensione del file caricato non è corretta.",$paginaHtml);
        } elseif($info->isExecutable()) {
            $errorFound=true;
            $paginaHtml = str_replace("{{profile-pic-error}}","Il file caricato non è supportato.",$paginaHtml);
        } elseif($info->getSize()>3145728) {
            $errorFound=true;
            $paginaHtml = str_replace("{{profile-pic-error}}",'Il file caricato supera i 3 <span lang="en">megabytes</span>: carica un file di dimensione minore.',$paginaHtml);
        } elseif(strcmp(mime_content_type($tmpFile),"image/jpeg")!=0 && strcmp(mime_content_type($tmpFile),"image/png")!=0) {
            $errorFound=true;
            $paginaHtml = str_replace("{{profile-pic-error}}",'Il file caricato è un formato non supportato.',$paginaHtml);
        } else {
            if(!is_dir($userBasePath)) {
                mkdir($userBasePath);
            }
            if(!is_dir($userBasePath.$userPath)) {
                mkdir($userBasePath.$userPath);
            }
            rename($tmpFile,$userBasePath.$userPath.$isLogged.".".$extension);
            unset($_FILES["profile-img-edit"]);
            $isProfilePicChanged=true;
            $paginaHtml = str_replace("{{profile-pic-error}}","",$paginaHtml);            
        }
    } else {
        $paginaHtml = str_replace("{{profile-pic-error}}","",$paginaHtml);
    }

    if($errorFound==true) {
        $paginaHtml=str_replace("{{username}}",$isLogged,$paginaHtml);
        if ($userInfo["immagine"]) {
            $paginaHtml=str_replace("{{profile-pic}}",$userInfo["immagine"],$paginaHtml);
        } else {
            $paginaHtml=str_replace("{{profile-pic}}","../asset/img/def-profile.png",$paginaHtml);
        }
        $categoria=$userInfo["tipo_studente"];
        $paginaHtml=str_replace('value="'.$userInfo["tipo_studente"].'"','value="'.$userInfo["tipo_studente"].'"'.' selected',$paginaHtml);
        if ($userInfo["biografia"]) {
            $paginaHtml=str_replace("{{biografia}}",$userInfo["biografia"],$paginaHtml);
        } else {
            $paginaHtml=str_replace("{{biografia}}","",$paginaHtml);
        }
        echo $paginaHtml;
    } else {
        if(strcmp($username,$isLogged)!=0 || strcmp($categoria,$userInfo["categoria"])!=0 || strcmp($biografia,$userInfo["biografia"])!=0 || $isProfilePicChanged==true) {
            $changeResult=false;
            $imagedef=scandir($userBasePath.$userPath);
            $info = new SplFileInfo($imagedef[2]);
            $extension = pathinfo($info->getFilename(), PATHINFO_EXTENSION);
            $imagedef="../user_profiles/".$username.'/'.$username.".".$extension;
            
            if(is_dir($userBasePath.$userPath) && strcmp($username,$isLogged)!=0) {
                rename($userBasePath.$userPath.$userInfo["nome"].".".$extension,$userBasePath.$userPath.$username.".".$extension); //rinomina immagine con il nuovo nome utente
                rename($userBasePath.$userPath,"../user_profiles/".$username.'/'); //rinomina la cartella dell'utente    
            }
            
            $changeResult=$db->changeUserData($username,$categoria,$biografia,$imagedef);
            if(is_bool($changeResult) && $changeResult==true) {
                header('Location: user.php');
                exit();
            } else {
                header('Location: user.php');
                exit();
            }
        } else {
            header('Location: user.php');
            exit();
        }
    }
}
