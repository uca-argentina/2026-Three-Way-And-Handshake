Class {
	#name : 'BoardFactory',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
BoardFactory class >> createABoardOf: aBoardSize [

	| squares aSquaresDictionary |
	squares := OrderedCollection new.

	aBoardSize * 20 // 100 timesRepeat: [ squares add: WormHole new ].
	aBoardSize * 20 // 100 timesRepeat: [ squares add: SpeedUp new ].
	aBoardSize * 10 // 100 timesRepeat: [
		squares add: (MoonWalk lasts: 1) ].
	aBoardSize * 8 // 100 timesRepeat: [
		squares add: (HyperJump skipping: #( 3 2 1 )) ].
	aBoardSize * 2 // 100 timesRepeat: [ squares add: AtomicBomb new ].

	aBoardSize - squares size timesRepeat: [
		squares add: SimpleSquare new ].

	squares := squares shuffled.

	aSquaresDictionary := Dictionary new.
	squares doWithIndex: [ :square :index |
			(square isKindOf: SimpleSquare) ifFalse: [
				aSquaresDictionary at: index put: square ] ].

	^ Board withSize: aBoardSize and: aSquaresDictionary
]

{ #category : 'as yet unclassified' }
BoardFactory class >> createABoardOf: aBoardSize withMoonWalkValues: aMoonWalkValues withHyperJumpValues: aHyperJumpValues [

	| squares aSquaresDictionary |
	squares := OrderedCollection new.

	aBoardSize * 20 // 100 timesRepeat: [ squares add: WormHole new ].
	aBoardSize * 20 // 100 timesRepeat: [ squares add: SpeedUp new ].

	aMoonWalkValues do: [ :value | squares add: (MoonWalk lasts: value) ].
	aHyperJumpValues do: [ :valuesList |
		squares add: (HyperJump skipping: valuesList) ].

	aBoardSize * 2 // 100 timesRepeat: [ squares add: AtomicBomb new ].

	aBoardSize - squares size timesRepeat: [
		squares add: SimpleSquare new ].

	squares := squares shuffled.

	aSquaresDictionary := Dictionary new.
	squares doWithIndex: [ :square :index |
			(square isKindOf: SimpleSquare) ifFalse: [
				aSquaresDictionary at: index put: square ] ].

	^ Board withSize: aBoardSize and: aSquaresDictionary
]
