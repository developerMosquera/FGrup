<?php

/**
 * @Author: amosquera
 * @Date:   2018-02-03 13:05:58
 * @Last Modified by:   developerMosquera
 * @Last Modified time: 2018-02-04 19:24:05
 */

?>

<!--
  Cabecera del modulo obligatorio colocar
-->
<div class="row">
  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="panel panel-default">
      <div class="panel-body">
        Usuarios
        <div class="helper pull-right"><a href="#Usuarios/agregar" title="Agregar usuario"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a></div>
      </div>
    </div>
  </div>
</div>
<!--
  Fin cabecera del modulo obligatorio colocar
-->

<div class="row">
  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="table-responsive">

      <table class="table table-striped">
        <thead>
          <tr>
            <th>#</th>
            <th>Usuario</th>
            <th>Nombre</th>
            <th>Permisos</th>
            <th>Fecha vencimiento</th>
            <th>Estado</th>
            <th></th>
            <th></th>
            <th></th>
          </tr>
        </thead>
        <tbody id="tableListUsers"></tbody>
      </table>

    </div>
  </div>
</div>

<script type="text/javascript" src="Modules/Usuarios/js/usuarios.js?v=<?php echo time();?>"></script>