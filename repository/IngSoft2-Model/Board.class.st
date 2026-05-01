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
^ (aShip getPosition).
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
Board >> moveShip: aShip toPosition: aPosition [ 
"HABRIA QUE VALIDAR QUE LA NAVE ESTE JUGANDO DENTRO DE ESTE TABLERO, ES DECRI QUE LA NAVE SEA UN JUGADOR REGISTRADO"
"HABRIA QUE VALIDAR QUE LA POSITION ES VALIDA DENTRO DEL TABLERO"
aShip setPositionTo: aPosition.
]
