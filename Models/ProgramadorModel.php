<?php

/**
 * @Author: amosquera
 * @Date:   2018-02-17 19:23:23
 * @Last Modified by:   developerMosquera
 * @Last Modified time: 2018-02-25 13:28:24
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
    $sql = $this->db->prepare("SELECT programador.LLAVE AS id, programador.FECHA_PROGRAMADOR AS start, programador.FECHA_PROGRAMADOR AS 'end', CONCAT(equipos.EQUIPO,', ',equipos.SERIAL_REAL,', ',clientes.CLIENTE,', ',servicios.SERVICIO) AS title, CONCAT('false') AS allDay, estados.COLOR AS color, estados.TEXT_COLOR AS textColor FROM programador LEFT JOIN equipos ON equipos.SERIAL_SISTEMA = programador.SERIAL_SISTEMA LEFT JOIN servicios ON servicios.ID = programador.ID_SERVICIO LEFT JOIN clientes ON clientes.ID = programador.ID_CLIENTE LEFT JOIN usuarios ON usuarios.ID = programador.ID_CREADOR LEFT JOIN usuarios AS usuarios_tecnico ON usuarios_tecnico.ID = programador.ID_TECNICO LEFT JOIN estados ON estados.ID = programador.ESTADO");
    $sql->execute();
    return $result = $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function insert()
  {
    $idCreador = Session::getSession('usuario')['idUsuario'];
    $servicioPeriocidad = explode('|', $_POST['servicio']);
    $idServicio = $servicioPeriocidad[0];
    $periocidad = $servicioPeriocidad[1];

    if($periocidad == 0)
    {
      $estado = 3; //Programado
      $sqlRemove = $this->db->prepare("DELETE FROM programador WHERE LLAVE = :llave");
      $sqlRemove->execute(array(':llave' => $_POST['serialSistema'] . $idServicio));
    } else {
      $estado = 1; //Cotizado
    }

    $sqlEstados = $this->db->prepare("SELECT estados.ID, estados.ESTADO, estados.DIAS_MAX FROM estados WHERE estados.ID = :idEstado ");
    $sqlEstados->execute(array(':idEstado' => $estado));
    $resultEstados = $sqlEstados->fetchAll(PDO::FETCH_ASSOC);
    $diasProgramador = $resultEstados[0]['DIAS_MAX'];

    $fechaProgramador = strftime("%Y-%m-%d", strtotime(date("Y-m-d") . " + ". $diasProgramador ." days"));

    $sql = $this->db->prepare("INSERT INTO programador (LLAVE, SERIAL_SISTEMA, ID_SERVICIO, ID_CLIENTE, ID_CREADOR, ESTADO, FECHA_PROGRAMADOR, FECHA_CREACION) VALUES (:llave, :serialSistema, :idServicio, :idCliente, :idCreador, :estado, :fechaProgramador, :fechaCreacion)");
    $sql->execute(array(':llave' => $_POST['serialSistema'] . $idServicio, ':serialSistema' => $_POST['serialSistema'], ':idServicio' => $idServicio, ':idCliente' => $_POST['cliente'], ':idCreador' => $idCreador, ':estado' => $estado, ':fechaProgramador' => $fechaProgramador, ':fechaCreacion' => date("Y-m-d H:i:s")));

    $sqlHistorial = $this->db->prepare("INSERT INTO programador_historial (LLAVE, SERIAL_SISTEMA, ID_SERVICIO, ID_CLIENTE, ID_CREADOR, ESTADO, FECHA_PROGRAMADOR, FECHA_CREACION) VALUES (:llave, :serialSistema, :idServicio, :idCliente, :idCreador, :estado, :fechaProgramador, :fechaCreacion)");
    $sqlHistorial->execute(array(':llave' => $_POST['serialSistema'] . $idServicio, ':serialSistema' => $_POST['serialSistema'], ':idServicio' => $idServicio, ':idCliente' => $_POST['cliente'], ':idCreador' => $idCreador, ':estado' => $estado, ':fechaProgramador' => $fechaProgramador, ':fechaCreacion' => date("Y-m-d H:i:s")));
    $affectedRows = $sql->rowCount();
    if($affectedRows > 0)
    {
      return array("result" => true, "mensaje" => "Servicio agregado");
    } else {
      $errorNo = $sql->errorInfo();
      if($errorNo[1] === 1062)
      {
        return array("result" => false, "mensaje" => "Servicio ya solicitado");
      } else {
        return array("result" => false, "mensaje" => "Programación no almacenada");
      }
    }
  }
}

?>