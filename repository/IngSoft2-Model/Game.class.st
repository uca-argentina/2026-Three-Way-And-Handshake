Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'winner',
		'board',
		'isOver'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Game class >> withABoard: aBoard [ 
	^(self new) initializeWithABoard: aBoard.
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
	isOver := false.
	winner := nil.
]

{ #category : 'as yet unclassified' }
Game >> moveShip: aShip toPosition: aPosition [

	board moveShip: aShip toPosition: aPosition.
	self checkGameOverFor: aShip
]

{ #category : 'modes' }
Game >> over [
	^isOver.
]
