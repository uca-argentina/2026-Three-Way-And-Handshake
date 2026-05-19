Class {
	#name : 'Position',
	#superclass : 'Object',
	#instVars : [
		'lap',
		'square'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
Position class >> atLap: aLap square: aSquare [

	^ self new initializeAtLap: aLap square: aSquare
]

{ #category : 'as yet unclassified' }
Position >> advancedBy: aNumberOfSquares onBoardOfSize: aBoardSize [

	| totalSquares newLap newSquare |
	totalSquares := square + aNumberOfSquares.
	newLap := lap + (totalSquares // aBoardSize).
	newSquare := totalSquares \\ aBoardSize.
	^ Position atLap: newLap square: newSquare
]

{ #category : 'initialization' }
Position >> initializeAtLap: aLap square: aSquare [

	lap := aLap.
	square := aSquare
]

{ #category : 'accessing' }
Position >> lap [

	^ lap
]

{ #category : 'accessing' }
Position >> square [

	^ square
]
