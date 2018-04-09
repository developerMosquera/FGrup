<?php

/**
 * @Author: amosquera
 * @Date:   2018-02-18 21:22:04
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-03-31 23:54:49
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
    $sql = $this->db->prepare("SELECT equipos.ID, equipos.ID_CLIENTE, clientes.CLIENTE, equipos.ID_TIPO_EQUIPO, tiposEquipos.TIPO_EQUIPO, equipos.SERIAL_SISTEMA, equipos.SERIAL_REAL, equipos.MODELO FROM equipos LEFT JOIN clientes ON clientes.ID = equipos.ID_CLIENTE LEFT JOIN tiposEquipos ON tiposEquipos.ID = equipos.ID_TIPO_EQUIPO");
    $sql->execute();
    return $result = $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function listAllTiposEquipos()
  {
    $sql = $this->db->prepare("SELECT tiposEquipos.ID, tiposEquipos.TIPO_EQUIPO FROM tiposEquipos");
    $sql->execute();
    return $result = $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function listAllMarcasEquipos()
  {
    $sql = $this->db->prepare("SELECT marcarEquipos.ID, marcarEquipos.MARCA_EQUIPO FROM marcarEquipos");
    $sql->execute();
    return $result = $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function listAllTiposEquiposMasServiciosGarantias()
  {
    $sql = $this->db->prepare("SELECT tiposEquiposServicios.ID_TIPO_EQUIPO, tiposEquiposServicios.ID_SERVICIO, servicios.SERVICIO, servicios.ALIAS, servicios.CONBINACION, servicios.PRIMER_ESTADO, servicios.DIAS_MAX FROM tiposEquiposServicios INNER JOIN servicios ON servicios.ID = tiposEquiposServicios.ID_SERVICIO WHERE tiposEquiposServicios.ID_TIPO_EQUIPO =:idTipoEquipo");
    $sql->execute(array(':idTipoEquipo' => $_POST['filterSql']['idTipoEquipo']));
    return $result = $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function listAllTiposEquiposMasServiciosNoGarantias()
  {
    $sql = $this->db->prepare("SELECT tiposEquiposServicios.ID_TIPO_EQUIPO, tiposEquiposServicios.ID_SERVICIO, servicios.SERVICIO, servicios.ALIAS, servicios.CONBINACION, servicios.PRIMER_ESTADO, servicios.DIAS_MAX FROM tiposEquiposServicios INNER JOIN servicios ON servicios.ID = tiposEquiposServicios.ID_SERVICIO WHERE tiposEquiposServicios.ID_TIPO_EQUIPO =:idTipoEquipo AND tiposEquiposServicios.ID_SERVICIO != '26' AND tiposEquiposServicios.ID_SERVICIO != '35'");
    $sql->execute(array(':idTipoEquipo' => $_POST['filterSql']['idTipoEquipo']));
    return $result = $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function insert()
  {
    /***
      Insert equipo
    ***/
    $serialSistema = $this->textToNumber($_POST['serialEquipo']); //Formateando el serial para usar solo numeros como serial del sistama
    $sqlEquipos = $this->db->prepare("INSERT IGNORE INTO equipos (ID_TIPO_EQUIPO, ID_MARCA, SERIAL_SISTEMA, SERIAL_REAL, MODELO, FECHA_CREACION) VALUES (:tipoEquipo, :marcaEquipo, :serialSistema, :serialReal, :modelo, :fechaCreacion)");
    $sqlEquipos->execute(array(':tipoEquipo' => $_POST['tipoEquipo'], ':marcaEquipo' => $_POST['marcaEquipo'], ':serialSistema' => $serialSistema, ':serialReal' => $_POST['serialEquipo'], ':modelo' => $_POST['modeloEquipo'], ':fechaCreacion' => date("Y-m-d H:i:s")));
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
        $sqlClientes = $this->db->prepare("INSERT INTO clientes (CLIENTE, NIT, DIRECCION, CELULAR, TELEFONO, CIUDAD, CONTACTO_1, CONTACTO_2, CORREO_1, CORREO_2, FECHA_CREACION) VALUES (:cliente, :nit, :direccion, :telefono, :celular, :ciudad, :contactoUno, :contactoDos, :correoUno, :correoDos, :fechaCreacion)");
        $sqlClientes->execute(array(':cliente' => $_POST['nombreCliente'], ':nit' => $_POST['nitCliente'], ':direccion' => $_POST['direccionCliente'], ':telefono' => $_POST['telefonoCliente'], ':celular' => $_POST['celularCliente'], 'ciudad' => $_POST['ciudad'], ':contactoUno' => $_POST['contacto'], ':contactoDos' => $_POST['contactoDos'], ':correoUno' => $_POST['emailCliente'], ':correoDos' => $_POST['emailClienteDos'], ':fechaCreacion' => date("Y-m-d H:i:s")));
        $affectedRowsClientes = $sqlClientes->rowCount();

        /***
          Si el insert cliente es exitoso almacenamos los datos al programador
        ***/
        if($affectedRowsClientes > 0)
        {
          $idCliente = $this->db->lastInsertId();
          $idServicio = explode("|", $_POST['servicio']);
          $idCreador = Session::getSession('usuario')['idUsuario'];

          $sqlAgregaIdCliente = $this->db->prepare("UPDATE equipos SET ID_CLIENTE = ". $idCliente ." WHERE ID = ". $idEquipo ."");
          $sqlAgregaIdCliente->execute();

          $fechaProgramador = strftime("%Y-%m-%d", strtotime(date("Y-m-d") . " + ". $idServicio[3] ." days"));

          $combinaciones = explode(",", $idServicio[1]);
          if($combinaciones[0] == 0)
          {
            $llave = $serialSistema . $idServicio[0];
            $llaveCombinacion = $serialSistema . $idServicio[0];

            $sql = $this->db->prepare("INSERT INTO programador (LLAVE, LLAVE_COMBINACION, SERIAL_SISTEMA, ID_SERVICIO, ID_CLIENTE, ID_CREADOR, ESTADO, FECHA_PROGRAMADOR, FECHA_CREACION) VALUES (:llave, :llaveCombinacion, :serialSistema, :idServicio, :idCliente, :idCreador, :estado, :fechaProgramador, :fechaCreacion)");
            $sql->execute(array(':llave' => $llave, ':llaveCombinacion' => $llaveCombinacion, ':serialSistema' => $serialSistema, ':idServicio' => $idServicio[0], ':idCliente' => $idCliente, ':idCreador' => $idCreador, ':estado' => $idServicio[2], ':fechaProgramador' => $fechaProgramador, ':fechaCreacion' => date("Y-m-d H:i:s")));

            $sqlHistorial = $this->db->prepare("INSERT INTO programador_historial (LLAVE, LLAVE_COMBINACION, SERIAL_SISTEMA, ID_SERVICIO, ID_CLIENTE, ID_CREADOR, ESTADO, FECHA_PROGRAMADOR, FECHA_CREACION) VALUES (:llave, :llaveCombinacion, :serialSistema, :idServicio, :idCliente, :idCreador, :estado, :fechaProgramador, :fechaCreacion)");
            $sqlHistorial->execute(array(':llave' => $llave, ':llaveCombinacion' => $llaveCombinacion, ':serialSistema' => $serialSistema, ':idServicio' => $idServicio[0], ':idCliente' => $idCliente, ':idCreador' => $idCreador, ':estado' => $idServicio[2], ':fechaProgramador' => $fechaProgramador, ':fechaCreacion' => date("Y-m-d H:i:s")));
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

            foreach ($combinaciones as $key => $servicio)
            {
              $llave = $serialSistema . $servicio;
              $llaveCombinacion = $serialSistema . $idServicio[0];

              $sql = $this->db->prepare("INSERT INTO programador (LLAVE, LLAVE_COMBINACION, SERIAL_SISTEMA, ID_SERVICIO, ID_CLIENTE, ID_CREADOR, ESTADO, FECHA_PROGRAMADOR, FECHA_CREACION) VALUES (:llave, :llaveCombinacion, :serialSistema, :idServicio, :idCliente, :idCreador, :estado, :fechaProgramador, :fechaCreacion)");
              $sql->execute(array(':llave' => $llave, ':llaveCombinacion' => $llaveCombinacion, ':serialSistema' => $serialSistema, ':idServicio' => $servicio, ':idCliente' => $idCliente, ':idCreador' => $idCreador, ':estado' => $idServicio[2], ':fechaProgramador' => $fechaProgramador, ':fechaCreacion' => date("Y-m-d H:i:s")));

              $sqlHistorial = $this->db->prepare("INSERT INTO programador_historial (LLAVE, LLAVE_COMBINACION, SERIAL_SISTEMA, ID_SERVICIO, ID_CLIENTE, ID_CREADOR, ESTADO, FECHA_PROGRAMADOR, FECHA_CREACION) VALUES (:llave, :llaveCombinacion, :serialSistema, :idServicio, :idCliente, :idCreador, :estado, :fechaProgramador, :fechaCreacion)");
              $sqlHistorial->execute(array(':llave' => $llave, ':llaveCombinacion' => $llaveCombinacion, ':serialSistema' => $serialSistema, ':idServicio' => $servicio, ':idCliente' => $idCliente, ':idCreador' => $idCreador, ':estado' => $idServicio[2], ':fechaProgramador' => $fechaProgramador, ':fechaCreacion' => date("Y-m-d H:i:s")));
              $affectedRows = $sql->rowCount();
              if($affectedRows == 0)
              {
                $sqlDeleteEquipo = $this->db->prepare("DELETE FROM equipos WHERE ID = ". $idEquipo ."");
                $sqlDeleteEquipo->execute();

                $sqlDeleteCliente = $this->db->prepare("DELETE FROM clientes WHERE ID = ". $idCliente ."");
                $sqlDeleteCliente->execute();

                return array("result" => false, "mensaje" => "Programación no almacenada");

                break;
              }
            }

            return array("result" => true, "mensaje" => "");
          }

        } else {
          $sqlDeleteEquipo = $this->db->prepare("DELETE FROM equipos WHERE ID = ". $idEquipo ."");
          $sqlDeleteEquipo->execute();

          return array("result" => false, "mensaje" => "Cliente no almacenado");
        }

      } else {
        $idCliente = $_POST['cliente'];
        $idServicio = explode("|", $_POST['servicio']);
        $idCreador = Session::getSession('usuario')['idUsuario'];

        $sqlAgregaIdCliente = $this->db->prepare("UPDATE equipos SET ID_CLIENTE = ". $idCliente ." WHERE ID = ". $idEquipo ."");
        $sqlAgregaIdCliente->execute();

        $fechaProgramador = strftime("%Y-%m-%d", strtotime(date("Y-m-d") . " + ". $idServicio[3] ." days"));

        $combinaciones = explode(",", $idServicio[1]);
        if($combinaciones[0] == 0)
        {
          $llave = $serialSistema . $idServicio[0];
          $llaveCombinacion = $serialSistema . $idServicio[0];

          $sql = $this->db->prepare("INSERT INTO programador (LLAVE, LLAVE_COMBINACION, SERIAL_SISTEMA, ID_SERVICIO, ID_CLIENTE, ID_CREADOR, ESTADO, FECHA_PROGRAMADOR, FECHA_CREACION) VALUES (:llave, :llaveCombinacion, :serialSistema, :idServicio, :idCliente, :idCreador, :estado, :fechaProgramador, :fechaCreacion)");
          $sql->execute(array(':llave' => $llave, ':llaveCombinacion' => $llaveCombinacion, ':serialSistema' => $serialSistema, ':idServicio' => $idServicio[0], ':idCliente' => $idCliente, ':idCreador' => $idCreador, ':estado' => $idServicio[2], ':fechaProgramador' => $fechaProgramador, ':fechaCreacion' => date("Y-m-d H:i:s")));

          $sqlHistorial = $this->db->prepare("INSERT INTO programador_historial (LLAVE, LLAVE_COMBINACION, SERIAL_SISTEMA, ID_SERVICIO, ID_CLIENTE, ID_CREADOR, ESTADO, FECHA_PROGRAMADOR, FECHA_CREACION) VALUES (:llave, :llaveCombinacion, :serialSistema, :idServicio, :idCliente, :idCreador, :estado, :fechaProgramador, :fechaCreacion)");
          $sqlHistorial->execute(array(':llave' => $llave, ':llaveCombinacion' => $llaveCombinacion, ':serialSistema' => $serialSistema, ':idServicio' => $idServicio[0], ':idCliente' => $idCliente, ':idCreador' => $idCreador, ':estado' => $idServicio[2], ':fechaProgramador' => $fechaProgramador, ':fechaCreacion' => date("Y-m-d H:i:s")));
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

          foreach ($combinaciones as $key => $servicio)
          {
            $llave = $serialSistema . $servicio;
            $llaveCombinacion = $serialSistema . $idServicio[0];

            $sql = $this->db->prepare("INSERT INTO programador (LLAVE, LLAVE_COMBINACION, SERIAL_SISTEMA, ID_SERVICIO, ID_CLIENTE, ID_CREADOR, ESTADO, FECHA_PROGRAMADOR, FECHA_CREACION) VALUES (:llave, :llaveCombinacion, :serialSistema, :idServicio, :idCliente, :idCreador, :estado, :fechaProgramador, :fechaCreacion)");
            $sql->execute(array(':llave' => $llave, ':llaveCombinacion' => $llaveCombinacion, ':serialSistema' => $serialSistema, ':idServicio' => $servicio, ':idCliente' => $idCliente, ':idCreador' => $idCreador, ':estado' => $idServicio[2], ':fechaProgramador' => $fechaProgramador, ':fechaCreacion' => date("Y-m-d H:i:s")));

            $sqlHistorial = $this->db->prepare("INSERT INTO programador_historial (LLAVE, LLAVE_COMBINACION, SERIAL_SISTEMA, ID_SERVICIO, ID_CLIENTE, ID_CREADOR, ESTADO, FECHA_PROGRAMADOR, FECHA_CREACION) VALUES (:llave, :llaveCombinacion, :serialSistema, :idServicio, :idCliente, :idCreador, :estado, :fechaProgramador, :fechaCreacion)");
            $sqlHistorial->execute(array(':llave' => $llave, ':llaveCombinacion' => $llaveCombinacion, ':serialSistema' => $serialSistema, ':idServicio' => $servicio, ':idCliente' => $idCliente, ':idCreador' => $idCreador, ':estado' => $idServicio[2], ':fechaProgramador' => $fechaProgramador, ':fechaCreacion' => date("Y-m-d H:i:s")));
            $affectedRows = $sql->rowCount();
            if($affectedRows == 0)
            {
              $sqlDeleteEquipo = $this->db->prepare("DELETE FROM equipos WHERE ID = ". $idEquipo ."");
              $sqlDeleteEquipo->execute();

              $sqlDeleteCliente = $this->db->prepare("DELETE FROM clientes WHERE ID = ". $idCliente ."");
              $sqlDeleteCliente->execute();

              return array("result" => false, "mensaje" => "Programación no almacenada");

              break;
            }
          }

          return array("result" => true, "mensaje" => "");
        }
      }

    } else {
      return array("result" => false, "mensaje" => "Equipo no almacenado o ya registrado");
    }
  }
}

?>