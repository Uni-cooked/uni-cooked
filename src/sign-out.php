<?php

require_once "utility-methods.php";
use DB\DB;

DB::logOutUser();
header("Location: index.php");
exit();
