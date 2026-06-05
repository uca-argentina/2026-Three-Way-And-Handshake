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
    aGame playCard: anOverloadCard targeting: aTargetShip. 
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
    aGame playCard: aSpeedCard targeting: aTargetShip. 
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
    aGame playCard: anAccelerationCard.                     
    aGame play.                                          
    aGame play.                                          

    self assert: (aGame squareOf: aTargetShip) equals: 6.
    self assert: (aGame squareOf: aShip) equals: 11.
]

{ #category : 'tests' }
CardTest >> test004WhenTwoOverloadsArePlayedOnDifferentShipsBothAreAffected [
    | aGame luke anakin aBoard aLoadedDie aDiceSet overload1 overload2 |
    luke := Ship withName: 'Luke'.
    anakin := Ship withName: 'Anakin'.
    aBoard := Board withSize: 20.
    aLoadedDie := LoadedDie mustRoll: #( 5 ).
    aDiceSet := DiceSet withDice: (OrderedCollection with: aLoadedDie).
    aGame := Game
        playedOn: aBoard
        by: (OrderedCollection with: luke with: anakin)
        throwing: aDiceSet.

    overload1 := Overload new.
    overload2 := Overload new.
    luke addCard: overload1.
    anakin addCard: overload2.

    aGame playCard: overload1 targeting: anakin.  
    aGame playCard: overload2 targeting: luke.    

    aGame play.   
    aGame play.   

    self assert: (aGame squareOf: luke) equals: 3.
    self assert: (aGame squareOf: anakin) equals: 3.
]
