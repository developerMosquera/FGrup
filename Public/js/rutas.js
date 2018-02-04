/*
* @Author: amosquera
* @Date:   2018-02-03 01:01:41
* @Last Modified by:   developerMosquera
* @Last Modified time: 2018-02-04 14:24:10
*/

jQuery(document).ready(function($) {
  /***
    Cuando se detecta un cambio en la url se incluye al modulo
  ***/
  $(window).on('hashchange', function(){

    $('#content').hide();
    $('#loading').show();

    var hash = location.hash;

    if(hash === '')
    {
      var data = 'module=' + encodeURIComponent('#Dashboard/dashboard');
    } else {
      var data = 'module=' + encodeURIComponent(document.location.hash) + '&' + document.location.hash.split('?')[1];
    }

    $.ajax({
      url: "app.php",
      type: "GET",
      data: data,
      cache: false,
      success: function (html) {
        $('#content').html(html);
        $('#loading').hide();
        $('#content').show();
      }
    });

  });
  /***
    Fin cuando se detecta un cambio en la url
  ***/

  /***
    Cuando se carga la pagina, automaticamente detecte que modulo a incluir
  ***/
  $('#content').hide();
  $('#loading').show();
  var hash = location.hash;

  if(hash === '')
  {
    var data = 'module=' + encodeURIComponent('#Dashboard/dashboard');
    /***
      Si se recarga la pagina
    ***/
    //$('#Dashboard>a').addClass('activeApp');
  } else {
    var data = 'module=' + encodeURIComponent(document.location.hash) + '&' + document.location.hash.split('?')[1];
    /***
      Si se recarga la pagina
    ***/
    var navResaltar = hash.split('?');
    //$(navResaltar[0] + '>a').addClass('activeApp');
  }

  $.ajax({
    url: "app.php",
    type: "GET",
    data: data,
    cache: false,
    success: function (html) {
      $('#content').html(html);
      $('#loading').hide();
      $('#content').show();
    }
  });
  /***
    Fin cuando se carga la pagina, automaticamente detecte que modulo a incluir
  ***/
});