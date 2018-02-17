<?php

/**
 * @Author: developerMosquera
 * @Date:   2018-02-03 19:27:34
 * @Last Modified by:   developerMosquera
 * @Last Modified time: 2018-02-04 19:26:29
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
		$sql = $this->db->prepare("SELECT ID, USUARIO, ESTADO, FECHA_VENCIMIENTO, TOKEN, NOMBRE, PERFIL, PERMISOS FROM usuarios");
		$sql->execute();
		return $result = $sql->fetchAll(PDO::FETCH_ASSOC);
	}
}