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
SpecialSquares >> test002WhenAShipLandsOnAWormholeThenItFallsBackwards4Squares [

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

{ #category : 'running' }
SpecialSquares >> test003WhenAShipLandsOnASpeedUpThenItLands4SquaresForward [

	| aGame aFirstShip aCollectionOfShips aBoard aLoadedDie aDiceSet |
	aFirstShip := Ship withName: 'Luke'.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 10 and: SpeedUp new on: 5.

	aLoadedDie := LoadedDie mustRoll: #( 5 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).

	aGame := Game
		         playedOn: aBoard
		         by: aCollectionOfShips
		         throwing: aDiceSet.

	aGame play.

	self assert: (aGame squareOf: aFirstShip) equals: 9.
]

{ #category : 'running' }
SpecialSquares >> test004WhenEveryoneJumpsToSquare3ThenAPlayerLandsOnMoonWalkThenEveryoneFallsbackANumberOfSquaresN [

	| aGame aFirstShip aCollectionOfShips aBoard aLoadedDie aDiceSet aSecondShip aThirdShip|
	aFirstShip := Ship withName: 'Michael Jackson the MoonWalker'.
	aSecondShip := Ship withName: 'Anakin'.
	aThirdShip := Ship withName: 'George Buttcheeks'.

	aCollectionOfShips := OrderedCollection with: aFirstShip.
	aCollectionOfShips add: aSecondShip.
	aCollectionOfShips add: aThirdShip.

	aBoard := Board withSize: 10 and: (MoonWalk lasts: 1) on: 6.

	aLoadedDie := LoadedDie mustRoll: #( 3 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).

	aGame := Game
		         playedOn: aBoard
		         by: aCollectionOfShips
		         throwing: aDiceSet.

	aGame play.
	aGame play.
	aGame play.
	aGame play.

	self assert: (aGame squareOf: aSecondShip) equals: 2.
	self assert: (aGame squareOf: aThirdShip) equals: 2.
]

{ #category : 'running' }
SpecialSquares >> test005WhenAShipLandsOnAHyperJumpThenItLands3ParsecsForward [

"parsecs != casilleros, cambiar implementacion"

	| aGame aFirstShip aCollectionOfShips aBoard aLoadedDie aDiceSet |
	aFirstShip := Ship withName: 'Luke'.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 10 and: (HyperJump skipping: #(3 2 1) ) on: 5.

	aLoadedDie := LoadedDie mustRoll: #( 5 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).

	aGame := Game
		         playedOn: aBoard
		         by: aCollectionOfShips
		         throwing: aDiceSet.

	aGame play.

	self assert: (aGame squareOf: aFirstShip) equals: 8.
]

{ #category : 'running' }
SpecialSquares >> test006WhenAShipLandsOnAHyperJumpForTheSecondTimeThenItLands2ParsecsForward [

	| aGame aFirstShip aCollectionOfShips aBoard aLoadedDie aDiceSet aSecondShip aThirdShip |
	aFirstShip := Ship withName: 'Luke'.
	aSecondShip := Ship withName: 'Anakin'.
	aThirdShip := Ship withName: 'George Buttcheeks'.

	aCollectionOfShips := OrderedCollection with: aFirstShip.
	aCollectionOfShips add: aSecondShip.
	aCollectionOfShips add: aThirdShip.

	aBoard := Board withSize: 10 and: (HyperJump skipping: #(3 2 1) ) on: 5.

	aLoadedDie := LoadedDie mustRoll: #( 5 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).

	aGame := Game
		         playedOn: aBoard
		         by: aCollectionOfShips
		         throwing: aDiceSet.

	aGame play.
	aGame play.
	aGame play.

	self assert: (aGame squareOf: aFirstShip) equals: 8.
	self assert: (aGame squareOf: aSecondShip) equals: 7.
	self assert: (aGame squareOf: aThirdShip) equals: 6.
	
]

{ #category : 'running' }
SpecialSquares >> test007WhenAShipLandsOnAtomicEveryoOtherShipFallsBackToSquare1 [

"Si quieren que las naves vuelvan al square 1 o 0 se cambia facil, la implementacion esta en el metodo de instancia everyoneBackToSquare1 dentro de game"
	| aGame aFirstShip aCollectionOfShips aBoard aLoadedDie aDiceSet aSecondShip aThirdShip |
	aFirstShip := Ship withName: 'Luke'.
	aSecondShip := Ship withName: 'Anakin'.
	aThirdShip := Ship withName: 'George Buttcheeks'.

	aCollectionOfShips := OrderedCollection with: aFirstShip.
	aCollectionOfShips add: aSecondShip.
	aCollectionOfShips add: aThirdShip.

	aBoard := Board withSize: 10 and: AtomicBomb new on: 5.

	aLoadedDie := LoadedDie mustRoll: #(4 1).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).

	aGame := Game
		         playedOn: aBoard
		         by: aCollectionOfShips
		         throwing: aDiceSet.

	aGame play.
	aGame play.
	aGame play.
	
	aGame play.

	self assert: (aGame squareOf: aFirstShip) equals: 1.
	self assert: (aGame squareOf: aSecondShip) equals: 1.
	self assert: (aGame squareOf: aThirdShip) equals: 1.
	
]

{ #category : 'running' }
SpecialSquares >> test008WhenAShipLandsOnAtomicEveryoOtherShipFallsBackToSquare1AndKeepsTheSameAmountOfLaps [
	"Si quieren que las naves vuelvan al square 1 o 0 se cambia facil, la implementacion esta en el metodo de instancia everyoneBackToSquare1 dentro de game"
	"refactorizar este test porfa, me quedo medio largo pero me quiero ir a dormir jefe"

	| aGame aFirstShip aCollectionOfShips aBoard aLoadedDie aDiceSet aSecondShip |
	aFirstShip := Ship withName: 'George Buttcheeks'.
	aSecondShip := Ship withName: 'Anakin'.

	aCollectionOfShips := OrderedCollection with: aFirstShip.
	aCollectionOfShips add: aSecondShip.

	aBoard := Board withSize: 10 and: AtomicBomb new on: 8.

	aLoadedDie := LoadedDie mustRoll: #( 6 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).

	aGame := Game
		         playedOn: aBoard
		         by: aCollectionOfShips
		         throwing: aDiceSet
		         winningAt: 3.

	aGame play.
	aGame play.

	self assert: (aGame squareOf: aFirstShip) equals: 6.
	self assert: (aGame lapOf: aFirstShip) equals: 0.

	self assert: (aGame squareOf: aFirstShip) equals: 6.
	self assert: (aGame lapOf: aFirstShip) equals: 0.

	aGame play.
	aGame play.

	self assert: (aGame squareOf: aFirstShip) equals: 2.
	self assert: (aGame lapOf: aFirstShip) equals: 1.

	self assert: (aGame squareOf: aFirstShip) equals: 2.
	self assert: (aGame lapOf: aFirstShip) equals: 1.

	aGame play.

	self assert: (aGame squareOf: aFirstShip) equals: 1.
	self assert: (aGame lapOf: aFirstShip) equals: 1.

	self assert: (aGame squareOf: aFirstShip) equals: 1.
	self assert: (aGame lapOf: aFirstShip) equals: 1
]
