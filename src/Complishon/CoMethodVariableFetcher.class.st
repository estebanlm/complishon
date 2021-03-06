"
I am a complishon fetcher that autocompletes variable names accessible in the lexical context of a method.
That is, block temporaries, block arguments, method temporaries and method arguments.

From a given ast node, I walk up the tree looking for scopes and yield the variables I find.
"
Class {
	#name : #CoMethodVariableFetcher,
	#superclass : #CoFetcher,
	#instVars : [
		'complishonASTNode'
	],
	#category : #'Complishon-Fetchers'
}

{ #category : #accessing }
CoMethodVariableFetcher >> complishonASTNode [
	^ complishonASTNode
]

{ #category : #accessing }
CoMethodVariableFetcher >> complishonASTNode: anObject [
	complishonASTNode := anObject
]

{ #category : #accessing }
CoMethodVariableFetcher >> entriesDo: aBlock [

	self methodVariableNamesDo: [ :each |
		aBlock value: (NECLocalEntry contents: each node: self) ]
]

{ #category : #accessing }
CoMethodVariableFetcher >> methodVariableNamesDo: aBlock [

	| currentNode |
	currentNode := complishonASTNode.
	[ currentNode notNil ] whileTrue: [ 
		"ASTs are strange.
		There is no way to ask the variables defined in the scope in an ordered way.
		Hack our way through"
		self flag: #notNice.
		currentNode isSequence ifTrue: [ 
			currentNode temporaryNames do: aBlock.
			currentNode parent argumentNames do: aBlock ].
		currentNode := currentNode parent ]
]
