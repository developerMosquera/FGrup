<?php

/**
 * @Author: developerMosquera
 * @Date:   2018-01-31 18:14:38
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-02-03 10:37:36
 */

require 'Application/Session.php';

Session::start();

if(Session::getSession('usuarioOn') !== true)
{
  Session::redirect('index.php');
}
?>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>American FarmaGrup S.A.S.</title>
    <link rel="stylesheet" type="text/css" href="Public/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="Public/css/style.css?v=<?php echo time();?>" />
  </head>

  <body>

    <nav id="nav" class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Start skina</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <li class="navLinkApp" id="Categorias"><a href="#Productos?vista=productos"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Productos</a></li>
            <li class="navLinkApp" id="Usuarios"><a href="#Usuarios/usuarios"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Usuarios</a></li>
            <li class="navLinkApp" id="Config"><a href="#Config?vista=config"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Config</a></li>
            <li class="navLinkApp" id="Salir"><a href="Modules/Salir/Salir.php"><span class="glyphicon glyphicon-off" aria-hidden="true"></span> Salir</a></li>
          </ul>
        </div>

      </div>
    </nav>

    <div class="container">
      <div class="row">
        <div class="col-lg-2 col-lg-offset-5 col-md-2 col-md-offset-5 col-sm-4 col-sm-offset-4 col-xs-8 col-xs-offset-2">
          <div id="cargando">
            <b>Cargando...</b>
          </div>
        </div>
      </div>
    </div>

    <div class="container">
      <section id="contenedor"></section>
    </div>

    <script type="text/javascript" src="Public/js/jquery.min.js"></script>
    <script type="text/javascript" src="Public/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="Public/js/validator-form.min.js?v=<?php echo time();?>"></script>
    <script type="text/javascript" src="Public/js/rutas.js?v=<?php echo time();?>"></script>
  </body>

</html>