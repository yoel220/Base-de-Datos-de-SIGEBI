# SIGEBI - Sistema de Gestión de Bibliotecas

Este proyecto contiene el diseño e implementación de la base de datos para SIGEBI, un sistema para gestionar préstamos, libros, usuarios y penalizaciones en una biblioteca.

## Contenido

- **SIGEBI.sql**: Script que crea la base de datos, tablas, relaciones y datos de prueba.
- **SIGEBI.jpg**: Diagrama Entidad-Relación (ER) del sistema.
- **README.md**: Información general del proyecto.

## Entidades principales

- Usuario
- Rol
- Libro
- Autor
- Editorial
- Préstamo
- Penalización
- Notificación
- Reservación
- LibroAutor (relación N:M)

## Instrucciones

1. Abrir SQL Server Management Studio.
2. Ejecutar el archivo `SIGEBI.sql`.
3. Se creará la base de datos y se insertarán datos de ejemplo.

## Características

- Base de datos normalizada hasta 3FN.
- Relaciones entre tablas con claves foráneas.
- Restricciones `NOT NULL`, `UNIQUE`, `CHECK`, etc.
- Datos de prueba incluidos para facilitar pruebas.

---

Gracias por revisar el proyecto.
