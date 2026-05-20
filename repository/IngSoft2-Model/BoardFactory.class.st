Class {
	#name : 'BoardFactory',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
BoardFactory class >> createABoardOf: aBoardSize [ 
    | aSquaresDictionary |
    aSquaresDictionary := Dictionary new.
    1 to: aBoardSize * 20 // 100 do: [ :i | aSquaresDictionary at: i put: WormHole new ].
    (aBoardSize * 20 // 100 + 1) to: aBoardSize * 40 // 100 do: [ :i | aSquaresDictionary at: i put: SpeedUp new ].
    (aBoardSize * 40 // 100 + 1) to: aBoardSize * 50 // 100 do: [ :i | aSquaresDictionary at: i put: (MoonWalk lasts: 1) ].
    (aBoardSize * 50 // 100 + 1) to: aBoardSize * 58 // 100 do: [ :i | aSquaresDictionary at: i put: (HyperJump skipping: #(3 2 1)) ].
    (aBoardSize * 58 // 100 + 1) to: aBoardSize * 60 // 100 do: [ :i | aSquaresDictionary at: i put: AtomicBomb new ].
    ^ Board withSize: aBoardSize and: aSquaresDictionary
]

{ #category : 'as yet unclassified' }
BoardFactory class >> createABoardOf: aBoardSize withMoonWalkValues: aMoonWalkValues withHyperJumpValues: aHyperJumpValues [

	| aSquaresDictionary |
	aSquaresDictionary := Dictionary new.
	
	1 to: aBoardSize * 20 // 100 do: [ :i |
	aSquaresDictionary at: i put: WormHole new ].

	aBoardSize * 20 // 100 + 1 to: aBoardSize * 40 // 100 do: [ :i |
	aSquaresDictionary at: i put: SpeedUp new ].

	aMoonWalkValues doWithIndex: [ :value :index |
    aSquaresDictionary at: (aBoardSize * 40 // 100 + index) put: (MoonWalk lasts: value) ].

	aHyperJumpValues doWithIndex: [ :value :index |
    aSquaresDictionary at: (aBoardSize * 50 // 100 + index) put: (HyperJump skipping: value) ].

	aBoardSize * 58 // 100 + 1 to: aBoardSize * 60 // 100 do: [ :i |
	aSquaresDictionary at: i put: AtomicBomb new ].

	^ Board withSize: aBoardSize and: aSquaresDictionary
]
