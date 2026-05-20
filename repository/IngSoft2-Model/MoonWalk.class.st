Class {
	#name : 'MoonWalk',
	#superclass : 'Object',
	#instVars : [
		'fallback'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
MoonWalk class >> lasts: anAmountToFallback [ 
	^ self new initializeWithAmountToFallback: anAmountToFallback.
]

{ #category : 'as yet unclassified' }
MoonWalk >> everyoneSuffers [
	^ fallback.
]

{ #category : 'initialization' }
MoonWalk >> initializeWithAmountToFallback: anAmountToFallback [ 
	fallback:= anAmountToFallback negated.
]

{ #category : 'as yet unclassified' }
MoonWalk >> land [ 

^ 0.
]
