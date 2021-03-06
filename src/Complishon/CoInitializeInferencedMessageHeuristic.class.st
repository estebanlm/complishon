"
I am an heuristic using depth-bound type inference to type variables.
I autocomplete messages in the hierarchy of the found types.
"
Class {
	#name : #CoInitializeInferencedMessageHeuristic,
	#superclass : #CoASTNodeFetcherHeuristic,
	#category : #'Complishon-InitializeInferenceHeuristic'
}

{ #category : #requests }
CoInitializeInferencedMessageHeuristic >> appliesForNode: aNode inContext: aContext [

	^ aContext complishonClass notNil
		and: [ aNode receiver isVariable ]
]

{ #category : #requests }
CoInitializeInferencedMessageHeuristic >> buildFetcherFor: aNode inContext: aContext [

	| variables fetcher |
	variables := self inferTypesIn: aContext complishonClass.
	fetcher := CoEmptyFetcher new.
	variables
		at: aNode receiver name
		ifPresent: [ :types |
			types do: [ :each |
				fetcher := (self newMessageInHierarchyFetcherForClass: each), fetcher ] ].
	^ fetcher
]

{ #category : #requests }
CoInitializeInferencedMessageHeuristic >> inferTypesIn: aClass [

	^ CoTypeInferencer new
		inferFrom: aClass;
		variables
]
