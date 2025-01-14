<?php

require_once "utils/utility-methods.php";
use DB\DB;

DB::logOutUser();
header("Location: index.php");
exit();
