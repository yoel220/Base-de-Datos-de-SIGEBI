-- Crear base de datos
CREATE DATABASE SIGEBI;

-- Usar base de datos
USE SIGEBI;


-- Tabla ROL
CREATE TABLE Rol (
    id_rol INT PRIMARY KEY,
    nombre_rol VARCHAR(100) NOT NULL
);


-- Tabla USUARIO
CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    contrasena VARCHAR(100) NOT NULL,
    estado VARCHAR(10) NOT NULL CHECK (estado IN ('activo', 'inactivo')),
    id_rol INT,
    FOREIGN KEY (id_rol) REFERENCES Rol(id_rol)
);


-- Tabla EDITORIAL
CREATE TABLE Editorial (
    id_editorial INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);


-- Tabla AUTOR
CREATE TABLE Autor (
    id_autor INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla LIBRO
CREATE TABLE Libro (
    id_libro INT PRIMARY KEY,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    titulo VARCHAR(200) NOT NULL,
    cantidad INT NOT NULL,
    id_editorial INT,
    FOREIGN KEY (id_editorial) REFERENCES Editorial(id_editorial)
);

-- Tabla LIBRO-AUTOR
CREATE TABLE LibroAutor (
    id_libro INT,
    id_autor INT,
    PRIMARY KEY (id_libro, id_autor),
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro),
    FOREIGN KEY (id_autor) REFERENCES Autor(id_autor)
);


-- Tabla PRESTAMO
CREATE TABLE Prestamo (
    id_prestamo INT PRIMARY KEY,
    id_usuario INT,
    id_libro INT,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE,
    estado VARCHAR(10) NOT NULL CHECK (estado IN ('activo', 'devuelto', 'atrasado')),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro)
);


-- Tabla PENALIZACION
CREATE TABLE Penalizacion (
    id_penalizacion INT PRIMARY KEY,
    id_usuario INT,
    id_prestamo INT,
    monto DECIMAL(10, 2),
    motivo TEXT,
    fecha DATE NOT NULL,
    estado VARCHAR(10) NOT NULL CHECK (estado IN ('pendiente', 'pagada')),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_prestamo) REFERENCES Prestamo(id_prestamo)
);


-- Tabla NOTIFICACION
CREATE TABLE Notificacion (
    id_notificacion INT PRIMARY KEY,
    id_usuario INT,
    fecha_envio DATETIME NOT NULL,
    mensaje TEXT NOT NULL,
    leida BIT DEFAULT 0, -- 0 = no leída, 1 = leída
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);


-- Tabla RESERVACION
CREATE TABLE Reservacion (
    id_reservacion INT PRIMARY KEY,
    id_usuario INT,
    id_libro INT,
    fecha DATE NOT NULL,
    expira DATE,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro)
);


-- Insertar Roles
INSERT INTO Rol VALUES (1, 'Administrador');
INSERT INTO Rol VALUES (2, 'Lector');
INSERT INTO Rol VALUES (3, 'Bibliotecario');

-- Insertar Usuarios
INSERT INTO Usuario VALUES (1, 'Ana Torres', 'ana@example.com', 'pass123', 'activo', 1);
INSERT INTO Usuario VALUES (2, 'Luis Pérez', 'luis@example.com', 'pass456', 'activo', 2);
INSERT INTO Usuario VALUES (3, 'Marta Gómez', 'marta@example.com', 'pass789', 'inactivo', 3);

-- Insertar Editoriales
INSERT INTO Editorial VALUES (1, 'Planeta');
INSERT INTO Editorial VALUES (2, 'Santillana');
INSERT INTO Editorial VALUES (3, 'Alfaguara');

-- Insertar Autores
INSERT INTO Autor VALUES (1, 'Gabriel García Márquez');
INSERT INTO Autor VALUES (2, 'Isabel Allende');
INSERT INTO Autor VALUES (3, 'Mario Vargas Llosa');

-- Insertar Libros
INSERT INTO Libro VALUES (1, '9788490627133', 'Cien Años de Soledad', 10, 1);
INSERT INTO Libro VALUES (2, '9789876095282', 'La Casa de los Espíritus', 5, 2);
INSERT INTO Libro VALUES (3, '9788420471839', 'La ciudad y los perros', 7, 3);

-- Insertar LibroAutor
INSERT INTO LibroAutor VALUES (1, 1);  -- Cien Años de Soledad - Gabriel García Márquez
INSERT INTO LibroAutor VALUES (2, 2);  -- La Casa de los Espíritus - Isabel Allende
INSERT INTO LibroAutor VALUES (3, 3);  -- La ciudad y los perros - Vargas Llosa

-- Insertar Reservaciones
INSERT INTO Reservacion VALUES (1, 1, 1, '2025-05-24', '2025-05-30');
INSERT INTO Reservacion VALUES (2, 2, 2, '2025-05-23', '2025-05-29');
INSERT INTO Reservacion VALUES (3, 3, 3, '2025-05-22', '2025-05-28');

-- Insertar Préstamos
INSERT INTO Prestamo VALUES (1, 1, 1, '2025-05-20', NULL, 'activo');
INSERT INTO Prestamo VALUES (2, 2, 2, '2025-05-15', '2025-05-22', 'devuelto');
INSERT INTO Prestamo VALUES (3, 3, 3, '2025-05-10', NULL, 'atrasado');

-- Insertar Penalizaciones
INSERT INTO Penalizacion VALUES (1, 3, 3, 10.00, 'Devolución tardía', '2025-05-23', 'pendiente');
INSERT INTO Penalizacion VALUES (2, 2, 2, 5.00, 'Libro dañado', '2025-05-20', 'pagada');
INSERT INTO Penalizacion VALUES (3, 1, 1, 3.00, 'Entrega fuera de plazo', '2025-05-22', 'pendiente');

-- Insertar Notificaciones
INSERT INTO Notificacion VALUES (1, 1, GETDATE(), 'Tiene un libro pendiente de devolver', 0);
INSERT INTO Notificacion VALUES (2, 2, GETDATE(), 'Su penalización ha sido pagada', 1);
INSERT INTO Notificacion VALUES (3, 3, GETDATE(), 'Debe devolver el libro pronto', 0);


SELECT * FROM Rol;
SELECT * FROM Usuario;
SELECT * FROM Editorial;
SELECT * FROM Autor;
SELECT * FROM Libro;
SELECT * FROM LibroAutor;
SELECT * FROM Reservacion;
SELECT * FROM Prestamo;
SELECT * FROM Penalizacion;
SELECT * FROM Notificacion;