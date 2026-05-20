Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'squares',
		'lengthInParsecs'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Board class >> assertPositiveSize: aBoardSize [

	aBoardSize < 1 ifTrue: [
		Error signal: 'Board size cannot be negative or zero' ]
]

{ #category : 'instance creation' }
Board class >> called: aBoardSize [

	aBoardSize isInteger ifFalse: [
		Error signal: 'Board size cannot be other than integer' ]
]

{ #category : 'instance creation' }
Board class >> withSize: aBoardSize [

	| aSquaresDictionary |
	self called: aBoardSize.
	self assertPositiveSize: aBoardSize.
	
	aSquaresDictionary := Dictionary new.

	^ self withSize: aBoardSize and: aSquaresDictionary .
]

{ #category : 'as yet unclassified' }
Board class >> withSize: aBoardSize and: aSquaresDictionary [

	^ self
		  withSize: aBoardSize
		  lengthInParsecs: aBoardSize
		  and: aSquaresDictionary
]

{ #category : 'as yet unclassified' }
Board class >> withSize: aBoardSize and: anAnomaly on: aPosition [
	
	
	| aSquaresDictionary |
	aSquaresDictionary := Dictionary new.
	aSquaresDictionary at: aPosition put: anAnomaly .

	^ self withSize: aBoardSize and: aSquaresDictionary .

]

{ #category : 'as yet unclassified' }
Board class >> withSize: aBoardSize lengthInParsecs: aLengthInParsecs and: aSquaresDictionary [

	^ self new
		  initializeWithSize: aBoardSize
		  lengthInParsecs: aLengthInParsecs
		  and: aSquaresDictionary
]

{ #category : 'as yet unclassified' }
Board >> countSquaresOfType: aSquareType [ 
	| count |
    count := 0.
    1 to: self size do: [ :i |
        ((self squareAt: i) isKindOf: aSquareType) 
            ifTrue: [ count := count + 1 ]
    ].
    ^ count
]

{ #category : 'initialization' }
Board >> initializeWithSize: aBoardSize and: aSquaresDictionary [

	squares := OrderedCollection new: aBoardSize withAll: SimpleSquare new.
    aSquaresDictionary keysAndValuesDo: [ :position :square |
        squares at: position put: square ]
]

{ #category : 'initialization' }
Board >> initializeWithSize: aBoardSize lengthInParsecs: aLengthInParsecs and: aSquaresDictionary [

	
		lengthInParsecs := aLengthInParsecs.
		squares := OrderedCollection
			           new: aBoardSize
			           withAll: SimpleSquare new.
		aSquaresDictionary keysAndValuesDo: [ :position :square |
			squares at: position put: square ] 
]

{ #category : 'as yet unclassified' }
Board >> parsecsToSquares: amountOfParsecs [
	

	^ amountOfParsecs * self size // lengthInParsecs
]

{ #category : 'as yet unclassified' }
Board >> simpleSquareCount [

	| count |
	count := 0.
	1 to: self size do: [ :i |
			((self squareAt: i) isKindOf: SimpleSquare) ifTrue: [
				count := count + 1 ] ].
	^ count
]

{ #category : 'as yet unclassified' }
Board >> size [
	^ squares size.
]

{ #category : 'as yet unclassified' }
Board >> squareAt: aSquare [ 
	^ (squares at: aSquare).
]
