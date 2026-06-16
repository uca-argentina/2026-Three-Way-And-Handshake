Class {
	#name : 'Card',
	#superclass : 'Object',
	#instVars : [
		'target'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
Card >> aimedAt: aTarget [

	target := aTarget.
	^ self
]
