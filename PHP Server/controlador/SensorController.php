<?php

namespace Embarcados\controlador;

use Embarcados\persistencia\SensorDAO;
use Embarcados\entidade\Sensor;
use Embarcados\controlador\AbstractController;

date_default_timezone_set('America/Sao_Paulo');



class SensorController extends AbstractController{

  public function __construct() {
    $this->setDAO (new SensorDAO());
  }

  public function insert($teste){
    $sensor = new Sensor($teste->valor);
    $this->getDao()->insert($sensor);
    return ["mensagem"=>"Registo inserido com sucesso."];
  }

  public function update($id, $json){
    $sensor = new Sensor($json->id, $json->valor);
    $this->getDao()->update($sensor);
    return ["mensagem"=>"Registro atualziado com sucesso."];
  }

  public function delete($id){

  }

}
