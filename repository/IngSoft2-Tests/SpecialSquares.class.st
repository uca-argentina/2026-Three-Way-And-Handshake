Class {
	#name : 'SpecialSquares',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
SpecialSquares >> test001WhenAShipRollsADieAndTheOutcomeIs5ThenItMoves5Positions [

"Este test esta copiado exactamente de game pero nos va a ayudar a testear la funcionalidad de cada uno de los distintos cuadrados disponibles"
	| aGame aFirstShip aCollectionOfShips aBoard aLoadedDie aDiceSet |
	aFirstShip := Ship withName: 'Luke'.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 10.

	aLoadedDie := LoadedDie mustRoll: #( 5 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).

	aGame := Game
		         playedOn: aBoard
		         by: aCollectionOfShips
		         throwing: aDiceSet.

	aGame play.

	self assert: (aGame squareOf: aFirstShip) equals: 5.
	self assert: (aGame lapOf: aFirstShip) equals: 0
]

{ #category : 'running' }
SpecialSquares >> test002 [

	| aGame aFirstShip aCollectionOfShips aBoard aLoadedDie aDiceSet |
	aFirstShip := Ship withName: 'Luke'.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 10 and: WormHole new on: 5.

	aLoadedDie := LoadedDie mustRoll: #( 5 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).

	aGame := Game
		         playedOn: aBoard
		         by: aCollectionOfShips
		         throwing: aDiceSet.

	aGame play.

	self assert: (aGame squareOf: aFirstShip) equals: 1.
]
