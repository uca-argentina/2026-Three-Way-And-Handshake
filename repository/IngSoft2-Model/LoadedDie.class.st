Class {
	#name : 'LoadedDie',
	#superclass : 'Object',
	#instVars : [
		'numberToRoll'
	],
	#classInstVars : [
		'numberToRoll'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
LoadedDie class >> mustRoll: aNumberToBeRolled [

	aNumberToBeRolled isInteger ifFalse: [
		Error signal: 'LoadedDie sides cannot be other than integer type' ].
	aNumberToBeRolled < 1 ifTrue: [
		Error signal: 'LoadedDie sides cannot be negative or zero' ].

	^ self new initializeWithNumberToRoll: aNumberToBeRolled
]

{ #category : 'initialization' }
LoadedDie >> initializeWithNumberToRoll: aNumberToBeRolled [ 
numberToRoll:= aNumberToBeRolled.
]

{ #category : 'as yet unclassified' }
LoadedDie >> numberToBeRolled [
	^ numberToRoll.
]

{ #category : 'as yet unclassified' }
LoadedDie >> roll [
	^ numberToRoll.
]
