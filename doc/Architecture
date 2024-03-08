## About Myg Architectures

One of the key question when designing an application with the visual part is to understand how the model and the view interact.
The MVC (Model View Controller) or MVP (Model View Presenter) are the archetypes of architecture to answer such a question. 

Myg supports different architecture and we will present them in the following sections:
The different games, Takuzu, MineSweeper, and Sokoban exhibit different game behavior and architectures.

Takuzu is a game that we describe as static and isolated. Static in the sense that elements do not change position, 
and isolated in the sense that an element does not interact with its neighbors.

MineSweeper is static but not isolated since an element may have an influence on its neighbors.

Sokoban is dynamic in the sense that elements such as the box and the player will change during the curse of the game.


### Vocabulary

In this document and in the Myg Framework we follow the following vocabulary:

- Box and Board are elements of the game model. A box represents a conceptual tile within a 2D space. A board is the 2D space. A board is the parent of a box.

- BoxElement and BoardElement are the graphical counterpart of a Box and its Board. 