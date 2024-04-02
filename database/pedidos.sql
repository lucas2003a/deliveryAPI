CREATE DATABASE delivery;
USE delivery;

CREATE TABLE usuarios
(
	idusuario		INT					AUTO_INCREMENT PRIMARY KEY,
    nombres			VARCHAR(40) 		NOT NULL,
    apellidos		VARCHAR(40) 		NOT NULL,
    correo			VARCHAR(100) 		NOT NULL,
    claveacceso		VARCHAR(100)		NOT NULL,
    create_at 		DATETIME 			NOT NULL DEFAULT NOW()
)ENGINE = INNODB;

CREATE TABLE pedidos
(
	idpedido		INT						AUTO_INCREMENT PRIMARY KEY,
    direccion		VARCHAR(100)			NOT NULL,
    cliente			VARCHAR(100)			NOT NULL,
    encomienda 		VARCHAR(100)			NOT NULL,
    estado			CHAR(1) 				NOT NULL DEFAULT 'P',
    genero	 		VARCHAR(20)				NOT NULL,
    fecha_entrega	DATE 					NULL,
    create_at 		DATETIME 				NOT NULL DEFAULT NOW()
)ENGINE = INNODB;

INSERT INTO usuarios (nombres, apellidos,correo, claveacceso) VALUES
('Lucas Alfredp','Atuncar Valerio','lucasatuncar1@gmail.com','123456'),
('Adriana Arlet','Durand BUenamarca','AdrianaDurand@gmail.com','654321');

INSERT INTO pedidos (direccion, cliente, encomienda, estado, genero, fecha_entrega, create_at) 
VALUES 
('Calle 123', 'Juan Pérez', 'Paquete 1', 'P', 'Masculino', '2024-03-10', NOW()),
('Avenida Central', 'María González', 'Paquete 2', 'P', 'Femenino', '2024-03-12', NOW()),
('Calle Principal', 'Pedro Rodríguez', 'Paquete 3', 'P', 'Masculino', '2024-03-15', NOW()),
('Avenida Norte', 'Ana López', 'Paquete 4', 'P', 'Femenino', '2024-03-18', NOW()),
('Calle Sur', 'Luis Martínez', 'Paquete 5', 'P', 'Masculino', '2024-03-20', NOW()),
('Avenida Oeste', 'Laura García', 'Paquete 6', 'P', 'Femenino', '2024-03-22', NOW()),
('Calle Este', 'Carlos Sánchez', 'Paquete 7', 'P', 'Masculino', '2024-03-25', NOW()),
('Avenida Principal', 'Sofía Rodríguez', 'Paquete 8', 'P', 'Femenino', '2024-03-28', NOW()),
('Calle Central', 'Daniel Pérez', 'Paquete 9', 'P', 'Masculino', '2024-03-30', NOW()),
('Avenida Sur', 'Elena Martínez', 'Paquete 10', 'P', 'Femenino', '2024-04-02', NOW());

ALTER TABLE pedidos ADD COLUMN imagen VARCHAR(100);

select * from usuarios;
select * from pedidos;

SELECT 	correo, claveacceso
	FROM usuarios
	WHERE nombreusuario = nombreusuario_ AND estado = '1';

UPDATE pedidos 
SET estado = 'E' 
WHERE idpedido IN (6, 7, 8, 9, 10);

UPDATE pedidos SET imagen = "chinese_food_packet" WHERE idpedido = 13;
SELECT * FROM pedidos;

