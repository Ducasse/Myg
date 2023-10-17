# Myg

Myg is a project containing games and providing tools to create other games.

## Loading the project 

Load a stable version of Myg with the following snippet, in Pharo 11:

```Smalltalk
Author fullName: 'No'.
Metacello new
	repository: 'github://Ducasse/Myg:v1.0.1/src';
	baseline: 'Myg';
	load.
```

For development, load master branch:

```Smalltalk
Author fullName: 'No'.
Metacello new
	repository: 'github://Ducasse/Myg';
	baseline: 'Myg';
	load.
```


## Playing Games

There are currently 3 games in Myg :

- MineSweeper
- Takuzu
- Sokoban

You can play each game by executing these snippets :

```Smalltalk
MineSweeper open
```
```Smalltalk
Takuzu open
```
```Smalltalk
Sokoban open
```
