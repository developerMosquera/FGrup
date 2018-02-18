<?php

/**
 * @Author: developerMosquera
 * @Date:   2018-02-15 20:09:12
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-02-17 20:45:51
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
        <div class="helper pull-right"><a href="#Programador/agregar" title="Agregar usuario"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a></div>
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

<input type="hidden" id="defaultDate" value="<?= date("Y-m-d"); ?>" />

<script type="text/javascript" src="Modules/Programador/js/programador.js?v=<?php echo time();?>"></script>