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

!OOStackTest methodsFor: 'test' stamp: 'lvg 10/11/2022 21:18:27'!
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


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 12:36:13'!
test01FindASentenceInAnEmptyStackAndRaiseError
	
	|aStack aFinder aPrefixToFind|
	
	aStack := OOStack new.
	aFinder := SentenceFinderByPrefix newWith: aStack.
	aPrefixToFind := 'a'.
	
	[aFinder findByPrefix: aPrefixToFind. self fail]
	on: Error
	do: [self assert: aStack isEmpty]
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 12:52:28'!
test02FindAnEmptySentenceShouldRaiseAnError

	|aStack element aFinder prefixToFind|
	
	aStack := OOStack new.
	element := 'ASentence'.
	aStack push: element.
	
	aFinder := SentenceFinderByPrefix newWith: aStack.
	prefixToFind := ''.
	
	[aFinder findByPrefix: prefixToFind. self fail]
	on: Error
	do: [[self assert: prefixToFind isEmpty] and: [self assert: aStack top = element]]! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 12:54:02'!
test03FindASentenceWithSpacesShouldRaiseAnError
	
	|aStack element aFinder prefixToFind|
	
	aStack := OOStack new.
	element := 'ASentence'.
	aStack push: element.
	
	aFinder := SentenceFinderByPrefix newWith: aStack.
	prefixToFind := 'A Sentence'.
	
	[aFinder findByPrefix: prefixToFind. self fail]
	on: Error
	"do: [[self assert: [prefixToFind indexOf: $  ifAbsent: [0]]] and: [self assert: aStack top = element]]"
	do: [^'Hacer verificacion!!!!!!'].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 13:19:24'!
test04FindASentenceIsCaseSensitive

	|aStack element aFinder prefixToFind coincidences|
	
	aStack := OOStack new.
	element := 'ASentence'.
	aStack push: element.
	
	aFinder := SentenceFinderByPrefix newWith: aStack.
	prefixToFind := 'asentence'.
	
	coincidences := aFinder findByPrefix: prefixToFind.
	
	self assert: coincidences isEmpty.
	self assert: aStack top = element.
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 13:16:53'!
test05FindASentenceWithoutCoincidences
	
	|aStack element anotherElement aFinder prefixToFind coincidences|
	
	aStack := OOStack new.
	element := 'ASentence'.
	anotherElement := 'AnotherSentence'.
	
	aStack push: element.
	aStack push: anotherElement.
	
	aFinder := SentenceFinderByPrefix newWith: aStack.
	prefixToFind := 'OneSentence'.
	
	coincidences := aFinder findByPrefix: prefixToFind.
	
	self assert: coincidences isEmpty.
	self assert: aStack size = 2.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 13:16:50'!
test06FindASentenceWithOneCoincidence
	
	|aStack element anotherElement aFinder prefixToFind coincidences|
	
	aStack := OOStack new.
	element := 'ASentence'.
	anotherElement := 'AnotherSentence'.
	
	aStack push: element.
	aStack push: anotherElement.
	
	aFinder := SentenceFinderByPrefix newWith: aStack.
	prefixToFind := 'ASen'.
	
	coincidences := aFinder findByPrefix: prefixToFind.
	
	self assert: coincidences size = 1.
	self assert: coincidences includes: element.
	self assert: aStack size = 2.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 13:16:42'!
test07FindASentenceWithMultiplesCoincidences
	
	|aStack element anotherElement lastElement aFinder prefixToFind coincidences|
	
	aStack := OOStack new.
	element := 'ASentence'.
	anotherElement := 'AnotherSentence'.
	lastElement := 'ASuperSentence'.
	
	aStack push: element.
	aStack push: anotherElement.
	aStack push: lastElement.
	
	aFinder := SentenceFinderByPrefix newWith: aStack.
	prefixToFind := 'AS'.
	
	coincidences := aFinder findByPrefix: prefixToFind.
	
	self assert: coincidences size = 2.
	self assert: coincidences includes: element.
	self assert: coincidences includes: lastElement.
	self assert: aStack size = 3.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 13:25:25'!
test08FindASentenceInElementsWithPrefixInTheMiddle
	
	|aStack element anotherElement lastElement aFinder prefixToFind coincidences|
	
	aStack := OOStack new.
	element := 'ASentence'.
	anotherElement := 'AnotherSentence'.
	lastElement := 'Sentence, ASuperSentence'.
	
	aStack push: element.
	aStack push: anotherElement.
	aStack push: lastElement.
	
	aFinder := SentenceFinderByPrefix newWith: aStack.
	prefixToFind := 'AS'.
	
	coincidences := aFinder findByPrefix: prefixToFind.
	
	self assert: coincidences size = 1.
	self assert: coincidences includes: element.
	self assert: aStack size = 3.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 13:23:57'!
test09FindASentenceLongerThanTheElement
	
	|aStack element anotherElement aFinder prefixToFind coincidences|
	
	aStack := OOStack new.
	element := 'ASentence'.
	anotherElement := 'OneSentence'.
	
	aStack push: element.
	aStack push: anotherElement.
	
	aFinder := SentenceFinderByPrefix newWith: aStack.
	prefixToFind := 'ASentenceOfSmalltalk'.
	
	coincidences := aFinder findByPrefix: prefixToFind.
	
	self assert: coincidences isEmpty.
	self assert: aStack size = 2.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 13:30:58'!
test10ASentenceIsNotAString
	
	|aStack element aFinder aPrefixToFind |
	
	aStack := OOStack new.
	element := '1'.
	
	aFinder := SentenceFinderByPrefix newWith: aStack.
	aPrefixToFind := 1.
	
	[aFinder findByPrefix: aPrefixToFind. self fail]
	on: Error
	do: [self assert: element ~= aPrefixToFind].! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack stackStatus'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'signals' stamp: 'lvg 10/9/2022 11:50:31'!
signalStackIsEmpty

	self error: self class stackEmptyErrorDescription .! !


!OOStack methodsFor: 'operations' stamp: 'lv 10/13/2022 11:55:29'!
pop
	^stackStatus tryPop: self.
	
! !

!OOStack methodsFor: 'operations' stamp: 'lv 10/13/2022 10:57:19'!
push: anElement

	stack addFirst: anElement.
	
	stackStatus := 		OOStackStatus newWith: self.
! !

!OOStack methodsFor: 'operations' stamp: 'lv 10/13/2022 11:55:47'!
top
	^stackStatus tryTop: self.
! !


!OOStack methodsFor: 'initialization' stamp: 'lvg 10/11/2022 21:33:26'!
initialize

	stack := OrderedCollection new.
	stackStatus := OOStackStatus newWith: self.

! !


!OOStack methodsFor: 'validOperations' stamp: 'lv 10/13/2022 10:49:51'!
canPop

	| anElement |
	
	anElement := stack removeFirst.	
	stackStatus := 	OOStackStatus newWith: self.
	
	^anElement.! !

!OOStack methodsFor: 'validOperations' stamp: 'lv 10/13/2022 11:02:48'!
canTop

	^stack at: 1.! !


!OOStack methodsFor: 'status' stamp: 'lvg 10/11/2022 20:52:21'!
size

	^stack size.! !


!OOStack methodsFor: 'testing' stamp: 'lvg 10/11/2022 20:51:51'!
isEmpty

	^stack isEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


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

!OOStackStatus methodsFor: 'stack status operations' stamp: 'lv 10/13/2022 11:55:47'!
tryTop: aStack

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackStatus class' category: 'Stack-Exercise'!
OOStackStatus class
	instanceVariableNames: ''!

!OOStackStatus class methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 12:15:46'!
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

!OOStackIsEmpty methodsFor: 'stack status operations' stamp: 'lv 10/13/2022 11:55:47'!
tryTop: aStack

	^aStack signalStackIsEmpty.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackIsEmpty class' category: 'Stack-Exercise'!
OOStackIsEmpty class
	instanceVariableNames: ''!

!OOStackIsEmpty class methodsFor: 'as yet unclassified' stamp: 'lvg 10/11/2022 21:42:49'!
assignSubclassStatusWith: aStack

	^ aStack isEmpty.! !


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

!OOStackIsNotEmpty methodsFor: 'stack status operations' stamp: 'lv 10/13/2022 11:55:47'!
tryTop: aStack

	^aStack canTop.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackIsNotEmpty class' category: 'Stack-Exercise'!
OOStackIsNotEmpty class
	instanceVariableNames: ''!

!OOStackIsNotEmpty class methodsFor: 'as yet unclassified' stamp: 'lv 10/13/2022 10:53:11'!
assignSubclassStatusWith: aStack

	^aStack isEmpty not.

	! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stackTarget'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'AGH 10/13/2022 12:28:03'!
findByPrefix: aPrefix

	! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'AGH 10/13/2022 12:20:34'!
initializeWith: aStack
	
	stackTarget := aStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 12:25:28'!
newWith: aStack
	
	self new initializeWith: aStack.! !
