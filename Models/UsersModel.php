<?php

/**
 * @Author: developerMosquera
 * @Date:   2018-02-03 19:27:34
 * @Last Modified by:   developerMosquera
 * @Last Modified time: 2018-02-25 14:37:18
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
		$sql = $this->db->prepare("SELECT usuarios.ID, usuarios.USUARIO, usuarios.ESTADO, usuarios.FECHA_VENCIMIENTO, usuarios.TOKEN, usuarios.NOMBRE, usuarios.PERMISOS, perfiles.PERFIL, perfiles.ID AS ID_PERFIL FROM usuarios LEFT JOIN perfiles ON perfiles.ID = usuarios.PERFIL");
		$sql->execute();
		return $result = $sql->fetchAll(PDO::FETCH_ASSOC);
	}
}