USE examen_mysql;

INSERT INTO Metodo_pago(
    pago_confirmado,
    nombre
    ) VALUES
    (0, 'Efectivo'),
    (0, 'Tarjeta'),
    (1, 'Efectivo'),
    (1, 'Tarjeta');

-- 1. **Registrar un nuevo cliente:**

INSERT INTO Cliente(
    metodo_id,
    nombre,
    telefono,
    ubicacion,
    ciudad
) VALUES
(3, 'Santiago Arenas', 305235780, 'Calle 50', 'Mutis'),
(4, 'Adrian Ruizzzz', 312438590, 'Carrera 97', 'Giron'),
(1, 'Yholver Pardo', 320728493, 'Calle 44', 'Giron'),
(2, 'Persona Campus', 310234567, 'Calle 1', 'Bucarica');

-- 2. **Agregar un nuevo producto (pizza) al menú:**

INSERT INTO Tipo_pizza(
    tipo_pizza,
    precio
) VALUES 
('Pequeña', 8000),
('Mediana', 9600),
('Grande', 10500);


INSERT INTO Pizza(
    tipo_pizza_id,
    nombre,
    precio_total
) VALUES 
(1, 'Pizza de pepperoni', 12000),
(2, 'Pizza de piña', 10600),
(3, 'Pizza de jamon', 12400)

-- 3. **Registrar una bebida en el menú:**

INSERT INTO Tipo_bebida(
    tipo_bebida,
    precio
) VALUES
('Pequeño', 3000),
('Mediano', 4500),
('Grande', 6000);

INSERT INTO Bebida(
    tipo_bebida_id,
    nombre
) VALUES
(1, 'Colombiana'),
(2, 'Postobon'),
(3, 'Coca-cola'),
(2, 'Colombiana'),
(2, 'Postobon'),
(2, 'Coca-cola'),
(3, 'Colombiana'),
(3, 'Postobon'),
(3, 'Coca-cola');

-- 4. **Agregar un ingrediente a la base de datos:**

INSERT INTO Ingrediente(
    nombre,
    precio,
    stock
) VALUES
('Pepperoni', 2000, 500),
('Piña', 1000, 800),
('Jamón', 1900, 400),
('Champiñon', 1400, 450);

INSERT INTO Pizza_ingrediente(
    pizza_id,
    ingrediente_id,
    cantidad
) VALUES 
(1, 1, 2),
(2, 2, 1),
(3, 3, 1);

-- 5. **Crear un pedido para un cliente:**

INSERT INTO Pedido(
    cliente_id,
    fecha_pedido,
    fecha_recogida
) VALUES
(1, '2025-06-06', '2025-06-06'),
(2, '2025-06-06', '2025-06-06')

-- 6. **Añadir productos a un pedido específico:**

INSERT INTO Detalle_pedido(
    pedido_id,
    pizza_id,
    cantidad,
    precio_unitario
) VALUES
(1, 3, 1, 16900);

-- 7. **Añadir ingredientes adicionales a una pizza en un pedido:**

INSERT INTO `Pizza_ingrediente`(
    pizza_id,
    ingrediente_id,
    cantidad
)
VALUES
(1,1, 2);

-- 8. **Consultar el detalle de un pedido (productos y sus ingredientes):**

SELECT pe.pedido_id, pe.cliente_id, pi.nombre AS pizza, be.nombre AS bebida, dp.cantidad, ing.nombre AS ingrediente
FROM Pedido AS pe
INNER JOIN Detalle_pedido AS dp ON pe.pedido_id = dp.pedido_id
LEFT JOIN Pizza AS pi ON  dp.pizza_id = pi.pizza_id
LEFT JOIN Bebida AS be ON dp.bebida_id = be.bebida_id
LEFT JOIN Pizza_ingrediente AS pizin ON pizin.pizza_id = pi.pizza_id
LEFT JOIN Ingrediente AS ing ON ing.ingrediente_id = pizin.ingrediente_id;

-- 9. **Actualizar el precio de una pizza en el menú:**


UPDATE Pizza 
SET precio_total = 20000 
WHERE pizza_id = 1;

-- 10. **Actualizar la dirección de un cliente:**


UPDATE Cliente
SET ubicacion = 'Ubicacion cambiada por actualizacion de tabla'
WHERE cliente_id = 2;

-- 11. **Eliminar un producto del menú (bebida):**
DELETE FROM `Bebida` WHERE bebida_id = 28;

-- LOS IDS SE GENERARON CON VALORES MUY ALTOS (DE 19 PARA ARRIBA) NO SE POR QUÈ, SI A USTED, QUERIDA PERSONA QUE
-- ESTA LEYENDO ESTO LOS IDS SÍ SON NORMALES, PORFAVOR CAMBIE ESTE NUMERO


-- 12. **Eliminar un ingrediente de la base de datos:**

DELETE FROM `Ingrediente` WHERE ingrediente_id = 4;
