Class {
	#name : 'PlayerTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
PlayerTest >> test001WhenThePlayerIsInitializedWithNameGianniThenNameIsGianni [

| aPlayer |
aPlayer := Player withName: 'Gianni'.

self assert: aPlayer getName equals: 'Gianni'.
]

{ #category : 'running' }
PlayerTest >> test002WhenThePlayerIsSetWithNameOtherThanStringThenCannotBeInstantiated [

	self
		should: [ Player withName: 1 ]
		raise: Error
		withExceptionDo: [ :error |
				self
					assert: error messageText
					equals: 'Player name cannot be other than string type' ]
]

{ #category : 'running' }
PlayerTest >> test003WhenAPlayerIsGivenAShipThenCanAccessToItsProperties [

| aShip aPlayer |
aShip:= Ship withId: 1.

aPlayer:= Player withName: 'Gianni' andShip: aShip.

self assert: aPlayer getShipId equals: 1.
]

{ #category : 'running' }
PlayerTest >> test004WhenAPlayerIsGivenOtherThanShipTypeThenPlayerCannotBeInstantiated [

	self
		should: [ Player withName: 'Gianni' andShip: 1234]
		raise: Error
		withExceptionDo: [ :error |
				self
					assert: error messageText
					equals: 'Player ship cannot be other than Ship type' ]
]
