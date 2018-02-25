<?php

/**
 * @Author: amosquera
 * @Date:   2018-02-18 12:21:33
 * @Last Modified by:   developerMosquera
 * @Last Modified time: 2018-02-25 12:43:56
 */

?>

<!--
  Cabecera del modulo obligatorio colocar
-->
<div class="row">
  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="panel panel-default">
      <div class="panel-body">
        Equipos
        <div class="helper pull-right"><a href="#Equipos/agregar" title="Agregar equipo"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a></div>
      </div>
    </div>
  </div>
</div>
<!--
  Fin cabecera del modulo obligatorio colocar
-->

<div class="row">
  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

    <!--
      Devlver aqui alertas Boostrap indicando los problemas con el SQL
    -->
    <div class="alertSql"></div>
    <!--
      Fin
    -->

    <div class="table-responsive">

      <table id="dataTableEquipos" class="table table-striped">
        <thead>
          <tr>
            <th>#</th>
            <th>Cliente</th>
            <th>Equipo</th>
            <th>Serial</th>
            <th>Modelo</th>
            <th></th>
          </tr>
        </thead>
      </table>

    </div>
  </div>
</div>

<!-- Modal agregar al programador -->
<div class="modal fade bs-example-modal-lg" id="myModalAgregarAprogramador" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Agregar a programador</h4>
      </div>
      <form id="formAddAprogramador" method="post" data-toggle="validator" role="form" autocomplete="off">
        <div class="modal-body">

          <div class="form-group">
            <label for="agregarServicio">Servicio</label>
            <select name="servicio" id="agregarServicio" data-live-search="true" class="form-control" required></select>
          </div>

          <input type="hidden" name="cliente" id="cliente" value="" />
          <input type="hidden" name="serialSistema" id="serialSistema" value="" />

          <input type="hidden" name="controller" id="controller" value="programador" />
          <input type="hidden" name="method" id="method" value="insert" />
          <input type="hidden" name="action" id="action" value="post" />
          <input type="hidden" name="serverHost" id="serverHost" value="<?php echo $_SERVER['HTTP_HOST']; ?>" />

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default closeModal" data-dismiss="modal">Cerrar</button>
          <button type="submit" class="btn btn-primary">Enviar</button>
        </div>
      </form>
    </div>
  </div>
</div>
<!-- Fin -->

<script type="text/javascript" src="Modules/Equipos/js/equipos.js?v=<?php echo time();?>"></script>