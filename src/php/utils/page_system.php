<?php

namespace Utilities;

require_once("math.php");
require_once ("utility-methods.php");
require_once ("Sanitizer.php");

use DB\DB;
use Utilities\Sanitizer;

class PageSystem {
    private int $current_page;
    private int $totalPages;
    private DB $db;

    private array $filter_list;

    private ?string $recipieName;
    private ?string $recipieCategory;
    private ?string $course;
    private ?int $grade;
    private ?int $cost;
    private ?string $order;

    private const ITEMS_PER_PAGE = 9;

    public function __construct(DB $d,?string $recipieName,?string $recipieCategory,?string $course, ?int $grade, ?int $cost,?string $order) {
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
        $query = "SELECT r.immagine,r.nome,CEILING(AVG(coalesce(v.voto,31))) as voto,r.categoria,r.tipo_piatto,r.prezzo
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
            $this->filter_list["cat"] = $this->recipieCategory;
        }
        if($this->course){
            $query .= " and r.tipo_piatto = ? ";
            $params[] = $this->course;
            $this->filter_list["dish"] = $this->course;
        }
        if($this->cost){
            $query .= " and r.prezzo <= ? ";
            $params[] = $this->cost;
            $this->filter_list["max_price"] = $this->cost;
        }
        
        $query .= "GROUP BY r.nome ";
        if($this->grade){
            $query .= " HAVING AVG(coalesce(v.voto,31)) >= ? ";
            $params[] = $this->grade;
            $this->filter_list["min_rate"] = $this->grade;
        }
        $order_query = "ORDER BY ";

        if($this->recipieName){
            $order_query .= "LOCATE(?, r.nome),";
            $params[] = $this->recipieName;
        }
        
        if($this->db->isUserLogged()){
            $user = $this->db->getUserInfo();
            if(!is_string($user)) {
                $order_query.="CASE
                WHEN r.categoria = \"". $user["tipo_studente"] ."\" THEN 0
                ELSE 1                        
                END,";
            }
        }
        
        $order_query.="CASE
                        WHEN v.voto <> 31 THEN 0
                        ELSE 1                        
                        END,";


        switch ($this->order) {
            case 'prezzo_asc':
                $order_query .= "r.prezzo ASC";
                break;
            
            case 'prezzo_desc':
                $order_query .= "r.prezzo DESC";
                break;
            
            case 'voto_desc':
                $order_query .= "v.voto DESC";
                break;
                
            default:
                $order_query .= "v.voto DESC";
                break;
        }

        
        $query.=$order_query;
        
        $results = $this->db->GetRecipes($query,$params);


        $this->totalPages = ceil(($results ? count($results) : 1) / PageSystem::ITEMS_PER_PAGE);
        $this->current_page=clamp($this->current_page=$page,0,$this->totalPages);

        if($results) {
            return array_slice($results,PageSystem::ITEMS_PER_PAGE*($page-1),PageSystem::ITEMS_PER_PAGE);
        }

        return $results;

    }

    public function GetParamList(): array {
        return $this->filter_list;
    }

    public function RenderButtons(): string{
        return $this->CreatePageButtons($this->current_page,$this->totalPages,$this->filter_list);
    }

    private function CreatePageButtons(int $currentPage,int $totalPages,$filters_list):string {
        $prev_btn = ($currentPage > 1) ? '<button id="prev-page-btn" class="shadow" name="page" value="' . clamp($currentPage-1,1,$totalPages) . '" aria-label="via alla pagina precedente"></button>' : "";
        $next_btn = ($currentPage < $totalPages) ? '<button id="next-page-btn" class="shadow" name="page" value="' . clamp($currentPage+1,1,$totalPages) . '"aria-label="vai alla pagina successiva"></button>' : "";
        $TEMPLATE = "<p>". $currentPage . ' <abbr title="su">/</abbr> ' . $totalPages ." </p>" . $prev_btn . $next_btn;
                    // <button id=\"prev-page-btn\" class=\"shadow\" name=\"page\" value="."\"" .  clamp($currentPage-1,1,$totalPages) . "\"" . "aria-label=\"via alla pagina precedente\"></button>
                    // <button id=\"next-page-btn\" class=\"shadow\" name=\"page\" value="."\"" . clamp($currentPage+1,1,$totalPages) . "\"" . "aria-label=\"vai alla pagina successiva\"></button>";
        $HIDDEN ="";
        while ($value = current($filters_list)) {
            $HIDDEN .= "<input type=\"hidden\" name=". key($filters_list) ." value=". $value .">";
            next($filters_list);
        }
        return $TEMPLATE.$HIDDEN;
    }
}
?>