Class {
	#name : 'Die',
	#superclass : 'Object',
	#instVars : [
		'numberOfSides'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Die class >> withSides: aNumberOfSides [ 

	aNumberOfSides isInteger ifFalse: [
		Error signal: 'Die sides cannot be other than integer type' ].
	aNumberOfSides < 1 ifTrue: [
		Error signal: 'Die sides cannot be negative or zero' ].


	^ self new initializeWithSides: aNumberOfSides.
]

{ #category : 'as yet unclassified' }
Die >> getNumberOfSides [ 
	^numberOfSides .
]

{ #category : 'initialization' }
Die >> initializeWithSides: aNumberOfSides [ 
	numberOfSides:= aNumberOfSides .
]

{ #category : 'as yet unclassified' }
Die >> roll [ 
	^ numberOfSides atRandom.
]
