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
	aDiceSet := DiceSet withDice:
		            (OrderedCollection with: aShip with: aTargetShip).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).
	aGame := Game
		         playedOn: aBoard
		         by: (OrderedCollection with: aShip with: aTargetShip)
		         throwing: aDiceSet.

	anOverloadCard := Overload new.
	aShip addCard: anOverloadCard.
	aGame play: (anOverloadCard aimedAt: aTargetShip) by: aShip.
	aGame play.
	aGame play.

	self assert: (aGame squareOf: aTargetShip) equals: 3.
	self assert: (aGame squareOf: aShip) equals: 5
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
	aGame play: (aSpeedCard aimedAt: aTargetShip) by: aShip.
	aGame play.
	aGame play.

	self assert: (aGame squareOf: aTargetShip) equals: 6.
	self assert: (aGame squareOf: aShip) equals: 5
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
	aGame play: anAccelerationCard by: aShip.
	aGame play.
	aGame play.
	aGame play.

	self assert: (aGame squareOf: aTargetShip) equals: 6.
	self assert: (aGame squareOf: aShip) equals: 12
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

	aGame play: (aFirstOverloadCard aimedAt: aSecondShip) by: aFirstShip.
	aGame play.
	aGame play: (aSecondOverloadCard aimedAt: aFirstShip) by: aSecondShip.
	aGame play.
	aGame play.

	self assert: (aGame squareOf: aSecondShip) equals: 3.
	self assert: (aGame squareOf: aFirstShip) equals: 8
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

	aGame play: (anOverloadCard aimedAt: aSecondShip) by: aFirstShip.
	aGame play.
	aGame
		play: (aCancellationCard removing: anOverloadCard)
		by: aSecondShip.
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
		aGame play: (aCancellationCard removing: Overload new) by: aShip ]
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
		aGame play: (anOverloadCard aimedAt: aTargetShip) by: aShip ]
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
	aGame play: (anOverloadCard aimedAt: aTargetShip) by: aShip.

	self
		should: [
		aGame play: (anOverloadCard aimedAt: aTargetShip) by: aShip ]
		raise: Error
		withExceptionDo: [ :error |
				self
					assert: error messageText
					equals: 'The card is not in the ship''s hand.' ]
]

{ #category : 'tests' }
CardTest >> test009WhenAPermanentCardIsPlayedOutsideTheShipsTurnThenItRaisesError [

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

	aGame play. "Turno de Luke consumido - ahora es turno de Anakin"

	self
		should: [
		aGame play: (anOverloadCard aimedAt: aTargetShip) by: aShip ]
		raise: Error
		withExceptionDo: [ :error |
				self
					assert: error messageText
					equals:
					'Permanent cards can only be played during the ship''s turn.' ]
]

{ #category : 'tests' }
CardTest >> test010WhenAnInstantCardIsPlayedAfterTheGameIsOverThenItRaisesError [ 

	| aGame aShip aBoard aLoadedDie aDiceSet aCancellationCard |
	aShip := Ship withName: 'Luke'.
	aBoard := Board withSize: 5.
	aLoadedDie := LoadedDie mustRoll: #( 6 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).
	aGame := Game
		         playedOn: aBoard
		         by: (OrderedCollection with: aShip)
		         throwing: aDiceSet.

	aGame play.

	aCancellationCard := Cancellation new.
	aShip addCard: aCancellationCard.

	self
		should: [ aGame play: (aCancellationCard removing: Overload new) by: aShip ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: error messageText equals: 'The game is already over.' ]
]

{ #category : 'tests' }
CardTest >> test011WhenRedoIsPlayedItImitatesLastPlayedCardOnADifferentTarget [

	| aGame aLuke anAnakin aBoard aLoadedDie aDiceSet aSpeedCard aRedoCard |
	aLuke := Ship withName: 'Luke'.
	anAnakin := Ship withName: 'Anakin'.
	aBoard := Board withSize: 20.
	aLoadedDie := LoadedDie mustRoll: #( 5 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).
	aGame := Game
		         playedOn: aBoard
		         by: (OrderedCollection with: aLuke with: anAnakin)
		         throwing: aDiceSet.

	aSpeedCard := Speed new.
	aRedoCard := Redo new.
	aLuke addCard: aSpeedCard.
	anAnakin addCard: aRedoCard.

	aGame play: (aSpeedCard aimedAt: anAnakin) by: aLuke.
	aGame play.
	aGame play: (aRedoCard aimedAt: aLuke) by: anAnakin.
	aGame play.
	aGame play.

	self assert: (aGame squareOf: anAnakin) equals: 6.
	self assert: (aGame squareOf: aLuke) equals: 11
]

{ #category : 'tests' }
CardTest >> test012WhenRedoIsPlayedWithNoCardPlayedBeforeThenItRaisesError [

	| aGame aShip aBoard aLoadedDie aDiceSet aRedoCard |
	aShip := Ship withName: 'Luke'.
	aBoard := Board withSize: 20.
	aLoadedDie := LoadedDie mustRoll: #( 5 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).
	aGame := Game
		         playedOn: aBoard
		         by: (OrderedCollection with: aShip)
		         throwing: aDiceSet.

	aRedoCard := Redo new.
	aShip addCard: aRedoCard.

	self
		should: [ aGame play: (aRedoCard aimedAt: aShip) by: aShip ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: error messageText equals: 'No card has been played yet.' ]
]

{ #category : 'tests' }
CardTest >> test013WhenRepeatIsPlayedItReappliesLastSquareEffectOnChosenShip [ 

	| aGame aLuke anAnakin aBoard aLoadedDie aDiceSet aRepeatCard aSquaresDictionary |
	aLuke := Ship withName: 'Luke'.
	anAnakin := Ship withName: 'Anakin'.
	aLoadedDie := LoadedDie mustRoll: #( 5 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).
	aSquaresDictionary := Dictionary new.
	aSquaresDictionary at: 5 put: SpeedUp new.
	aBoard := Board withSize: 20 and: aSquaresDictionary.
	aGame := Game
		         playedOn: aBoard
		         by: (OrderedCollection with: aLuke with: anAnakin)
		         throwing: aDiceSet.

	aRepeatCard := Repeat new.
	anAnakin addCard: aRepeatCard.

	aGame play.
	aGame play: (aRepeatCard aimedAt: anAnakin) by: anAnakin.
	aGame play.

	self assert: (aGame squareOf: aLuke) equals: 9.
	self assert: (aGame squareOf: anAnakin) equals: 9

]

{ #category : 'tests' }
CardTest >> test014WhenRepeatIsPlayedWithNoPreviousSquareEffectThenNothingHappens [ 

	| aGame aShip aBoard aLoadedDie aDiceSet aRepeatCard |
	aShip := Ship withName: 'Luke'.
	aLoadedDie := LoadedDie mustRoll: #( 5 ).
	aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).
	aBoard := Board withSize: 20.
	aGame := Game
		         playedOn: aBoard
		         by: (OrderedCollection with: aShip)
		         throwing: aDiceSet.

	aRepeatCard := Repeat new.
	aShip addCard: aRepeatCard.

	aGame play: (aRepeatCard aimedAt: aShip) by: aShip.

	self assert: (aGame squareOf: aShip) equals: 0

]
