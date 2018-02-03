<?php

/**
 * @Author: amosquera
 * @Date:   2018-02-02 20:15:48
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-02-02 20:16:16
 */

/**
* Clase que conecta la base de datos con el sistema mediante PDO
*/
class Database extends PDO
{
   function __construct()
   {
      parent::__construct('mysql:host=' . DB_HOST . ';dbname=' . DB_NAME, DB_USER, DB_PASS, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES ' . DB_CHAR));
   }
}

?>