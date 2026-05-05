Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'shipId'
	],
	#classInstVars : [
		'shipId'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Ship class >> cannotBeOtherThanInteger: anId [

	anId isInteger ifFalse: [
		Error signal: 'Ship ID cannot be other than integer type' ]
]

{ #category : 'as yet unclassified' }
Ship class >> withId: anId [

	self cannotBeOtherThanInteger: anId.
	^ (self new) initializeWithId: anId
]

{ #category : 'as yet unclassified' }
Ship >> getId [
	^ shipId.
]

{ #category : 'initialization' }
Ship >> initializeWithId: anId [

	shipId := anId
]
