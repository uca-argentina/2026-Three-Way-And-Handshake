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
Die class >> assertIsInteger: aNumberOfSides [

	aNumberOfSides isInteger ifFalse: [
		Error signal: 'Die sides cannot be other than integer type' ]
]

{ #category : 'as yet unclassified' }
Die class >> assertPositiveSize: aNumberOfSides [

	aNumberOfSides < 1 ifTrue: [
		Error signal: 'Die sides cannot be negative or zero' ]
]

{ #category : 'as yet unclassified' }
Die class >> withSides: aNumberOfSides [

	self assertIsInteger: aNumberOfSides.
	self assertPositiveSize: aNumberOfSides.


	^ self new initializeWithSides: aNumberOfSides
]

{ #category : 'initialization' }
Die >> initializeWithSides: aNumberOfSides [ 
	numberOfSides:= aNumberOfSides .
]

{ #category : 'as yet unclassified' }
Die >> numberOfSides [ 
	^numberOfSides .
]

{ #category : 'as yet unclassified' }
Die >> roll [ 
	^ numberOfSides atRandom.
]
