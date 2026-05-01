Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'boardSize',
		'collectionOfShips'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Board class >> withSize: aNumberOfSquares [

	aNumberOfSquares isInteger ifFalse: [
		Error signal: 'Board size cannot be other than integer' ].
	aNumberOfSquares < 1 ifTrue: [
		Error signal: 'Board size cannot be negative or zero' ].

	^ self new initializeWithSize: aNumberOfSquares
]

{ #category : 'as yet unclassified' }
Board class >> withSize: aBoardSize andShips: aCollectionOfShips [ 
	^ (self new) initializeWithSize: aBoardSize andShips: aCollectionOfShips. 
]

{ #category : 'adding' }
Board >> addShip: aShipToBeAdded [ 
collectionOfShips add: aShipToBeAdded.
]

{ #category : 'as yet unclassified' }
Board >> getAmountOfShips [
^collectionOfShips size.
]

{ #category : 'as yet unclassified' }
Board >> getSize [
	^ boardSize .
]

{ #category : 'initialization' }
Board >> initializeWithSize: aNumberOfSquares [ 
boardSize:= aNumberOfSquares. 
collectionOfShips:= OrderedCollection new.
]

{ #category : 'initialization' }
Board >> initializeWithSize: aBoardSize andShips: aCollectionOfShips [ 
boardSize:= aBoardSize.
collectionOfShips:= aCollectionOfShips.
]
