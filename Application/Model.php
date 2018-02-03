<?php

/**
 * @Author: developerMosquera
 * @Date:   2018-01-31 18:41:11
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-02-02 20:19:24
 */

/**
* Clase modelo general
*/
class Model
{
  protected $db;

  public function __construct()
  {
    $this->db = new Database();
  }
}
?>