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

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:50'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:43'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:56:59'!
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

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:26'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'lvg 10/9/2022 12:03:26'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:44'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:56'!
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

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:07'!
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


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack size element'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'lvg 10/9/2022 12:05:17'!
decreaseSizeOfStack

	^size := size - 1.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lvg 10/9/2022 12:05:25'!
increaseSizeOfStack

	^size := size + 1.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lvg 10/9/2022 12:05:31'!
initialize
	
	stack := OrderedCollection new.
	size := 0.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lvg 10/9/2022 12:05:37'!
isEmpty

	^size = 0.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lvg 10/9/2022 12:09:24'!
pop

	self subclassResponsibility.
	"
	| anElement |
	
	stack isEmpty ifTrue: [^self signalStackIsEmpty].
	anElement := stack removeFirst.
	self decreaseSizeOfStack.
	
	^anElement .
	"! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lvg 10/9/2022 12:09:49'!
push: anElement

	self subclassResponsibility.
"
	self increaseSizeOfStack .
	^stack addFirst: anElement.
	"! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lvg 10/9/2022 11:50:31'!
signalStackIsEmpty

	self error: self class stackEmptyErrorDescription .! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lvg 10/9/2022 12:05:02'!
size

	^size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lvg 10/9/2022 11:55:54'!
top

	stack isEmpty ifTrue: [^self signalStackIsEmpty].
	^stack at: 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !



!classDefinition: #OOStackIsEmpty category: 'Stack-Exercise'!
OOStack subclass: #OOStackIsEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackIsEmpty methodsFor: 'as yet unclassified' stamp: 'lvg 10/9/2022 12:19:30'!
pop

	stack isEmpty ifTrue: [^self signalStackIsEmpty].
! !

!OOStackIsEmpty methodsFor: 'as yet unclassified' stamp: 'lvg 10/9/2022 12:27:22'!
push: anElement

	^ OOStackIsNotEmpty new initializeWith: anElement.
! !


!classDefinition: #OOStackIsNotEmpty category: 'Stack-Exercise'!
OOStack subclass: #OOStackIsNotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackIsNotEmpty methodsFor: 'as yet unclassified' stamp: 'lvg 10/9/2022 12:24:47'!
initializeWith: anElement
	
	element := anElement.! !

!OOStackIsNotEmpty methodsFor: 'as yet unclassified' stamp: 'lvg 10/9/2022 12:10:31'!
pop

	| anElement |
	
	anElement := stack removeFirst.
	self decreaseSizeOfStack.
	
	^anElement .
! !

!OOStackIsNotEmpty methodsFor: 'as yet unclassified' stamp: 'lvg 10/9/2022 12:11:12'!
push: anElement

	self increaseSizeOfStack .
	^stack addFirst: anElement.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackIsNotEmpty class' category: 'Stack-Exercise'!
OOStackIsNotEmpty class
	instanceVariableNames: ''!

!OOStackIsNotEmpty class methodsFor: 'as yet unclassified' stamp: 'lvg 10/9/2022 12:21:26'!
with: anElement

	OOStackIsNotEmpty new initializeWith: anElement.
	"^ anElement."! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
