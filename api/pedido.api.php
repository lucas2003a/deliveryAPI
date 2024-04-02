<?php

require_once '../models/Pedidos.php';

$pedido = new Pedido();


header("Content-type: application/json");

$verbo = $_SERVER["REQUEST_METHOD"];


switch ($verbo) {
    case 'GET':
        if (isset($_GET['estado']) && $_GET['estado'] !== '') {

            $datoEstado = [
                "estado" => $_GET['estado']
            ];


            $pedidos = $pedido->getPedidos($datoEstado);

         
                foreach ($pedidos as &$registro){

                    if($registro["imagen"] == null || $registro["imagen"] == " "){

                        $nom_img = "NoImage.jpg";
                        $url = "/images/" . $nom_img ;
            
                        $registro["imagen"] = $url;  
                    }else{

                        $nom_img = $registro["imagen"];
                        $url = "/images/" . $nom_img ;
            
                        $registro["imagen"] = $url;  
                    }
                }

            echo json_encode($pedidos);
        
        }else if (isset($postData['correo']) && isset($postData['claveacceso'])) {
            
            $params = array(
                'correo' => $postData['correo'],
                'claveacceso' => $postData['claveacceso']
            );
            
            $loginResult = $pedido->login($params);
            if ($loginResult !== false) {
                // Inicio de sesión exitoso, devuelve los datos del usuario con código de estado 200 (OK)
                http_response_code(200);
                echo json_encode($loginResult);
            } else {
                // Inicio de sesión fallido, devuelve un mensaje de error con código de estado 401 (Unauthorized)
                http_response_code(401);
                echo json_encode(array('error' => 'Credenciales incorrectas'));
            }
        }

        break;


    case 'POST':
        
        $datosRecibidos = json_decode(file_get_contents('php://input'), true);
        $datosEnviar = [
            
            "direccion"     => $datosRecibidos['direccion'],
            "cliente"    => $datosRecibidos['cliente'],
            "estado"     => $datosRecibidos['estado'],
            "genero"     => $datosRecibidos['genero'],
            "fecha_entrega"     => $datosRecibidos['fecha_entrega'],
            "encomienda"     => $datosRecibidos['encomienda'],
            
            ];
            
            $pedido->add($datosEnviar);
        
        break;

    case 'PUT':
        
        $datosRecibidos = json_decode(file_get_contents('php://input'), true);
        $datosEnviar = [
            
            "direccion"     => $datosRecibidos['direccion'],
            "cliente"    => $datosRecibidos['cliente'],
            "estado"     => $datosRecibidos['estado'],
            "genero"     => $datosRecibidos['genero'],
            "fecha_entrega"     => $datosRecibidos['fecha_entrega'],
            "encomienda"     => $datosRecibidos['encomienda'],
            "idpedido"     => $datosRecibidos['idpedido'],
            
            ];
            
            $pedido->set($datosEnviar);
        
        break;

    case 'DELETE':

        $path = isset($_SERVER["PATH_INFO"]) ? $_SERVER["PATH_INFO"] : '/';
        $buscarID = explode('/', $path);
        $idpedido = ($path != '/' ? end($buscarID) : null);
        
        // Llamada a la función delete() para eliminar el pedido
        $eliminacionExitosa = $pedido->delete(["idpedido" => $idpedido]);
    
        if (!$eliminacionExitosa) {
            // Si la eliminación no tuvo éxito (retornó false), enviar una respuesta de error con el código HTTP 400
            http_response_code(400);
            echo "No es posible eliminar un pedido entregado.";
        }
        
        break;
        
}
