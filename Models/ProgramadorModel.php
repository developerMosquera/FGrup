<?php

/**
 * @Author: amosquera
 * @Date:   2018-02-17 19:23:23
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-02-17 19:38:09
 */

/**
* Clase modelo para administrar el programador
*/
class ProgramadorModel extends Model
{
  function __construct()
  {
    parent::__construct();
  }

  public function listAll()
  {
    $sql = $this->db->prepare("SELECT programador.SERIAL, programador.FECHA, equipos.EQUIPO, servicios.SERVICIO, servicios.ALIAS, clientes.CLIENTE, usuarios.NOMBRE AS CREADOR, usuarios_tecnico.NOMBRE AS TECNICO, estados.ESTADO  FROM programador LEFT JOIN equipos ON equipos.SERIAL = programador.SERIAL LEFT JOIN servicios ON servicios.ID = programador.ID_SERVICIO LEFT JOIN clientes ON clientes.ID = programador.ID_CLIENTE LEFT JOIN usuarios ON usuarios.ID = programador.ID_CREADOR LEFT JOIN usuarios AS usuarios_tecnico ON usuarios_tecnico.ID = programador.ID_TECNICO LEFT JOIN estados ON estados.ID = programador.ESTADO");
    $sql->execute();
    return $result = $sql->fetchAll(PDO::FETCH_ASSOC);
  }
}

?>