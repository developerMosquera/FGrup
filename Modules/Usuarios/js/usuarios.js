/*
* @Author: developerMosquera
* @Date:   2018-02-03 19:11:02
* @Last Modified by:   developerMosquera
* @Last Modified time: 2018-02-03 21:04:46
*/

jQuery(document).ready(function($) {

	$.ajax({
		url: '../../../FGrup/app.php',
		type: 'POST',
		data: {controller: 'users', method: 'listAll', action: 'post'},
		cache: false,
		success: function(data) {
			var data = JSON.parse(data);

			$('#tableListUsers').html();

			data.map(function(index, elem) {
				$('#tableListUsers').append('\
					<tr>\
						<td>'+ index['ID'] +'</td>\
						<td>'+ index['USUARIO'] +'</td>\
						<td>'+ index['NOMBRE'] +'</td>\
						<td>'+ index['PERMISOS'] +'</td>\
						<td>'+ index['FECHA_VENCIMIENTO'] +'</td>\
						<td>'+ index['ESTADO'] +'</td>\
					</tr>')
			})

		}
	});

});