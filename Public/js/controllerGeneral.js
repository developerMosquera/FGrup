/*
* @Author: developerMosquera
* @Date:   2018-02-04 14:24:00
* @Last Modified by:   amosquera
* @Last Modified time: 2018-04-01 00:28:05
*/

/***
	Controlador general para hacer peticiones al core de la aplicaciòn con callback
***/
var ControllerGeneral = function ()
{
  /***
    Retornando DataJson
  ***/
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
  /***
    Fin
  ***/

  /***
    Retornando DataJson usando un filtro para la consulta
  ***/
  this.requestFilter = function(controller, method, filterSql) {

    var requestFilter = $.Deferred();

    $.ajax({
      url: 'app.php',
      type: 'post',
      data: { controller: controller, method: method, action: 'post', filterSql: filterSql },
      cache: false,
      success: function(data) {
        var result = JSON.parse(data);
        requestFilter.resolve(result);
      }
    });

    return requestFilter.promise();
  }
  /***
    Fin
  ***/

  /***
    Insertando datos y retornando Json
  ***/
  this.requestForm = function(formData) {

    var requestForm = $.Deferred();

    $.ajax({
      url: 'app.php',
      type: 'post',
      data: formData,
      cache: false,
      success: function(data) {
        var result = JSON.parse(data);
        requestForm.resolve(result);
      }
    });

    return requestForm.promise();
  }
  /***
    Fin
  ***/

  /***
    Listados para datatables
  ***/
  this.toListData = function(id, data, columns) {

    var tableData = $.Deferred();

    var table = $('#' + id).DataTable({
      data : data,
      "columns" : columns,
      "language": {
        "url": "Public/json/dataTablesSpanish.json"
      }
    });

    tableData.resolve(table);

    return tableData.promise();
  }
  /***
    Fin
  ***/
}

var ControllerGeneral = new ControllerGeneral();