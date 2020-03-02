Class {
	#name : #CoWorkspaceVariablesHeuristic,
	#superclass : #CoASTNodeFetcherHeuristic,
	#category : #'Complishon-Heuristics'
}

{ #category : #requests }
CoWorkspaceVariablesHeuristic >> appliesForNode: aNode inContext: aContext [

	^ aContext isWorkspace
]

{ #category : #requests }
CoWorkspaceVariablesHeuristic >> buildFetcherFor: aNode inContext: aContext [

	^ (GenericComplishonFetcher onCollection: aContext doItRequestor model variableBindings keys),
			(next fetcherFor: aNode inContext: aContext)
]