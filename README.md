# Myg

Myg is a project containing games and providing tools to create other games

## Loading the project 

To load the project you can copy and execute this snippet in Pharo 11 :

```Smalltalk
Metacello new
		baseline: 'Bloc';
		repository: 'github://pharo-graphics/Bloc:05e5b0e385811719537f8cd89966b150a07be985/src';
	onConflictUseIncoming;
	load;
	lock.

Metacello new
	repository: 'github://Ducasse/Myg';
	baseline: 'Myg';
	onConflictUseIncoming;
	load.
```

## Playing Games

There is currently 3 games in Myg :

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
