/*
* @Author: developerMosquera
* @Date:   2018-01-31 19:23:11
* @Last Modified by:   amosquera
* @Last Modified time: 2018-02-03 13:04:18
*/

jQuery(document).ready(function($) {

  $('#formLogin').on('submit', function(e) {
    e.preventDefault();

    if($('#user').val() !== "" && $('#pass').val() !== "")
    {
      $('#loadingLogin').show();

      var data = $(this).serialize();
      $.ajax({
        url: '../../../FGrup/app.php',
        type: 'post',
        data: data,
        cache: false,
        success: function(data) {

          $('#loadingLogin').hide(); //esconde el cargado del logueo

          var data = JSON.parse(data);
          if(data.result === false)
          {
            $('#logueoAlerta').html(data.mensaje);
            $('#logueoAlerta').show();
          } else {
            window.location.href = 'http://'+ $('#serverHost').val() +'/FGrup/fgrup.php';
          }
        }
      });
    }

  })

  .on('keyup', '.logueoData', function(){
    $('#logueoAlerta').hide("slow");
  });

});