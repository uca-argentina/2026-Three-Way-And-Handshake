Class {
	#name : 'BoardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BoardTest >> test001WhenABoardWithSize10IsCreatedThenTheSizeIs10 [

	| aBoard |
	aBoard := Board withSize: 10.

	self assert: aBoard size equals: 10
]

{ #category : 'tests' }
BoardTest >> test002WhenABoardIsSetWithSize0OrSmallerThenItIsNotInstantiated [

	| aBoard |
	self
		should: [ aBoard := Board withSize: 0 ]
		raise: Error
		withExceptionDo: [ :error |
				self
					assert: error messageText
					equals: 'Board size cannot be negative or zero' ]
]

{ #category : 'tests' }
BoardTest >> test003WhenABoardIsSetWithSizeOtherThanIntegerThenItIsNotInstantiated [

	| aBoard |
	self
		should: [ aBoard := Board withSize: 'aaaa' ]
		raise: Error
		withExceptionDo: [ :error |
				self
					assert: error messageText
					equals: 'Board size cannot be other than integer' ]
]

{ #category : 'tests' }
BoardTest >> test004WhenABoardIsCreatedWithLengthInParsecsItCanConvertParsecsToSquares [

	| aBoard |
	aBoard := Board
		          withSize: 100
		          lengthInParsecs: 1000
		          and: Dictionary new.

	self assert: (aBoard parsecsToSquares: 100) equals: 10
]

{ #category : 'tests' }
BoardTest >> test005WhenABoardIsCreatedWithLengthInLightYearsItCanConvertLightYearsToSquares [

	| aBoard |
	aBoard := Board
		          withSize: 100
		          lengthInLightYears: 300
		          and: Dictionary new.
	self assert: (aBoard lightYearsToSquares: 30) equals: 10
]
