/*
* @Author: developerMosquera
* @Date:   2018-02-03 19:11:02
* @Last Modified by:   amosquera
* @Last Modified time: 2018-02-18 21:57:40
*/

jQuery(document).ready(function($) {

	ControllerGeneral.request('users', 'listAll').then(function(data) {
  	data.map(function(index, elem) {
			/*$('#tableListUsers').append('\
				<tr>\
					<td>'+ index['ID'] +'</td>\
					<td>'+ index['USUARIO'] +'</td>\
					<td>'+ index['NOMBRE'] +'</td>\
					<td>'+ index['PERMISOS'] +'</td>\
					<td>'+ index['FECHA_VENCIMIENTO'] +'</td>\
					<td>'+ index['ESTADO'] +'</td>\
				</tr>');*/
				
		});

	});

	
});