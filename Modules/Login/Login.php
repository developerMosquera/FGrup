<?php

/**
 * @Author: developerMosquera
 * @Date:   2018-01-31 19:20:13
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-02-03 13:03:39
 */

require '../../Application/Session.php';

Session::start();

if(Session::getSession('usuarioOn') === true)
{
  Session::redirect('http://' . $_SERVER['HTTP_HOST'] . '/FGrup/fgrup.php');
}
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>American FarmaGrup S.A.S.</title>
  <link rel="stylesheet" type="text/css" href="../../Public/css/bootstrap.min.css" />
  <link rel="stylesheet" type="text/css" href="css/style.css?v=<?php echo time();?>" />
</head>
<body>

	<div class="row">
  	<div class="col-lg-4 col-lg-offset-4 col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 col-xs-12">
      <div id="logueoPanel" class="panel panel-default">

      	<form id="formLogin" class="formSubmit" method="post" data-toggle="validator" role="form" autocomplete="off">
					<div class="panel-body">
						<div id="logo">
            	<img src="../../Static/img/mundoAmfg.png">
            </div>

						<div class="form-group">
            	<label for="user" class="control-label">Usuario</label>
              <div class="input-group">
                <span class="input-group-addon"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
                <input type="text" name="user" class="form-control logueoData" id="user" placeholder="Usuario" autofocus required>
              </div>
            </div>

            <div class="form-group">
              <label for="pass" class="control-label">Contraseña</label>
              <div class="input-group">
                <span class="input-group-addon"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
                <input type="password" name="pass" class="form-control logueoData" id="pass" placeholder="Contraseña" required>
              </div>
            </div>

					</div>
					<div class="panel-footer">
            <div class="form-group">
            	<button type="submit" class="btn btn-primary">Ingresar</button>
            </div>
          </div>

          <input type="hidden" name="controller" id="controller" value="login" />
    			<input type="hidden" name="method" id="method" value="authenticate" />
    			<input type="hidden" name="action" id="action" value="post" />
          <input type="hidden" name="serverHost" id="serverHost" value="<?php echo $_SERVER['HTTP_HOST']; ?>" />
				</form>

      </div>

      <div id="logueoAlerta" class="alert alert-danger" role="alert" style="display: none;"></div>

    </div>
  </div>

  <div class="row">
    <div class="col-lg-2 col-lg-offset-5 col-md-2 col-md-offset-5 col-sm-4 col-sm-offset-4 col-xs-12">
    	<div id="loadingLogin">
        <b>Cargando...</b>
      </div>
    </div>
  </div>

	<script type="text/javascript" src="../../Public/js/jquery.min.js"></script>
  <script type="text/javascript" src="../../Public/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="../../Public/js/validator-form.min.js"></script>
  <script type="text/javascript" src="js/login.js?v=<?php echo time();?>"></script>
</body>
</html>