<?php
include("PDOConnection.php");

//Define alguns valores
define ("ACTION_ADD_USER", "add");
define ("ACTION_LOGIN", "login");
define ("ACTION_LOAD_MODULES", "loadModules");
define ("ACTION_ACTIVATE_MODULE", "activateModule");
define ("RESULT_SUCCESS", 0);
define ("RESULT_ERROR", 1);
define ("RESULT_USER_EXISTS", 2);

//$action = $_POST["action"];
$action = $_POST["action"];
$result = RESULT_ERROR;

if(isset($action))
{
	//$username = $_POST["username"];
	//$pwd = $_POST["password"];
	//$contract = $_POST["contract"];
	//$name = $_POST["name"];
	//$doc = $_POST["doc"];
	$username = $_POST["username"];
	//$pwd = $_POST["password"];
	//$mac = $_POST["mac"];
	
	switch($action)
	{
		case ACTION_ADD_USER:
			$contract = $_POST["contract"];
			$name = $_POST["name"];
			$doc = $_POST["doc"];
			$mac = $_POST["mac"];
			if (isExistUser($cnn, $username))
			{
				$result = RESULT_USER_EXISTS;
			}
			else
			{
				insertUser($cnn, $contract, $name, $doc, $username, $pwd, $mac);
				$result = RESULT_SUCCESS;
			}
			break;
		case ACTION_LOGIN:
			$pwd = $_POST["password"];
			if(login($cnn, $username,$pwd))
			{
				$result = RESULT_SUCCESS;
			}
			else
			{
				$result = RESULT_ERROR;
			}
			break;
		case ACTION_LOAD_MODULES:
		
			loadModules($cnn, $username);
			$result = RESULT_SUCCESS;
			break;
		case ACTION_ACTIVATE_MODULE:
			$id_module = $_POST["id_module"];
			$descricao = $_POST["desc"];
			
			activateModule($cnn, $id_module, $username, $descricao);
			$result = RESULT_SUCCESS;
			break;
		default:
			echo ("Ação inválida.");
	}
	
}

echo (json_encode(array ("result" => $result)));

function insertUser($cnn, $contract, $name, $doc, $username, $pwd, $mac)
{
	$query = "INSERT INTO Usuario(id_usuarioContrato, nome, cpf, login, senha, mac_dispositivo) VALUES (?, ?, ?, ?, ?, ?)";
	//INSERT INTO `Usuario` (`id_usuario`,`id_usuarioContrato`,`nome`,`cpf`,`login`,`senha`,`mac_dispositivo`) VALUES
	// ('','','','','','','');
	$stmt = $cnn->prepare($query);
	$stmt->bindParam(1, $contract);
	$stmt->bindParam(2, $name);
	$stmt->bindParam(3, $doc);
	$stmt->bindParam(4, $username);
	$stmt->bindParam(5, $pwd);
	$stmt->bindParam(6, $mac);
	
	$stmt->execute();
}

function isExistUser($cnn, $username)
{
	$query = "SELECT * FROM Usuario WHERE login = ?";
	$stmt = $cnn->prepare($query);
	$stmt->bindParam(1,$username);
	$stmt->execute();
	$rowcount = $stmt->rowCount();
	//paraDebug
	var_dump($rowcount);
	return $rowcount;
}

function login($cnn, $username, $pwd)
{
	$query = "SELECT * FROM Usuario WHERE login = ? AND senha = ?";
	$stmt = $cnn->prepare($query);
	$stmt->bindParam(1,$username);
	$stmt->bindParam(2,$pwd);
	$stmt->execute();
	$rowcount = $stmt->fetchColumn();
	//paraDebug
	//var_dump($rowCount);
	return $rowcount;
}

function loadModules ($cnn, $username)
{
	$query = "SELECT ca.id_modulo, m.dominio 
			  FROM controleacesso AS ca
			  INNER JOIN usuario AS u ON (ca.id_usuario = u.id_usuario)
			  INNER JOIN modulo AS m ON (ca.id_modulo = m.id_modulo)
			  WHERE u.login = ?";
	$stmt = $cnn->prepare($query);
	$stmt->bindParam(1,$username);
	$stmt->execute();
	
	/*
	$result=$cnn->query("SELECT u.login AS Usuario, m.dominio AS Modulo 
						 FROM controleacesso AS ca
						 INNER JOIN usuario AS u ON (ca.id_usuario = u.id_usuario)
						 INNER JOIN modulo AS m ON (ca.id_modulo = m.id_modulo)
						 WHERE u.login = 'user1'");
	*/
	
	$json = array();
	

	while($row = $stmt->fetch(PDO::FETCH_ASSOC))
	{
		$arr = array();
		$arr["id_modulo"] = $row["id_modulo"];
		$arr["dominio"] = $row["dominio"];
		$json[] = $arr;
	}
	echo json_encode($json); 
	return RESULT_SUCCESS;
}

function activateModule ($cnn, $id_module, $username, $descricao)
{
	$query1 = "SELECT id_usuario FROM Usuario WHERE login = ?";
	$stmt1 = $cnn->prepare($query1);
	$stmt1->bindParam(1,$username);
	$stmt1->execute();
	$item_id_usuario = $stmt1->fetch();
	
	$item_id_modulo = (int)$id_module;
	$item_id_usuario_int = (int)$item_id_usuario[0];
	
	//echo serialize($item_id_usuario);
	//echo $item_id_usuario_int;
	//echo $item_id_modulo;
	
	$query2 = "INSERT INTO Rastreabilidade(id_usuario, id_modulo, descricao) VALUES (?, ?, ?)";
	$stmt = $cnn->prepare($query2);
	$stmt->bindParam(1, $item_id_usuario_int);
	$stmt->bindParam(2, $item_id_modulo);
	$stmt->bindParam(3, $descricao);
	$stmt->execute();
	return RESULT_SUCCESS;
}





