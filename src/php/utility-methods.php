<?php

namespace DB;

session_start();

class DB {
    private const HOST_DB = "localhost";
    private const DBNAME = "dbname";
    private const USERNAME = "username";
    private const PSW = "psw";

    private $connection;
    private $tagPermessi = '<em><strong><ul><li>';

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
        } catch (\mysqli_sql_exception $e) {
            return false;
        }

        return true;
    }
    
    private function closeDBConnection(): void {
        mysqli_close($this->connection);
    }

    public function isUserLogged(): bool | string {
        /*
        *   Return false if not logged, username if logged
        */
        if (isset($_SESSION) && $_SESSION!=null) {
            return $_SESSION["logged_user"];
        } else {
            return false;
        }
    }

    public static function logOutUser() {
        $db=new DB;
        $isUserLogged=$db->isUserLogged();
        if ($isUserLogged!=false) {
            unset($_SESSION["logged_user"]);
        } else {
            return "userIsNotLoggedIn";
        }
    }

    public function getRecipeAverage(string $recipe): int | string {
        $connectionResult=$this->openDBConnection();
        if ($connectionResult) {
            $getRecipeAverage=$this->connection->prepare("SELECT CAST(AVG(voto) AS DECIMAL (2,0)) AS average FROM Valutazione WHERE ricetta = ?");
            $getRecipeAverage->bind_param("s",$recipe);
            try {
                $getRecipeAverage->execute();
            } catch (\mysqli_sql_exception $e) {
                $this->closeDBConnection();
                $getRecipeAverage->close();
                return "ExceptionThrow";
            }
            $result=$getRecipeAverage->get_result();
            $this->closeDBConnection();
            $getRecipeAverage->close();
            $row = mysqli_fetch_assoc($result);
            $result->free();
            if ($row["average"]) {
                return $row["average"];
            } else {
                return 18;
            }
        } else {
            return "ConnectionFailed";
        }
    }

    public function getUserFavourites(string $username,int $number = -1): array | string {
        $connectionResult=$this->openDBConnection();
        $result=array();
        if ($connectionResult) {
            $getUserFavourites=$this->connection->prepare("SELECT Ricetta.nome, Ricetta.categoria, Ricetta.tipo_piatto, Ricetta.prezzo, Ricetta.immagine FROM Ricetta, Preferenza_Ricetta WHERE Ricetta.nome=Preferenza_Ricetta.ricetta AND Preferenza_Ricetta.utente=?;");
            $getUserFavourites->bind_param("s",$username);
            try {
                $getUserFavourites->execute();
            } catch (\mysqli_sql_exception $e) {
                $this->closeDBConnection();
                $getUserFavourites->close();
                return "ExceptionThrow";
            }
            $queryResult=$getUserFavourites->get_result();
            $this->closeDBConnection();
            $getUserFavourites->close();
            if ($queryResult->num_rows>0) {
                if($number==-1) {
                    while($row = mysqli_fetch_assoc($queryResult)) {
                        array_push($result,$row);
                    }
                }
                else {
                    while($row = mysqli_fetch_assoc($queryResult) && $number>0) {
                        array_push($result,$row);
                        $number=$number-1;
                    }
                }
                $queryResult->free();
                return $result;
            }
            else {
                $queryResult->free();
                return "noFavourites";
            }
        } else {
            return "ConnectionFailed";
        }
    }

    public function getUserPublicInfo(string $username): array | string {
        $userExistance=$this->checkUserPresence($username);
        if(is_string($userExistance)) {
            return $userExistance;
        } elseif($userExistance==true) {
            $connectionResult=$this->openDBConnection();
            if ($connectionResult) {
                $getUserInfo=$this->connection->prepare("SELECT nome, data_iscrizione, biografia, tipo_studente, immagine FROM Utente WHERE nome = ?");
                $getUserInfo->bind_param("s",$username);
                try {
                    $getUserInfo->execute();
                } catch (\mysqli_sql_exception $e) {
                    $this->closeDBConnection();
                    $getUserInfo->close();
                    return "ExceptionThrow";
                }
                $result=$getUserInfo->get_result();
                $this->closeDBConnection();
                $getUserInfo->close();
                if ($result->num_rows==1) {
                    $row = mysqli_fetch_assoc($result);
                    $result->free();
                    return $row;
                }
                else {
                    $result->free();
                    return "genericError";
                }
            } else {
                return "ConnectionFailed";
            }
        } else {
            return "noUserFound";
        }
    }

    public function getUserInfo(): array | string {
        $isUserLogged=$this->isUserLogged();
        if ($isUserLogged==false) {
            return "userIsNotLogged";
        } else {
            $connectionResult=$this->openDBConnection();
            if ($connectionResult) {
                $getUserInfo=$this->connection->prepare("SELECT nome, data_iscrizione, biografia, tipo_studente, immagine FROM Utente WHERE nome = ?");
                $getUserInfo->bind_param("s",$isUserLogged);
                try {
                    $getUserInfo->execute();
                } catch (\mysqli_sql_exception $e) {
                    $this->closeDBConnection();
                    $getUserInfo->close();
                    return "ExceptionThrow";
                }
                $result=$getUserInfo->get_result();
                $this->closeDBConnection();
                $getUserInfo->close();
                if ($result->num_rows==1) {
                    $row = mysqli_fetch_assoc($result);
                    $result->free();
                    return $row;
                } else {
                    $result->free();
                    return "genericError";
                }
            } else {
                return "ConnectionFailed";
            }
        }
    }
    
    public function logUser($username,$psw): bool | string {
        if ($this->isUserLogged()==false) {
            $hashedPsw=hash("sha256",$psw);
            $connectionResult=$this->openDBConnection();
            if ($connectionResult) {
                $checkUserExistance=$this->connection->prepare("SELECT nome FROM Utente WHERE nome = ? AND password = ?");
                $checkUserExistance->bind_param("ss",$username,$hashedPsw);
                try {
                    $checkUserExistance->execute();
                } catch (\mysqli_sql_exception $e) {
                    $this->closeDBConnection();
                    $checkUserExistance->close();
                    return "ExceptionThrow";
                }

                $result=$checkUserExistance->get_result();
                $this->closeDBConnection();
                $checkUserExistance->close();
                if ($result->num_rows==1) {
                    $_SESSION["logged_user"] = $username;
                    $result->free(); 
                    return true;
                } else {
                    $result->free();
                    return false;
                }
            } else {
                return "ConnectionFailed";
            }
        } else {
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
                $result->free();
                return true;
            } else {
                $result->free();
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
            } catch (\mysqli_sql_exception $e) {
                $this->closeDBConnection();
                $checkUserStatement->close();
                return "ExceptionThrow";
            }

            $result=$checkUserStatement->get_result();
            $this->closeDBConnection();
            $checkUserStatement->close();

            if ($result->num_rows==1) {
                $result->free();
                return true;
            } else {
                $result->free();
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
