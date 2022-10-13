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

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 16:59:20'!
test01FindASentenceInAnEmptyStackAndRaiseError
	
	|aStack sentenceFinder aPrefixToFind|	
	
	aStack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix newWith: aStack.
	aPrefixToFind := Prefix newWith: 'a'.
	
	[sentenceFinder findByPrefix: aPrefixToFind. self fail]
	on: EmptyStack
	do: [self assert: aStack isEmpty]
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 17:02:30'!
test02FindAnEmptySentenceShouldRaiseAnError

	|aStack element sentenceFinder prefixToFind|
	
	aStack := OOStack new.
	element := 'ASentence'.
	aStack push: element.
	
	sentenceFinder := SentenceFinderByPrefix newWith: aStack.
	prefixToFind := Prefix newWith: ''.
	
	[sentenceFinder findByPrefix: prefixToFind. self fail]
	on: InvalidPrefix
	do: [self assert: aStack top = element].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 17:02:33'!
test03FindASentenceWithSpacesShouldRaiseAnError
	
	|aStack element sentenceFinder prefixToFind|
	
	aStack := OOStack new.
	element := 'ASentence'.
	aStack push: element.
	
	sentenceFinder := SentenceFinderByPrefix newWith: aStack.
	prefixToFind := Prefix newWith: 'A Sentence'.
	
	[sentenceFinder findByPrefix: prefixToFind. self fail]
	on: InvalidPrefix
	do: [self assert: aStack top = element].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 16:59:40'!
test04FindASentenceIsCaseSensitive

	|aStack element sentenceFinder prefixToFind coincidences|
	
	aStack := OOStack new.
	element := 'ASentence'.
	aStack push: element.
	
	sentenceFinder := SentenceFinderByPrefix newWith: aStack.
	prefixToFind := Prefix newWith: 'asentence'.
	
	coincidences := sentenceFinder findByPrefix: prefixToFind.
	
	self assert: coincidences isEmpty.
	self assert: aStack top = element.
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 16:59:46'!
test05FindASentenceWithoutCoincidences
	
	|aStack element anotherElement sentenceFinder prefixToFind coincidences|
	
	aStack := OOStack new.
	element := 'ASentence'.
	anotherElement := 'AnotherSentence'.
	
	aStack push: element.
	aStack push: anotherElement.
	
	sentenceFinder := SentenceFinderByPrefix newWith: aStack.
	prefixToFind := Prefix newWith: 'OneSentence'.
	
	coincidences := sentenceFinder findByPrefix: prefixToFind.
	
	self assert: coincidences isEmpty.
	self assert: aStack size = 2.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 16:59:50'!
test06FindASentenceWithOneCoincidence
	
	|aStack element anotherElement sentenceFinder prefixToFind coincidences|
	
	aStack := OOStack new.
	element := 'ASentence'.
	anotherElement := 'AnotherSentence'.
	
	aStack push: element.
	aStack push: anotherElement.
	
	sentenceFinder := SentenceFinderByPrefix newWith: aStack.
	prefixToFind := Prefix newWith: 'ASen'.
	
	coincidences := sentenceFinder findByPrefix: prefixToFind..
	
	self assert: coincidences size = 1.			"Prueba"
	self assert: aStack size = 2.			
	self assert: aStack top = anotherElement.	 "Prueba"
	self assert: coincidences includes: element.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 16:59:54'!
test07FindASentenceWithMultiplesCoincidences
	
	|aStack element anotherElement lastElement sentenceFinder prefixToFind coincidences|
	
	aStack := OOStack new.
	element := 'ASentence'.
	anotherElement := 'AnotherSentence'.
	lastElement := 'ASuperSentence'.
	
	aStack push: element.
	aStack push: anotherElement.
	aStack push: lastElement.
	
	sentenceFinder := SentenceFinderByPrefix newWith: aStack.
	prefixToFind := Prefix newWith: 'AS'.
	
	coincidences := sentenceFinder findByPrefix: prefixToFind.
	
	self assert: coincidences size = 2.
	self assert: coincidences includes: element.
	self assert: coincidences includes: lastElement.
	self assert: aStack size = 3.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 16:59:58'!
test08FindASentenceInElementsWithPrefixInTheMiddle
	
	|aStack element anotherElement lastElement sentenceFinder prefixToFind coincidences|
	
	aStack := OOStack new.
	element := 'ASentence'.
	anotherElement := 'AnotherSentence'.
	lastElement := 'Sentence, ASuperSentence'.
	
	aStack push: element.
	aStack push: anotherElement.
	aStack push: lastElement.
	
	sentenceFinder := SentenceFinderByPrefix newWith: aStack.
	prefixToFind := Prefix newWith: 'AS'.
	
	coincidences := sentenceFinder findByPrefix: prefixToFind.
	
	self assert: coincidences size = 1.
	self assert: coincidences includes: element.
	self assert: aStack size = 3.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 17:00:02'!
test09FindASentenceLongerThanTheElement
	
	|aStack element anotherElement sentenceFinder prefixToFind coincidences|
	
	aStack := OOStack new.
	element := 'ASentence'.
	anotherElement := 'OneSentence'.
	
	aStack push: element.
	aStack push: anotherElement.
	
	sentenceFinder := SentenceFinderByPrefix newWith: aStack.
	prefixToFind := Prefix newWith: 'ASentenceOfSmalltalk'.
	
	coincidences := sentenceFinder findByPrefix: prefixToFind.
	
	self assert: coincidences isEmpty.
	self assert: aStack size = 2.! !


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


!OOStack methodsFor: 'valid operations' stamp: 'lv 10/13/2022 10:49:51'!
canPop

	| anElement |
	
	anElement := stack removeFirst.	
	stackStatus := 	OOStackStatus newWith: self.
	
	^anElement.! !

!OOStack methodsFor: 'valid operations' stamp: 'lv 10/13/2022 11:02:48'!
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

!OOStackStatus class methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 16:57:43'!
assignSubclassStatusWith: aStack

	self subclassResponsibility.! !

!OOStackStatus class methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 16:53:03'!
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


!classDefinition: #Prefix category: 'Stack-Exercise'!
Object subclass: #Prefix
	instanceVariableNames: 'prefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Prefix methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 16:58:52'!
initializeWith: aString
	
	prefix := aString.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Prefix class' category: 'Stack-Exercise'!
Prefix class
	instanceVariableNames: ''!

!Prefix class methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 16:56:48'!
assignSubclassPrefixWith: aString

	self subclassResponsibility.! !

!Prefix class methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 16:55:50'!
newWith: aString
	
	^(self subclasses detect: [:prefixSubclasses |
				prefixSubclasses assignSubclassPrefixWith: aString
				]) new.! !


!classDefinition: #PrefixInvalid category: 'Stack-Exercise'!
Prefix subclass: #PrefixInvalid
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!PrefixInvalid methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 17:00:54'!
validate

	^InvalidPrefix signal.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PrefixInvalid class' category: 'Stack-Exercise'!
PrefixInvalid class
	instanceVariableNames: ''!

!PrefixInvalid class methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 16:54:26'!
assignSubclassPrefixWith: aString

	^(aString isEmpty or: [aString includesSubString: ' ']).! !


!classDefinition: #PrefixValid category: 'Stack-Exercise'!
Prefix subclass: #PrefixValid
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!PrefixValid methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 17:00:33'!
validate
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PrefixValid class' category: 'Stack-Exercise'!
PrefixValid class
	instanceVariableNames: ''!

!PrefixValid class methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 16:55:33'!
assignSubclassPrefixWith: aString

	^(aString isEmpty not and: [(aString includesSubString: ' ') not]).! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stackTarget coincidences'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'AGH 10/13/2022 17:00:28'!
findByPrefix: aPrefix

	|auxiliarStack|
	aPrefix validate.
	self validateStack.

	auxiliarStack := OOStack new.
	self iterate: stackTarget creating: auxiliarStack andDo: [].
	self iterate: auxiliarStack creating: stackTarget andDo: [(stackTarget top is: aPrefix substringAt: 1) ifTrue: [coincidences add: (stackTarget top)]].
	
	^coincidences! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'AGH 10/13/2022 16:28:45'!
initializeWith: aStack
	
	stackTarget := aStack.
	coincidences := OrderedCollection new.! !


!SentenceFinderByPrefix methodsFor: 'iterate - private' stamp: 'AGH 10/13/2022 16:23:45'!
iterate: aStack creating: anotherStack andDo: aBlock
	
	[aStack isEmpty not] whileTrue: [ |actualElement|
		actualElement := aStack pop.
		anotherStack push: actualElement.
		aBlock.
		].! !


!SentenceFinderByPrefix methodsFor: 'validations' stamp: 'AGH 10/13/2022 16:37:48'!
validateStack

	stackTarget isEmpty ifTrue: [^EmptyStack signal].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'AGH 10/13/2022 14:43:44'!
newWith: aStack
	
	^self new initializeWith: aStack.! !
