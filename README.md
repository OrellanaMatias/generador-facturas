>[!TIP]
>Puedes acceder al sistema de manera online [acá](https://generador-facturas-demo.000webhostapp.com/).

>[!NOTE]
>Para el funcionamiento del sistema se debe configurar los parámetros de conexión a la base de datos en el archivo "db-connect.php".

>[!IMPORTANT]
>Para evitar problemas al generar la factura formato pdf, se debe congfigurar manualmente la ruta en la que se encuentra el archivo "printable-receipt.php".</br>
>Esto debe modificarle en el archivo "save_invoice.php", linea 32, y en el archivo "index.php", linea 243. Si se ejecuta en localhost puede no ser un problema, pero el problema puede presentarse al subirlo a un hosting web.
