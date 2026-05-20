Class {
	#name : 'SpeedUp',
	#superclass : 'Square',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
SpeedUp >> applyEffectOn: aGame for: aShip [

	aGame advanceShip: aShip by: 4
]

{ #category : 'as yet unclassified' }
SpeedUp >> land [

^4.
]
