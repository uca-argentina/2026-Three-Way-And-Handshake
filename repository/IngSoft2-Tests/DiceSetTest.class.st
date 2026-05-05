Class {
	#name : 'DiceSetTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
DiceSetTest >> test001WhenADiceSetIsCreatedWithADieThenItHasOneDie [ 

| aDiceSet aDie |

aDie := Die withSides: 6.
aDiceSet := DiceSet withDice: (OrderedCollection with: aDie). 


self assert: aDiceSet getNumberOfDice equals: 1.
]

{ #category : 'tests' }
DiceSetTest >> test002WhenADiceSetIsCreatedWithMDiceThenItHasMDice [

	| aDiceSet aDie aSecondDie |
	aDie := Die withSides: 6.
	aSecondDie := Die withSides: 6.

	aDiceSet := DiceSet withDice:
		            (OrderedCollection with: aDie with: aSecondDie).


	self assert: aDiceSet getNumberOfDice equals: 2
]

{ #category : 'tests' }
DiceSetTest >> test003WhenADiceSetWithBothDiceWith6SidesThenTheResultIsBetween1And12 [

	| aDiceSet aDie aSecondDie |
	aDie := Die withSides: 6.
	aSecondDie := Die withSides: 6.

	aDiceSet := DiceSet withDice:
		            (OrderedCollection with: aDie with: aSecondDie).


	self assert: (aDiceSet roll between: 1 and: 12)
]

{ #category : 'tests' }
DiceSetTest >> test004WhenADiceSetIsEmptyThenItCannotBeTossed [

	| aDiceSet |
	aDiceSet := DiceSet withDice: OrderedCollection new.
	self
		should: [ aDiceSet roll ]
		raise: Error
		withExceptionDo: [ :error |
				self
					assert: error messageText
					equals: 'A dice set cannot be tossed when is empty' ]
]
