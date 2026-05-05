Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'winner',
		'board',
		'diceSet',
		'index',
		'shipsDictionary',
		'ships'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Game class >> withABoard: aBoard andShips: aCollectionOfShips andDiceSet: aDiceSet [
	 ^ (self new) initializeWithABoard: aBoard andShips: aCollectionOfShips andDiceSet: aDiceSet 
]

{ #category : 'as yet unclassified' }
Game >> aGameCannotBeOver [

	self isOver ifTrue: [ Error signal: 'The game is already over.' ]
]

{ #category : 'as yet unclassified' }
Game >> aGameIsNotOverYet [

	self isOver ifFalse: [ Error signal: 'The game is not over yet.' ]
]

{ #category : 'initialization' }
Game >> cannotBeEmpty: aCollectionOfShips [

	aCollectionOfShips isEmpty ifTrue: [
		Error signal: 'A game must have at least one ship.' ]
]

{ #category : 'as yet unclassified' }
Game >> checkGameOverFor: aShip [

	| currentPositionOfShip |
	currentPositionOfShip := self getPositionOfSpaceShip: aShip.

	^ currentPositionOfShip = board getSize ifTrue: [ winner := aShip ]
]

{ #category : 'as yet unclassified' }
Game >> getAmountOfShips [

	^ shipsDictionary size.
]

{ #category : 'as yet unclassified' }
Game >> getCurrentShip [

	^ ships at: index \\ ships size + 1
]

{ #category : 'as yet unclassified' }
Game >> getPositionOfSpaceShip: aShip [

	^ shipsDictionary at: aShip
]

{ #category : 'as yet unclassified' }
Game >> getWinner [

	self aGameIsNotOverYet.
	^ winner
]

{ #category : 'initialization' }
Game >> initializeWithABoard: aBoard andShips: aCollectionOfShips andDiceSet: aDiceSet [

	self cannotBeEmpty: aCollectionOfShips.

	board := aBoard.
	ships := aCollectionOfShips. "Consider removing variable as its already integrated on shipsDictionary"
	diceSet := aDiceSet.

	index := 0. "index for Ships turns"
	winner := EmptyShip new.

	shipsDictionary := Dictionary new.
	aCollectionOfShips do: [ :ship | shipsDictionary at: ship put: 0 ]
]

{ #category : 'modes' }
Game >> isOver [
	^ (winner isMemberOf: Ship).
]

{ #category : 'as yet unclassified' }
Game >> moveShip: aShip toPosition: aRollResult [

	|currentPositionOfShip positionToMove |
	currentPositionOfShip := shipsDictionary at: aShip.

	positionToMove:= (currentPositionOfShip + aRollResult) min: board getSize. "chooses the minimum between (current position + number of squares to move) and the board size which is the maximum limit ergo where game ends"
	
	shipsDictionary at: aShip put: positionToMove.
	self checkGameOverFor: aShip

]

{ #category : 'as yet unclassified' }
Game >> play [

	| aDiceRoll currentShip |
	self aGameCannotBeOver.
	aDiceRoll := diceSet roll.
	index := index \\ shipsDictionary keys size + 1.

	currentShip := ships at: index.
	self moveShip: currentShip toPosition: aDiceRoll
]
