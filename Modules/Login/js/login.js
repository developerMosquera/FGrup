/*
* @Author: developerMosquera
* @Date:   2018-01-31 19:23:11
* @Last Modified by:   developerMosquera
* @Last Modified time: 2018-02-02 23:54:19
*/

jQuery(document).ready(function($) {

  $('#formLogin').on('submit', function(e) {
    e.preventDefault();

    if($('#user').val() !== "" && $('#pass').val() !== "")
    {
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
    }

  });

});