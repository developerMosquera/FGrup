/*
* @Author: developerMosquera
* @Date:   2018-02-04 14:24:00
* @Last Modified by:   developerMosquera
* @Last Modified time: 2018-02-04 14:25:06
*/

/***
	Controlador general para hacer peticiones al core de la aplicaciòn con callback
***/
var Controlador = function ()
{
  this.listar = function(metodo, filtro) {

    var dataListar = $.Deferred();

    $.ajax({
      url: 'App/Controladores/Controlador.php',
      type: 'post',
      data: { metodo: metodo, filtro: filtro },
      cache: false,
      success: function(data) {
        var result = JSON.parse(data);
        dataListar.resolve(result);
      }
    });

    return dataListar.promise();
  }
}

var controlador = new Controlador();

controlador.listar("prueba").then(function(data) {
  console.log(data);
})