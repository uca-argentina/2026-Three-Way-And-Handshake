Class {
	#name : 'NullCard',
	#superclass : 'Card',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
NullCard >> playedIn: aGame by: aShip [ 
    Error signal: 'No card has been played yet.'
]
