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

aDiceSet := DiceSet withDice: (OrderedCollection with: aDie with: aSecondDie). 


self assert: aDiceSet getNumberOfDice equals: 2. 
]
