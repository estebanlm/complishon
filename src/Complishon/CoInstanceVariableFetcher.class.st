"
I am a fetcher looking for the instance variables implemented in a class.
"
Class {
	#name : #CoInstanceVariableFetcher,
	#superclass : #CoClassBasedFetcher,
	#category : #'Complishon-Fetchers'
}

{ #category : #entries }
CoInstanceVariableFetcher >> entriesDo: aBlock [
	
	self completionClass instVarNames do: [ :e |
		aBlock value: (NECInstVarEntry contents: e node: self)]
]
