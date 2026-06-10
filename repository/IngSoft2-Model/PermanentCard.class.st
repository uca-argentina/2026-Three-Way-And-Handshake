Class {
	#name : 'PermanentCard',
	#superclass : 'Card',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
PermanentCard >> effect [
    ^ self subclassResponsibility
]

{ #category : 'as yet unclassified' }
PermanentCard >> playedIn: aGame by: aShip [ 
    aGame assertIsCurrentShip: aShip.
    aGame activate: self
]
