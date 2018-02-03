<?php

/**
 * @Author: developerMosquera
 * @Date:   2018-01-31 19:20:13
 * @Last Modified by:   amosquera
 * @Last Modified time: 2018-02-02 19:24:20
 */

?>

<!DOCTYPE html>
<html>
<head>
	<title>App FGrup</title>
</head>
<body>

	<form class="formSubmit" id="formLogin" action="login/authenticate" method="post">
		<input type="text" name="user" id="user" />
		<input type="text" name="pass" id="pass" />
    <input type="text" name="controller" id="controller" value="login" />
    <input type="text" name="method" id="method" value="authenticate" />
    <input type="text" name="action" id="action" value="post" />
		<input type="submit" name="ingresar" />
	</form>

	<script type="text/javascript" src="../../Public/js/jquery.min.js"></script>
	<script type="text/javascript" src="js/login.js?v=<?php echo time();?>"></script>
</body>
</html>