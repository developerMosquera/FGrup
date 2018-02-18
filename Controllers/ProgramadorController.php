<?php

/**
 * @Author: amosquera
 * @Date:   2018-02-17 19:38:01
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-02-17 19:44:57
 */

/**
* Clase controlador para el programador
*/
class ProgramadorController extends Controller
{
  private $model;

  function __construct()
  {
    $this->model = $this->callModel('programador');
  }

  public function listAll()
  {
    echo json_encode($this->model->listAll());
  }
}
?>