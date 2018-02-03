<?php

/**
 * @Author: developerMosquera
 * @Date:   2018-01-31 19:55:18
 * @Last Modified by:   developerMosquera
 * @Last Modified time: 2018-02-02 21:14:03
 */

/**
* Clase controlador del Login
*/
class LoginController extends Controller
{
  private $model;

  function __construct()
  {
    $this->model = $this->callModel('login');
  }

  public function authenticate()
  {
    echo json_encode($this->model->authenticate(strtolower($_POST['user']), $_POST['pass']));
  }
}
?>