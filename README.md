# Myg

Myg is a project containing games and providing tools to create other games.

## Loading the project 

Load a stable version of Myg with the following snippet, in Pharo 13:

```Smalltalk
Metacello new
	repository: 'github://LeoDefossez/Myg:v1.0.5/src';
	baseline: 'Myg';
	load.
```

For development, load master branch:

```Smalltalk
Metacello new
	repository: 'github://LeoDefossez/Myg';
	baseline: 'Myg';
	onConflictUseLoaded;
	load.
```


## Playing Games

There are currently 5 games in Myg :

- MineSweeper
- Takuzu
- Sokoban
- Memory
- SameGame

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
```Smalltalk
Memory open
```
```Smalltalk
SameGame open
```
