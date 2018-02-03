<?php

/**
 * @Author: amosquera
 * @Date:   2018-02-03 01:06:14
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-02-03 10:14:08
 */

require '../../app.php';

Session::destroy();
Session::redirect('http://' . HTTP_HOST . '/' . DIRECTORIO .'/index.php');
