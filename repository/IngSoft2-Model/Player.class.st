Class {
	#name : 'Player',
	#superclass : 'Object',
	#instVars : [
		'name',
		'ship'
	],
	#classVars : [
		'id'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Player class >> withName: aName [

	aName isString ifFalse: [
		Error signal: 'Player name cannot be other than string type' ].

	^ self new initializeWithName: aName
]

{ #category : 'as yet unclassified' }
Player class >> withName: aName andShip: aShip [

	aName isString ifFalse: [
		Error signal: 'Player name cannot be other than string type' ].

	(aShip isMemberOf: Ship) ifFalse: [
		Error signal: 'Player ship cannot be other than Ship type' ].

	^ self new initializeWithName: aName andShip: aShip
]

{ #category : 'private' }
Player >> getName [
^name.
]

{ #category : 'as yet unclassified' }
Player >> getShipId [
^ (ship getId).
]

{ #category : 'initialization' }
Player >> initializeWithName: aName [ 
name:= aName.
]

{ #category : 'initialization' }
Player >> initializeWithName: aName andShip: aShip [ 
name:= aName.
ship:= aShip
]
