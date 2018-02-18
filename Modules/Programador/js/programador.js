/*
* @Author: amosquera
* @Date:   2018-02-17 19:06:00
* @Last Modified by:   developerMosquera
* @Last Modified time: 2018-02-17 22:52:51
*/


jQuery(document).ready(function($) {

  //Día por defecto para el calendario
  var defaultDate = $('#defaultDate').val();
  //Array para almacenar los eventos y mostrar en el calendario
  var events = new Array();

  ControllerRequest.request('programador', 'listAll').then(function(data) {
    console.log(data);
    data.map(function(index, elem) {
      events.push({'title': index.EQUIPO, 'start': index.FECHA});
    });
  });

  console.log(events);

  $('#programadorCalendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay,listWeek'
      },
      defaultDate: defaultDate,
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: [
        {
          id: 25,
          title: "prueba",
          start: "2018-02-10"
        }
      ],
      eventClick: function(event, jsEvent, view) {
        console.log(event);
        console.log(jsEvent);
        console.log(view);
        $('#myModalProgramador').modal();
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