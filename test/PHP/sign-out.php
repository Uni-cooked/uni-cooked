<?php
    require_once "utilityMethods.php";
    use DB\DB;

    DB::logOutUser();
    header("Location: index.php");
    exit();
?>