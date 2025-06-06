USE examen_mysql;


CREATE TABLE IF NOT EXISTS Metodo_pago(
    metodo_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pago_confirmado TINYINT NOT NULL DEFAULT(0),
    nombre VARCHAR(50) NOT NULL
)

CREATE TABLE IF NOT EXISTS Cliente(
    cliente_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    metodo_id INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    telefono INT NOT NULL,
    ubicacion VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    FOREIGN KEY (metodo_id) REFERENCES Metodo_pago(metodo_id)
)

CREATE TABLE IF NOT EXISTS Pedido(
    pedido_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    fecha_pedido DATE NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    fecha_recogida DATE NOT NULL
)

CREATE TABLE IF NOT EXISTS Tipo_bebida(
    tipo_bebida_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo_bebida ENUM('Pequeño', 'Mediano', 'Grande') NOT NULL,
    precio INT NOT NULL
)

CREATE TABLE IF NOT EXISTS Bebida(
    bebida_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo_bebida_id INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    FOREIGN KEY (tipo_bebida_id) REFERENCES Tipo_bebida(tipo_bebida_id)
)

CREATE TABLE IF NOT EXISTS Ingrediente(
    ingrediente_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
)

CREATE TABLE IF NOT EXISTS Tipo_pizza(
    tipo_pizza_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo_pizza ENUM('Pequeña', 'Mediana', 'Grande') NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
)

CREATE TABLE IF NOT EXISTS Pizza(
    pizza_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo_pizza_id INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    precio_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (tipo_pizza_id) REFERENCES Tipo_pizza(tipo_pizza_id)
)

CREATE TABLE IF NOT EXISTS Pizza_ingrediente(
    pizza_id INT NOT NULL,
    ingrediente_id INT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (pizza_id) REFERENCES Pizza(pizza_id),
    FOREIGN KEY (ingrediente_id) REFERENCES Ingrediente(ingrediente_id)
)

CREATE TABLE Combo(
    combo_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descuento DECIMAL(3, 2) NOT NULL,
    cantidad INT NOT NULL DEFAULT(1)
)

CREATE TABLE IF NOT EXISTS Detalle_combo(
    combo_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pizza_id INT NULL,
    bebida_id INT NULL,
    cantidad INT NOT NULL DEFAULT(1),
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (pizza_id) REFERENCES Pizza(pizza_id),
    FOREIGN KEY (bebida_id) REFERENCES Bebida(bebida_id)
)

CREATE TABLE IF NOT EXISTS Detalle_pedido(
    detalle_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    pizza_id INT NULL,
    bebida_id INT NULL,
    combo_id INT NULL,
    cantidad INT NOT NULL DEFAULT(1),
    precio_unitario DECIMAL(10, 2),
    FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id),
    FOREIGN KEY (pizza_id) REFERENCES Pizza(pizza_id),
    FOREIGN KEY (bebida_id) REFERENCES Bebida(bebida_id),
    FOREIGN KEY (combo_id) REFERENCES Combo(combo_id)
)

-- LA INSERCION DE DATOS SE ENCUENTRA EN EL OTRO ARCHIVO