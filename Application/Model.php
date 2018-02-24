<?php

/**
 * @Author: developerMosquera
 * @Date:   2018-01-31 18:41:11
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-02-22 22:07:10
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

  public function textToNumber($val)
  {
    $val = preg_replace('([^0-9a-zA-Z])', '', $val);
    $val = strtoupper($val);
    $letras = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
    $numeroLetra = array(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26);
    return str_replace($letras, $numeroLetra, $val);
  }
}
?>