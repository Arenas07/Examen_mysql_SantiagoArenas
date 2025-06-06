# (4H) Pizza Fiesta

La pizzería "Pizza Fiesta" requiere el desarrollo de una base de datos para gestionar de manera eficiente sus operaciones diarias. El sistema debe permitir el registro y manejo de clientes, productos (pizzas, bebidas e ingredientes), y pedidos. A su vez, la base de datos debe controlar los ingredientes utilizados en cada pizza, así como manejar los precios para pizzas de distintos tamaños (pequeñas, medianas y grandes), tanto individuales como enteras. Adicionalmente, el sistema debe gestionar el pago y la recogida de los pedidos, asegurando que los pedidos se preparen solo una vez confirmado el pago.

## Problema:
Actualmente, "Pizza Fiesta" no tiene una forma eficaz de gestionar sus operaciones, lo que genera dificultades en el seguimiento de pedidos, el control de inventario de ingredientes y el manejo de precios según el tipo de pizza y tamaño. Además, los clientes no tienen la posibilidad de personalizar su pedido de manera clara, lo que afecta la experiencia del usuario. La pizzería necesita una solución que automatice estas tareas y facilite la gestión de los pedidos y el inventario de productos.

## Características Principales:
### Gestión de Clientes: El sistema debe permitir el registro de información detallada de los clientes, incluyendo nombre, número de contacto y dirección.
### Gestión de Productos:
Registro de pizzas disponibles (pequeñas, medianas y grandes) y bebidas.
Gestión de ingredientes, permitiendo la personalización de pizzas por parte de los clientes.
Control de combos que incluyan pizzas y bebidas.
### Gestión de Pedidos:
Los clientes podrán realizar pedidos que se procesarán tras el pago.
La hora de recogida debe ser indicada por el cliente al hacer el pedido.
Posibilidad de añadir ingredientes extra, aplicando un costo adicional.
### Detallado del Pedido:
El sistema debe detallar el proceso de preparación de cada pizza, permitiendo al cliente seleccionar los ingredientes disponibles para personalizar su pizza.
Visualización de costos según el tamaño de la pizza y los ingredientes añadidos.
Pagos y Recogida: Los pedidos solo comenzarán a prepararse una vez realizado el pago, sin costos adicionales, ya que los clientes recogen personalmente su orden.

# DESCRIPCION DE LOGICA POR ESTUDIANTE:


-- 1. **Registrar un nuevo cliente:**

INSERT INTO Metodo_pago(
    pago_confirmado,
    nombre
    ) VALUES
    (0, 'Efectivo'),
    (0, 'Tarjeta'),
    (1, 'Efectivo'),
    (1, 'Tarjeta');

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

Sirve para que ver los clientes registrados junto su "metodo de pago" que confirma si
el cliente ya ha hecho el pago de su pizza para ir a recogerla, tambien se menciona el 
metodo por el cual el cliente lo pagó.

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


Muestra la logica de la insercion de datos para las pizzas, donde se debe especificar el tamaño de estas
para relacionarla a futuro a traves de la tabla Pizza_ingrediente


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

Para registrar una bebida se necesita especificar el tipo de bebida, osea pequeña, mediana o grande. Para despues poder asignarle esos valores a las bebidas
con su respectivo nombre de marca

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

Para ingresar un ingrediente a las pizzas se usa la tabla intermedia pizza_ingrediente, que se usa para relacionarlas

-- 5. **Crear un pedido para un cliente:**

INSERT INTO Pedido(
    cliente_id,
    fecha_pedido,
    fecha_recogida
) VALUES
(1, '2025-06-06', '2025-06-06'),
(2, '2025-06-06', '2025-06-06')

Para crear el pedido simplemente se necesita el id del cliente que realizó el pedido junto con las fechas que especifican, el pedido se autoincremente
automaticamente

-- 6. **Añadir productos a un pedido específico:**

INSERT INTO Detalle_pedido(
    pedido_id,
    pizza_id,
    cantidad,
    precio_unitario
) VALUES
(1, 3, 1, 16900);

Al utilizar la tabla detalle pedido con llaves foraneas NULL el cliente no está obligado a comprar un combo, una pizza y una bebida a la vez, el cliente puede
escoger qué opcion quiere  (Solo pizzas, solo bebidas, solo combo, o combinaciones de todas)

-- 7. **Añadir ingredientes adicionales a una pizza en un pedido:**

INSERT INTO `Pizza_ingrediente`(
    pizza_id,
    ingrediente_id,
    cantidad
)
VALUES
(1,1, 2);

Se ingresa el nuevo valor como un nuevo row al mismo id del pedido

-- 8. **Consultar el detalle de un pedido (productos y sus ingredientes):**

SELECT pe.pedido_id, pe.cliente_id, pi.nombre AS pizza, be.nombre AS bebida, dp.cantidad, ing.nombre AS ingrediente
FROM Pedido AS pe
INNER JOIN Detalle_pedido AS dp ON pe.pedido_id = dp.pedido_id
LEFT JOIN Pizza AS pi ON  dp.pizza_id = pi.pizza_id
LEFT JOIN Bebida AS be ON dp.bebida_id = be.bebida_id
LEFT JOIN Pizza_ingrediente AS pizin ON pizin.pizza_id = pi.pizza_id
LEFT JOIN Ingrediente AS ing ON ing.ingrediente_id = pizin.ingrediente_id

Con cada join que se hace se relaciona a la tabla donde podemos consultar el id del pedido, el id del cliente, la pizza, bebida o combo que pidió, y los ingredientes de su pizza (si hay)

-- 9. **Actualizar el precio de una pizza en el menú:**


UPDATE Pizza 
SET precio_total = 20000 
WHERE pizza_id = 1;

UN UPDATE FILTRADO POR ID

-- 10. **Actualizar la dirección de un cliente:**


UPDATE Cliente
SET ubicacion = 'Ubicacion cambiada por actualizacion de tabla'
WHERE cliente_id = 2;

UN UPDATE FILTRADO POR ID

-- 11. **Eliminar un producto del menú (bebida):**
DELETE FROM `Bebida` WHERE bebida_id = 28;

-- LOS IDS SE GENERARON CON VALORES MUY ALTOS (DE 19 PARA ARRIBA) NO SE POR QUÈ, SI A USTED, QUERIDA PERSONA QUE
-- ESTA LEYENDO ESTO LOS IDS SÍ SON NORMALES, PORFAVOR CAMBIE ESTE NUMERO



-- 12. **Eliminar un ingrediente de la base de datos:**

DELETE FROM `Ingrediente` WHERE ingrediente_id = 4;