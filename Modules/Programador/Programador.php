<?php

/**
 * @Author: developerMosquera
 * @Date:   2018-02-15 20:09:12
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-02-18 21:58:47
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

<!-- Modal -->
<div class="modal fade bs-example-modal-lg" id="myModalProgramador" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Editar evento</h4>
      </div>
      <div class="modal-body">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary">Guardar</button>
      </div>
    </div>
  </div>
</div>

<input type="hidden" id="defaultDate" value="<?= date("Y-m-d"); ?>" />

<script type="text/javascript" src="Modules/Programador/js/programador.js?v=<?php echo time();?>"></script>