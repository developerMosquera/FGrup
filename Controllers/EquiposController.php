<?php

/**
 * @Author: amosquera
 * @Date:   2018-02-18 21:20:40
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-03-31 23:28:20
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

  public function listAllTiposEquipos()
  {
    echo json_encode($this->model->listAllTiposEquipos());
  }

  public function listAllMarcasEquipos()
  {
    echo json_encode($this->model->listAllMarcasEquipos());
  }

  public function listAllTiposEquiposMasServiciosGarantias()
  {
    echo json_encode($this->model->listAllTiposEquiposMasServiciosGarantias());
  }

  public function listAllTiposEquiposMasServiciosNoGarantias()
  {
    echo json_encode($this->model->listAllTiposEquiposMasServiciosNoGarantias());
  }

  public function insert()
  {
    echo json_encode($this->model->insert());
  }
}

?>