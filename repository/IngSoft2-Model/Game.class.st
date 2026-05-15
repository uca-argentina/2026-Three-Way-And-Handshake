Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'winner',
		'board',
		'diceSet',
		'shipsDictionary',
		'ships',
		'shipIndex'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Game class >> boardIsValidInstance: aBoard [ 
	(aBoard isKindOf: Board) ifFalse: [
				Error signal: 'Game did not receive a valid instance of Board'].
]

{ #category : 'initialization' }
Game class >> cannotBeEmpty: aCollectionOfShips [

	aCollectionOfShips isEmpty ifTrue: [
		Error signal: 'A game must have at least one ship.' ]
]

{ #category : 'as yet unclassified' }
Game class >> isValidDice: aDiceSet [

	(aDiceSet respondsTo: #roll)
		ifFalse: [
		Error signal: 'Game did not receive a valid instance of Dice' ]
]

{ #category : 'as yet unclassified' }
Game class >> withABoard: aBoard andShips: aCollectionOfShips andDiceSet: aDiceSet [

	self cannotBeEmpty: aCollectionOfShips.
	self boardIsValidInstance: aBoard.
	self isValidDice: aDiceSet.
	^ (self new)
		  initializeWithABoard: aBoard
		  andShips: aCollectionOfShips
		  andDiceSet: aDiceSet
]

{ #category : 'as yet unclassified' }
Game >> amountOfShips [

	^ shipsDictionary size.
]

{ #category : 'as yet unclassified' }
Game >> assertGameIsNotOver [

	self isOver ifFalse: [ Error signal: 'The game is not over yet.' ]
]

{ #category : 'as yet unclassified' }
Game >> assertGameIsOver [

	self isOver ifTrue: [ Error signal: 'The game is already over.' ]
]

{ #category : 'as yet unclassified' }
Game >> calculateNewPositionFor: aShip withARoll: aRollResult [

	| currentPositionOfShip positionToMove |
	currentPositionOfShip := self positionOf: aShip.
	positionToMove := currentPositionOfShip + aRollResult min:
		                    board size.
		
	^positionToMove.
]

{ #category : 'as yet unclassified' }
Game >> checkGameOverFor: aShip [

	| currentPositionOfShip |
	currentPositionOfShip := self positionOf: aShip.

	^ currentPositionOfShip = board size ifTrue: [ winner := aShip ]
]

{ #category : 'as yet unclassified' }
Game >> currentShip [

	^ ships at: shipIndex \\ ships size + 1
]

{ #category : 'initialization' }
Game >> initializeWithABoard: aBoard andShips: aCollectionOfShips andDiceSet: aDiceSet [

	board := aBoard.
	ships := aCollectionOfShips.
	diceSet := aDiceSet.

	shipIndex := 0.
	winner := nil.

	shipsDictionary := Dictionary new.
	aCollectionOfShips do: [ :ship | shipsDictionary at: ship put: 0 ]
]

{ #category : 'modes' }
Game >> isOver [

	^ winner isNotNil
]

{ #category : 'as yet unclassified' }
Game >> moveShip: aShip toPosition: aRollResult [

	|positionToMove|
	positionToMove := self calculateNewPositionFor: aShip withARoll: aRollResult.
	
	
	shipsDictionary at: aShip put: positionToMove.
	self checkGameOverFor: aShip

]

{ #category : 'as yet unclassified' }
Game >> play [

	| aDiceRoll currentShip |
	self assertGameIsOver.
	aDiceRoll := diceSet roll.
	shipIndex := shipIndex \\ shipsDictionary keys size + 1.

	currentShip := ships at: shipIndex.
	self moveShip: currentShip toPosition: aDiceRoll
]

{ #category : 'as yet unclassified' }
Game >> positionOf: aShip [

	^ shipsDictionary at: aShip
]

{ #category : 'as yet unclassified' }
Game >> winner [

	self assertGameIsNotOver.
	^ winner
]
