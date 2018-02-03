/*
* @Author: amosquera
* @Date:   2018-02-03 01:01:41
* @Last Modified by:   amosquera
* @Last Modified time: 2018-02-03 01:01:51
*/

jQuery(document).ready(function($) {
  /***
    Cuando se detecta un cambio en la url se incluye al modulo
  ***/
  $(window).on('hashchange', function(){

    $('#contenedor').hide();
    $('#cargando').show();

    var hash = location.hash;
    if(hash === '')
    {
      var data = 'modulo=' + encodeURIComponent('#Productos?vista=productos');
    } else {
      var data = 'modulo=' + encodeURIComponent(document.location.hash) + '&' + document.location.hash.split('?')[1];
    }

    $.ajax({
      url: "rutas.php",
      type: "GET",
      data: data,
      cache: false,
      success: function (html) {
        $('#contenedor').html(html);
        $('#cargando').hide();
        $('#contenedor').show();
      }
    });

  });
  /***
    Fin cuando se detecta un cambio en la url
  ***/

  /***
    Cuando se carga la pagina, automaticamente detecte que modulo a incluir
  ***/
  $('#contenedor').hide();
  $('#cargando').show();
  var hash = location.hash;

  if(hash === '')
  {
    var data = 'modulo=' + encodeURIComponent('#Productos?vista=productos');
    /***
      Si se recarga la pagina
    ***/
    $('#Dashboard>a').addClass('activeApp');
  } else {
    var data = 'modulo=' + encodeURIComponent(document.location.hash) + '&' + document.location.hash.split('?')[1];
    /***
      Si se recarga la pagina
    ***/
    var navResaltar = hash.split('?');
    $(navResaltar[0] + '>a').addClass('activeApp');
  }

  $.ajax({
    url: "rutas.php",
    type: "GET",
    data: data,
    cache: false,
    success: function (html) {
      $('#contenedor').html(html);
      $('#cargando').hide();
      $('#contenedor').show();
    }
  });
  /***
    Fin cuando se carga la pagina, automaticamente detecte que modulo a incluir
  ***/

  /***
    Cambia el active para saber en que modulo del menu se encuentra el usuario
  ***/

  /***
    Si se da click al menú
  ***/
  $('body').on('click', '.navLinkApp', function(){
    var idNavLink = $(this).attr('id');

    $('.navLinkApp>a').removeClass('activeApp');
    $('#' + idNavLink + '>a').addClass('activeApp');
  });
  /***
    Fin cambia el active para saber en que modulo del menu se encuentra el usuario
  ***/

});