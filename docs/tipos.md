## Tipos
Estructura de los tipos de objetos de la aplicación.

#### Vendedor
Empleado que hace una venta.
```json
{
  "id": 1,
  "nombre": "Nombre de pila",
  "apellidos": "Apellido1 Apellido2",
  "email": "dominio@email.com",
  "telefono": "612 345 789"
}
```

#### Cliente
Empresa externa que realiza una compra.
```json
{
  "nombre": "Nombre de la empresa",
  "email": "dominio@email.com",
  "telefono": "612 123 456"
}
```

#### Venta
Transacción entre un vendedor y un cliente
```json
{
  "id": 1,
  "vendedor": 1,
  "cliente": "Nombre de la empresa",
  "fecha": "2024-04-21",
  "total": 12345678.12
}
```

#### Nota
Contiene información sobre una venta, un cliente o un vendedor
```json
{
  "id": 1,
  "autor": 1,
  "titulo": "Frase que resume el contenido de la nota",
  "contenido": "Texto que contiene la información de la nota",
  "fecha": "2025-04-25",
  "vendedor": 1,
  "cliente": "Nombre",
  "venta": 1
}
```










