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
Board class >> assertInteger: aBoardSize [

	aBoardSize isInteger ifFalse: [
		Error signal: 'Board size cannot be other than integer' ]
]

{ #category : 'instance creation' }
Board class >> assertPositiveSize: aBoardSize [

	aBoardSize < 1 ifTrue: [
		Error signal: 'Board size cannot be negative or zero' ]
]

{ #category : 'instance creation' }
Board class >> withSize: aBoardSize [

	self assertInteger: aBoardSize.
	self assertPositiveSize: aBoardSize.

	^ self new initializeWithSize: aBoardSize
]

{ #category : 'initialization' }
Board >> initializeWithSize: aBoardSize [

	boardSize := aBoardSize.
]

{ #category : 'as yet unclassified' }
Board >> size [
	^ boardSize .
]
