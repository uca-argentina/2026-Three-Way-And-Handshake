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
Board class >> cannotBeNegativeOrZero: aBoardSize [

	aBoardSize < 1 ifTrue: [
		Error signal: 'Board size cannot be negative or zero' ]
]

{ #category : 'instance creation' }
Board class >> cannotBeOtherThanInteger: aBoardSize [

	aBoardSize isInteger ifFalse: [
		Error signal: 'Board size cannot be other than integer' ]
]

{ #category : 'instance creation' }
Board class >> withSize: aBoardSize [

	self cannotBeOtherThanInteger: aBoardSize.
	self cannotBeNegativeOrZero: aBoardSize.

	^ self new initializeWithSize: aBoardSize
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

"possible refactor could be deleting this method since action logic has outgrown case scenario"

aPosition <= boardSize ifFalse: [ Error signal: 'The Position is outside of limits' ].
]
