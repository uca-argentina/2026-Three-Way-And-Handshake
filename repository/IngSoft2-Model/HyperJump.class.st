Class {
	#name : 'HyperJump',
	#superclass : 'Square',
	#instVars : [
		'parsecs',
		'callIndex'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
HyperJump class >> skipping: parsecsToSKip [ 

^ self new initializeWithSkips: parsecsToSKip.
]

{ #category : 'as yet unclassified' }
HyperJump >> effect [
	^ 'HyperJump'.
]

{ #category : 'initialization' }
HyperJump >> initializeWithSkips: aParsecArray [ 
	parsecs:= aParsecArray.
	callIndex := 0.
]

{ #category : 'as yet unclassified' }
HyperJump >> land [
    callIndex := callIndex + 1.
    ^ parsecs at: ((callIndex - 1) \\ parsecs size + 1).
]
