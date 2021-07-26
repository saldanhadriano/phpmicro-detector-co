<?php

namespace embarcados\persistencia;

use Doctrine\ORM\Tools\Setup;
use Doctrine\ORM\EntityManager;

abstract class AbstractDAO{

public $entityManager;
public $entityPath;

public function __construct($entityPath){
  $this->entityPath = $entityPath;
  $this->entityManager = $this->createEntityManager();
}

public function createEntityManager(){
  $path = array(
    'Embarcados/entidade'
  );
  $devMode = true;

  $config = Setup::createAnnotationMetadataConfiguration($path, $devMode);

  $connectionOptions = array(
      'dbname' => 'sensor',
      'user' => 'root',
      'password' => '',
      'host' => '127.0.0.1:3306',
      'driver' => 'pdo_mysql',
      'charset' => 'utf8',
      'collation' => 'utf8mb4_unicode_ci',
      'prefix' => '',
  );

  // 'dbname' => 'id3832913_bancoembarcados',
  // 'user' => 'id3832913_embarcados',
  // 'password' => 'embarcados',
  // 'host' => 'localhost:3306',
  // 'driver' => 'pdo_mysql',
  // 'charset' => 'utf8',
  // 'collation' => 'utf8mb4_unicode_ci',
  // 'prefix' => '',

  return EntityManager::create($connectionOptions, $config);
}

public function insert($obj){
  $this->entityManager->persist($obj);
  $this->entityManager->flush();
}
public function update($obj){
  $this->entityManager->merge($obj);
  $this->entityManager->flush();
}
public function delete($obj){
  $this->entityManager->remove($obj);
  $this->entityManager->flush();
}
public function findById($id){
  return $this->entityManager -> find($this->entityPath ,$id);
}
public function findAll(){
  $collection = $this->entityManager ->getRepository($this->entityPath) ->findAll();

  $data = array();
  foreach($collection as $obj){
    $data[] = $obj;
  }
  return $data;
}
}
