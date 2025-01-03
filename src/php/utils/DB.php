<?php

namespace Utilities;

session_start();

class DB {
    private const HOST_DB = "localhost";
    private const DBNAME = "asoranzo";
    private const USERNAME = "asoranzo";
    private const PSW = "bi0phoogeiyexo9E";

    private $connection;
    private function Connect() {
        mysqli_report(MYSQLI_REPORT_STRICT);
        try {
            $this->connection = mysqli_connect(self::HOST_DB, self::USERNAME, self::PSW, self::DBNAME);
        } catch (\mysqli_sql_exception $e) {
            header("Location: 505-err.php");
        }
    }

    
    private function Disconnect(): void {
        mysqli_close($this->connection);
    }

    public function isUserLogged(): bool | string {
        if ($_SESSION!=null && isset($_SESSION["logged_user"])) {
            return $_SESSION["logged_user"];
        } else {
            return false;
        }
    }

    public function logOutUser() {
        if($this->isUserLogged()) {
            unset($_SESSION["logged_user"]);
        }
        else {
            return "userIsNotLoggedIn";
        }
    }

    public function getUserInfo(): array | string {
        // $isUserLogged=$this->isUserLogged();
        // if($isUserLogged==false) {
        //     return "userIsNotLogged";
        // } else {
        //     $connectionResult=$this->openDBConnection();
        //     if ($connectionResult) {
        //         $getUserInfo=$this->connection->prepare("SELECT * FROM Utente WHERE nome = ?");
        //         $getUserInfo->bind_param("s",$isUserLogged);
        //         try {
        //             $getUserInfo->execute();
        //         } catch (\mysqli_sql_exception $e) {
        //             $this->closeDBConnection();
        //             $getUserInfo->close();
        //             return "ExceptionThrow";
        //         }
        //         $result=$getUserInfo->get_result();
        //         $this->closeDBConnection();
        //         $getUserInfo->close();
        //         if ($result->num_rows==1) {
        //             $row = mysqli_fetch_assoc($result);
        //             $result->free();
        //             return $row;
        //         }
        //         else {
        //             $result->free();
        //             return "genericError";
        //         }
        //     } else {
        //         return "ConnectionFailed";
        //     }
        // }
        $result=$this->SelectQuery("SELECT * FROM Utente WHERE nome = ?",[$_SESSION["logged_user"]]);
        return $result;
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

    public function InsertQuery($query,$params): bool|null {
        $this->Connect();
        try {
            $registerUserStatement=$this->connection->prepare($query);
            $registerUserStatement->execute($params);
            $registerUserStatement->close();
            $this->Disconnect();
            return mysqli_affected_rows($this->connection)==1;
            
        } catch(\mysqli_sql_exception $e) {
            $this->Disconnect();
            $registerUserStatement->close();
            echo $e->getMessage();
            return null;
        }
    }


    public function SelectQuery($query,$params): array|null {
        $this->Connect();
        try {
            $registerUserStatement=$this->connection->prepare($query);
            $registerUserStatement->execute($params);
            $result = $registerUserStatement->get_result();
            $this->Disconnect();
            $registerUserStatement->close();
            if ($result->num_rows > 0) {
                $list = array();
                while ($row = $result->fetch_assoc()) { // prende solo una riga
                    $list[] = $row;
                }
                $result->free_result();
                return $list;
            } else {
                $result->free_result();
                return null;
            } 
        } catch(\mysqli_sql_exception $e) {
            $this->Disconnect();
            $registerUserStatement->close();
            echo $e->getMessage();
            return null;
        }
    }

   
}

?>