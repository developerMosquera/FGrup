<?php

/**
 * @Author: amosquera
 * @Date:   2018-02-18 21:20:40
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-02-22 22:00:22
 */

/**
* Clase controlador para los equipos
*/
class EquiposController extends Controller
{
  private $model;

  function __construct()
  {
    $this->model = $this->callModel('equipos');
  }

  public function listAll()
  {
    echo json_encode($this->model->listAll());
  }

  public function insert()
  {
    echo json_encode($this->model->insert());
    //print_r($_POST);
  }
}

?>