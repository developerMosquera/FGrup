/*
* @Author: developerMosquera
* @Date:   2018-01-31 19:23:11
* @Last Modified by:   amosquera
* @Last Modified time: 2018-02-01 23:51:42
*/

jQuery(document).ready(function($) {

  $('#formLogin').on('submit', function(e) {
    e.preventDefault();

    var data = $(this).serialize();
    $.ajax({
      url: 'http://localhost/FGrup/app.php',
      type: 'post',
      data: data,
      cache: false,
      success: function(data) {

        console.log(data);

        
      }
    });

  });

});