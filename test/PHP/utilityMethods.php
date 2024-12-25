<?php

    namespace DB;

    session_start();

    class DB {
        private $tagPermessi ='<em><strong><ul><li>';
        private const HOST_DB = "localhost";
        private const DBNAME = "dbname";
        private const USERNAME = "username";
        private const PSW = "psw";

        private $connection;

        public static function pulisciInput($value) {
            $value = trim($value);
            $value = strip_tags($value);
            $value = str_replace(" ","",$value);
            $value = htmlentities($value);
            return $value;
        }
        
        public static function pulisciNote($value) {
            global $tagPermessi;
            $value = trim($value);
            $value = strip_tags($value, $tagPermessi);
            return $value;
        }

        private function openDBConnection(): bool {
            mysqli_report(MYSQLI_REPORT_STRICT);
            try {
                $this->connection = mysqli_connect(self::HOST_DB, self::USERNAME, self::PSW, self::DBNAME);
            } catch(\mysqli_sql_exception $e) {
                return false;
            }

            return true;
        }
        
        private function closeDBConnection(): void {
            mysqli_close($this->connection);
        }

        public function isUserLogged(): bool | string
        {
            /*
            *   Return false if not logged, username if logged
            */
            if(isset($_SESSION) && $_SESSION!=null) {
                return $_SESSION["logged_user"];
            } else {
                return false;
            }
        }
        
        public function logUser($username,$psw): bool | string {
            if($this->isUserLogged()==false)
            {
                $hashedPsw=hash("sha256",$psw);
                $connectionResult=$this->openDBConnection();
                if ($connectionResult) {
                    $checkUserExistance=$this->connection->prepare("SELECT nome FROM Utente WHERE nome = ? AND password = ?");
                    $checkUserExistance->bind_param("ss",$username,$hashedPsw);
                    try {
                        $checkUserExistance->execute();
                    } catch(\mysqli_sql_exception $e) {
                        $this->closeDBConnection();
                        $checkUserExistance->close();
                        return "ExceptionThrow";
                    }

                    $result=$checkUserExistance->get_result();
                    $this->closeDBConnection();
                    $checkUserExistance->close();
                    if ($result->num_rows==1) {
                        $_SESSION["logged_user"] = $username; 
                        return true;
                    } else {
                        return false;
                    }
                }
                else {
                
                    return "ConnectionFailed";
                }
            }
            else {
                return "userIsAlreadyLogged";
            }
            
        }

        public function checkEmailPresence($email): bool | string {
            $connectionResult=$this->openDBConnection();
            if ($connectionResult) {
                $checkUserStatement=$this->connection->prepare("SELECT email FROM Utente WHERE email = ?");
                $checkUserStatement->bind_param("s",$email);
                try {
                    $checkUserStatement->execute();
                } catch(\mysqli_sql_exception $e) {
                    $this->closeDBConnection();
                    $checkUserStatement->close();
                    return "ExceptionThrow";
                }

                $result=$checkUserStatement->get_result();
                $this->closeDBConnection();
                $checkUserStatement->close();

                if ($result->num_rows==1) {
                    return true;
                } else {
                    return false;
                }
            } else {
                return "ConnectionFailed";
            }
        }

        public function checkUserPresence($username): bool | string {
            $connectionResult=$this->openDBConnection();
            if ($connectionResult) {
                $checkUserStatement=$this->connection->prepare("SELECT nome FROM Utente WHERE nome = ?");
                $checkUserStatement->bind_param("s",$username);
                try {
                    $checkUserStatement->execute();
                } catch(\mysqli_sql_exception $e) {
                    $this->closeDBConnection();
                    $checkUserStatement->close();
                    return "ExceptionThrow";
                }

                $result=$checkUserStatement->get_result();
                $this->closeDBConnection();
                $checkUserStatement->close();

                if ($result->num_rows==1) {
                    return true;
                } else {
                    return false;
                }
            } else {
                return "ConnectionFailed";
            }
        }

        public function registerUser($username,$userCategory,$email,$psw): bool {
            /*
                Gestisce l'inserimento di dati già appositamente filtrati. Ritorna false se l'inserimento fallisce (es. l'utente è già registrato o la connessione
                al server è fallita)
            */
            $encPsw=hash('sha256',$psw);
            $date=date("Y-m-d h:m:s");
            $connectionResult=$this->openDBConnection();
            if ($connectionResult) {
                $registerUserStatement=$this->connection->prepare("INSERT INTO Utente(email,nome,password,data_iscrizione,tipo_studente) VALUES(?,?,?,?,?)");
                $registerUserStatement->bind_param("sssss",$email,$username,$encPsw,$date,$userCategory);
                try {
                    $registerUserStatement->execute();
                } catch(\mysqli_sql_exception $e) {
                    $this->closeDBConnection();
                    $registerUserStatement->close();
                    return false;
                }

                if (mysqli_affected_rows($this->connection)==1) {
                    $this->closeDBConnection();
                    $registerUserStatement->close();
                    $_SESSION["logged_user"] = $username; 
                    return true;
                } else {
                    $registerUserStatement->close();
                    $this->closeDBConnection();
                    return false;
                }
            } else {
                return false;
            }
        }

        
    }

?>