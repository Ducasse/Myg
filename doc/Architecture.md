## About Myg Architectures

One of the key questions when designing an application with a visual part is to understand how the model and the visual part (the view) interact. As a general design guideline, the model should not refer to the view so that the view can be changed independently from the model. The MVC (Model View Controller) or MVP (Model View Presenter) are some archetypes of architectures that answer such a question. 

Myg supports different architectures and we will present them in the following sections:
The different games, Takuzu, MineSweeper, and Sokoban exhibit different game behavior and architectures depending on the game logic and design.

- Takuzu is a game that we describe as static and isolated. Static in the sense that elements do not change position, 
and isolated in the sense that an element does not interact with its neighbors.

- MineSweeper is static but not isolated since an element may influence its neighbors.

- Sokoban is dynamic in the sense that elements such as boxes and the player change position during the game.


### Basic relationships between domain and graphical elements

In this document and in the Myg Framework we follow the following vocabulary:

SD: Add a figure about 

### Boxes and board

Box and Board are elements of the game model. 
A box represents a conceptual tile within a 2D space. A board is a 2D space.
A box has a logical position within the board. 
A board is the parent of a box. A box knows its parent. 

### BoxElements and BoardElement

BoxElement and BoardElement are the graphical counterparts of a Box and its Board. A BoxElement is generally a child of a BoardElement but it can be wrapped into intermediary elements inbetween the board and its boxes. 
A BoxElement has a reference to the current box model it represents and a BoardElement to the Board model.

### About Box logical position

An important design decision in Myg is that a Box knows its conceptual position within the 2D space. It does not have to ask the board to get such information.

This is important for the following reason. When an element that represents a given box receives an even, 
the element communicates to the box and since the box knows its logical position within the board, it does not have to extract it 
from the event or element physical position. 

This eases the decoupling between a physical position and a logical position. For example padding between the elements does not interfer (and does not have to be taken into account) when accessing the logical position.

If a box would not know its logical position, then this position would have to be calculated either at the level of the box element or by struggling with the physical position given by the box element. 





