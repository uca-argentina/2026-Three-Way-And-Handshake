Class {
	#name : 'BoardFactory',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

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
BoardFactory class >> createABoardOf: aBoardSize shapingTheFabricWith: aDictionaryOfSquaresAndProbabilities [

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
		amount timesRepeat: [ arrayOfProbability add: squareType new ] ]. "SACAR ESTE NEW SI DECIDIMOS PASAR INSTANCIAS"

	^ arrayOfProbability
]
