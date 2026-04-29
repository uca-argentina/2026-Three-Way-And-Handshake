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
Board class >> withSize: aNumberOfSquares [

	aNumberOfSquares isInteger ifFalse: [
		Error signal: 'Board size cannot be other than integer' ].
	aNumberOfSquares < 1 ifTrue: [
		Error signal: 'Board size cannot be negative or zero' ].

	^ self new initializeWithSize: aNumberOfSquares
]

{ #category : 'as yet unclassified' }
Board >> getSize [
	^ boardSize .
]

{ #category : 'initialization' }
Board >> initializeWithSize: aNumberOfSquares [ 
boardSize:= aNumberOfSquares .
]
