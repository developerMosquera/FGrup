/*
* @Author: developerMosquera
* @Date:   2018-02-04 14:24:00
* @Last Modified by:   developerMosquera
* @Last Modified time: 2018-02-04 19:34:12
*/

/***
	Controlador general para hacer peticiones al core de la aplicaciòn con callback
***/
var ControllerGeneral = function ()
{
  this.request = function(controller, method) {

    var request = $.Deferred();

    $.ajax({
      url: 'app.php',
      type: 'post',
      data: { controller: controller, method: method, action: 'post' },
      cache: false,
      success: function(data) {
        var result = JSON.parse(data);
        request.resolve(result);
      }
    });

    return request.promise();
  }
}

var ControllerRequest = new ControllerGeneral();