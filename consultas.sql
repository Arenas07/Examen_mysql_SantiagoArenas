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

INSERT INTO Ingrediente(
    nombre,
    precio,
    stock
) VALUES
('Pepperoni', 2000, 500),
('Piña', 1000, 800),
('Jamón', 1900, 400),
('Champiñon', 1400, 450);