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
Game >> getPositionOfSpaceShip: aShip [

	^ shipsDictionary at: aShip
]

{ #category : 'as yet unclassified' }
Game >> getWinner [
	^ winner.
]

{ #category : 'initialization' }
Game >> initializeWithABoard: aBoard andShips: aCollectionOfShips andDiceSet: aDiceSet [

	board := aBoard.
	ships := aCollectionOfShips. "Consider removing variable as its already integrated on shipsDictionary"
	diceSet := aDiceSet.
	
	index := 0. "index for Ships turns"
	winner := EmptyShip new.

	shipsDictionary := Dictionary new.
	aCollectionOfShips do: [ :ship | shipsDictionary at: ship put: 0 ]
]

{ #category : 'as yet unclassified' }
Game >> moveShip: aShip toPosition: aRollResult [

	|currentPositionOfShip positionToMove |
	currentPositionOfShip := shipsDictionary at: aShip.

	positionToMove:= (currentPositionOfShip + aRollResult) min: board getSize. "chooses the minimum between (current position + number of squares to move) and the board size which is the maximum limit ergo where game ends"
	
	shipsDictionary at: aShip put: positionToMove.
	self checkGameOverFor: aShip

]

{ #category : 'modes' }
Game >> over [
	^ (winner isMemberOf: Ship).
]

{ #category : 'as yet unclassified' }
Game >> play [
	| aDiceToss currentShip |
	aDiceToss := diceSet roll.
	index := (index \\ shipsDictionary keys size) + 1.
	
	currentShip:= ships at: index.
	self moveShip: currentShip toPosition: aDiceToss.
]
