Class {
	#name : 'Overload',
	#superclass : 'PermanentCard',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Overload >> affects: aShip [ 
    ^ target = aShip
]

{ #category : 'as yet unclassified' }
Overload >> effect [

	^ -2
]
