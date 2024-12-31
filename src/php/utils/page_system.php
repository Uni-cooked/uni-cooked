<?php

namespace Utilities;

require_once("html-templates.php");
require_once ("utils/DB.php");
require_once ("utils/Sanitizer.php");

use Utilities\DB;
use Utilities\Sanitizer;

class PageSystem {
    private int $current_page;
    private int $totalPages;
    private DB $db;

    private array $filter_list;

    private const ITEMS_PER_PAGE = 10;

    public function __construct(DB $d) {
        $this->db = $d;
        $this->filter_list = array();
    }
    
    public function GetCurrentPage(int $page): array|null    {
        $recipieName = isset($_GET['name']) ? Sanitizer::SanitizeInput($_GET['name']) : null;
        $recipieCategory = isset($_GET['category']) && $_GET['category'] != "tutti" ? Sanitizer::SanitizeInput($_GET['category']) : null;
        $course = isset($_GET['course']) && $_GET['course'] != "tutti" ? Sanitizer::SanitizeInput($_GET['course']) : null;
        $grade = isset($_GET['grade']) ? Sanitizer::SanitizeInput(Sanitizer::IntFilter($_GET['grade'])) : null;
        $cost = isset($_GET['cost']) ? Sanitizer::SanitizeInput(Sanitizer::IntFilter($_GET['cost'])) : null;
        $order= Sanitizer::SanitizeInput("ca"); // cost ascending

        $query = "SELECT r.immagine,r.nome,AVG(coalesce(v.voto,1)) as voto,r.categoria,r.tipo_piatto,r.tempo_sec
                FROM Ricetta as r LEFT JOIN Valutazione as v ON r.nome = v.ricetta
                WHERE 1=1 ";
        $params = [];

        if($recipieName){
            $query .= " and r.nome LIKE ? ";
            $params[] = "%".$recipieName."%";
            $this->filter_list["name"] = $recipieName;
        }
        if($recipieCategory){
            $query .= " and r.categoria = ? ";
            $params[] = $recipieCategory;
            $this->filter_list["category"] = $recipieCategory;
        }
        if($course){
            $query .= " and r.tipo_piatto = ? ";
            $params[] = $course;
            $this->filter_list["course"] = $course;
        }
        if($cost){
            $query .= " and r.prezzo <= ? ";
            $params[] = (int)$cost;
            $this->filter_list["cost"] = (int)$cost;
        }
        
        $query .= "GROUP BY r.nome ";
        if($grade){
            $query .= " HAVING AVG(coalesce(v.voto,1)) >= ? ";
            $params[] = (int)$grade;
            $this->filter_list["grade"] = (int)$grade;
        }
        $order_query = "ORDER BY ";

        if($recipieName){
            $order_query .= "LOCATE(?, r.nome),";
            $params[] = $recipieName;
        }

        if($this->db->isUserLogged()){
            $user = $this->db->getUserInfo();
            $order_query.="CASE
                            WHEN r.categoria =".$user["tipo_studente"]."THEN 0
                            ELSE 1                        
                            END,";
        }
        switch ($order) {
            case 'ca':
                $order_query .= "r.prezzo ASC";
                break;
            
            case 'cd':
                $order_query .= "r.prezzo DESC";
                break;
            
            case 'ga':
                $order_query .= "v.voto ASC";
                break;
            
            case 'gd':
                $order_query .= "v.voto DESC";
                break;
                
            default:
                $order_query .= "v.voto DESC";
                break;
        }

        
        $query.=$order_query;
        
        $query.= " LIMIT ". PageSystem::ITEMS_PER_PAGE . " OFFSET " . PageSystem::ITEMS_PER_PAGE*($page-1);
        
        $results = $this->db->SelectQuery($query,$params);

        $this->totalPages = ceil(($results ? count($results) : 1) / PageSystem::ITEMS_PER_PAGE);
        $this->current_page=clamp($this->current_page=$page,0,$this->totalPages);

        return $results;
    }

    public function RenderButtons(): string{
        return CreatePageButtons($this->current_page,$this->totalPages,$this->filter_list);
    }
}
?>