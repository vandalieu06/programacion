**Mòdul 0485:** Programació

**4.1_ACT15: Gestió d'una Biblioteca**

**Objectius**:

*RA6. Escriu programes que manipulin informació seleccionant i
utilitzant tipus avançats de dades.*

*RA7. Desenvolupa programes aplicant característiques avançades dels
llenguatges orientats a objectes i de l\'entorn de programació.*

**Requisits**:

- Apache NetBeans

**Entrega*:***

- Arxius JAVA

**Observacions*:***

- La nota mínima per fer mitja es un 3. Qualsevol codi copiat o que no
  compili tindrà una nota de 0.

Crea una aplicació d'escriptori en Java Swing per gestionar una petita
biblioteca digital. L'usuari podrà:

- Afegir llibres amb informació bàsica (títol, autor, any de
  publicació).

- Eliminar llibres del catàleg.

- Editar les dades d'un llibre ja registrat.

- Cercar llibres pel títol o per l'autor.

- Simular el préstec i la devolució de llibres, canviant l'estat del
  llibre ("Disponible" o "Prestat").

**Funcionalitats**

- Pantalla inicial amb dos botons:
  
  - Gestionar llibres.
  
  - Consultar catàleg.

- Gestió de llibres (CRUD):
  
  - Afegir, editar i eliminar llibres.

- Consulta de llibres:
  
  - Veure tots els llibres.
  
  - Filtrar llibres per títol o autor.
  
  - Botó de Préstec o Devolució (només canvia l'estat).

**Requisits tècnics**

- Utilitza JTable per mostrar el llistat de llibres.

- Els formularis es poden fer amb JDialog o JFrame separades.

- Guarda les dades a memòria (no fa falta arxius en aquesta versió).

- Classes:
  
  - Llibre amb atributs: titol, autor, any, estat
    (\"Disponible\"/\"Prestat\").
  
  - Afegir herència per diferenciar Llibres, Revistes o Articles.

**Surgència implementació**

- Usa ArrayList\<Llibre\> per gestionar els llibres.

- Implementa listeners per gestionar els botons d'afegir, editar i
  eliminar.

- Usa layouts com BorderLayout per l'estructura general i GridLayout o
  FlowLayout pels formularis.

- Pots afegir una barra de menú (JMenuBar) amb opcions: "Arxiu"
  (Sortir), "Ajuda" (Sobre l'aplicació).

**Funcionalitats extres (opcional)**

- Afegir funcionalitat de guardar i carregar des de fitxer.

- Implementar préstecs amb usuaris (afegir qui fa el préstec i quan).

- Afegir data de devolució prevista i indicar si el llibre està
  retardat.
