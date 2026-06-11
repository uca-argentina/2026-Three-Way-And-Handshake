Class {
	#name : 'BoardFactory',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
BoardFactory class >> addAtomicBombsTo: squares for: aBoardSize [

	aBoardSize * 2 // 100 timesRepeat: [ squares add: AtomicBomb new ]
]

{ #category : 'as yet unclassified' }
BoardFactory class >> addCardSquaresTo: squares for: aBoardSize [

	aBoardSize * 10 // 100 timesRepeat: [ squares add: CardSquare new ]
]

{ #category : 'as yet unclassified' }
BoardFactory class >> addHyperJumpsTo: squares for: aBoardSize [

	aBoardSize * 8 // 100 timesRepeat: [
		squares add: (HyperJump skipping: #( 3 2 1 )) ]
]

{ #category : 'as yet unclassified' }
BoardFactory class >> addHyperJumpsTo: squares withValues: aHyperJumpValues [

	aHyperJumpValues do: [ :valuesList |
		squares add: (HyperJump skipping: valuesList) ]
]

{ #category : 'as yet unclassified' }
BoardFactory class >> addMoonWalksTo: squares for: aBoardSize [

	aBoardSize * 10 // 100 timesRepeat: [
		squares add: (MoonWalk lasts: 1) ]
]

{ #category : 'as yet unclassified' }
BoardFactory class >> addMoonWalksTo: squares withValues: aMoonWalkValues [

	aMoonWalkValues do: [ :value | squares add: (MoonWalk lasts: value) ]
]

{ #category : 'as yet unclassified' }
BoardFactory class >> addSpeedUpsTo: squares for: aBoardSize [

	aBoardSize * 20 // 100 timesRepeat: [ squares add: SpeedUp new ]
]

{ #category : 'as yet unclassified' }
BoardFactory class >> addWormholesTo: squares for: aBoardSize [

	aBoardSize * 20 // 100 timesRepeat: [ squares add: WormHole new ]
]

{ #category : 'as yet unclassified' }
BoardFactory class >> buildBoardOf: aBoardSize from: squares [

	| aSquaresDictionary |
	aSquaresDictionary := Dictionary new.
	squares doWithIndex: [ :square :index |
			(square isKindOf: SimpleSquare) ifFalse: [
				aSquaresDictionary at: index put: square ] ].

	^ Board withSize: aBoardSize and: aSquaresDictionary
]

{ #category : 'as yet unclassified' }
BoardFactory class >> createABoardOf: aBoardSize [

	| squares |
	squares := OrderedCollection new.
	self addWormholesTo: squares for: aBoardSize.
	self addCardSquaresTo: squares for: aBoardSize.
	self addSpeedUpsTo: squares for: aBoardSize.
	self addMoonWalksTo: squares for: aBoardSize.
	self addHyperJumpsTo: squares for: aBoardSize.
	self addAtomicBombsTo: squares for: aBoardSize.

	self fillWithSimpleSquares: squares upTo: aBoardSize.

	squares := squares shuffled.
	^ self buildBoardOf: aBoardSize from: squares
]

{ #category : 'as yet unclassified' }
BoardFactory class >> createABoardOf: aBoardSize withMoonWalkValues: aMoonWalkValues withHyperJumpValues: aHyperJumpValues [

	| squares |
	squares := OrderedCollection new.
	self addWormholesTo: squares for: aBoardSize.
	self addSpeedUpsTo: squares for: aBoardSize.
	self addMoonWalksTo: squares withValues: aMoonWalkValues.
	self addHyperJumpsTo: squares withValues: aHyperJumpValues.
	self addAtomicBombsTo: squares for: aBoardSize.
	self fillWithSimpleSquares: squares upTo: aBoardSize.
	squares := squares shuffled.
	^ self buildBoardOf: aBoardSize from: squares
]

{ #category : 'as yet unclassified' }
BoardFactory class >> fillWithSimpleSquares: squares upTo: aBoardSize [

	aBoardSize - squares size timesRepeat: [
		squares add: SimpleSquare new ]
]
