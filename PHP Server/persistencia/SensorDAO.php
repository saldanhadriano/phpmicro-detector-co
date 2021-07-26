<?php

namespace Embarcados\persistencia;

use Doctrine\ORM\Tools\Setup;
use Doctrine\ORM\EntityManager;
use Embarcados\entidade\Sensor;
use Embarcados\persistencia\AbstractDAO;

class SensorDAO extends AbstractDAO{

  public function __construct(){
    parent::__construct('Embarcados\entidade\Sensor');
  }

}
