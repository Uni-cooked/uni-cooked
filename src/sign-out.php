<?php

require_once "utils/utility-methods.php";

use Utilities\DB;

DB::logOutUser();
header("Location: index.php");
exit();
