Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'winner',
		'board'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Game class >> withABoard: aBoard [ 
	^(self new) initializeWithABoard: aBoard.
]

{ #category : 'as yet unclassified' }
Game >> getPositionOfSpaceShip: aShip onTheBoard: aBoard [ 
	^board getPositionOf: aShip.
	
]

{ #category : 'as yet unclassified' }
Game >> getWinner [
	^winner.
]

{ #category : 'initialization' }
Game >> initializeWithABoard: aBoard [ 
	board := aBoard
]

{ #category : 'as yet unclassified' }
Game >> moveShip: aShip toPosition: aPosition [
	board moveShip: aShip toPosition: aPosition.
]

{ #category : 'modes' }
Game >> over [
	^true
]

{ #category : 'as yet unclassified' }
Game >> play [
	winner := 1.
]
