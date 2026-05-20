Class {
	#name : 'BoardFactory',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'adding' }
BoardFactory class >> addAtomicBombsTo: aSquaresDictionary of: aBoardSize [
	
	aBoardSize * 58 // 100 + 1 to: aBoardSize * 60 // 100 do: [ :i |
	aSquaresDictionary at: i put: AtomicBomb new ].
]

{ #category : 'adding' }
BoardFactory class >> addHyperJumpsTo: aSquaresDictionary of: aBoardSize with: aHyperJumpValues [
	aHyperJumpValues doWithIndex: [ :value :index |
    aSquaresDictionary at: (aBoardSize * 50 // 100 + index) put: (HyperJump skipping: value) ].
]

{ #category : 'adding' }
BoardFactory class >> addMoonWalksTo: aSquaresDictionary of: aBoardSize with: aMoonWalkValues [

	aMoonWalkValues doWithIndex: [ :value :index |
    aSquaresDictionary at: (aBoardSize * 40 // 100 + index) put: (MoonWalk lasts: value) ].
]

{ #category : 'adding' }
BoardFactory class >> addSpeedUpsTo: aSquaresDictionary of: aBoardSize [

	aBoardSize * 20 // 100 + 1 to: aBoardSize * 40 // 100 do: [ :i |
	aSquaresDictionary at: i put: SpeedUp new ]
]

{ #category : 'adding' }
BoardFactory class >> addWormHolesTo: aSquaresDictionary of: aBoardSize [

	1 to: aBoardSize * 20 // 100 do: [ :i |
	aSquaresDictionary at: i put: WormHole new ].
]

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
	
	
	self addWormHolesTo: aSquaresDictionary of: aBoardSize.

	self addSpeedUpsTo: aSquaresDictionary of: aBoardSize.

	self addMoonWalksTo: aSquaresDictionary of: aBoardSize with: aMoonWalkValues.
	
	self addHyperJumpsTo: aSquaresDictionary of: aBoardSize with: aHyperJumpValues.

	self addAtomicBombsTo: aSquaresDictionary of: aBoardSize.

	

	^ Board withSize: aBoardSize and: aSquaresDictionary
]
