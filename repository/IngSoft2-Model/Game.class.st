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
Game class >> boardIsValidInstance: aBoard [ 
	(aBoard isMemberOf: Board) ifFalse: [
				Error signal: 'Game did not receive a valid instance of Board'].
]

{ #category : 'initialization' }
Game class >> cannotBeEmpty: aCollectionOfShips [

	aCollectionOfShips isEmpty ifTrue: [
		Error signal: 'A game must have at least one ship.' ]
]

{ #category : 'as yet unclassified' }
Game class >> isValidDice: aDiceSet [

	((aDiceSet isMemberOf: DiceSet) or: (aDiceSet isMemberOf: LoadedDie))
		ifFalse: [
		Error signal: 'Game did not receive a valid instance of Dice' ]
]

{ #category : 'as yet unclassified' }
Game class >> withABoard: aBoard andShips: aCollectionOfShips andDiceSet: aDiceSet [

	self cannotBeEmpty: aCollectionOfShips.
	self boardIsValidInstance: aBoard.
	self isValidDice: aDiceSet.
	^ self new
		  initializeWithABoard: aBoard
		  andShips: aCollectionOfShips
		  andDiceSet: aDiceSet
]

{ #category : 'as yet unclassified' }
Game >> aGameIsNotOverYet [

	self isOver ifFalse: [ Error signal: 'The game is not over yet.' ]
]

{ #category : 'as yet unclassified' }
Game >> aGameIsOver [

	self isOver ifTrue: [ Error signal: 'The game is already over.' ]
]

{ #category : 'as yet unclassified' }
Game >> calculateNewPositionFor: aShip withARoll: aRollResult [

	| currentPositionOfShip positionToMove |
	currentPositionOfShip := self getPositionOfSpaceShip: aShip.
	positionToMove := currentPositionOfShip + aRollResult min:
		                    board getSize.
		
	^positionToMove.
]

{ #category : 'initialization' }
Game >> cannotBeEmpty: aCollectionOfShips [ 
	^ self class cannotBeEmpty: aCollectionOfShips 
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

	board := aBoard.
	ships := aCollectionOfShips.
	diceSet := aDiceSet.

	index := 0.
	winner := nil.

	shipsDictionary := Dictionary new.
	aCollectionOfShips do: [ :ship | shipsDictionary at: ship put: 0 ]
]

{ #category : 'modes' }
Game >> isOver [
	^ (winner isMemberOf: Ship).
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
	self aGameIsOver.
	aDiceRoll := diceSet roll.
	index := index \\ shipsDictionary keys size + 1.

	currentShip := ships at: index.
	self moveShip: currentShip toPosition: aDiceRoll
]
