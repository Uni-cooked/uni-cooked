<?php

namespace Utilities;

session_start();

class DB {
    private const HOST_DB = "localhost";
    private const DBNAME = "aprecoma";
    private const USERNAME = "aprecoma";
    private const PSW = "bahnoht9fuo2WiCh";

    private $connection;
    private static $tagPermessi = '<em><strong>';

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
        if (isset($_SESSION["logged_user"]) && $_SESSION!=null) {
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

    public function getRecipeComments (string $recipe, int $number = -1): array | string {
        $result=array();
        $username="";
        $isUserLogged=$this->isUserLogged();
        if(is_bool($isUserLogged) && $isUserLogged==false) {
            $username="aaaaaaaaaaaaaaaa"; //16 letter-long username, which is impossible to have in our db, so all comments will be returned
        } else {
            $username=$isUserLogged;
        }
        $connectionResult=$this->openDBConnection();
        if ($connectionResult) {
            $getRecipeComments=$this->connection->prepare("SELECT utente, commento, data, voto FROM Valutazione WHERE ricetta=? AND utente<>?");
            $getRecipeComments->bind_param("ss",$recipe,$username);
            try {
                $getRecipeComments->execute();
            } catch (\mysqli_sql_exception $e) {
                $this->closeDBConnection();
                $getRecipeComments->close();
                return "ExceptionThrow";
            }
            $queryResult=$getRecipeComments->get_result();
            $this->closeDBConnection();
            $getRecipeComments->close();
            if ($queryResult->num_rows>0) {
                if($number==-1) {
                    while($row = mysqli_fetch_assoc($queryResult)) {
                        array_push($result,$row);
                    }
                }
                else {
                    while($number>0 && $row = mysqli_fetch_assoc($queryResult)) {
                        array_push($result,$row);
                        $number=$number-1;
                    }
                }
                $queryResult->free();
                return $result;
            }
            else {
                $queryResult->free();
                return "noComments";
            }
        } else {
            return "ConnectionFailed";
        }
    }

    public function getUserPublicComment (string $username, string $recipe): string | array {
        $connectionResult=$this->openDBConnection();
        if ($connectionResult) {
            $getUserPublicComment=$this->connection->prepare("SELECT commento, data, voto FROM Valutazione WHERE ricetta=? AND utente=?");
            $getUserPublicComment->bind_param("ss",$recipe,$username);
            try {
                $getUserPublicComment->execute();
            } catch (\mysqli_sql_exception $e) {
                $this->closeDBConnection();
                $getUserPublicComment->close();
                return "ExceptionThrow";
            }
            $result=$getUserPublicComment->get_result();
            $this->closeDBConnection();
            $getUserPublicComment->close();
            if ($result->num_rows==1) {
                $row = mysqli_fetch_assoc($result);
                $result->free();
                return $row;
            }
            else {
                $result->free();
                return "userLeftNoComment";
            }
        } else {
            return "ConnectionFailed";
        } 
    }

    public function getRecipeToDoList(string $recipe): array | string {
        $connectionResult=$this->openDBConnection();
        if ($connectionResult) {
            $getRecipeToDoList=$this->connection->prepare("SELECT * FROM Preparazione WHERE ricetta=?");
            $getRecipeToDoList->bind_param("s",$recipe);
            try {
                $getRecipeToDoList->execute();
            } catch (\mysqli_sql_exception $e) {
                $this->closeDBConnection();
                $getRecipeToDoList->close();
                return "ExceptionThrow";
            }
            $result=$getRecipeToDoList->get_result();
            $this->closeDBConnection();
            $getRecipeToDoList->close();
            if ($result->num_rows>0) {
                $final=array();
                while($row = mysqli_fetch_assoc($result)) {
                    array_push($final,$row);
                }
                $result->free();
                return $final;
            }
            else {
                $result->free();
                return "genericError";
            }
        } else {
            return "ConnectionFailed";
        }  
    }

    public function getRecipeIngredients(string $recipe): array | string {
        $connectionResult=$this->openDBConnection();
        if ($connectionResult) {
            $getRecipeIngredients=$this->connection->prepare("SELECT * FROM Utilizzo_Ingrediente WHERE ricetta=?");
            $getRecipeIngredients->bind_param("s",$recipe);
            try {
                $getRecipeIngredients->execute();
            } catch (\mysqli_sql_exception $e) {
                $this->closeDBConnection();
                $getRecipeIngredients->close();
                return "ExceptionThrow";
            }
            $result=$getRecipeIngredients->get_result();
            $this->closeDBConnection();
            $getRecipeIngredients->close();
            if ($result->num_rows>0) {
                $final=array();
                while($row = mysqli_fetch_assoc($result)) {
                    array_push($final,$row);
                }
                $result->free();
                return $final;
            }
            else {
                $result->free();
                return "genericError";
            }
        } else {
            return "ConnectionFailed";
        }
    }

    public function getRecipeDetails(string $recipe): array | string {
        $connectionResult=$this->openDBConnection();
        if ($connectionResult) {
            $getRecipeDetails=$this->connection->prepare("SELECT * FROM Ricetta WHERE nome=?");
            $getRecipeDetails->bind_param("s",$recipe);
            try {
                $getRecipeDetails->execute();
            } catch (\mysqli_sql_exception $e) {
                $this->closeDBConnection();
                $getRecipeDetails->close();
                return "ExceptionThrow";
            }
            $result=$getRecipeDetails->get_result();
            $this->closeDBConnection();
            $getRecipeDetails->close();
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
                return "-";
            }
        } else {
            return "ConnectionFailed";
        }
    }

    public function doesRecipeExists(string $recipe): bool | string {
        $connectionResult=$this->openDBConnection();
        $result=array();
        if ($connectionResult) {
            $doesRecipeExists=$this->connection->prepare("SELECT nome FROM Ricetta WHERE nome=?");
            $doesRecipeExists->bind_param("s", $recipe);
            try {
                $doesRecipeExists->execute();
            } catch (\mysqli_sql_exception $e) {
                $this->closeDBConnection();
                $doesRecipeExists->close();
                return "ExceptionThrow";
            }
            $result=$doesRecipeExists->get_result();
            $this->closeDBConnection();
            $doesRecipeExists->close();
            if ($result->num_rows==1) {
                $result->free();
                return true;
            }
            else {
                $result->free();
                return false;
            }
        } else {
            return "ConnectionFailed";
        }
    }

    public function removeRecipeFromUserFavourites(string $recipe): bool | string {
        $isUserLogged=$this->isUserLogged();
        if ($isUserLogged==false) {
            return "userIsNotLogged";
        } else {
            $connectionResult=$this->openDBConnection();
            if ($connectionResult) {
                $getUserInfo=$this->connection->prepare("DELETE FROM Preferenza_Ricetta WHERE ricetta = ? AND utente=?");
                $getUserInfo->bind_param("ss",$recipe,$isUserLogged);
                try {
                    $getUserInfo->execute();
                } catch (\mysqli_sql_exception $e) {
                    $this->closeDBConnection();
                    $getUserInfo->close();
                    return "ExceptionThrow";
                }
                $result=$getUserInfo->affected_rows;
                $this->closeDBConnection();
                $getUserInfo->close();
                if ($result==1) {
                    return true;
                } else {
                    return "genericError";
                }
            } else {
                return "ConnectionFailed";
            }
        }
    }

    public function removeUserComment(string $recipe): bool | string {
        $isUserLogged=$this->isUserLogged();
        if ($isUserLogged==false) {
            return "userIsNotLogged";
        } else {
            $connectionResult=$this->openDBConnection();
            if ($connectionResult) {
                $removeUserComment=$this->connection->prepare("DELETE FROM Valutazione WHERE ricetta = ? AND utente=?");
                $removeUserComment->bind_param("ss",$recipe,$isUserLogged);
                try {
                    $removeUserComment->execute();
                } catch (\mysqli_sql_exception $e) {
                    $this->closeDBConnection();
                    $removeUserComment->close();
                    return "ExceptionThrow";
                }
                $result=$removeUserComment->affected_rows;
                $this->closeDBConnection();
                $removeUserComment->close();
                if ($result==1) {
                    return true;
                } else {
                    return "genericError";
                }
            } else {
                return "ConnectionFailed";
            }
        }
    }

    public function addUserReview(string $recipe, string $comment,int $mark): bool {
        $isUserLogged=$this->isUserLogged();
        $date=date("Y-m-d h:m:s");
        if($isUserLogged==false) {
            return "userIsNotLogged";
        }
        $connectionResult=$this->openDBConnection();
        if ($connectionResult) {
            $addUserReview=$this->connection->prepare("INSERT INTO Valutazione(ricetta, utente, commento, voto,data) VALUES(?,?,?,?,?)");
            $addUserReview->bind_param("sssis",$recipe,$isUserLogged,$comment,$mark,$date);
            try {
                $addUserReview->execute();
            } catch(\mysqli_sql_exception $e) {
                $this->closeDBConnection();
                $addUserReview->close();
                return false;
            }

            if (mysqli_affected_rows($this->connection)==1) {
                $this->closeDBConnection();
                $addUserReview->close();
                return true;
            } else {
                $addUserReview->close();
                $this->closeDBConnection();
                return false;
            }
        } else {
            return false;
        }
    }

    public function addRecipeToUserFavourites(string $recipe): bool | string {
        $isUserLogged=$this->isUserLogged();
        if($isUserLogged==false) {
            return "userIsNotLogged";
        }
        $connectionResult=$this->openDBConnection();
        if ($connectionResult) {
            $addRecipeToUserFavourites=$this->connection->prepare("INSERT INTO Preferenza_Ricetta(ricetta, utente) VALUES(?,?)");
            $addRecipeToUserFavourites->bind_param("ss",$recipe,$isUserLogged);
            try {
                $addRecipeToUserFavourites->execute();
            } catch(\mysqli_sql_exception $e) {
                $this->closeDBConnection();
                $addRecipeToUserFavourites->close();
                return false;
            }

            if (mysqli_affected_rows($this->connection)==1) {
                $this->closeDBConnection();
                $addRecipeToUserFavourites->close();
                return true;
            } else {
                $addRecipeToUserFavourites->close();
                $this->closeDBConnection();
                return false;
            }
        } else {
            return false;
        }
    }

    public function isRecipeInUserFavourites(string $recipe, string $username): bool | string {
        $connectionResult=$this->openDBConnection();
        $result=array();
        if ($connectionResult) {
            $isRecipeInUserFavourites=$this->connection->prepare("SELECT ricetta FROM Preferenza_Ricetta WHERE ricetta=? AND utente=?;");
            $isRecipeInUserFavourites->bind_param("ss", $recipe, $username);
            try {
                $isRecipeInUserFavourites->execute();
            } catch (\mysqli_sql_exception $e) {
                $this->closeDBConnection();
                $isRecipeInUserFavourites->close();
                return "ExceptionThrow";
            }
            $result=$isRecipeInUserFavourites->get_result();
            $this->closeDBConnection();
            $isRecipeInUserFavourites->close();
            if ($result->num_rows==1) {
                $result->free();
                return true;
            }
            else {
                $result->free();
                return false;
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
                    while($number>0 && $row = mysqli_fetch_assoc($queryResult)) {
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

    public function deleteUser(): bool | string {
        $isUserLogged=$this->isUserLogged();
        if ($isUserLogged==false) {
            return "userIsNotLogged";
        } else {
            $connectionResult=$this->openDBConnection();
            if ($connectionResult) {
                $getUserInfo=$this->connection->prepare("DELETE FROM Utente WHERE nome = ?");
                $getUserInfo->bind_param("s",$isUserLogged);
                try {
                    $getUserInfo->execute();
                } catch (\mysqli_sql_exception $e) {
                    $this->closeDBConnection();
                    $getUserInfo->close();
                    return "ExceptionThrow";
                }
                $result=$getUserInfo->affected_rows;
                $this->closeDBConnection();
                $getUserInfo->close();
                if ($result==1) {
                    $logOutResult=DB::logOutUser();
                    if(is_string($logOutResult) && strcmp($logOutResult,"userIsNotLoggedIn")==0)
                    {
                        return "genericError";
                    }
                    return true;
                } else {
                    return "genericError";
                }
            } else {
                return "ConnectionFailed";
            }
        }
    }
    public function deleteUserPreferredRecipe(): bool | string {
        $isUserLogged=$this->isUserLogged();
        if ($isUserLogged==false) {
            return "userIsNotLogged";
        } else {
            $connectionResult=$this->openDBConnection();
            if ($connectionResult) {
                $getUserInfo=$this->connection->prepare("DELETE FROM Preferenza_Ricetta WHERE utente = ?");
                $getUserInfo->bind_param("s",$isUserLogged);
                try {
                    $getUserInfo->execute();
                } catch (\mysqli_sql_exception $e) {
                    $this->closeDBConnection();
                    $getUserInfo->close();
                    return "ExceptionThrow";
                }
                $this->closeDBConnection();
                $getUserInfo->close();
                return true;
            } else {
                return "ConnectionFailed";
            }
        }
    }

    public function changeUserData($username,$categoria,$biografia,$image=null): bool | string {
        $isUserLogged=$this->isUserLogged();
        if ($isUserLogged==false) {
            return "userIsNotLogged";
        } else {
            $userPath="../user_profiles/".$_SESSION["logged_user"].'/';
            $connectionResult=$this->openDBConnection();
            if ($connectionResult) {
                $changeUserData=$this->connection->prepare("UPDATE Utente SET nome=?, tipo_studente=?, biografia=?, immagine=? WHERE nome=?");
                $changeUserData->bind_param("sssss",$username,$categoria,$biografia,$image,$isUserLogged);
                try {
                    $changeUserData->execute();
                } catch (\mysqli_sql_exception $e) {
                    $this->closeDBConnection();
                    $changeUserData->close();
                    return "ExceptionThrow";
                }
                $result=$changeUserData->affected_rows;
                $this->closeDBConnection();
                $changeUserData->close();
                if ($result==1) {
                    $_SESSION["logged_user"] = $username;
                    return true;
                } else {
                    return "genericError";
                }
            } else {
                return "ConnectionFailed";
            }
        }
    }

    public function changeUserPsw(string $oldPsw, string $newPsw): string | bool {
        $encOldPsw=hash('sha256',$oldPsw);
        $encNewPsw=hash('sha256',$newPsw);
        $isUserLogged=$this->isUserLogged();
        if ($isUserLogged==false) {
            return "userIsNotLogged";
        } else {
            $connectionResult=$this->openDBConnection();
            if ($connectionResult) {
                $changeUserPsw=$this->connection->prepare("UPDATE Utente SET password=? WHERE nome=? AND password=?");
                $changeUserPsw->bind_param("sss",$encNewPsw,$isUserLogged,$encOldPsw);
                try {
                    $changeUserPsw->execute();
                } catch (\mysqli_sql_exception $e) {
                    $this->closeDBConnection();
                    $changeUserPsw->close();
                    return "ExceptionThrow";
                }
                $result=$changeUserPsw->affected_rows;
                $this->closeDBConnection();
                $changeUserPsw->close();
                if ($result==1) {
                    return true;
                } else {
                    return "wrongPassword";
                }
            } else {
                return "ConnectionFailed";
            }
        }
    }

    public function insertSuggestion($suggestion,$user = null): bool {
        $date=date("Y-m-d h:m:s");
        $connectionResult=$this->openDBConnection();
        if ($connectionResult) {
            $insertSuggestion=$this->connection->prepare("INSERT INTO Suggerimento(testo, utente, data) VALUES(?,?,?)");
            $insertSuggestion->bind_param("sss",$suggestion,$user,$date);
            try {
                $insertSuggestion->execute();
            } catch(\mysqli_sql_exception $e) {
                $this->closeDBConnection();
                $insertSuggestion->close();
                return false;
            }

            if (mysqli_affected_rows($this->connection)==1) {
                $this->closeDBConnection();
                $insertSuggestion->close();
                return true;
            } else {
                $insertSuggestion->close();
                $this->closeDBConnection();
                return false;
            }
        } else {
            return false;
        }
    }

    public function GetRecipes($query,$params):array|null {
        $connectionResult=$this->openDBConnection();
        if(!$connectionResult) {
            header('Location: 500-err.php');
            exit();
        }
        try {
            $registerUserStatement=$this->connection->prepare($query);
            $registerUserStatement->execute($params);
            $result = $registerUserStatement->get_result();
            $this->closeDBConnection();
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
            $this->closeDBConnection();
            $registerUserStatement->close();
            echo $e->getMessage();
            return null;
        }
    }

    public function checkLang($s,$addSpan=true): string {
        preg_match_all('/\b(\w+)_([A-Z]{2})\b/u', $s, $matches);
        
        foreach ($matches[0] as $matchIndex => $match) {
            $lang = $matches[2][$matchIndex];
            $strRep = ($addSpan) ? '<span lang="' . strtolower($lang) . '">' . $matches[1][$matchIndex] . '</span>' : $matches[1][$matchIndex];
            $s = str_replace($match, $strRep, $s);
        }
        
        return $s;
    }
}
