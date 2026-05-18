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


self assert: aDiceSet numberOfDice equals: 1.
]

{ #category : 'tests' }
DiceSetTest >> test002WhenADiceSetIsCreatedWithMDiceThenItHasMDice [

	| aDiceSet aDie aSecondDie |
	aDie := Die withSides: 6.
	aSecondDie := Die withSides: 6.

	aDiceSet := DiceSet withDice:
		            (OrderedCollection with: aDie with: aSecondDie).


	self assert: aDiceSet numberOfDice equals: 2
]

{ #category : 'tests' }
DiceSetTest >> test003WhenADiceSetIsRolledThenTheResultIsTheSumOfEachDieRoll [

	| aDiceSet aFirstLoadedDie aSecondLoadedDie |
	aFirstLoadedDie := LoadedDie mustRoll: #( 3 ).
	aSecondLoadedDie := LoadedDie mustRoll: #( 4 ).

	aDiceSet := DiceSet withDice:
		            (OrderedCollection
			             with: aFirstLoadedDie
			             with: aSecondLoadedDie).


	self assert: aDiceSet roll equals: 7
]

{ #category : 'tests' }
DiceSetTest >> test004WhenADiceSetIsEmptyThenItCannotBeTossed [

	| aDiceSet |
	
	self
		should: [aDiceSet := DiceSet withDice: OrderedCollection new. ]
		raise: Error
		withExceptionDo: [ :error |
				self
					assert: error messageText
					equals: 'A dice set cannot be tossed when is empty' ]
]
