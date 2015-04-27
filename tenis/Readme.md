## Kata Tenis

La idea es implementar una clase (en realidad pueden ser varias clases, queda a su criterio) que represente un marcador de tenis.
Las siguientes pruebas explicitan el comportamiento que debe soportar.
El partido arranca con

 - sets 0-0
 - games 0-0
 - puntos 0-0
 - cuando un jugador gana un game, los puntos vuelven a 0-0
 - cuando un jugador gana un set, los games vuelven a 0-0 y lo mismo ocurre con los puntos.
 - cuando un jugador alcance los 6 games gana el set (no hay tie-break ni diferencia de 2)
 - el partido termina cuando algunos de los jugadores alcance los 2 sets

El diseño de la interface de la clase queda a su criterio y además de implementar las pruebas aquí sugeridas, deben hacer TDD. Esto implica escribir las pruebas de a una y hacer commit+push cuando pasa cada prueba y verificar que el build continue en verde en travis.

El ejercicio debe ubicarse dentro de sus repositorios git en la carpeta tenis.
Para la entrega de este TP deberán generar un tag llamado "tenis" y entregar el link al mismo.
