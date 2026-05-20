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
HyperJump class >> skipping: parsecsToSkip [
    ^ self new initializeWithSkips: parsecsToSkip.
]

{ #category : 'as yet unclassified' }
HyperJump >> applyEffectOn: aGame for: aShip [
    aGame moveShip: aShip toPosition: self land.
]

{ #category : 'initialization' }
HyperJump >> initializeWithSkips: aParsecArray [
    parsecs := aParsecArray.
    callIndex := 0.
]

{ #category : 'as yet unclassified' }
HyperJump >> land [
    callIndex := callIndex + 1.
    ^ parsecs at: ((callIndex - 1) \\ parsecs size + 1).
]
