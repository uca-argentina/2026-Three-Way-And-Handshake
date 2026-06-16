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
	aThirdShip := Ship withName: 'Luke'.

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
	aThirdShip := Ship withName: 'Obi-Wan'.

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

	| aGame aFirstShip aCollectionOfShips aBoard aLoadedDie aDiceSet aSecondShip aThirdShip |
	aFirstShip := Ship withName: 'Luke'.
	aSecondShip := Ship withName: 'Anakin'.
	aThirdShip := Ship withName: 'Obi-Wan'.

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
	aFirstShip := Ship withName: 'Luke'.
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
SpecialSquaresTest >> test011WhenAShipLandsOnHyperJumpThenItMovesAnMAmountParsecs [

	| aGame aFirstShip aCollectionOfShips aBoard aLoadedDie aDiceSet aSecondShip aSquaresDictionary |
	aFirstShip := Ship withName: 'Michael Jackson the MoonWalker'.
	aSecondShip := Ship withName: 'Anakin'.

	aCollectionOfShips := OrderedCollection with: aFirstShip.
	aCollectionOfShips add: aSecondShip.
	
	aSquaresDictionary := Dictionary new.
	aSquaresDictionary at: 6 put: (HyperJump skipping: #(30 20 10)).
	
	aBoard := Board withSize: 10 lengthInParsecs: 100 and: aSquaresDictionary.

	aLoadedDie := LoadedDie mustRoll: #( 6 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).

	aGame := Game
		         playedOn: aBoard
		         by: aCollectionOfShips
		         throwing: aDiceSet.

	aGame play.
	aGame play.
	
	self assert: (aGame squareOf: aFirstShip ) equals: 9.
	self assert: (aGame squareOf: aSecondShip ) equals: 8.
]

{ #category : 'running' }
SpecialSquaresTest >> test012WhenAShipLandsOnAHyperJumpWithLightYearsThenItMovesCorrectly [

	| aGame aFirstShip aBoard aLoadedDie aDiceSet aSquaresDictionary |
	aFirstShip := Ship withName: 'Luke'.
	aSquaresDictionary := Dictionary new.
	aSquaresDictionary
		at: 5
		put: (HyperJump skippingLightYears: #( 9 6 3 )).
	aBoard := Board
		          withSize: 10
		          lengthInLightYears: 30
		          and: aSquaresDictionary.
	aLoadedDie := LoadedDie mustRoll: #( 5 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).
	aGame := Game
		         playedOn: aBoard
		         by: (OrderedCollection with: aFirstShip)
		         throwing: aDiceSet.
	aGame play.
	self assert: (aGame squareOf: aFirstShip) equals: 8
]

{ #category : 'running' }
SpecialSquaresTest >> test013WhenAShipLandsOnACardSquareThenItReceivesACard [

	| aGame aFirstShip aBoard aDiceSet aLoadedDie |
	aFirstShip := Ship withName: 'Luke'.
	aBoard := Board withSize: 10 and: CardSquare new on: 5.
	aLoadedDie := LoadedDie mustRoll: #( 5 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).
	aGame := Game
		         playedOn: aBoard
		         by: (OrderedCollection with: aFirstShip)
		         throwing: aDiceSet.

	aGame play.

	self assert: aFirstShip cards size equals: 3.
]

{ #category : 'running' }
SpecialSquaresTest >> test014WhenAShipLandsOnACardSquareThenItReceivesACardFromTheGameDeck [

	| aGame aFirstShip aBoard aDiceSet aLoadedDie |
	aFirstShip := Ship withName: 'Luke'.
	aBoard := Board withSize: 10 and: CardSquare new on: 5.
	aLoadedDie := LoadedDie mustRoll: #( 5 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).
	aGame := Game
		         playedOn: aBoard
		         by: (OrderedCollection with: aFirstShip)
		         throwing: aDiceSet
		         winningAt: 1
		         having: { Overload }.
	aGame play.
	self assert: (aFirstShip cards last isKindOf: Overload)
]

{ #category : 'running' }
SpecialSquaresTest >> test015WhenAHyperJumpIsCreatedWithAnEmptyArrayThenItCannotBeInstantiated [

	self
		should: [ HyperJump skipping: #(  ) ]
		raise: Error
		withExceptionDo: [ :error |
				self
					assert: error messageText
					equals: 'A HyperJump must have at least one distance.' ]
]

{ #category : 'running' }
SpecialSquaresTest >> test016WhenABoardFactoryIsCreatedWithSize0ThenItCannotBeInstantiated [

	self
		should: [ BoardFactory createABoardOf: 0 shapingTheFabricWith: Dictionary new ]
		raise: Error
		withExceptionDo: [ :error |
				self
					assert: error messageText
					equals: 'Board size cannot be negative or zero' ]
]

{ #category : 'running' }
SpecialSquaresTest >> test017WhenABoardFactoryIsCreatedWIthProbabilitiesDifferentFrom100ThenItCannotBeInstantiated [

	| squaresAndProbabilities |

	squaresAndProbabilities := {
		                           (SimpleSquare -> 30).
		                           (WormHole -> 20).
		                           (SpeedUp -> 20).
		                           (MoonWalk -> 10).
		                           (HyperJump -> 8).
		                           (AtomicBomb -> 2).
		                           (CardSquare -> 0) } asDictionary.
	self
		should: [
				BoardFactory
					createABoardOf: 100
					shapingTheFabricWith: squaresAndProbabilities ]
		raise: Error
		withExceptionDo: [ :error |
				self
					assert: error messageText
					equals:
					'The sum of all probabilities must be 100%, but it was 90%' ]
]

{ #category : 'running' }
SpecialSquaresTest >> test018WhenABoardIsCreatedWithPercentagesThenTheDistributionFollowsAlong [

	| squaresAndProbabilities aBoard |
	squaresAndProbabilities := {
		                           (SimpleSquare -> 30).
		                           (WormHole -> 20).
		                           (SpeedUp -> 20).
		                           (MoonWalk -> 10).
		                           (HyperJump -> 8).
		                           (AtomicBomb -> 2).
		                           (CardSquare -> 10) } asDictionary.

	aBoard := BoardFactory
		          createABoardOf: 100000
		          shapingTheFabricWith: squaresAndProbabilities.

	self assert: ((BoardFactory howMuchOf: SimpleSquare appearsIn: aBoard)
			 closeTo: 30
			 precision: 1.5).

	self assert: ((BoardFactory howMuchOf: WormHole appearsIn: aBoard)
			 closeTo: 20
			 precision: 1).

	self assert: ((BoardFactory howMuchOf: SpeedUp appearsIn: aBoard)
			 closeTo: 20
			 precision: 1).

	self assert: ((BoardFactory howMuchOf: MoonWalk appearsIn: aBoard)
			 closeTo: 10
			 precision: 0.5).

	self assert: ((BoardFactory howMuchOf: HyperJump appearsIn: aBoard)
			 closeTo: 8
			 precision: 0.4).

	self assert: ((BoardFactory howMuchOf: AtomicBomb appearsIn: aBoard)
			 closeTo: 2
			 precision: 0.1).

	self assert: ((BoardFactory howMuchOf: CardSquare appearsIn: aBoard)
			 closeTo: 10
			 precision: 0.5)
]
