<?php

/**
 * @Author: amosquera
 * @Date:   2018-02-21 20:31:44
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-02-21 20:32:34
 */

/**
* Clase para los servicios
*/
class ServiciosController extends Controller
{
  private $model;

  function __construct()
  {
    $this->model = $this->callModel('servicios');
  }

  public function listAll()
  {
    echo json_encode($this->model->listAll());
  }
}