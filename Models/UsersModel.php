<?php

/**
 * @Author: developerMosquera
 * @Date:   2018-02-03 19:27:34
 * @Last Modified by:   developerMosquera
 * @Last Modified time: 2018-02-03 20:43:59
 */

/**
* Clase modelo para los usuarios
*/
class UsersModel extends Model
{
	function __construct()
	{
		parent::__construct();
	}

	public function listAll()
	{
		$sql = $this->db->prepare("SELECT ID, USUARIO, CONTRASENA, ESTADO, FECHA_VENCIMIENTO, TOKEN, NOMBRE, PERFIL, PERMISOS FROM usuarios");
		$sql->execute();
		return $result = $sql->fetchAll(PDO::FETCH_ASSOC);
	}
}