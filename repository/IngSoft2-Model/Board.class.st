Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'boardSize'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Board class >> withSize: aBoardSize [

	aBoardSize isInteger ifFalse: [
		Error signal: 'Board size cannot be other than integer' ].
	aBoardSize < 1 ifTrue: [
		Error signal: 'Board size cannot be negative or zero' ].

	^ self new initializeWithSize: aBoardSize.
]

{ #category : 'as yet unclassified' }
Board >> getSize [
	^ boardSize .
]

{ #category : 'initialization' }
Board >> initializeWithSize: aBoardSize [

	boardSize := aBoardSize.
]

{ #category : 'as yet unclassified' }
Board >> isPositionBetweenLimits: aPosition [

aPosition <= boardSize ifFalse: [ Error signal: 'The Position is outside of limits' ].
]
