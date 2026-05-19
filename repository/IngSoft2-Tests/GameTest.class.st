Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
GameTest >> test001WhenAGameIsCreatedAndNoShipMovesThenItIsNotOver [

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

	self deny: aGame isOver.
	self assert: aGame amountOfShips equals: 1
]

{ #category : 'running' }
GameTest >> test002WhenAGameIsCreatedWithABoardAndSpaceShipThenThePositionOfTheSpaceShipItIs0 [

	| aGame aFirstShip aCollectionOfShips aBoard aLoadedDie aDiceSet |
	aFirstShip := Ship withName: 'Luke'.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 10.

	aLoadedDie := LoadedDie mustRoll: #( 1 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).

	aGame := Game
		         playedOn: aBoard
		         by: aCollectionOfShips
		         throwing: aDiceSet.

	self assert: (aGame positionOf: aFirstShip) equals: 0
]

{ #category : 'running' }
GameTest >> test003WhenAShipRollsADieAndTheOutcomeIs5ThenItMoves5Positions [

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

	self assert: (aGame positionOf: aFirstShip) equals: 5
]

{ #category : 'running' }
GameTest >> test004WhenAShipReachTheEndOfTheBoardThenTheGameIsOver [

	| aGame aFirstShip aCollectionOfShips aBoard aLoadedDie aDiceSet |
	aFirstShip := Ship withName: 'Luke'.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 10.

	aLoadedDie := LoadedDie mustRoll: #( 10 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).

	aGame := Game
		         playedOn: aBoard
		         by: aCollectionOfShips
		         throwing: aDiceSet.

	aGame play.

	self assert: aGame isOver.
	self assert: (aGame positionOf: aFirstShip) equals: 10
]

{ #category : 'running' }
GameTest >> test005WhenAShipMovesButDoesNotReachTheEndOfTheBoardThenTheGameIsNotOver [

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

	self deny: aGame isOver.
	self assert: (aGame positionOf: aFirstShip) equals: 5
]

{ #category : 'running' }
GameTest >> test006WhenAShipIsTheFirstToReachTheEndThenItIsTheWinner [

	| aGame aFirstShip aCollectionOfShips aBoard aLoadedDie aDiceSet |
	aFirstShip := Ship withName: 'Luke'.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 10.

	aLoadedDie := LoadedDie mustRoll: #( 10 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).

	aGame := Game
		         playedOn: aBoard
		         by: aCollectionOfShips
		         throwing: aDiceSet.

	aGame play.

	self assert: aGame isOver.
	self assert: (aGame positionOf: aFirstShip) equals: 10.
	self assert: aGame winner equals: aFirstShip
]

{ #category : 'running' }
GameTest >> test007WhenAShipIsOnPosition0AndRolls5TwiceThenItMovesToPosition10 [

	| aGame aFirstShip aCollectionOfShips aBoard aLoadedDie aDiceSet |
	aFirstShip := Ship withName: 'Luke'.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 10.

	aLoadedDie := LoadedDie mustRoll: #( 5 5 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).

	aGame := Game
		         playedOn: aBoard
		         by: aCollectionOfShips
		         throwing: aDiceSet.

	aGame play.
	aGame play.

	self assert: aGame isOver.
	self assert: (aGame positionOf: aFirstShip) equals: 10.
	self assert: aGame winner equals: aFirstShip
]

{ #category : 'running' }
GameTest >> test008WhenTwoShipsPlayThreeTurnsThenFirstShipMovedTwiceAndSecondShipMovedOnce [

	| aGame aFirstShip aCollectionOfShips aBoard aFirstLoadedDie aSecondShip aDiceSet |
	aFirstShip := Ship withName: 'Luke'.
	aSecondShip := Ship withName: 'Anakin'.

	aCollectionOfShips := OrderedCollection with: aFirstShip.
	aCollectionOfShips add: aSecondShip.

	aBoard := Board withSize: 10.

	aFirstLoadedDie := LoadedDie mustRoll: #( 4 3 ).
	aDiceSet := DiceSet withDice:
		            (OrderedCollection with: aFirstLoadedDie).

	aGame := Game
		         playedOn: aBoard
		         by: aCollectionOfShips
		         throwing: aDiceSet.

	aGame play.
	aGame play.
	aGame play.

	self assert: (aGame positionOf: aFirstShip) equals: 8.
	self assert: (aGame positionOf: aSecondShip) equals: 3
]

{ #category : 'running' }
GameTest >> test009WhenASetOfLoadedDiceIsRolledThenTheSumOfDiceComesInOrder [

	| aGame aFirstShip aCollectionOfShips aCollectionOfDice aBoard aFirstLoadedDie aSecondLoadedDie aSecondShip aDiceSet |
	aFirstShip := Ship withName: 'Luke'.
	aSecondShip := Ship withName: 'Anakin'.

	aCollectionOfShips := OrderedCollection with: aFirstShip.
	aCollectionOfShips add: aSecondShip.
	aBoard := Board withSize: 10.

	aFirstLoadedDie := LoadedDie mustRoll: #( 4 2 ).
	aSecondLoadedDie := LoadedDie mustRoll: #( 3 4 ).

	aCollectionOfDice := OrderedCollection with: aFirstLoadedDie.
	aCollectionOfDice add: aSecondLoadedDie.

	aDiceSet := DiceSet withDice: aCollectionOfDice.

	aGame := Game
		         playedOn: aBoard
		         by: aCollectionOfShips
		         throwing: aDiceSet.
	aGame play.
	aGame play.

	self assert: (aGame positionOf: aFirstShip) equals: 7.
	self assert: (aGame positionOf: aSecondShip) equals: 6
]

{ #category : 'running' }
GameTest >> test010WhenAShipsRollIsGreaterThanTheAmountOfSquaresToFinishThenFinalPositionIsAtFinish [

	| aGame aFirstShip aCollectionOfShips aBoard aLoadedDie aDiceSet |
	aFirstShip := Ship withName: 'Luke'.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 9.

	aLoadedDie := LoadedDie mustRoll: #( 10 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).

	aGame := Game
		         playedOn: aBoard
		         by: aCollectionOfShips
		         throwing: aDiceSet.

	aGame play.

	self assert: aGame isOver.
	self assert: (aGame positionOf: aFirstShip) equals: 9.
	self assert: aGame winner equals: aFirstShip
]

{ #category : 'running' }
GameTest >> test011WhenTheGameIsOverThenNoMoreTurnsCanBePlayed [

	| aGame aFirstShip aCollectionOfShips aBoard aLoadedDie aDiceSet |
	aFirstShip := Ship withName: 'Luke'.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 10.

	aLoadedDie := LoadedDie mustRoll: #( 10 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).

	aGame := Game
		         playedOn: aBoard
		         by: aCollectionOfShips
		         throwing: aDiceSet.

	aGame play.

	self assert: aGame isOver.
	self should: [ aGame play ] raise: Error withExceptionDo: [ :error |
		self assert: error messageText equals: 'The game is already over.' ]
]

{ #category : 'running' }
GameTest >> test012WhenTheGameIsNotOverThenAskingForWinnerRaisesError [

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

	self deny: aGame isOver.
	self
		should: [ aGame winner ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: error messageText equals: 'The game is not over yet.' ]
]

{ #category : 'running' }
GameTest >> test013WhenTheLastShipPlaysThenItIsFirstShipTurnAgain [

	| aGame aFirstShip aSecondShip aCollectionOfShips aBoard aLoadedDie aDiceSet |
	aFirstShip := Ship withName: 'Luke'.
	aSecondShip := Ship withName: 'Anakin'.
	aCollectionOfShips := OrderedCollection
		                      with: aFirstShip
		                      with: aSecondShip.
	aBoard := Board withSize: 20.
	aLoadedDie := LoadedDie mustRoll: #( 5 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).
	aGame := Game
		         playedOn: aBoard
		         by: aCollectionOfShips
		         throwing: aDiceSet.
	aGame play.
	aGame play.
	self assert: aGame currentShip equals: aFirstShip
]

{ #category : 'running' }
GameTest >> test014WhenAGameIsCreatedWithNoShipsThenItCannotBeInstantiated [

	| aBoard aLoadedDie aCollectionOfShips |
	aBoard := Board withSize: 10.
	aLoadedDie := LoadedDie mustRoll: #( 5 ).
	aCollectionOfShips := OrderedCollection new.
	self
		should: [
				Game
					playedOn: aBoard
					by: aCollectionOfShips
					throwing: aLoadedDie ]
		raise: Error
		withExceptionDo: [ :error |
				self
					assert: error messageText
					equals: 'A game must have at least one ship.' ]
]

{ #category : 'running' }
GameTest >> test015WhenAGameReceivesAnInvalidBoardThenGameCannotBeInstantiated [

	| aGame aFirstShip aCollectionOfShips aBoard aLoadedDie |
	aFirstShip := Ship withName: 'Luke'.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := 'hello'.

	aLoadedDie := LoadedDie mustRoll: #( 10 ).

	self should: [ aGame := Game
		         playedOn: aBoard
		         by: aCollectionOfShips
		         throwing: aLoadedDie. ] raise: Error withExceptionDo: [ :error |
		self assert: error messageText equals: 'Game did not receive a valid instance of Board' ]
]

{ #category : 'running' }
GameTest >> test016WhenAGameReceivesAnInvalidInstanceOfDiceThenGameCannotBeInitialized [

	| aGame aFirstShip aCollectionOfShips aBoard aLoadedDie |
	aFirstShip := Ship withName: 'Luke'.

	aCollectionOfShips := OrderedCollection with: aFirstShip.

	aBoard := Board withSize: 10.

	aLoadedDie := 5.

	self should: [ aGame := Game
		         playedOn: aBoard
		         by: aCollectionOfShips
		         throwing: aLoadedDie. ] raise: Error withExceptionDo: [ :error |
		self assert: error messageText equals: 'Game did not receive a valid instance of DiceSet' ]
]

{ #category : 'running' }
GameTest >> test017WhenFirstShipPlaysThenSecondShipPlaysNext [

	| aGame aFirstShip aSecondShip aCollectionOfShips aBoard aLoadedDie aDiceSet |
	aFirstShip := Ship withName: 'Luke'.
	aSecondShip := Ship withName: 'Anakin'.
	aCollectionOfShips := OrderedCollection
		                      with: aFirstShip
		                      with: aSecondShip.
	aBoard := Board withSize: 20.
	aLoadedDie := LoadedDie mustRoll: #( 5 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).
	aGame := Game
		         playedOn: aBoard
		         by: aCollectionOfShips
		         throwing: aDiceSet.

	aGame play.
	aGame play.

	self assert: (aGame positionOf: aSecondShip) equals: 5.
	self assert: (aGame positionOf: aFirstShip) equals: 5
]
