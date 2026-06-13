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
BoardFactory class >> assertValidProbabilities: aDictionaryOfSquaresAndProbabilities [

	| totalSum |
	totalSum := aDictionaryOfSquaresAndProbabilities values sum.
	
	totalSum = 100 ifFalse: [ 
		Error signal: ('The sum of all probabilities must be 100%, but it was {1}%' format: { totalSum }) 
	]
]

{ #category : 'asserting' }
BoardFactory class >> assertValidSize: aBoardSize [

	aBoardSize isInteger ifFalse: [
		Error signal: 'Board size cannot be other than integer' ].
	aBoardSize < 1 ifTrue: [
		Error signal: 'Board size cannot be negative or zero' ]
]

{ #category : 'as yet unclassified' }
BoardFactory class >> buildBoardOf: aBoardSize from: squares [

	| aSquaresDictionary |
	aSquaresDictionary := Dictionary new.
	squares doWithIndex: [ :square :index |
			square isDefaultSquare ifFalse: [
				aSquaresDictionary at: index put: square ] ].

	^ Board withSize: aBoardSize and: aSquaresDictionary
]

{ #category : 'as yet unclassified' }
BoardFactory class >> createABoardOf: aBoardSize [

	| squares |
	self assertValidSize: aBoardSize.
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
BoardFactory class >> createABoardOf: aBoardSize shapingTheFabricWith: aDictionaryOfSquaresAndProbabilities [
	"NOTA: No estamso agregando al board instancias configuradas. Si podemos agregar objetos new pero que no usan nuestros initialize, es decir, instancias basiconas. Es relevante para el nivel de profundidad de este tp ? tiene un arreglo facil pero deberia asumir como son las instancias, caso contrario hacer otro metodo el cual reciba instancias configuradas, la diferencia con este seria minima. Simplemente habria que sacar el new dentro del ciclo pero bueno. No parece tan necesario ya que el testeo dentro de este game va a ser poco. -G"

	| arrayOfProbability squares |
	self assertValidSize: aBoardSize.
	self assertValidProbabilities: aDictionaryOfSquaresAndProbabilities.
	
	arrayOfProbability := self shapeArrayOfProbability: aDictionaryOfSquaresAndProbabilities.
	squares := OrderedCollection new.

	aBoardSize timesRepeat: [
		squares add: (arrayOfProbability at: ((1 to: 100) atRandom)) ].
	
	^ self buildBoardOf: aBoardSize from: squares
]

{ #category : 'as yet unclassified' }
BoardFactory class >> createABoardOf: aBoardSize withMoonWalkValues: aMoonWalkValues withHyperJumpValues: aHyperJumpValues [

	| squares |
	self assertValidSize: aBoardSize.
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

{ #category : 'as yet unclassified' }
BoardFactory class >> howMuchOf: aSquareType appearsIn: aBoard [

	| occurrences |
	occurrences := 0.

	1 to: aBoard size do: [ :index |
			| currentSquare |
			currentSquare := aBoard squareAt: index.

			"Quitamos el .class a aSquareType porque ya es una clase"
			currentSquare class = aSquareType ifTrue: [
				occurrences := occurrences + 1 ] ].

	^ occurrences asFloat / aBoard size * 100
]

{ #category : 'as yet unclassified' }
BoardFactory class >> shapeArrayOfProbability: aDictionaryOfSquaresAndProbabilities [

	| arrayOfProbability |
	arrayOfProbability := OrderedCollection new.
	aDictionaryOfSquaresAndProbabilities keysAndValuesDo: [
		:squareType
		:amount |
		amount timesRepeat: [ arrayOfProbability add: squareType new ] ].

	^ arrayOfProbability
]
