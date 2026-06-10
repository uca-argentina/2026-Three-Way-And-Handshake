Class {
	#name : 'Cancellation',
	#superclass : 'InstantCard',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Cancellation >> applyIn: aGame [ 
    aGame deactivate: target
]

{ #category : 'as yet unclassified' }
Cancellation >> removing: aCard [ 
    target := aCard.
    ^ self
]
