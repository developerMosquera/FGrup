/*
* @Author: amosquera
* @Date:   2018-02-17 19:06:00
* @Last Modified by:   amosquera
* @Last Modified time: 2018-04-01 00:32:23
*/


jQuery(document).ready(function($) {

  //Día por defecto para el calendario
  var defaultDate = $('#defaultDate').val();

  $('#programadorCalendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay,listWeek'
      },
      defaultDate: defaultDate,
      navLinks: true,
      editable: true,
      events: {
          url: 'app.php',
          type: 'POST',
          data: {
             controller: 'programador', method: 'listAllProgramador', action: 'post'
          },
          error: function() {
              console.log('Algo esta mal!!!');
          }
      },
      allDay: false,
      eventClick: function(event, jsEvent, view) {
        console.log(event.id);

        var filterSql = {llave: event.id}

        ControllerGeneral.requestFilter('programador', 'listOne', filterSql).then(function(data) {
          console.log(data[0].ID_ESTADO);
          $('#myModalLabelProgramador').html(data[0].TIPO_EQUIPO);
          $('#cliente').val(data[0].CLIENTE);
          $('#serialEquipo').val(data[0].SERIAL_REAL);
          $('#estadoServicio').val(data[0].ESTADO);
          $('#tipoServicio').val(data[0].SERVICIO);
          $('#fechaMaxEstado').val(moment(event.start).format());

          if(data[0].ID_ESTADO == 3)
          {
            $('.activeProgramado').show();
          } else {
            $('.activeProgramado').hide();
          }

        });

        $('#myModalProgramador').modal();
      },
      eventDrop: function(event, delta) {
        console.log(event.id);
        console.log(event.title);
        console.log(moment(event.start).format());
        /*console.log(delta);*/
        //console.log(data);
      }
    });

  $('#datepickerProgramador').datetimepicker({
    format: 'YYYY-MM-DD'
  });

  ControllerGeneral.request('users', 'listAll').then(function(data) {
    $('#tecnico').html('<option> </option>');
    data.map(function(index, elem) {
      if(index.ID_PERFIL == 4)
      {
        $('#tecnico').append('<option value='+ index.ID +'>'+ index.NOMBRE +'</option>');
      }

    });

    $('#tecnico').selectpicker();
  });

});
