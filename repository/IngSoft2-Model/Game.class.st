Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'winner',
		'board',
		'diceSet',
		'shipsDictionary',
		'ships',
		'shipIndex',
		'targetLaps',
		'activeCards'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Game class >> assertIsValidBoard: aBoard [ 
	(aBoard isKindOf: Board) ifFalse: [
				Error signal: 'Game did not receive a valid instance of Board'].
]

{ #category : 'as yet unclassified' }
Game class >> assertIsValidDiceSet: aDiceSet [

	(aDiceSet isKindOf: DiceSet )
		ifFalse: [
		Error signal: 'Game did not receive a valid instance of DiceSet' ]
]

{ #category : 'initialization' }
Game class >> assertNotEmpty: aCollectionOfShips [

	aCollectionOfShips isEmpty ifTrue: [
		Error signal: 'A game must have at least one ship.' ]
]

{ #category : 'as yet unclassified' }
Game class >> playedOn: aBoard by: someShips throwing: aDiceSet [

	^ self
		  playedOn: aBoard
		  by: someShips
		  throwing: aDiceSet
		  winningAt: 1
]

{ #category : 'accessing' }
Game class >> playedOn: aBoard by: someShips throwing: aDiceSet winningAt: aNumberOfLaps [

	self assertNotEmpty: someShips.
	self assertIsValidBoard: aBoard.
	self assertIsValidDiceSet: aDiceSet.
	^ self new
		  initializePlayedOn: aBoard
		  by: someShips
		  throwing: aDiceSet
		  winningAt: aNumberOfLaps
]

{ #category : 'as yet unclassified' }
Game >> advanceShip: aShip by: anAmount [

	| currentPosition landingPosition |
	currentPosition := shipsDictionary at: aShip.
	landingPosition := currentPosition
		                   advancedBy: anAmount
		                   onBoardOfSize: board size.
	shipsDictionary at: aShip put: landingPosition 
]

{ #category : 'as yet unclassified' }
Game >> advanceShip: aShip byParsecs: amountOfParsecs [

	| squaresToAdvance |
	squaresToAdvance := board parsecsToSquares: amountOfParsecs.
	self advanceShip: aShip by: squaresToAdvance
]

{ #category : 'as yet unclassified' }
Game >> amountOfShips [

	^ shipsDictionary size.
]

{ #category : 'as yet unclassified' }
Game >> applyOnEveryone: anEffect but: aShip [
    (shipsDictionary keys reject: [ :ship | ship = aShip ])
        do: [ :ship |
            | newPosition |
            newPosition := (shipsDictionary at: ship) advancedBy: anEffect onBoardOfSize: board size.
            shipsDictionary at: ship put: newPosition
        ].
]

{ #category : 'as yet unclassified' }
Game >> assertGameIsNotOver [

	self isOver ifFalse: [ Error signal: 'The game is not over yet.' ]
]

{ #category : 'as yet unclassified' }
Game >> assertGameIsOver [

	self isOver ifTrue: [ Error signal: 'The game is already over.' ]
]

{ #category : 'as yet unclassified' }
Game >> calculateNewPositionFor: aShip withARoll: aRollResult [

	| currentPosition landingPosition  |
	currentPosition := shipsDictionary at: aShip.
	landingPosition := currentPosition
		                   advancedBy: aRollResult
		                   onBoardOfSize: board size.

	shipsDictionary at: aShip put: landingPosition.
   (board squareAt: landingPosition square) applyEffectOn: self for: aShip.
	^ shipsDictionary at: aShip
]

{ #category : 'as yet unclassified' }
Game >> currentShip [

	^ ships at: shipIndex \\ ships size + 1
]

{ #category : 'as yet unclassified' }
Game >> everyoneBackToSquareOne: aShip [

	| positionOfPlayerThatLandedOnAtomic |
	shipsDictionary keysDo: [ :ship |
			| currentPosition newPosition |
			currentPosition := shipsDictionary at: ship.
			newPosition := Position atLap: currentPosition lap square: 1.
			shipsDictionary at: ship put: newPosition ].

	positionOfPlayerThatLandedOnAtomic := shipsDictionary at: aShip.
	^ positionOfPlayerThatLandedOnAtomic
]

{ #category : 'accessing' }
Game >> initializePlayedOn: aBoard by: someShips throwing: aDiceSet winningAt: aNumberOfLaps [

	board := aBoard.
	ships := someShips.
	diceSet := aDiceSet.
	targetLaps := aNumberOfLaps.
	shipIndex := 0.
	winner := nil.
	shipsDictionary := Dictionary new.
	activeCards := Dictionary new.
	someShips do: [ :ship | shipsDictionary at: ship put: (Position atLap: 0 square: 0) ]
]

{ #category : 'modes' }
Game >> isOver [

	^ winner isNotNil
]

{ #category : 'as yet unclassified' }
Game >> lapOf: aShip [
    ^ (shipsDictionary at: aShip) lap
]

{ #category : 'as yet unclassified' }
Game >> moveShip: aShip toPosition: aRollResult [

	|positionToMove|
	positionToMove := self calculateNewPositionFor: aShip withARoll: aRollResult.
	
	shipsDictionary at: aShip put: positionToMove.
	self updateWinnerIfGameEndedFor: aShip.

]

{ #category : 'as yet unclassified' }
Game >> play [

	| aDiceRoll currentShip modifier |
	self assertGameIsOver.
	aDiceRoll := diceSet roll.
	shipIndex := shipIndex \\ shipsDictionary keys size + 1.
	currentShip := ships at: shipIndex.
	modifier := self rollModifierFor: currentShip.
	self moveShip: currentShip toPosition: aDiceRoll + modifier
]

{ #category : 'as yet unclassified' }
Game >> playCard: aCard by: aShip [

	(aShip hasCard: aCard) ifFalse: [
		Error signal: 'The card is not in the ship''s hand.' ].
	self currentShip = aShip ifFalse: [
			Error signal:
				'Permanent cards can only be played during the ship''s turn.' ].
	aShip removeCard: aCard.
	activeCards at: aCard put: ships
]

{ #category : 'as yet unclassified' }
Game >> playCard: aCard by: aShip removing: aCardToRemove [

	(aShip hasCard: aCard) ifFalse: [
		Error signal: 'The card is not in the ship''s hand.' ].
	activeCards isEmpty ifTrue: [
		Error signal: 'There are no active permanent cards.' ].
	aShip removeCard: aCard.
	activeCards removeKey: aCardToRemove
]

{ #category : 'as yet unclassified' }
Game >> playCard: aCard by: aShip targeting: aTargetShip [

	(aShip hasCard: aCard) ifFalse: [
		Error signal: 'The card is not in the ship''s hand.' ].
	self currentShip = aShip ifFalse: [
			Error signal:
				'Permanent cards can only be played during the ship''s turn.' ].
	aShip removeCard: aCard.
	activeCards at: aCard put: (OrderedCollection with: aTargetShip)
]

{ #category : 'as yet unclassified' }
Game >> ranking [
	| madeRanking  |
	
	
	madeRanking := ships sort: [ :a :b | 
		 (shipsDictionary at: a) isAheadOf: (shipsDictionary at: b)]	.

    ^ madeRanking 

]

{ #category : 'as yet unclassified' }
Game >> rollModifierFor: aShip [

	| modifier |
	modifier := 0.
	activeCards keysAndValuesDo: [ :card :targets |
			(targets includes: aShip) ifTrue: [
				modifier := modifier + card effect ] ].
	^ modifier
]

{ #category : 'as yet unclassified' }
Game >> squareOf: aShip [
    ^ (shipsDictionary at: aShip) square
]

{ #category : 'as yet unclassified' }
Game >> updateWinnerIfGameEndedFor: aShip [

	(self lapOf: aShip) >= targetLaps ifTrue: [ winner := aShip ]
]

{ #category : 'as yet unclassified' }
Game >> winner [

	self assertGameIsNotOver.
	^ winner
]
