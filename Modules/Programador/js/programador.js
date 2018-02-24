/*
* @Author: amosquera
* @Date:   2018-02-17 19:06:00
* @Last Modified by:   amosquera
* @Last Modified time: 2018-02-22 23:09:46
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
      navLinks: true, // can click day/week names to navigate views
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
        /*console.log(event);
        console.log(jsEvent);
        console.log(view);
        $('#myModalProgramador').modal();*/
      },
      eventDrop: function(event, delta) {

        console.log(event.id);
        console.log(event.title);
        console.log(moment(event.start).format());
        /*console.log(delta);*/
        //console.log(data);
      }
    });
});

//https://www.youtube.com/watch?v=31MBEI0lxiE

/*jQuery(document).ready(function($) {
  $('#calendar').fullCalendar({
      defaultDate: '2018-02-12',
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: [
        {
          title: 'All Day Event',
          start: '2018-02-01'
        },
        {
          title: 'Long Event',
          start: '2018-02-07',
          end: '2018-02-10'
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: '2018-02-09T16:00:00'
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: '2018-02-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2018-02-11',
          end: '2018-02-13'
        },
        {
          title: 'Meeting',
          start: '2018-02-12T10:30:00',
          end: '2018-02-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2018-02-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2018-02-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2018-02-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2018-02-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2018-02-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2018-02-28'
        }
      ]
    });
});*/