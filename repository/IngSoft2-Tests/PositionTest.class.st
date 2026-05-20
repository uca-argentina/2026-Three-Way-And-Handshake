Class {
	#name : 'PositionTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
PositionTest >> test001WhenAPositionIsCreatedAtLap0Square0ThenLapIs0AndSquareIs0 [

	| aPosition |
	aPosition := Position atLap: 0 square: 0.

	self assert: aPosition lap equals: 0.
	self assert: aPosition square equals: 0
]

{ #category : 'tests' }
PositionTest >> test002WhenAPositionAtSquare2AdvancesBy3OnABoardOfSize10ThenItIsAtSquare5 [

	| aPosition newPosition |
	aPosition := Position atLap: 0 square: 2.

	newPosition := aPosition advancedBy: 3 onBoardOfSize: 10.

	self assert: newPosition square equals: 5.
	self assert: newPosition lap equals: 0
]

{ #category : 'tests' }
PositionTest >> test003WhenAPositionAtSquare8AdvancesBy5OnABoardOfSize10ThenItCrossesToNextLap [

	| aPosition newPosition |
	aPosition := Position atLap: 0 square: 8.

	newPosition := aPosition advancedBy: 5 onBoardOfSize: 10.

	self assert: newPosition square equals: 3.
	self assert: newPosition lap equals: 1.
]

{ #category : 'tests' }
PositionTest >> test004WhenAPositionGoesBackwardsBelowZeroThenItStaysAtLapZeroSquareZero [

	| aPosition newPosition |
	aPosition := Position atLap: 0 square: 2.

	newPosition := aPosition advancedBy: -5 onBoardOfSize: 10.

	self assert: newPosition lap equals: 0.
	self assert: newPosition square equals: 0
]
