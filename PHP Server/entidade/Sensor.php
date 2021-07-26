<?php
namespace Embarcados\entidade;

use Embarcados\entidade\Entidade;

/**
* @Entity
* @Table{name="sensor"}
*/
class Sensor extends Entidade{

  /**
  * @var integer @Id
  *      @Column(name="id", type="integer")
  *      @GeneratedValue(strategy="AUTO")
  */
  private $id;
  /**
  *
  * @var integer @Column(type="integer")
  */
  private $valor;
  /**
  *
  * @var date @Column(type="date")
  */
  private $dataleitura;
  /**
  *
  * @var date @Column(type="date")
  */
  private $dataatualizacao;

  //public function __construct($id = 0,$valor = 0,$dataleitura = "0000-00-00",$dataatualizacao = "0000-00-00"){
  //public function __construct($id = 0,$valor = 0){
  public function __construct($valor = 0){
  //  $this->id = $id;
    $this->valor = $valor;
  }

  public static function construct($array){
    $obj = new Sensor();
    $obj->setId( $array['id']);
    $obj->setValor( $array['valor']);
    return $obj;

  }

  public function getId(){
    return $this->id;
  }

  public function setId($id){
    $this->id=$id;
  }

  public function getValor(){
    return $this->valor;
  }

  public function setValor($valor){
    $this->valor=$valor;
  }

  // public function getDataleitura(){
  //   return $this->dataleitura;
  // }

  // public function setDataleitura($dataleitura){
  //   $this->dataleitura=$dataleitura;
  // }

  // public function getDataatualizacao(){
  //   return $this->dataatualizacao;
  // }

  // public function setDataatualizacao($dataatualizacao){
  //   $this->dataatualizacao=$dataatualizacao;
  // }

  public function equals($object){
    if($object instanceof Sensor){

      if($this->id!=$object->id){
        return false;

      }

      if($this->valor!=$object->valor){
        return false;

      }

      // if($this->dataleitura!=$object->dataleitura){
      //   return false;
      //
      // }

      // if($this->dataatualizacao!=$object->dataatualizacao){
      //   return false;
      //
      // }

      return true;

    }
    else{
      return false;
    }

  }
  public function toString(){
    //return "  [id:" .$this->id. "]  [valor:" .$this->valor. "]  [dataleitura:" .$this->dataleitura. "]  [dataatualizacao:" .$this->dataatualizacao. "]  " ;
    return " [valor:" .$this->valor. "]  " ;
  }

  public function toArray(){
    return [
      "valor"=>$this->valor
      // "dataleitura"=>$this->dataleitura,
      // "dataatualizacao"=>$this->dataatualizacao
    ];
  }

}

?>
