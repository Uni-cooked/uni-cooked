<?php
    namespace DB;

    class DB
    {
        private const HOST_DB = "localhost";
        private const DBNAME = "placeholder";
        private const USERNAME = "placeholder";
        private const PSW = "placeholder";
    
        private $connection;
    
        public function openDBConnection(): bool
        {
            mysqli_report(MYSQLI_REPORT_STRICT);
            try
            {
                $this->connection = mysqli_connect(self::HOST_DB, self::USERNAME, self::PSW, self::DBNAME);
            } 
			catch(\mysqli_sql_exception $e)
			{
				return false;
            }

			return true;
        }
        
        public function closeDBConnection(): void
        {
            mysqli_close($this->connection);
        }
    }

    /*$db=new DB;
	$esito = $db->openDBConnection();
	if($esito == true)
	{
		echo "riuscito\n";
		$db->closeDBConnection();
	}
	else
	{
		echo "fallito\n";
	}*/
?>