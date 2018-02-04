<?php

/**
 * @Author: developerMosquera
 * @Date:   2018-02-03 19:22:58
 * @Last Modified by:   developerMosquera
 * @Last Modified time: 2018-02-03 19:33:53
 */

/**
* Clase controlador para los usuarios
*/
class UsersController extends Controller
{

	private $model;

	function __construct()
	{
		$this->model = $this->callModel('users');
	}

	public function listAll()
	{
		echo json_encode($this->model->listAll());
	}
}