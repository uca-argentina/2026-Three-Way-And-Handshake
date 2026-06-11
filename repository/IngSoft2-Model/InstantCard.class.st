Class {
	#name : 'InstantCard',
	#superclass : 'Card',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
InstantCard >> applyIn: aGame [
    self subclassResponsibility
]

{ #category : 'as yet unclassified' }
InstantCard >> playedIn: aGame by: aShip [

	aGame assertGameIsNotOver.
	self applyIn: aGame.
	aGame registerLastPlayed: self
]
