Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'winner',
		'board',
		'isOver',
		'currentPositionOfShip',
		'ships',
		'diceSet'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Game class >> withABoard: aBoard [ 
	^(self new) initializeWithABoard: aBoard.
]

{ #category : 'as yet unclassified' }
Game class >> withABoard: aBoard andShips: aCollectionOfShips andDiceSet: aDiceSet [
	 ^self new initializeWithABoard: aBoard andShips: aCollectionOfShips andDiceSet: aDiceSet 
]

{ #category : 'as yet unclassified' }
Game >> checkGameOverFor: aShip [

	| currentPositionOfShip |
	currentPositionOfShip := self
		                         getPositionOfSpaceShip: aShip.

	^ currentPositionOfShip = board getSize ifTrue: [
			  isOver := true.
			  winner := aShip ]
]

{ #category : 'as yet unclassified' }
Game >> getPositionOfSpaceShip: aShip [
	^board getPositionOf: aShip.
	
]

{ #category : 'as yet unclassified' }
Game >> getWinner [
	^winner.
]

{ #category : 'initialization' }
Game >> initializeWithABoard: aBoard [ 
	board := aBoard.
	currentPositionOfShip := 0.
	isOver := false.
	winner := nil.
]

{ #category : 'initialization' }
Game >> initializeWithABoard: aBoard andShips: aCollectionOfShips andDiceSet: aDiceSet [
	board := aBoard.
	ships := aCollectionOfShips.
	diceSet := aDiceSet.
	
]

{ #category : 'as yet unclassified' }
Game >> moveShip: aShip toPosition: aPosition [

	board moveShip: aShip toPosition: currentPositionOfShip + aPosition.
	currentPositionOfShip := currentPositionOfShip + aPosition.
	self checkGameOverFor: aShip
]

{ #category : 'modes' }
Game >> over [
	^isOver.
]

{ #category : 'as yet unclassified' }
Game >> play [
	| aDiceToss |
	aDiceToss := diceSet toss.
]
