/*
* @Author: amosquera
* @Date:   2018-02-17 19:06:00
* @Last Modified by:   developerMosquera
* @Last Modified time: 2018-02-25 15:03:44
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
              console.log('Algo esta mal en el programador ajax fullcalendar');
          }
      },
      allDay: false,
      eventClick: function(event, jsEvent, view) {
        console.log(event);
        console.log(jsEvent);
        console.log(view);
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

});
