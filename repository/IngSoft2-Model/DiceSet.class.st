Class {
	#name : 'DiceSet',
	#superclass : 'Object',
	#instVars : [
		'dice'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'asserting' }
DiceSet class >> assertNotEmpty: aDieCollection [

	aDieCollection isEmpty ifTrue: [
		Error signal: 'A dice set cannot be tossed when is empty' ]
]

{ #category : 'as yet unclassified' }
DiceSet class >> withDice: aDieCollection [

	self assertNotEmpty: aDieCollection.
	
	^(self new) initializeWithDice: aDieCollection
]

{ #category : 'as yet unclassified' }
DiceSet >> assertNotEmpty [

	dice isEmpty ifTrue: [
		Error signal: 'A dice set cannot be tossed when is empty' ]
]

{ #category : 'initialization' }
DiceSet >> initializeWithDice: aDieCollection [ 
	dice := aDieCollection.
]

{ #category : 'as yet unclassified' }
DiceSet >> numberOfDice [ 
	^dice size
]

{ #category : 'as yet unclassified' }
DiceSet >> roll [
	| diceRollResult |

	diceRollResult := (dice collect: [ :die | die roll ]) sum.
	^ diceRollResult
]
