<?php
require_once 'Conexion.php';

class Pedido extends Conexion
{

    private $pdo;

    public function __CONSTRUCT()
    {
        $this->pdo = parent::getConexion();
    }



    public function login($params = [])
    {
        try {
            $query = "SELECT * FROM usuarios WHERE correo = ? AND claveacceso = ?;
      ";
            $cmd = $this->pdo->prepare($query);
            $cmd->execute(
                array(
                    $params['correo'],
                    $params['claveacceso']
                )
            );
            $usuario = $cmd->fetch(PDO::FETCH_ASSOC);
            if ($usuario) {
                // Si se encontró al menos un usuario, las credenciales son correctas
                return $usuario;
            } else {
                // Si no se encontró ningún usuario, las credenciales son incorrectas
                return false;
            }
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    public function getPedidos($params = [])
    {
        try {
            $query = "SELECT * FROM pedidos WHERE estado = ? ORDER BY fecha_entrega DESC";
            $cmd = $this->pdo->prepare($query);
            $cmd->execute(
                array(
                    $params['estado']
                )
            );
            return $cmd->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }




    public function add($params = [])
    {
        try {
            $query = "
            INSERT INTO pedidos (direccion, cliente, encomienda, estado, genero, fecha_entrega) 
            VALUES 
            (?, ?, ?, ?, ?, ?);
            ";

            $cmd = $this->pdo->prepare($query);
            $cmd->execute(
                array(
                    $params['direccion'],
                    $params['cliente'],
                    $params['encomienda'],
                    $params['estado'],
                    $params['genero'],
                    $params['fecha_entrega'],
                )
            );
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }

    public function set($params = [])
    {
        try {
            $query = "
            UPDATE pedidos 
                SET
                    direccion   = ?, 
                    cliente     = ?, 
                    encomienda  = ?, 
                    estado      = ?, 
                    genero      = ?, 
                    fecha_entrega = ? 
                WHERE
                    idpedido = ?;
            ";

            $cmd = $this->pdo->prepare($query);
            $cmd->execute(
                array(
                    $params['direccion'],
                    $params['cliente'],
                    $params['encomienda'],
                    $params['estado'],
                    $params['genero'],
                    $params['fecha_entrega'],
                    $params['idpedido'],
                )
            );
        } catch (Exception $e) {
            die($e->getMessage());
        }
    }




    public function delete($params = [])
{
    try {
        // Verificar si el estado es 'E', en cuyo caso devolver false
        $query = "SELECT estado FROM pedidos WHERE idpedido = ?";
        $cmd = $this->pdo->prepare($query);
        $cmd->execute(array($params['idpedido']));
        $pedido = $cmd->fetch(PDO::FETCH_ASSOC);

        if ($pedido && $pedido['estado'] == 'E') {
            // Si el estado es 'E', devolver false
            return false;
        }

        // Si no es 'E', proceder con la eliminación
        $query = "DELETE FROM pedidos WHERE estado = 'P' AND idpedido = ?";
        $cmd = $this->pdo->prepare($query);
        $cmd->execute(array($params['idpedido']));
        return true; // Devolver true si la eliminación tiene éxito
    } catch (Exception $e) {
        die($e->getMessage());
    }
}

}
