<?php

/**
 * @Author: amosquera
 * @Date:   2018-02-21 20:33:07
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-02-21 20:35:27
 */

/**
* Clase para consultar los servicios
*/
class ServiciosModel extends Model
{
  function __construct()
  {
    parent::__construct();
  }

  public function listAll()
  {
    $sql = $this->db->prepare("SELECT servicios.ID, servicios.SERVICIO, servicios.ALIAS, servicios.PERIOCIDAD, servicios.CONBINACION, servicios.ESTADO FROM servicios");
    $sql->execute();
    return $result = $sql->fetchAll(PDO::FETCH_ASSOC);
  }
}