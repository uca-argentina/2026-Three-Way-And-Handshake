Class {
	#name : 'LoadedDie',
	#superclass : 'Object',
	#instVars : [
		'numberToRoll',
		'setOfRolls',
		'index'
	],
	#classInstVars : [
		'numberToRoll'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
LoadedDie class >> mustRoll: aSetOfRolls [

	aSetOfRolls do: [ :aNumberToBeRolled |
			aNumberToBeRolled isInteger ifFalse: [
				Error signal: 'LoadedDie sides cannot be other than integer type' ] ].
		
		
	aSetOfRolls do: [ :aNumberToBeRolled |
			aNumberToBeRolled < 1 ifTrue: [
				Error signal: 'LoadedDie sides cannot be negative or zero' ] ].

	^ self new initializeWithMustRoll: aSetOfRolls
]

{ #category : 'initialization' }
LoadedDie >> initializeWithMustRoll: aSetOfRolls [ 
setOfRolls:= aSetOfRolls.
index := 0.
]

{ #category : 'as yet unclassified' }
LoadedDie >> roll [

	index := index + 1.
	^setOfRolls at: index.
]

{ #category : 'as yet unclassified' }
LoadedDie >> rollsToBeRolled [
	^ setOfRolls .
]
