Class {
	#name : 'CardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
CardTest >> test001WhenOverloadIsPlayedOnAShipThenItsRollIsReducedBy2 [
    | aGame aShip aTargetShip aBoard aLoadedDie aDiceSet anOverloadCard |
    aShip := Ship withName: 'Luke'.
    aTargetShip := Ship withName: 'Anakin'.
    aBoard := Board withSize: 20.
    aLoadedDie := LoadedDie mustRoll: #( 5 ).
    aDiceSet := DiceSet withDice: (OrderedCollection with: aShip with: aTargetShip).
    aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).
    aGame := Game
        playedOn: aBoard
        by: (OrderedCollection with: aShip with: aTargetShip)
        throwing: aDiceSet.

    anOverloadCard := Overload new.
    aShip addCard: anOverloadCard .
    aGame play.                                       
    aGame playCard: anOverloadCard by: aShip targeting: aTargetShip. 
    aGame play.                                       

    self assert: (aGame squareOf: aTargetShip) equals: 3.
    self assert: (aGame squareOf: aShip) equals: 5.
]

{ #category : 'tests' }
CardTest >> test002WhenSpeedIsPlayedOnAShipThenItsRollIsIncreasedBy1 [
    | aGame aShip aTargetShip aBoard aLoadedDie aDiceSet aSpeedCard |
    aShip := Ship withName: 'Luke'.
    aTargetShip := Ship withName: 'Anakin'.
    aBoard := Board withSize: 20.
    aLoadedDie := LoadedDie mustRoll: #( 5 ).
    aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).
    aGame := Game
        playedOn: aBoard
        by: (OrderedCollection with: aShip with: aTargetShip)
        throwing: aDiceSet.

    aSpeedCard := Speed new.
    aShip addCard: aSpeedCard.
    aGame play.                                     
    aGame playCard: aSpeedCard by: aShip targeting: aTargetShip. 
    aGame play.                                     

    self assert: (aGame squareOf: aTargetShip) equals: 6.
    self assert: (aGame squareOf: aShip) equals: 5.
]

{ #category : 'tests' }
CardTest >> test003WhenAccelerationIsPlayedThenAllShipsRollsAreIncreasedBy1 [

	| aGame aShip aTargetShip aBoard aLoadedDie aDiceSet anAccelerationCard |
	aShip := Ship withName: 'Luke'.
	aTargetShip := Ship withName: 'Anakin'.
	aBoard := Board withSize: 20.
	aLoadedDie := LoadedDie mustRoll: #( 5 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).
	aGame := Game
		         playedOn: aBoard
		         by: (OrderedCollection with: aShip with: aTargetShip)
		         throwing: aDiceSet.

	anAccelerationCard := Acceleration new.
	aShip addCard: anAccelerationCard.
	aGame play.
	aGame playCard: anAccelerationCard by: aShip.
	aGame play.
	aGame play.

	self assert: (aGame squareOf: aTargetShip) equals: 6.
	self assert: (aGame squareOf: aShip) equals: 11
]

{ #category : 'tests' }
CardTest >> test004WhenTwoOverloadsArePlayedOnDifferentShipsBothAreAffected [

	| aGame aFirstShip aSecondShip aBoard aLoadedDie aDiceSet aFirstOverloadCard aSecondOverloadCard |
	aFirstShip := Ship withName: 'Luke'.
	aSecondShip := Ship withName: 'Anakin'.
	aBoard := Board withSize: 20.
	aLoadedDie := LoadedDie mustRoll: #( 5 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).
	aGame := Game
		         playedOn: aBoard
		         by: (OrderedCollection with: aFirstShip with: aSecondShip)
		         throwing: aDiceSet.

	aFirstOverloadCard := Overload new.
	aSecondOverloadCard := Overload new.
	aFirstShip addCard: aFirstOverloadCard.
	aSecondShip addCard: aSecondOverloadCard.

	aGame
		playCard: aFirstOverloadCard
		by: aFirstShip
		targeting: aSecondShip.
	aGame
		playCard: aSecondOverloadCard
		by: aSecondShip
		targeting: aFirstShip.

	aGame play.
	aGame play.

	self assert: (aGame squareOf: aFirstShip) equals: 3.
	self assert: (aGame squareOf: aSecondShip) equals: 3
]

{ #category : 'tests' }
CardTest >> test005WhenCancellationIsPlayedOnAnActivePermanentCardThenItIsRemoved [

	| aGame aFirstShip aSecondShip aBoard aLoadedDie aDiceSet anOverloadCard aCancellationCard |
	aFirstShip := Ship withName: 'Luke'.
	aSecondShip := Ship withName: 'Anakin'.
	aBoard := Board withSize: 20.
	aLoadedDie := LoadedDie mustRoll: #( 5 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).
	aGame := Game
		         playedOn: aBoard
		         by: (OrderedCollection with: aFirstShip with: aSecondShip)
		         throwing: aDiceSet.

	anOverloadCard := Overload new.
	aCancellationCard := Cancellation new.
	aFirstShip addCard: anOverloadCard.
	aSecondShip addCard: aCancellationCard.

	aGame playCard: anOverloadCard by: aFirstShip targeting: aSecondShip. "Overload activo sobre Anakin"
	aGame play. "Luke mueve 5"
	aGame
		playCard: aCancellationCard
		by: aSecondShip
		removing: anOverloadCard. "Anakin cancela el Overload"
	aGame play. "Anakin mueve 5 (sin penalidad)"

	self assert: (aGame squareOf: aSecondShip) equals: 5
]

{ #category : 'tests' }
CardTest >> test006WhenCancellationIsPlayedWithNoActivePermanentCardsThenItRaisesError [

	| aGame aShip aBoard aLoadedDie aDiceSet aCancellationCard |
	aShip := Ship withName: 'Luke'.
	aBoard := Board withSize: 20.
	aLoadedDie := LoadedDie mustRoll: #( 5 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).
	aGame := Game
		         playedOn: aBoard
		         by: (OrderedCollection with: aShip)
		         throwing: aDiceSet.

	aCancellationCard := Cancellation new.
	aShip addCard: aCancellationCard.

	self
		should: [
		aGame playCard: aCancellationCard by: aShip removing: Overload new ]
		raise: Error
		withExceptionDo: [ :error |
				self
					assert: error messageText
					equals: 'There are no active permanent cards.' ]
]

{ #category : 'tests' }
CardTest >> test007WhenACardThatIsNotInTheShipsHandIsPlayedThenItRaisesError [

	| aGame aShip aTargetShip aBoard aDiceSet aLoadedDie anOverloadCard |
	aShip := Ship withName: 'Luke'.
	aTargetShip := Ship withName: 'Anakin'.
	aBoard := Board withSize: 20.
	aLoadedDie := LoadedDie mustRoll: #( 5 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).
	aGame := Game
		         playedOn: aBoard
		         by: (OrderedCollection with: aShip with: aTargetShip)
		         throwing: aDiceSet.
	anOverloadCard := Overload new.
	self
		should: [
		aGame playCard: anOverloadCard by: aShip targeting: aTargetShip ]
		raise: Error
		withExceptionDo: [ :error |
				self
					assert: error messageText
					equals: 'The card is not in the ship''s hand.' ]
]

{ #category : 'tests' }
CardTest >> test008WhenACardIsPlayedThenItCannotBePlayedAgain [

	| aGame aShip aTargetShip aBoard aDiceSet aLoadedDie anOverloadCard |
	aShip := Ship withName: 'Luke'.
	aTargetShip := Ship withName: 'Anakin'.
	aBoard := Board withSize: 20.
	aLoadedDie := LoadedDie mustRoll: #( 5 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).
	aGame := Game
		         playedOn: aBoard
		         by: (OrderedCollection with: aShip with: aTargetShip)
		         throwing: aDiceSet.

	anOverloadCard := Overload new.
	aShip addCard: anOverloadCard.
	aGame playCard: anOverloadCard by: aShip targeting: aTargetShip.

	self
		should: [
		aGame playCard: anOverloadCard by: aShip targeting: aTargetShip ]
		raise: Error
		withExceptionDo: [ :error |
				self
					assert: error messageText
					equals: 'The card is not in the ship''s hand.' ]
]
