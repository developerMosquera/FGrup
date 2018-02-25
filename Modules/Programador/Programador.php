<?php

/**
 * @Author: developerMosquera
 * @Date:   2018-02-15 20:09:12
 * @Last Modified by:   developerMosquera
 * @Last Modified time: 2018-02-25 15:33:30
 */
?>

<!--
  Cabecera del modulo obligatorio colocar
-->
<div class="row">
  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="panel panel-default">
      <div class="panel-body">
        Programador
        <div class="helper pull-right"><a href="#Equipos/equipos" title="Agregar al programador"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a></div>
      </div>
    </div>
  </div>
</div>
<!--
  Fin cabecera del modulo obligatorio colocar
-->

<div class="row">
  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div id='programadorCalendar'></div>
  </div>
</div>

<!-- Modal editr el evento en el calendario -->
<div class="modal fade bs-example-modal-md" id="myModalProgramador" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-md" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Editar</h4>
      </div>
      <form id="formAddAprogramador" method="post" data-toggle="validator" role="form" autocomplete="off">
        <div class="modal-body">

          <div class="form-group">
            <label for="nombreEquipo">Cliente</label>
            <input type="text" class="form-control" name="cliente" id="cliente" placeholder="Cliente" readonly>
          </div>
          <div class="form-group">
            <label for="nombreEquipo">Nombre equipo</label>
            <input type="text" class="form-control" name="nombreEquipo" id="nombreEquipo" placeholder="Nombre equipo" readonly>
          </div>
          <div class="form-group">
            <label for="nombreEquipo">Serial equipo</label>
            <input type="text" class="form-control" name="serialEquipo" id="serialEquipo" placeholder="Serial equipo" readonly>
          </div>
          <div class="form-group">
            <label for="nombreEquipo">Estado servicio</label>
            <input type="text" class="form-control" name="estadoServicio" id="estadoServicio" placeholder="Estado servicio" readonly>
          </div>
          <div class="form-group">
            <label for="nombreEquipo">Tipo servicio</label>
            <input type="text" class="form-control" name="tipoServicio" id="tipoServicio" placeholder="Tipo servicio" readonly>
          </div>
          <div class="form-group">
            <label for="tecnico">Tecnico</label>
            <select name="tecnico" id="tecnico" data-live-search="true" class="form-control" required></select>
          </div>
          <div class="form-group">
            <div class='input-group date' id='datepickerProgramador'>
              <input type="text" name="fechaProgramado" id="fechaProgramado" value="" class="form-control" required />
              <span class="input-group-addon">
                <span class="glyphicon glyphicon-calendar"></span>
              </span>
            </div>
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

<input type="hidden" id="defaultDate" value="<?= date("Y-m-d"); ?>" />

<script type="text/javascript" src="Modules/Programador/js/programador.js?v=<?php echo time();?>"></script>