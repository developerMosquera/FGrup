<?php

/**
 * @Author: amosquera
 * @Date:   2018-02-17 19:38:01
 * @Last Modified by:   developerMosquera
 * @Last Modified time: 2018-02-25 12:28:46
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

  public function listAllProgramador()
  {
    echo json_encode($this->model->listAllProgramador());
  }

  public function insert()
  {
    echo json_encode($this->model->insert());
  }
}
?>