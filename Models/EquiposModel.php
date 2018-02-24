<?php

/**
 * @Author: amosquera
 * @Date:   2018-02-18 21:22:04
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-02-23 22:23:12
 */

/**
* Clase modelo para consultar la tabla equipos
*/
class EquiposModel extends Model
{
  function __construct()
  {
    parent::__construct();
  }

  public function listAll()
  {
    $sql = $this->db->prepare("SELECT equipos.ID, equipos.ID_CLIENTE, clientes.CLIENTE, equipos.EQUIPO, equipos.SERIAL_SISTEMA, equipos.SERIAL_REAL, equipos.MODELO FROM equipos LEFT JOIN clientes ON clientes.ID = equipos.ID_CLIENTE");
    $sql->execute();
    return $result = $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function insert()
  {
    /***
      Insert equipo
    ***/
    $serialSistema = $this->textToNumber($_POST['serialEquipo']);
    $sqlEquipos = $this->db->prepare("INSERT IGNORE INTO equipos (EQUIPO, SERIAL_SISTEMA, SERIAL_REAL, MODELO, FECHA_CREACION) VALUES (:equipo, :serialSistema, :serialReal, :modelo, :fechaCreacion)");
    $sqlEquipos->execute(array(':equipo' => $_POST['nombreEquipo'], ':serialSistema' => $serialSistema, ':serialReal' => $_POST['serialEquipo'], ':modelo' => $_POST['modeloEquipo'], ':fechaCreacion' => date("Y-m-d H:i:s")));
    $idEquipo = $this->db->lastInsertId();

    /***
      Fin
    ***/

    /***
      Si el insert equipo es exitoso procedemos a validar los demas insert
    ***/
    if($idEquipo > 0)
    {
      if($_POST['statusNewClienteControl'] == 1)
      {
        $sqlClientes = $this->db->prepare("INSERT INTO clientes (CLIENTE, NIT, DIRECCION, TELEFONO, CORREO_1, CORREO_2, FECHA_CREACION) VALUES (:cliente, :nit, :direccion, :telefono, :correoUno, :correoDos, :fechaCreacion)");
        $sqlClientes->execute(array(':cliente' => $_POST['nombreCliente'], ':nit' => $_POST['nitCliente'], ':direccion' => $_POST['direccionCliente'], ':telefono' => $_POST['telefonoCliente'], ':correoUno' => $_POST['emailCliente'], ':correoDos' => $_POST['emailClienteDos'], ':fechaCreacion' => date("Y-m-d H:i:s")));
        $affectedRowsClientes = $sqlClientes->rowCount();

        /***
          Si el insert cliente es exitoso almacenamos los datos al programador
        ***/
        if($affectedRowsClientes > 0)
        {
          $idCliente = $this->db->lastInsertId();
          $idServicio = $_POST['servicio'];
          $idCreador = Session::getSession('usuario')['idUsuario'];

          $sqlEstados = $this->db->prepare("SELECT estados.ID, estados.ESTADO, estados.DIAS_MAX FROM estados WHERE estados.ID = 1");
          $sqlEstados->execute();
          $resultEstados = $sqlEstados->fetchAll(PDO::FETCH_ASSOC);
          $diasProgramador = $resultEstados[0]['DIAS_MAX'];

          $sqlAgregaIdCliente = $this->db->prepare("UPDATE equipos SET ID_CLIENTE = ". $idCliente ." WHERE ID = ". $idEquipo ."");
          $sqlAgregaIdCliente->execute();

          $fechaProgramador = strftime("%Y-%m-%d", strtotime(date("Y-m-d") . " + ". $diasProgramador ." days"));

          $sql = $this->db->prepare("INSERT INTO programador (LLAVE, SERIAL_SISTEMA, ID_SERVICIO, ID_CLIENTE, ID_CREADOR, FECHA_PROGRAMADOR, FECHA_CREACION) VALUES (:llave, :serialSistema, :idServicio, :idCliente, :idCreador, :fechaProgramador, :fechaCreacion)");
          $sql->execute(array(':llave' => $serialSistema . $idServicio, ':serialSistema' => $serialSistema, ':idServicio' => $idServicio, ':idCliente' => $idCliente, ':idCreador' => $idCreador, ':fechaProgramador' => $fechaProgramador, ':fechaCreacion' => date("Y-m-d H:i:s")));
          $affectedRows = $sql->rowCount();
          if($affectedRows > 0)
          {
            return array("result" => true, "mensaje" => "");
          } else {
            $sqlDeleteEquipo = $this->db->prepare("DELETE FROM equipos WHERE ID = ". $idEquipo ."");
            $sqlDeleteEquipo->execute();

            $sqlDeleteCliente = $this->db->prepare("DELETE FROM clientes WHERE ID = ". $idCliente ."");
            $sqlDeleteCliente->execute();

            return array("result" => false, "mensaje" => "Programación no almacenada");
          }

        } else {
          $sqlDeleteEquipo = $this->db->prepare("DELETE FROM equipos WHERE ID = ". $idEquipo ."");
          $sqlDeleteEquipo->execute();

          return array("result" => false, "mensaje" => "Cliente no almacenado");
        }

      } else {
        $idCliente = $_POST['cliente'];
        $idServicio = $_POST['servicio'];
        $idCreador = Session::getSession('usuario')['idUsuario'];

        $sqlEstados = $this->db->prepare("SELECT estados.ID, estados.ESTADO, estados.DIAS_MAX FROM estados WHERE estados.ID = 1");
        $sqlEstados->execute();
        $resultEstados = $sqlEstados->fetchAll(PDO::FETCH_ASSOC);
        $diasProgramador = $resultEstados[0]['DIAS_MAX'];

        $sqlAgregaIdCliente = $this->db->prepare("UPDATE equipos SET ID_CLIENTE = ". $idCliente ." WHERE ID = ". $idEquipo ."");
        $sqlAgregaIdCliente->execute();

        $fechaProgramador = strftime("%Y-%m-%d", strtotime(date("Y-m-d") . " + ". $diasProgramador ." days"));

        $sql = $this->db->prepare("INSERT INTO programador (LLAVE, SERIAL_SISTEMA, ID_SERVICIO, ID_CLIENTE, ID_CREADOR, FECHA_PROGRAMADOR, FECHA_CREACION) VALUES (:llave, :serialSistema, :idServicio, :idCliente, :idCreador, :fechaProgramador, :fechaCreacion)");
        $sql->execute(array(':llave' => $serialSistema . $idServicio, ':serialSistema' => $serialSistema, ':idServicio' => $idServicio, ':idCliente' => $idCliente, ':idCreador' => $idCreador, ':fechaProgramador' => $fechaProgramador, ':fechaCreacion' => date("Y-m-d H:i:s")));
        $affectedRows = $sql->rowCount();
        if($affectedRows > 0)
        {
          return array("result" => true, "mensaje" => "");
        } else {
          $sqlDeleteEquipo = $this->db->prepare("DELETE FROM equipos WHERE ID = ". $idEquipo ."");
          $sqlDeleteEquipo->execute();

          return array("result" => false, "mensaje" => "Programación no almacenada");
        }
      }

    } else {
      return array("result" => false, "mensaje" => "Equipo no almacenado");
    }
  }
}

?>