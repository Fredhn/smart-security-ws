<?php
$dbName = "securitycenter";
$user = "wfuser";
$pwd = "wfpass";
$host = "localhost";
$cnn = new PDO('mysql:host='.$host.';dbname='.$dbName, $user, $pwd);

//$dbh = new PDO('mysql:host=localhost;
//			dbname=terrasGerais','wfuser','wfpass');