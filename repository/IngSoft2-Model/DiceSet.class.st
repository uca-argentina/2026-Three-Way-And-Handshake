Class {
	#name : 'DiceSet',
	#superclass : 'Object',
	#instVars : [
		'dice'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
DiceSet class >> withDice: aDieCollection [
	
	^(self new) initializeWithDice: aDieCollection
]

{ #category : 'as yet unclassified' }
DiceSet >> aDiceSetCannotBeEmpty [

	dice isEmpty ifTrue: [
		Error signal: 'A dice set cannot be tossed when is empty' ]
]

{ #category : 'as yet unclassified' }
DiceSet >> getNumberOfDice [ 
	^dice size
]

{ #category : 'initialization' }
DiceSet >> initializeWithDice: aDieCollection [ 
	dice := aDieCollection.
]

{ #category : 'as yet unclassified' }
DiceSet >> toss [

	| diceRollResult |
	self aDiceSetCannotBeEmpty.

	diceRollResult := (dice collect: [ :die | die roll ]) sum.
	^ diceRollResult
]
