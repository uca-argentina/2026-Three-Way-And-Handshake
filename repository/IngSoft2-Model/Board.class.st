Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'squares'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Board class >> assertPositiveSize: aBoardSize [

	aBoardSize < 1 ifTrue: [
		Error signal: 'Board size cannot be negative or zero' ]
]

{ #category : 'instance creation' }
Board class >> called: aBoardSize [

	aBoardSize isInteger ifFalse: [
		Error signal: 'Board size cannot be other than integer' ]
]

{ #category : 'instance creation' }
Board class >> withSize: aBoardSize [

	self called: aBoardSize.
	self assertPositiveSize: aBoardSize.

	^ self withSize: aBoardSize and:  SimpleSquare new on: 1.
]

{ #category : 'as yet unclassified' }
Board class >> withSize: anInteger and: anAnomaly on: aPosition [

	^ (self new) initializeWithSize: anInteger and: anAnomaly on: aPosition
]

{ #category : 'initialization' }
Board >> initializeWithSize: aBoardSize and: anAnomaly on: aPosition [

	squares := OrderedCollection new: 10 withAll: SimpleSquare new.
	squares at: aPosition put: anAnomaly.
]

{ #category : 'as yet unclassified' }
Board >> landOn: aSquarePosition [

^ (squares at: aSquarePosition) land.
]

{ #category : 'as yet unclassified' }
Board >> size [
	^ squares size.
]
