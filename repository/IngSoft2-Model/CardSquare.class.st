Class {
	#name : 'CardSquare',
	#superclass : 'Square',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
CardSquare >> applyEffectOn: aGame for: aShip [

	| cardTypes |
	cardTypes := {
		             Overload.
		             Speed.
		             Acceleration.
		             Cancellation }.
	aShip addCard: cardTypes atRandom new
]
