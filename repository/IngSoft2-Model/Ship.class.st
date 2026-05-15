Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'shipId'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Ship class >> assertInteger: anId [

	anId isInteger ifFalse: [
		Error signal: 'Ship ID cannot be other than integer type' ]
]

{ #category : 'as yet unclassified' }
Ship class >> withId: anId [

	self assertInteger: anId.
	^ (self new) initializeWithId: anId
]

{ #category : 'as yet unclassified' }
Ship >> id [
	^ shipId.
]

{ #category : 'initialization' }
Ship >> initializeWithId: anId [

	shipId := anId
]
