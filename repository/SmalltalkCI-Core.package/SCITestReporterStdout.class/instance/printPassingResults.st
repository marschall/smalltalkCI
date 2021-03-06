printing
printPassingResults
	| title |
	self newLine; printTravisFold: 'passing_tests' action: 'start'.
	title := '(', runner passingTests asString, ' tests passed)'.
	self print: title; newLine.
	
	[ runner results keysAndValuesDo: [ :class :results | | passing |
		passing := results select: [ :result | result passed ].
		passing ifNotEmpty: [
			self printClassTitle: class.
			passing do: [ :result | self printPass: result ] ] ]
	] ensure: [ self printTravisFold: 'passing_tests' action: 'end' ]