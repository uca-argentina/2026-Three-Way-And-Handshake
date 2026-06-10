Class {
	#name : 'Redo',
	#superclass : 'Card',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Redo >> playedIn: aGame by: aShip [ 
    (aGame lastPlayedCard class new aimedAt: target) playedIn: aGame by: aShip

]
