<?php

/**
 * @Author: amosquera
 * @Date:   2018-02-18 21:45:53
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-02-18 21:56:34
 */

/**
* Clase controlador para los clientes
*/
class ClientesController extends Controller
{
  private $model;

  function __construct()
  {
    $this->model = $this->callModel('clientes');
  }

  public function listAll()
  {
    echo json_encode($this->model->listAll());
  }
}
?>