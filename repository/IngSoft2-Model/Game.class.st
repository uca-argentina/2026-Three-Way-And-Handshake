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
		'targetLaps'
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
Game >> amountOfShips [

	^ shipsDictionary size.
]

{ #category : 'as yet unclassified' }
Game >> applyOnEveryone: anEffect but: aShip [
    shipsDictionary
        keysAndValuesDo: [ :ship :position |
            ship = aShip ifFalse: [
                | newPosition |
                newPosition := position advancedBy: anEffect onBoardOfSize: board size.
                shipsDictionary at: ship put: newPosition
            ]
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

	| currentPosition landingPosition squareEffectOnThisShip aResultAfterEffect squareEffectOnEveryone|
	currentPosition := shipsDictionary at: aShip.
	landingPosition := currentPosition advancedBy: aRollResult onBoardOfSize: board size.
	
	squareEffectOnThisShip := board landOn: landingPosition square. "cuanto avanza esta nave"
	squareEffectOnEveryone:= board everyoneSuffers: landingPosition square. "cuanto avanzan el resto de naves"
	
	self applyOnEveryone: squareEffectOnEveryone but: aShip.
	
	aResultAfterEffect := landingPosition advancedBy: squareEffectOnThisShip onBoardOfSize: board size.
	
	^ aResultAfterEffect.
]

{ #category : 'as yet unclassified' }
Game >> currentShip [

	^ ships at: shipIndex \\ ships size + 1
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

	| aDiceRoll currentShip |
	self assertGameIsOver.
	aDiceRoll := diceSet roll.
	shipIndex := shipIndex \\ shipsDictionary keys size + 1.

	currentShip := ships at: shipIndex.
	self moveShip: currentShip toPosition: aDiceRoll
]

{ #category : 'as yet unclassified' }
Game >> ranking [
	| madeRanking  |
	
	
	madeRanking := ships sort: [ :a :b | 
		 (shipsDictionary at: a) isAheadOf: (shipsDictionary at: b)]	.

    ^ madeRanking 

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
