Class {
	#name : 'BoardAndShipTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BoardAndShipTest >> test001WhenABoardIsCreatedWithOneShipThenItHasOneShip [

	| aShip aCollectionOfShips aBoard |
	aShip := Ship withId: 1.

	aCollectionOfShips := OrderedCollection with: aShip.

	aBoard := Board withSize: 10 andShips: aCollectionOfShips.

	self assert: aBoard getAmountOfShips equals: 1
]

{ #category : 'tests' }
BoardAndShipTest >> test002WhenABoardIsInitializedWithACollectionOfShipsThenMoreCanBeAddedFurther [

	| aFirstShip aSecondShip aCollectionOfShips aBoard |
	aFirstShip := Ship withId: 1.
	aSecondShip := Ship withId: 2.

	aCollectionOfShips := OrderedCollection with: aFirstShip .

	aBoard := Board withSize: 10 andShips: aCollectionOfShips.
	aBoard addShip: aSecondShip.

	self assert: aBoard getAmountOfShips equals: 2
]

{ #category : 'tests' }
BoardAndShipTest >> test003WhenTheBoardIsInitializedWithNoShipsThenMoreCanBeAddedFurther [

	| aShip aBoard aCollectionOfShips |
	aShip := Ship withId: 1.
	aCollectionOfShips := OrderedCollection new.

	aBoard := Board withSize: 10 andShips: aCollectionOfShips.
	aBoard addShip: aShip.

	self assert: aBoard getAmountOfShips equals: 1.
]

{ #category : 'tests' }
BoardAndShipTest >> test004WhenABoardIsAskedToMoveAShipTo5ThenThePositionOfSaidShipis5 [

	| aShip aBoard aCollectionOfShips |
	aShip := Ship withId: 1.
	aCollectionOfShips := OrderedCollection new.

	aBoard := Board withSize: 10 andShips: aCollectionOfShips.
	aBoard addShip: aShip.
	
	aBoard moveShip: aShip toPosition: 5.

	self assert: (aBoard getPositionOf: aShip) equals: 5.
]

{ #category : 'tests' }
BoardAndShipTest >> test005WhenAShipExteriorToTheBoardIsAskedToMoveThenAnErrorIsRaisedAndConditionsRemainUnchanged [

	| aShip aBoard aCollectionOfShips |
	aShip := Ship withId: 1.
	
	aCollectionOfShips := OrderedCollection new.

	aBoard := Board withSize: 10 andShips: aCollectionOfShips.
	

	self
		should: [ aBoard moveShip: aShip toPosition: 5 ]
		raise: Error
		withExceptionDo: [ :error |
		self assert: error messageText equals: 'The Ship is not on board' ]
]

{ #category : 'tests' }
BoardAndShipTest >> test006WhenAShipIsAskedToMoveOutsideOfBoardBoundsThenAnErrorIsRaisedAndInitialConditionsRemainUnchanged [

"ESTE TEST EXISTE MERAMENTE COMO VERIFICACION DE MANERA MOMENTANEA, EVENTUALMENTE CON UNA BUENA IMPLEMENTACCION Y COMUNICAICON ENTRE LOS OBJETOS NO SERA NECESARIO JAMAS YA QUE EL BOARD ANALIZARA LA POSICION A LA QUE SE TIENE QUE MOVER. 

probablemente el board reciba una cantidad de positions que tiene que saltar y automaticamente analice hasta donde tiene que ir ya que alguien podria rollear mas de la cantidad de cuadrados que le faltan para terminar"

	| aShip aBoard aCollectionOfShips |
	aShip := Ship withId: 1.
	aCollectionOfShips := OrderedCollection new.

	aBoard := Board withSize: 10 andShips: aCollectionOfShips.
	aBoard addShip: aShip.

	self
		should: [ aBoard moveShip: aShip toPosition: 11 ]
		raise: Error
		withExceptionDo: [ :error |
		self assert: error messageText equals: 'The Position is outside of limits' ]
]
