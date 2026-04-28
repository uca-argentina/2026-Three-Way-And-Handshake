Class {
	#name : 'Die',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Die class >> roll [
	^ 1.
]

{ #category : 'as yet unclassified' }
Die class >> withSides: aNumberOfSides [

	aNumberOfSides < 1 ifTrue: [ Error signal: 'Die sides cannot be negative or zero']
]
