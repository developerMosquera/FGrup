<?php

/**
 * @Author: amosquera
 * @Date:   2018-02-17 19:23:23
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-02-23 22:52:02
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
    $sql = $this->db->prepare("SELECT programador.SERIAL_SISTEMA, programador.FECHA_PROGRAMADOR, equipos.EQUIPO, servicios.SERVICIO, servicios.ALIAS, clientes.CLIENTE, usuarios.NOMBRE AS CREADOR, usuarios_tecnico.NOMBRE AS TECNICO, estados.ESTADO  FROM programador LEFT JOIN equipos ON equipos.SERIAL_SISTEMA = programador.SERIAL_SISTEMA LEFT JOIN servicios ON servicios.ID = programador.ID_SERVICIO LEFT JOIN clientes ON clientes.ID = programador.ID_CLIENTE LEFT JOIN usuarios ON usuarios.ID = programador.ID_CREADOR LEFT JOIN usuarios AS usuarios_tecnico ON usuarios_tecnico.ID = programador.ID_TECNICO LEFT JOIN estados ON estados.ID = programador.ESTADO");
    $sql->execute();
    return $result = $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function listAllProgramador()
  {
    $sql = $this->db->prepare("SELECT programador.LLAVE AS id, programador.FECHA_PROGRAMADOR AS start, programador.FECHA_PROGRAMADOR AS 'end', equipos.EQUIPO AS title, CONCAT('false') AS allDay FROM programador LEFT JOIN equipos ON equipos.SERIAL_SISTEMA = programador.SERIAL_SISTEMA LEFT JOIN servicios ON servicios.ID = programador.ID_SERVICIO LEFT JOIN clientes ON clientes.ID = programador.ID_CLIENTE LEFT JOIN usuarios ON usuarios.ID = programador.ID_CREADOR LEFT JOIN usuarios AS usuarios_tecnico ON usuarios_tecnico.ID = programador.ID_TECNICO LEFT JOIN estados ON estados.ID = programador.ESTADO");
    $sql->execute();
    return $result = $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function insert()
  {
    $idCreador = Session::getSession('usuario')['idUsuario'];

    /*if()
    {
      Aqui voy!!!!
    }*/

    $sqlEstados = $this->db->prepare("SELECT estados.ID, estados.ESTADO, estados.DIAS_MAX FROM estados WHERE estados.ID = ");
    $sqlEstados->execute();
    $resultEstados = $sqlEstados->fetchAll(PDO::FETCH_ASSOC);
    $diasProgramador = $resultEstados[0]['DIAS_MAX'];

    $sql = $this->db->prepare("INSERT INTO programador (LLAVE, SERIAL_SISTEMA, ID_SERVICIO, ID_CLIENTE, ID_CREADOR, FECHA_PROGRAMADOR, FECHA_CREACION) VALUES (:llave, :serialSistema, :idServicio, :idCliente, :idCreador, :fechaProgramador, :fechaCreacion)");
    $sql->execute(array(':llave' => $_POST['serialSistema'] . $_POST['servicio'], ':serialSistema' => $_POST['serialSistema'], ':idServicio' => $_POST['servicio'], ':idCliente' => $_POST['cliente'], ':idCreador' => $idCreador, ':fechaProgramador' => $fechaProgramador, ':fechaCreacion' => date("Y-m-d H:i:s")));
    $affectedRows = $sql->rowCount();
  }
}

?>