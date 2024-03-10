## About Myg Architectures

One of the key questions when designing an application with a visual part is to understand how the model and the visual part (the view) interact. As a general design guideline, the model should not refer to the view so that the view can be changed independently from the model. The MVC (Model View Controller) or MVP (Model View Presenter) are some archetypes of architecture to answer such a question. 

Myg supports different architectures and we will present them in the following sections:
The different games, Takuzu, MineSweeper, and Sokoban exhibit different game behavior and architectures depending on the game logic and design.

- Takuzu is a game that we describe as static and isolated. Static in the sense that elements do not change position, 
and isolated in the sense that an element does not interact with its neighbors.

- MineSweeper is static but not isolated since an element may influence its neighbors.

- Sokoban is dynamic in the sense that elements such as boxes and the player change position during the game.


### Basic relationships between domain and graphical elements

In this document and in the Myg Framework we follow the following vocabulary:

- Box and Board are elements of the game model. A box represents a conceptual tile within a 2D space. A board is a 2D space. A board is the parent of a box. An important design decision in Myg is that a Box knows its conceptual position within the 2D space. It does not have to ask the board to get such information

- BoxElement and BoardElement are the graphical counterparts of a Box and its Board. A BoxElement is generally a child of a BoardElement. 
A BoxElement has a reference to the current box model it represents and a BoardElement to the Board model.