<?php
    namespace DB;

    session_start();

    class DB
    {
        private $tagPermessi ='<em><strong><ul><li>';
        private const HOST_DB = "localhost";
        private const DBNAME = "placeholder";
        private const USERNAME = "placeholder";
        private const PSW = "placeholder";
    
        private $connection;

        private function pulisciInput($value)
        {
            $value = trim($value);
            $value = strip_tags($value);
            $value = htmlentities($value);
            return $value;
        }
       
        private function pulisciNote($value)
        {
            global $tagPermessi;
            $value = trim($value);
            $value = strip_tags($value, $tagPermessi);
            return $value;
        }

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

        public function checkUserPresence($username): bool | string
        {
            $connectionResult=$this->openDBConnection();
            if($connectionResult)
            {
                $checkUserStatement=$this->connection->prepare("SELECT nome FROM Utente WHERE nome = ?");
                $checkUserStatement->bind_param("s",$username);
                try
                {
                    $checkUserStatement->execute();
                }
                catch(\mysqli_sql_exception $e)
                {
                    $this->closeDBConnection();
                    $checkUserStatement->close();
                    return "ExceptionThrow";
                }

                $result=$checkUserStatement->get_result();
                $this->closeDBConnection();
                $checkUserStatement->close();

                if($result->num_rows==1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
                
            }
            else
            {
                return "ConnectionFailed";
            }
        }

        public function registerUser($username,$userCategory,$email,$psw): bool
        {   
            /*
                Gestisce l'inserimento di dati già appositamente filtrati. Ritorna false se l'inserimento fallisce (es. l'utente è già registrato o la connessione
                al server è fallita)
            */
            $encPsw=hash('sha256',$psw);
            $date=date("Y-m-d h:m:s");
            $connectionResult=$this->openDBConnection();
            if($connectionResult)
            {   
                $registerUserStatement=$this->connection->prepare("INSERT INTO Utente(email,nome,password,data_iscrizione) VALUES(?,?,?,?)");
                $registerUserStatement->bind_param("ssss",$email,$username,$encPsw,$date);
                try
                {
                    $registerUserStatement->execute();
                }
                catch(\mysqli_sql_exception $e)
                {
                    $this->closeDBConnection();
                    $registerUserStatement->close();
                    return false;
                }

                if(mysqli_affected_rows($this->connection)==1)
                {
                    $this->closeDBConnection();
                    $registerUserStatement->close();
                    $_SESSION["logged_user"] = $username; 
                    return true;
                }
                else
                {
                    $registerUserStatement->close();
                    $this->closeDBConnection();
                    return false;
                }
            }
            else
            {
                return false;
            }
        }

    }
    

    $db=new DB;
    $result=$db->registerUser("user","Fuorisede","user@user.com","user");
    if($result)
    {
        echo "riuscito\n";
    }
    else
    {
        echo "fallito\n";
    }

?>