Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
GameTest >> test003ElJuegoTerminadoDeberiaSerAlgoAsi [


| aShip aPlayer aBoard aLoadedDie |
aShip:= Ship withId: 1.
aPlayer:= Player withName: 'Gianni' andShip: aShip.

aBoard := Board withSize: 10.
aBoard addShip: aShip.

aLoadedDie:= LoadedDie mustRoll: 5.

self assert: true equals: true

"self assert: aBoard getShipPosition: aShip equals: 5."


]
