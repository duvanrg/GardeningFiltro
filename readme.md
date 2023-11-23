# Gardening ASP.NET Core

## Descripción
GardensGestión es una aplicación ASP.NET Core desarrollada para satisfacer las necesidades específicas de la empresa Gardens, especializada en jardinería. Esta aplicación ofrece una solución integral para el control y registro de todos los productos y servicios proporcionados por Gardens.

## Inicio Rápido
Para iniciar GardensGestión en tu entorno local, sigue estos pasos:

1. Instalación del .NET SDK: Asegúrate de tener instalado el .NET SDK en tu máquina.
2. Clonar Repositorio: Clona el repositorio de GardensGestión desde [enlace al repositorio].
3. Ejecutar Aplicación: Navega a la carpeta del proyecto y ejecuta `dotnet run` 
`dotnet restore`
`dotnet run`

## Endpoint de la consulta

`http://localhost:5092/[Route]`

## consultas
### Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

`http://localhost:5092/Client/ClientNoPayment`

## Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

`http://localhost:5092/Office/GetOfficeNoSellFruits`

## Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
 `http://localhost:5092/Order/GetDelayedOrders`