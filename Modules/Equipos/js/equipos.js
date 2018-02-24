/*
* @Author: amosquera
* @Date:   2018-02-18 12:26:52
* @Last Modified by:   amosquera
* @Last Modified time: 2018-02-23 22:44:09
*/

jQuery(document).ready(function($) {

  ControllerGeneral.request('equipos', 'listAll').then(function(data) {
    var columns = [
      { "data" : "ID" },
      { "data" : "CLIENTE" },
      { "data" : "EQUIPO" },
      { "data" : "SERIAL_REAL" },
      { "data" : "MODELO" },
      {"defaultContent": "<button type='button' class='btn btn-danger clickListEdit' aria-label='Left Align'>\
                            <span class='glyphicon glyphicon-pencil' aria-hidden='true'></span>\
                          </button>\
                          <button type='button' class='btn btn-info clickListAdd' aria-label='Left Align'>\
                            <span class='glyphicon glyphicon-plus-sign' aria-hidden='true'></span>\
                          </button>"}
    ];

    ControllerGeneral.toListData('dataTableEquipos', data, columns).then(function(table) {
      dataClickList('#dataTableEquipos tbody', table);
    });
  });

  /***
    JS para agregar datos al programador
  ***/
  var dataClickList = function(tbody, table) {
    $(tbody).on('click', 'button.clickListAdd', function(e) {
      e.preventDefault();
      var data = table.row( $(this).parents('tr')).data();
      console.log(data);
      $('#cliente').val(data.ID_CLIENTE);
      $('#serialSistema').val(data.SERIAL_SISTEMA);
      $('#myModalAgregarAprogramador').modal();
    });
  }

  $('#formAddAprogramador').validator().on('submit', function (e) {
    if(!e.isDefaultPrevented())
    {
      e.preventDefault();
      var formData = $(this).serialize();
      ControllerGeneral.requestForm(formData).then(function(data) {
        console.log(data);
        /*if(data.result === true)
        {
          window.location.href = 'http://'+ $('#serverHost').val() +'/FGrup/fgrup.php#Programador/programador';
        } else {
          $('.alertSql').html('<div class="alert alert-danger alert-dismissible" role="alert">\
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>\
                                <strong>Warning!</strong> '+ data.mensaje +'.\
                              </div>');
        }*/
      });
    }
  });
  /***
    Fin
  ***/

  /*** JS para listar en un select los clientes ***/
  /************************************************/
  ControllerGeneral.request('clientes', 'listAll').then(function(data) {
    $('#eligirCliente').html('<option> </option>');
    data.map(function(index, elem) {
      $('#eligirCliente').append('<option value='+ index.ID +'>'+ index.CLIENTE +'</option>');
    });

    $('#eligirCliente').selectpicker();
  });

  /*** Activa los formularios para agregar un nuevo cliente ***/
  /************************************************************/
  $('#activeNewClienteControl').on('click', function(e) {
    e.preventDefault();
    $('#newClienteControl').show('slow');
    $('#existClienteControl').hide('slow');
    $('#statusNewClienteControl').val('1');
    $('#helperInactiveNewClienteControl').show();
    $('#helperActiveNewClienteControl').hide();
    $('#eligirCliente').removeAttr('required');
    $('.inputNewCliente').attr('required', 'required');
  });

  /*** Activa los formularios para tomar un cliente existente ***/
  /**************************************************************/
  $('#inactiveNewClienteControl').on('click', function(e) {
    e.preventDefault();
    $('#newClienteControl').hide('slow');
    $('#existClienteControl').show('slow');
    $('#statusNewClienteControl').val('0');
    $('#helperInactiveNewClienteControl').hide();
    $('#helperActiveNewClienteControl').show();
    $('#eligirCliente').attr('required', 'required');
    $('.inputNewCliente').removeAttr('required');
  });

  /*** JS para listar en un select los servicios ***/
  /************************************************/
  ControllerGeneral.request('servicios', 'listAll').then(function(data) {
    $('#eligirServicio').html('<option> </option>');
    data.map(function(index, elem) {
      $('#eligirServicio').append('<option value='+ index.ID +'>'+ index.SERVICIO +'</option>');
    });

    $('#eligirServicio').selectpicker();
  });

  $('#formAgregarEquipo').validator().on('submit', function (e) {
    if(!e.isDefaultPrevented())
    {
      e.preventDefault();
      var formData = $(this).serialize();
      ControllerGeneral.requestForm(formData).then(function(data) {
        if(data.result === true)
        {
          window.location.href = 'http://'+ $('#serverHost').val() +'/FGrup/fgrup.php#Programador/programador';
        } else {
          $('.alertSql').html('<div class="alert alert-danger alert-dismissible" role="alert">\
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>\
                                <strong>Warning!</strong> '+ data.mensaje +'.\
                              </div>');
        }
      });
    }
  });
});