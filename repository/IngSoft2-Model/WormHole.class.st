Class {
	#name : 'WormHole',
	#superclass : 'Square',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
WormHole >> applyEffectOn: aGame for: aShip [

	aGame moveShip: aShip toPosition: -4
]

{ #category : 'as yet unclassified' }
WormHole >> land [
"returns the amount of squares to move, in this case a negative amount"
^ (-4)
]
