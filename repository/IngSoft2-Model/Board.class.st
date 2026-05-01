Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'boardSize',
		'shipsDictionary'
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
shipsDictionary at: aShipToBeAdded put: 0.
]

{ #category : 'as yet unclassified' }
Board >> getAmountOfShips [
^ shipsDictionary size.
]

{ #category : 'as yet unclassified' }
Board >> getPositionOf: aShip [ 
^ (shipsDictionary at: aShip).
]

{ #category : 'as yet unclassified' }
Board >> getSize [
	^ boardSize .
]

{ #category : 'initialization' }
Board >> initializeWithSize: aNumberOfSquares [ 
boardSize:= aNumberOfSquares. 
shipsDictionary:= Dictionary new.
]

{ #category : 'initialization' }
Board >> initializeWithSize: aBoardSize andShips: aCollectionOfShips [ 
boardSize:= aBoardSize.
shipsDictionary:= Dictionary new.

aCollectionOfShips do: [:each | shipsDictionary at: each put: 0].
]

{ #category : 'as yet unclassified' }
Board >> isPositionBetweenLimits: aPosition [

aPosition <= boardSize ifFalse: [ Error signal: 'The Position is outside of limits' ].
]

{ #category : 'testing' }
Board >> isShipOnBoard: aShip [ 

(shipsDictionary includesKey: aShip) ifFalse: [Error signal: 'The Ship is not on board'].
]

{ #category : 'as yet unclassified' }
Board >> moveShip: aShip toPosition: aPosition [

self isShipOnBoard: aShip.
self isPositionBetweenLimits: aPosition.

self setPositionOf: aShip to: aPosition.
]

{ #category : 'initialization' }
Board >> setPositionOf: aShip to: aPosition [ 
	shipsDictionary at: aShip put: aPosition.
]
