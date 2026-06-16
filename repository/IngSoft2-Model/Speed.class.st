Class {
	#name : 'Speed',
	#superclass : 'PermanentCard',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Speed >> affects: aShip [ 
    ^ target = aShip
]

{ #category : 'as yet unclassified' }
Speed >> effect [

	^ 1
]
