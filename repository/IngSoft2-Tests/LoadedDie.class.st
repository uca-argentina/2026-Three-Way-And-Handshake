Class {
	#name : 'LoadedDie',
	#superclass : 'Object',
	#instVars : [
		'setOfRolls',
		'index'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
LoadedDie class >> assertPositiveSize: aSetOfRolls [
"Comentario de prueba"
	aSetOfRolls do: [ :aNumberToBeRolled |
			aNumberToBeRolled < 1 ifTrue: [
				Error signal: 'LoadedDie sides cannot be negative or zero' ] ]
]

{ #category : 'as yet unclassified' }
LoadedDie class >> called: aSetOfRolls [
"Comentario de prueba"
	aSetOfRolls do: [ :aNumberToBeRolled |
			aNumberToBeRolled isInteger ifFalse: [
				Error signal: 'LoadedDie sides cannot be other than integer type' ] ]
]

{ #category : 'as yet unclassified' }
LoadedDie class >> mustRoll: aSetOfRolls [
"Comentario de prueba"

	self called: aSetOfRolls.
	self assertPositiveSize: aSetOfRolls.

	^ self new initializeWithMustRoll: aSetOfRolls
]

{ #category : 'initialization' }
LoadedDie >> initializeWithMustRoll: aSetOfRolls [

	setOfRolls := aSetOfRolls.
	index := 0
]

{ #category : 'as yet unclassified' }
LoadedDie >> roll [

	index := index \\ setOfRolls size + 1.
	^ setOfRolls at: index
]
