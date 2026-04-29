Class {
	#name : 'LoadedDieTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
LoadedDieTest >> test001WhenALoadedDieIsSetToRoll5TheValueIsSet [

| aLoadedDie |
aLoadedDie:= LoadedDie mustRoll: 5.

self assert: aLoadedDie numberToBeRolled equals: 5.


]

{ #category : 'tests' }
LoadedDieTest >> test002WhenALoadedDieIsSetToRoll5ItRolls5 [

| aLoadedDie |
aLoadedDie:= LoadedDie mustRoll: 5.

self assert: aLoadedDie roll equals: 5.


]

{ #category : 'tests' }
LoadedDieTest >> test003WhenTheLoadedDieIsSetToRollNegativeNumberThenClassCannotBeInstantiated [

self
		should: [ LoadedDie mustRoll: -1 ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'LoadedDie sides cannot be negative or zero']
]

{ #category : 'tests' }
LoadedDieTest >> test004WhenTheLoadedDieIsSetToRollOtherThanIntegerThenClassCannotBeInstantiated [

self
		should: [ LoadedDie mustRoll: 'b' ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'LoadedDie sides cannot be other than integer type']
]
