"
I implement an heuristic for global variables accessible in the completion environment.

See my superclass for details.
"
Class {
	#name : #CoGlobalVariablesHeuristic,
	#superclass : #CoASTNodeFetcherHeuristic,
	#category : #'Complishon-Heuristics'
}

{ #category : #requests }
CoGlobalVariablesHeuristic >> appliesForNode: aNode inContext: aContext [

	^ aNode isVariable and: [ aNode name first isUppercase ]
]

{ #category : #requests }
CoGlobalVariablesHeuristic >> buildFetcherFor: aNode inContext: complishonContext [

	^ CoGlobalVariableFetcher new
			complishonEnvironment: complishonContext complishonEnvironment;
			yourself
]
