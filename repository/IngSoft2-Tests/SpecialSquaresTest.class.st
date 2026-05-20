Class {
	#name : 'SpecialSquaresTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
SpecialSquaresTest >> test001WhenAShipRollsADieAndTheOutcomeIs5ThenItMoves5Positions [

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
SpecialSquaresTest >> test002WhenAShipLandsOnAWormholeThenItFallsBackwards4Squares [

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
SpecialSquaresTest >> test003WhenAShipLandsOnASpeedUpThenItLands4SquaresForward [

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
SpecialSquaresTest >> test004WhenEveryoneJumpsToSquare3ThenAPlayerLandsOnMoonWalkThenEveryoneFallsbackANumberOfSquaresN [

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
SpecialSquaresTest >> test005WhenAShipLandsOnAHyperJumpThenItLands3ParsecsForward [

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
SpecialSquaresTest >> test006WhenAShipLandsOnAHyperJumpForTheSecondTimeThenItLands2ParsecsForward [

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
SpecialSquaresTest >> test007WhenAShipLandsOnAtomicThenEveryShipFallsBackToSquare1 [

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
SpecialSquaresTest >> test008WhenAShipLandsOnAtomicThenEveryShipFallsBackToSquare1AndKeepsTheSameAmountOfLaps [

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

	aGame play.
	aGame play.

	self assert: (aGame squareOf: aFirstShip) equals: 2.
	self assert: (aGame lapOf: aFirstShip) equals: 1.

	aGame play.

	self assert: (aGame squareOf: aFirstShip) equals: 1.
	self assert: (aGame lapOf: aFirstShip) equals: 1
]

{ #category : 'running' }
SpecialSquaresTest >> test009WhenASpeedUpSendsAShipToAnotherSpecialSquareThenItDoesNotTriggerASecondEffect [

	| aGame aFirstShip aCollectionOfShips aBoard aLoadedDie aDiceSet aSquaresDictionary |
	aFirstShip := Ship withName: 'Luke'.
	
	aCollectionOfShips := OrderedCollection with: aFirstShip.
	aSquaresDictionary := Dictionary new.
	aSquaresDictionary at: 5 put: SpeedUp new .
	aSquaresDictionary at: 1 put: SpeedUp new.
	aBoard := Board withSize: 10 and: aSquaresDictionary.
	aLoadedDie := LoadedDie mustRoll: #( 1 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).
	aGame := Game
		         playedOn: aBoard
		         by: aCollectionOfShips
		         throwing: aDiceSet.
	aGame play.
	self assert: (aGame squareOf: aFirstShip) equals: 5
]

{ #category : 'running' }
SpecialSquaresTest >> test010WhenAShipLandsOnASpeedUpAndItLandsOnAMoonWalkThenTheSecondEffectDoesNotApply [

	| aGame aFirstShip aCollectionOfShips aBoard aLoadedDie aDiceSet aSecondShip aSquaresDictionary |
	aFirstShip := Ship withName: 'Michael Jackson the MoonWalker'.
	aSecondShip := Ship withName: 'Anakin'.

	aCollectionOfShips := OrderedCollection with: aFirstShip.
	aCollectionOfShips add: aSecondShip.
	
	aSquaresDictionary := Dictionary new.
	aSquaresDictionary at: 6 put: (MoonWalk lasts: 1).
	aSquaresDictionary at: 2 put: SpeedUp new.
	aBoard := Board withSize: 10 and: aSquaresDictionary.

	aLoadedDie := LoadedDie mustRoll: #( 1 2 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).

	aGame := Game
		         playedOn: aBoard
		         by: aCollectionOfShips
		         throwing: aDiceSet.

	aGame play.
	aGame play.

	self assert: (aGame squareOf: aSecondShip) equals: 6.
	self assert: (aGame squareOf: aFirstShip) equals: 1.
]

{ #category : 'running' }
SpecialSquaresTest >> test011WhenABoardWith40SimpleSquaresIsCreatedThenItHas40 [

	| aBoard |
	
	aBoard := BoardFactory createABoardOf: 100.
	
	self assert: (aBoard countSquaresOfType: SimpleSquare) equals: 40.
]

{ #category : 'running' }
SpecialSquaresTest >> test012WhenABoardWith100SquaresIsCreatedThenTheProportionsAreCorrect [

	| aBoard |
	aBoard := BoardFactory createABoardOf: 100.

	self assert: (aBoard countSquaresOfType: SimpleSquare) equals: 40.
	self assert: (aBoard countSquaresOfType: WormHole) equals: 20.
	self assert: (aBoard countSquaresOfType: SpeedUp) equals: 20.
	self assert: (aBoard countSquaresOfType: MoonWalk) equals: 10.
	self assert: (aBoard countSquaresOfType: HyperJump) equals: 8.
	self assert: (aBoard countSquaresOfType: AtomicBomb) equals: 2
]

{ #category : 'running' }
SpecialSquaresTest >> test013WhenABoardIsCreatedWithFactoryWithMoonWalkAndHyperJumpValuesThenItHasTheCorrectDistribution [
    | aBoard |
    aBoard := BoardFactory 
        createABoardOf: 100 
        withMoonWalkValues: #(1 2 3 1 2 1 3 2 1 2)
        withHyperJumpValues: #(#(3 2 1) #(5 4) #(2 1) #(4 3 2) #(1) #(3 2) #(5 4 3) #(2 1)).
    self assert: (aBoard countSquaresOfType: MoonWalk) equals: 10.
    self assert: (aBoard countSquaresOfType: HyperJump) equals: 8.
]
