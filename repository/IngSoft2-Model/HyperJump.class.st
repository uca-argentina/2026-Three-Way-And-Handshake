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

{ #category : 'asserting' }
HyperJump class >> assertNotEmpty: aParsecArray [

	aParsecArray isEmpty ifTrue: [
		Error signal: 'A HyperJump must have at least one distance.' ]
]

{ #category : 'as yet unclassified' }
HyperJump class >> skipping: parsecsToSkip [

	self assertNotEmpty: parsecsToSkip.
	^ self new initializeWithSkips: parsecsToSkip
]

{ #category : 'as yet unclassified' }
HyperJump class >> skippingLightYears: aLightYearsArray [

	^ self skipping:
		  (aLightYearsArray collect: [ :aLightYear | aLightYear / 3 ])
]

{ #category : 'as yet unclassified' }
HyperJump >> applyEffectOn: aGame for: aShip [

	aGame advanceShip: aShip byParsecs: self land
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
