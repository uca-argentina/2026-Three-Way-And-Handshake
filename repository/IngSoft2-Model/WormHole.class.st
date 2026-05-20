Class {
	#name : 'WormHole',
	#superclass : 'Square',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
WormHole >> applyEffectOn: aGame for: aShip [

	aGame advanceShip: aShip by: -4
]
