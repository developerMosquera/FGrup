<?php

/**
 * @Author: amosquera
 * @Date:   2018-02-18 21:30:11
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-02-22 23:24:10
 */

?>

<!--
  Cabecera del modulo obligatorio colocar
-->
<div class="row">
  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="panel panel-default">
      <div class="panel-body">
        Equipos - agregar
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

    <div class="panel panel-primary">
      <form id="formAgregarEquipo" method="post" data-toggle="validator" role="form" autocomplete="off">
        <div class="panel-body">

          <div class="row">

            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
              <div class="panel panel-default">
                <div class="panel-heading">Equipo</div>
                <div class="panel-body">

                  <div class="form-group">
                    <label for="nombreEquipo">Nombre equipo</label>
                    <input type="text" class="form-control" name="nombreEquipo" id="nombreEquipo" placeholder="Nombre equipo" required>
                  </div>
                  <div class="form-group">
                    <label for="serialCliente">Serial equipo</label>
                    <input type="text" class="form-control" name="serialEquipo" id="serialCliente" placeholder="Serial equipo" required>
                  </div>
                  <div class="form-group">
                    <label for="modeloCliente">Modelo equipo</label>
                    <input type="text" class="form-control" name="modeloEquipo" id="modeloCliente" placeholder="Modelo equipo" required>
                  </div>

                </div>
              </div>
            </div>

            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
              <div class="panel panel-default">
                <div class="panel-heading">Servicio</div>
                <div class="panel-body">

                  <div class="form-group">
                    <label for="eligirServicio">Servicio</label>
                    <select name="servicio" id="eligirServicio" data-live-search="true" class="form-control" required></select>
                  </div>

                </div>
              </div>
            </div>

            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
              <div class="panel panel-default">
                <div class="panel-heading">Cliente
                  <div id="helperActiveNewClienteControl" class="helper pull-right">
                    <a href="#" id="activeNewClienteControl" title="Agregar cliente">
                      <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
                    </a>
                  </div>

                  <div id="helperInactiveNewClienteControl" class="helper pull-right" style="display: none;">
                    <a href="#" id="inactiveNewClienteControl" title="Tomar cliente existente">
                      <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                    </a>
                  </div>
                </div>

                <div class="panel-body">

                  <div id="existClienteControl">
                    <div class="form-group">
                      <label for="eligirCliente">Cliente</label>
                      <select name="cliente" id="eligirCliente" data-live-search="true" class="form-control" required></select>
                    </div>
                  </div>

                  <div id="newClienteControl" style="display: none;">
                    <div class="form-group">
                      <label for="nombreCliente">Nombre cliente</label>
                      <input type="text" class="form-control inputNewCliente" name="nombreCliente" id="nombreCliente" placeholder="Nombre cliente">
                    </div>
                    <div class="form-group">
                      <label for="nitCliente">Nit cliente</label>
                      <input type="text" class="form-control inputNewCliente" name="nitCliente" id="nitCliente" placeholder="Nit cliente">
                    </div>
                    <div class="form-group">
                      <label for="direccionCliente">Dirección cliente</label>
                      <input type="text" class="form-control inputNewCliente" name="direccionCliente" id="direccionCliente" placeholder="Dirección cliente">
                    </div>
                    <div class="form-group">
                      <label for="telefonoCliente">Teléfono cliente</label>
                      <input type="number" class="form-control inputNewCliente" name="telefonoCliente" id="telefonoCliente" placeholder="Teléfono cliente">
                    </div>
                    <div class="form-group">
                      <label for="emailCliente">Email cliente</label>
                      <input type="email" class="form-control inputNewCliente" name="emailCliente" id="emailCliente" placeholder="Email cliente">
                    </div>
                    <div class="form-group">
                      <label for="emailClienteDos">Email 2 cliente</label>
                      <input type="email" class="form-control" name="emailClienteDos" id="emailClienteDos" placeholder="Email 2 cliente">
                    </div>
                  </div>
                  <!-- input de estado para validar si se agregara un nuevo cliente 0 no 1 si se agregara -->
                  <input type="hidden" id="statusNewClienteControl" name="statusNewClienteControl" value="0">

                  <input type="hidden" name="controller" id="controller" value="equipos" />
                  <input type="hidden" name="method" id="method" value="insert" />
                  <input type="hidden" name="action" id="action" value="post" />
                  <input type="hidden" name="serverHost" id="serverHost" value="<?php echo $_SERVER['HTTP_HOST']; ?>" />

                </div>
              </div>
            </div>

          </div>

        </div>
        <div class="panel-footer">
          <button type="submit" class="btn btn-primary">Enviar</button>
        </div>
      </form>
    </div>

  </div>
</div>
<script type="text/javascript" src="Modules/Equipos/js/equipos.js?v=<?php echo time();?>"></script>