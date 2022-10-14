!classDefinition: #EmptyStack category: 'Stack-Exercise'!
Error subclass: #EmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #InvalidPrefix category: 'Stack-Exercise'!
Error subclass: #InvalidPrefix
	instanceVariableNames: 'stackTarget'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:02'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:57'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'lvg 10/13/2022 18:06:22'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'lvg 10/11/2022 21:18:44'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test' stamp: 'lvg 10/11/2022 21:18:51'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'lvg 10/11/2022 21:19:05'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'lvg 10/11/2022 21:19:10'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test' stamp: 'lvg 10/11/2022 21:19:18'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'lvg 10/11/2022 21:19:27'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'lvg 10/11/2022 21:19:32'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'lvg 10/13/2022 18:05:37'!
test11CanNotPushElementWhenAStackIsAlreadyFull

	| stack |
	stack := OOStack newWith: 2.
	
	stack push: 'something'.
	stack push: 'anotherSomething'.
	
	[stack push: 'TryPush'. self fail]
	on: Error
	do: [self assert: stack size = 2].
	! !

!OOStackTest methodsFor: 'test' stamp: 'lvg 10/13/2022 18:09:16'!
test12PopRemovesAnElementFromAFullStack

	| stack |
	stack := OOStack newWith: 2.
	
	stack push: 'something'.
	stack push: 'anotherSomething'.
	stack pop.
	
	self assert: stack size = 1.
	self deny: stack isFull.! !

!OOStackTest methodsFor: 'test' stamp: 'lvg 10/13/2022 18:09:47'!
test13PopRemovesElementsFromAFullStackAndGetsEmptied

	| stack |
	stack := OOStack newWith: 1.
	
	stack push: 'something'.	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'lvg 10/13/2022 18:09:27'!
test14TopFromAFullStackDoesNotRemoveTheElement

	| stack element |
	stack := OOStack newWith: 2.
	
	stack push: 'something'.
	stack push: 'anotherSomething'.
	
	element := stack top.

	self assert: element = 'anotherSomething'.
	self assert: stack isFull.! !

!OOStackTest methodsFor: 'test' stamp: 'lvg 10/13/2022 18:19:01'!
test15StackGetsFullThenPopThenPushAndOnceAgainGetsFull

	| stack element |
	stack := OOStack newWith: 2.
	
	stack push: 'something'.
	stack push: 'anotherSomething'.
	stack pop.
	element := 'finalAnotherSomething'.

	stack push: element .

	
	self assert: stack size = 2.
	self assert: stack isFull.
	self assert: element = stack top.! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'lvg 10/13/2022 18:37:11'!
test01FindASentenceInAnEmptyStackAndRaiseError
	
	|aStack sentenceFinder aPrefix|	
	
	aStack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix newWith: aStack.
	aPrefix :='a'.
	
	[sentenceFinder findByPrefix: aPrefix. self fail]
	on: EmptyStack
	do: [self assert: aStack isEmpty]
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'lvg 10/13/2022 23:00:22'!
test02FindAnEmptySentenceShouldRaiseAnError

	| stack anElement sentenceFinder prefixToFind |
	
	stack := OOStack new.
	anElement := 'ASentence'.
	stack push: anElement.
	
	sentenceFinder := SentenceFinderByPrefix newWith: stack.
	prefixToFind :=  ''.
	
	[sentenceFinder findByPrefix: prefixToFind. self fail]
	on: InvalidPrefix
	do: [self assert: stack top = anElement].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'lvg 10/13/2022 23:01:07'!
test03FindASentenceWithSpacesShouldRaiseAnError
	
	|stack anElement sentenceFinder prefixToFind|
	
	stack := OOStack new.
	anElement := 'ASentence'.
	stack push: anElement.
	
	sentenceFinder := SentenceFinderByPrefix newWith: stack.
	prefixToFind :=  'A Sentence'.
	
	[sentenceFinder findByPrefix: prefixToFind. self fail]
	on: InvalidPrefix
	do: [self assert: stack top = anElement].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'lvg 10/13/2022 23:01:52'!
test04FindASentenceIsCaseSensitive

	| stack anElement sentenceFinder prefixToFind coincidences|
	
	stack := OOStack new.
	anElement := 'ASentence'.
	stack push: anElement.
	
	sentenceFinder := SentenceFinderByPrefix newWith: stack.
	prefixToFind := 'asentence'.
	
	coincidences := sentenceFinder findByPrefix: prefixToFind.
	
	self assert: coincidences isEmpty.
	self assert: stack top = anElement.
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'lvg 10/13/2022 23:03:34'!
test05FindASentenceWithoutCoincidences
	
	| stack anElement anotherElement sentenceFinder prefixToFind coincidences |
	
	stack := OOStack new.
	anElement := 'ASentence'.
	anotherElement := 'AnotherSentence'.
	
	stack push: anElement.
	stack push: anotherElement.
	
	sentenceFinder := SentenceFinderByPrefix newWith: stack.
	prefixToFind :=  'OneSentence'.
	
	coincidences := sentenceFinder findByPrefix: prefixToFind.
	
	self assert: coincidences isEmpty.
	self assert: stack size = 2.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'lvg 10/13/2022 23:04:30'!
test06FindASentenceWithOneCoincidence
	
	| stack anElement anotherElement sentenceFinder prefixToFind coincidences |
	
	stack := OOStack new.
	anElement := 'ASentence'.
	anotherElement := 'AnotherSentence'.
	
	stack push: anElement.
	stack push: anotherElement.
	
	sentenceFinder := SentenceFinderByPrefix newWith: stack.
	prefixToFind := 'ASen'.
	
	coincidences := sentenceFinder findByPrefix: prefixToFind..
	
	self assert: coincidences size = 1.			"Prueba"
	self assert: stack size = 2.			
	self assert: stack top = anotherElement.	 "Prueba"
	self assert: coincidences includes: anElement.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'lvg 10/13/2022 23:05:23'!
test07FindASentenceWithMultiplesCoincidences
	
	| stack anElement anotherElement lastElement sentenceFinder prefixToFind coincidences |
	
	stack := OOStack new.
	anElement := 'ASentence'.
	anotherElement := 'AnotherSentence'.
	lastElement := 'ASuperSentence'.
	
	stack push: anElement.
	stack push: anotherElement.
	stack push: lastElement.
	
	sentenceFinder := SentenceFinderByPrefix newWith: stack.
	prefixToFind := 'AS'.
	
	coincidences := sentenceFinder findByPrefix: prefixToFind.
	
	self assert: coincidences size = 2.
	self assert: coincidences includes: anElement.
	self assert: coincidences includes: lastElement.
	self assert: stack size = 3.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'lvg 10/13/2022 23:06:23'!
test08FindASentenceInElementsWithPrefixInTheMiddle
	
	| stack anElement anotherElement lastElement sentenceFinder prefixToFind coincidences |
	
	stack := OOStack new.
	anElement := 'ASentence'.
	anotherElement := 'AnotherSentence'.
	lastElement := 'Sentence, ASuperSentence'.
	
	stack push: anElement.
	stack push: anotherElement.
	stack push: lastElement.
	
	sentenceFinder := SentenceFinderByPrefix newWith: stack.
	prefixToFind :=  'AS'.
	
	coincidences := sentenceFinder findByPrefix: prefixToFind.
	
	self assert: coincidences size = 1.
	self assert: coincidences includes: anElement.
	self assert: stack size = 3.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'lvg 10/13/2022 23:07:03'!
test09FindASentenceLongerThanTheElement
	
	| stack anElement anotherElement sentenceFinder prefixToFind coincidences |
	
	stack := OOStack new.
	anElement := 'ASentence'.
	anotherElement := 'OneSentence'.
	
	stack push: anElement.
	stack push: anotherElement.
	
	sentenceFinder := SentenceFinderByPrefix newWith: stack.
	prefixToFind := 'ASentenceOfSmalltalk'.
	
	coincidences := sentenceFinder findByPrefix: prefixToFind.
	
	self assert: coincidences isEmpty.
	self assert: stack size = 2.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'lvg 10/13/2022 23:12:25'!
test10SentenceIsNotAString

	| stack anElement sentenceFinder prefixToFind |
	
	stack := OOStack new.
	anElement := 'ASentence'.
	stack push: anElement.
	
	sentenceFinder := SentenceFinderByPrefix newWith: stack.
	prefixToFind :=  1.
	
	[sentenceFinder findByPrefix: prefixToFind. self fail]
	on: InvalidPrefix
	do: [self assert: stack top = anElement].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'lvg 10/14/2022 14:00:28'!
test11StacksRemainsSameOrderAfterPrevioslyFoundSomeCoincidences
	
	| stack anElement anotherElement lastElement sentenceFinder prefixToFind coincidences |
	
	stack := OOStack new.
	anElement := 'ASentence'.
	anotherElement := 'AnotherSentence'.
	lastElement := 'ASuperSentence'.
	
	stack push: anElement.
	stack push: anotherElement.
	stack push: lastElement.
	
	sentenceFinder := SentenceFinderByPrefix newWith: stack.
	prefixToFind := 'AS'.
	
	coincidences := sentenceFinder findByPrefix: prefixToFind.
	
	self assert: stack pop = lastElement .
	self assert: stack pop = anotherElement .
	self assert: stack pop = anElement.
	self assert: coincidences includes: anElement.	
	self assert: coincidences includes: lastElement.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack stackStatus limit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'signals' stamp: 'lvg 10/9/2022 11:50:31'!
signalStackIsEmpty

	self error: self class stackEmptyErrorDescription .! !

!OOStack methodsFor: 'signals' stamp: 'AGH 10/13/2022 17:22:31'!
signalStackIsFull

	self error: self class stackFullErrorDescription .! !


!OOStack methodsFor: 'operations' stamp: 'lv 10/13/2022 11:55:29'!
pop
	^stackStatus tryPop: self.
	
! !

!OOStack methodsFor: 'operations' stamp: 'AGH 10/13/2022 17:30:56'!
push: anElement

	^stackStatus tryPush: anElement from: self.
	
! !

!OOStack methodsFor: 'operations' stamp: 'lv 10/13/2022 11:55:47'!
top
	^stackStatus tryTop: self.
! !


!OOStack methodsFor: 'initialization' stamp: 'AGH 10/13/2022 17:41:15'!
initialize

	stack := OrderedCollection new.
	stackStatus := OOStackStatus newWith: self.	
	limit := 1000000000.

! !

!OOStack methodsFor: 'initialization' stamp: 'AGH 10/13/2022 17:17:15'!
initializeWith: aLimit

	stack := OrderedCollection new.
	stackStatus := OOStackStatus newWith: self.	
	limit := aLimit.! !


!OOStack methodsFor: 'valid operations' stamp: 'lv 10/13/2022 10:49:51'!
canPop

	| anElement |
	
	anElement := stack removeFirst.	
	stackStatus := 	OOStackStatus newWith: self.
	
	^anElement.! !

!OOStack methodsFor: 'valid operations' stamp: 'AGH 10/13/2022 17:20:59'!
canPush: anElement

	stack addFirst: anElement.
	stackStatus := 		OOStackStatus newWith: self.! !

!OOStack methodsFor: 'valid operations' stamp: 'lv 10/13/2022 11:02:48'!
canTop

	^stack at: 1.! !


!OOStack methodsFor: 'status' stamp: 'lvg 10/11/2022 20:52:21'!
size

	^stack size.! !


!OOStack methodsFor: 'testing' stamp: 'lvg 10/11/2022 20:51:51'!
isEmpty

	^stack isEmpty.! !

!OOStack methodsFor: 'testing' stamp: 'AGH 10/13/2022 17:16:53'!
isFull

	^ self size = limit.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'AGH 10/13/2022 17:22:44'!
stackFullErrorDescription
	
	^ 'Stack is full'! !


!OOStack class methodsFor: 'initialization' stamp: 'AGH 10/13/2022 17:11:26'!
newWith: aLimit

	^self new initializeWith: aLimit.! !


!classDefinition: #OOStackStatus category: 'Stack-Exercise'!
Object subclass: #OOStackStatus
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackStatus methodsFor: 'initialization' stamp: 'lvg 10/13/2022 09:48:17'!
initializeWith: aStack
	
	stack := aStack! !


!OOStackStatus methodsFor: 'stack status operations' stamp: 'lv 10/13/2022 11:55:29'!
tryPop: aStack

	self subclassResponsibility ! !

!OOStackStatus methodsFor: 'stack status operations' stamp: 'lvg 10/13/2022 21:35:47'!
tryPush: anElement from: aStack

	self subclassResponsibility.! !

!OOStackStatus methodsFor: 'stack status operations' stamp: 'lv 10/13/2022 11:55:47'!
tryTop: aStack

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackStatus class' category: 'Stack-Exercise'!
OOStackStatus class
	instanceVariableNames: ''!

!OOStackStatus class methodsFor: 'assign' stamp: 'AGH 10/13/2022 16:57:43'!
assignSubclassStatusWith: aStack

	self subclassResponsibility.! !


!OOStackStatus class methodsFor: 'initialization' stamp: 'AGH 10/13/2022 16:53:03'!
newWith: aStack

	^(self subclasses detect: [:statusSubclasses |
				statusSubclasses assignSubclassStatusWith: aStack
				]) new.
				! !


!classDefinition: #OOStackIsEmpty category: 'Stack-Exercise'!
OOStackStatus subclass: #OOStackIsEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackIsEmpty methodsFor: 'stack status operations' stamp: 'lv 10/13/2022 11:55:29'!
tryPop: aStack

	^aStack signalStackIsEmpty.
! !

!OOStackIsEmpty methodsFor: 'stack status operations' stamp: 'AGH 10/13/2022 17:30:22'!
tryPush: anElement from: aStack

	^ aStack canPush: anElement.! !

!OOStackIsEmpty methodsFor: 'stack status operations' stamp: 'lv 10/13/2022 11:55:47'!
tryTop: aStack

	^aStack signalStackIsEmpty.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackIsEmpty class' category: 'Stack-Exercise'!
OOStackIsEmpty class
	instanceVariableNames: ''!

!OOStackIsEmpty class methodsFor: 'assign' stamp: 'lvg 10/11/2022 21:42:49'!
assignSubclassStatusWith: aStack

	^ aStack isEmpty.! !


!classDefinition: #OOStackIsFull category: 'Stack-Exercise'!
OOStackStatus subclass: #OOStackIsFull
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackIsFull methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 17:23:21'!
tryPop: aStack

	^aStack canPop.
	
! !

!OOStackIsFull methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 17:30:10'!
tryPush: anElement from: aStack
	
	^ aStack signalStackIsFull.
! !

!OOStackIsFull methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 17:23:33'!
tryTop: aStack

	^aStack canTop.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackIsFull class' category: 'Stack-Exercise'!
OOStackIsFull class
	instanceVariableNames: ''!

!OOStackIsFull class methodsFor: 'assign' stamp: 'AGH 10/13/2022 17:15:43'!
assignSubclassStatusWith: aStack

	^aStack isFull.! !


!classDefinition: #OOStackIsNotEmpty category: 'Stack-Exercise'!
OOStackStatus subclass: #OOStackIsNotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackIsNotEmpty methodsFor: 'stack status operations' stamp: 'lv 10/13/2022 11:55:29'!
tryPop: aStack

	^aStack canPop.
	
! !

!OOStackIsNotEmpty methodsFor: 'stack status operations' stamp: 'AGH 10/13/2022 17:30:36'!
tryPush: anElement from: aStack

	^ aStack canPush: anElement.! !

!OOStackIsNotEmpty methodsFor: 'stack status operations' stamp: 'lv 10/13/2022 11:55:47'!
tryTop: aStack

	^aStack canTop.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackIsNotEmpty class' category: 'Stack-Exercise'!
OOStackIsNotEmpty class
	instanceVariableNames: ''!

!OOStackIsNotEmpty class methodsFor: 'assign' stamp: 'AGH 10/13/2022 17:44:31'!
assignSubclassStatusWith: aStack

	^aStack isEmpty not and: [aStack isFull not].

	! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stackTarget coincidences'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'lvg 10/14/2022 13:44:21'!
findByPrefix: aPrefix

	| auxiliarStack |
	self validatePrefix: aPrefix.
	self validateStack.

	auxiliarStack := OOStack new.

	self iterate: stackTarget creating: auxiliarStack andLookFor: aPrefix.
	self iterate: auxiliarStack creating: stackTarget andLookFor: 'doNothing'.
	
	"
	self compares: aPrefix fromEachElementIn: auxiliarStack.
	self fillStackFromAn: auxiliarStack.	"

	^coincidences! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'AGH 10/13/2022 16:28:45'!
initializeWith: aStack
	
	stackTarget := aStack.
	coincidences := OrderedCollection new.! !


!SentenceFinderByPrefix methodsFor: 'iterate - private' stamp: 'lvg 10/13/2022 23:21:39'!
compares: aPrefix fromEachElementIn: anAuxiliarStack

	^ [stackTarget isEmpty not] whileTrue: [ |actualElement  |
		actualElement := stackTarget pop.
		anAuxiliarStack push: actualElement.
		(actualElement is: aPrefix substringAt: 1) ifTrue: [coincidences add: actualElement]

		]! !

!SentenceFinderByPrefix methodsFor: 'iterate - private' stamp: 'lvg 10/13/2022 23:23:18'!
fillStackFromAn: auxiliarStack

	^ [auxiliarStack isEmpty not] whileTrue: [ |actualElement|
		actualElement := auxiliarStack pop.
		stackTarget push: actualElement.
		]! !

!SentenceFinderByPrefix methodsFor: 'iterate - private' stamp: 'lvg 10/14/2022 00:12:43'!
iterate: aStack creating: anotherStack andLookFor: aPrefix
	
	^[aStack isEmpty not] whileTrue: [ |actualElement|
		actualElement := aStack pop.
		anotherStack push: actualElement.
		(actualElement is: aPrefix substringAt: 1) ifTrue: [coincidences add: actualElement]
		].! !


!SentenceFinderByPrefix methodsFor: 'validations' stamp: 'lvg 10/13/2022 23:14:01'!
validatePrefix: aPrefix
	
	(aPrefix isString not or: [aPrefix isEmpty] or: [aPrefix includesSubString: ' '] ) ifTrue: [^ InvalidPrefix signal].! !

!SentenceFinderByPrefix methodsFor: 'validations' stamp: 'AGH 10/13/2022 16:37:48'!
validateStack

	stackTarget isEmpty ifTrue: [^EmptyStack signal].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'initialization' stamp: 'AGH 10/13/2022 14:43:44'!
newWith: aStack
	
	^self new initializeWith: aStack.! !
