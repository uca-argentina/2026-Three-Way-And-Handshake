Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'name'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'asserting' }
Ship class >> assertIsString: aName [


	aName isString ifFalse: [
		Error signal: 'Ship Name cannot be other than string type' ]
]

{ #category : 'as yet unclassified' }
Ship class >> called: aName [

	^ (self new) initializeWithName: aName
]

{ #category : 'as yet unclassified' }
Ship class >> withName: aName [
	
	self assertIsString: aName.

	^ (self new) initializeWithName: aName
]

{ #category : 'initialization' }
Ship >> initializeWithName: aName [

	name := aName
]
