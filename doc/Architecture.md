## About Myg Architectures

One of the key questions when designing an application with a visual part is to understand how the model and the visual part (the view) interact. As a general design guideline, the model should not refer to the view so that the view can be changed independently from the model. The MVC (Model View Controller) or MVP (Model View Presenter) are some archetypes of architecture to answer such a question. 

Myg supports different architectures and we will present them in the following sections:
The different games, Takuzu, MineSweeper, and Sokoban exhibit different game behavior and architectures depending on the game logic and design.

- Takuzu is a game that we describe as static and isolated. Static in the sense that elements do not change position, 
and isolated in the sense that an element does not interact with its neighbors.

- MineSweeper is static but not isolated since an element may influence its neighbors.

- Sokoban is dynamic in the sense that elements such as boxes and the player change position during the course of the game.


### Vocabulary

In this document and in the Myg Framework we follow the following vocabulary:

- Box and Board are elements of the game model. A box represents a conceptual tile within a 2D space. A board is a 2D space. A board is the parent of a box.

- BoxElement and BoardElement are the graphical counterparts of a Box and its Board. 