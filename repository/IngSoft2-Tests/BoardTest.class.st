Class {
	#name : 'BoardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BoardTest >> test001WhenABoardWithSize10IsCreatedThenTheSizeIs10 [

| aBoard aCollectionOfShips |
	aCollectionOfShips := OrderedCollection new.

	aBoard := Board withSize: 10 andShips: aCollectionOfShips.

self assert: aBoard getSize equals: 10.
]

{ #category : 'tests' }
BoardTest >> test002WhenABoardIsSetWithSize0OrSmallerThenItIsNotInstantiated [
	| aCollectionOfShips aBoard |
	aCollectionOfShips := OrderedCollection new.

	

self
		should: [ aBoard := Board withSize: 0 andShips: aCollectionOfShips. ]
		raise: Error
		withExceptionDo: [ :error |
			self
				assert: error messageText
				equals: 'Board size cannot be negative or zero']
]

{ #category : 'tests' }
BoardTest >> test003WhenABoardIsSetWithSizeOtherThanIntegerThenItIsNotInstantiated [

	| aBoard aCollectionOfShips |
	aCollectionOfShips := OrderedCollection new.
	self
		should: [
		aBoard := Board withSize: 'aaaa' andShips: aCollectionOfShips ]
		raise: Error
		withExceptionDo: [ :error |
				self
					assert: error messageText
					equals: 'Board size cannot be other than integer' ]
]
