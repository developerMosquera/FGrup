<?php

/**
 * @Author: amosquera
 * @Date:   2018-02-18 21:46:08
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-02-18 21:54:19
 */

/**
* Clase modelos para consultar los clientes
*/
class ClientesModel extends Model
{
  function __construct()
  {
    parent::__construct();
  }

  public function listAll()
  {
    $sql = $this->db->prepare("SELECT clientes.ID, clientes.CLIENTE, clientes.NIT, clientes.DIRECCION, clientes.TELEFONO, clientes.CORREO_1, clientes.CORREO_2, clientes.ESTADO FROM clientes");
    $sql->execute();
    return $result = $sql->fetchAll(PDO::FETCH_ASSOC);
  }
}
?>