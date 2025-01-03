<?php

namespace Utilities;

require_once("html-templates.php");
require_once ("utils/DB.php");

use Utilities\DB;

class PageSystem {
    private int $current_page;
    private int $totalPages;
    private DB $db;

    private array $filter_list;

    private ?string $recipieName;
    private ?string $recipieCategory;
    private ?string $course;
    private int $grade;
    private int $cost;
    private ?string $order;

    private const ITEMS_PER_PAGE = 9;

    public function __construct(DB $d,?string $recipieName,?string $recipieCategory,?string $course, int $grade, int $cost,?string $order) {
        $this->db = $d;
        $this->filter_list = array();

        $this->recipieName= $recipieName;
        $this->recipieCategory= $recipieCategory;
        $this->course= $course;
        $this->grade= $grade;
        $this->cost= $cost;
        $this->order= $order;
    }
    
    public function GetCurrentPage(int $page): array|null    {
        $query = "SELECT r.immagine,r.nome,AVG(coalesce(v.voto,1)) as voto,r.categoria,r.tipo_piatto,r.prezzo
                FROM Ricetta as r LEFT JOIN Valutazione as v ON r.nome = v.ricetta
                WHERE 1=1 ";
        $params = [];

        if($this->recipieName){
            $query .= " and r.nome LIKE ? ";
            $params[] = "%".$this->recipieName."%";
            $this->filter_list["name"] = $this->recipieName;
        }
        if($this->recipieCategory){
            $query .= " and r.categoria = ? ";
            $params[] = $this->recipieCategory;
            $this->filter_list["category"] = $this->recipieCategory;
        }
        if($this->course){
            $query .= " and r.tipo_piatto = ? ";
            $params[] = $this->course;
            $this->filter_list["course"] = $this->course;
        }
        if($this->cost){
            $query .= " and r.prezzo <= ? ";
            $params[] = $this->cost;
            $this->filter_list["cost"] = $this->cost;
        }
        
        $query .= "GROUP BY r.nome ";
        if($this->grade){
            $query .= " HAVING AVG(coalesce(v.voto,1)) >= ? ";
            $params[] = $this->grade;
            $this->filter_list["grade"] = $this->grade;
        }
        $order_query = "ORDER BY ";

        if($this->recipieName){
            $order_query .= "LOCATE(?, r.nome),";
            $params[] = $this->recipieName;
        }

        if($this->db->isUserLogged()){
            $user = $this->db->getUserInfo()[0];
            $order_query.="CASE
                            WHEN r.categoria = \"". $user["tipo_studente"] ."\" THEN 0
                            ELSE 1                        
                            END,";
        }
        switch ($this->order) {
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
        
        // echo $query;
        $results = $this->db->SelectQuery($query,$params);


        $this->totalPages = ceil(($results ? count($results) : 1) / PageSystem::ITEMS_PER_PAGE);
        $this->current_page=clamp($this->current_page=$page,0,$this->totalPages);

        if($results) {
            return array_slice($results,PageSystem::ITEMS_PER_PAGE*($page-1),PageSystem::ITEMS_PER_PAGE);
        }

        return $results;

    }

    public function RenderButtons(): string{
        return CreatePageButtons($this->current_page,$this->totalPages,$this->filter_list);
    }
}
?>