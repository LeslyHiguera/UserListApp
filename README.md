UserListApp

Conceptos técnicos:

Lenguaje: Swift 5.7
Vistas: XIBs
Comportamiento: Reactivo(Observers)
Librerías: No
Servicios: Se adapta URLSession para el consumo de servicios
Decodificación: Codable
Binding: Closures

Arquitectura:

MVVM con repository, factory, router y adapter

- Model: Entidades
- View: Vistas y la lógica de vista
- ViewModel: Casos de uso (lógica de negocios)
- Repository: Obtención datos de la API y locales(CoreData)
- Router: Navegación entre controladores
- Factory: Construcción de objetos complejos.

Funcionalidades:

- La vista principal muestra un listado de usuario obtenidos de la API.
- Al seleccionar un usuario se muestra una vista con la descripción del mismo.
- Se utiliza un activity indicator para mostrar cuándo se está realizando un consumo de la API y se oculta cuando se obtiene una respuesta(success o error).
- Cuando hay un error de conectividad se muestra una alerta para elegir si se usan datos locales o se realiza el consumo de la API nuevamente.
