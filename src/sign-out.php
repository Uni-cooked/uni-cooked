<?php

require_once "utils/utility-methods.php";

use Utilities\DB;

if(isset($_POST["sign-out"])) {
    unset($_POST["sign-out"]);
    DB::logOutUser();
    header("Location: index.php");
    exit();
} else {
    header("Location: user.php");
    exit();
}

?>
