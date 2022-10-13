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


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack stackStatus'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'lvg 10/11/2022 21:33:26'!
initialize

	stack := OrderedCollection new.
	stackStatus := OOStackStatus newWith: self.

! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lvg 10/11/2022 20:51:51'!
isEmpty

	^stack isEmpty.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lvg 10/13/2022 09:56:05'!
pop
	stackStatus popWhileStatusFrom: self.
	
! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lvg 10/11/2022 20:55:41'!
push: anElement

	stackStatus := OOStackIsNotEmpty.
	^stack addFirst: anElement.
	
! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lvg 10/9/2022 11:50:31'!
signalStackIsEmpty

	self error: self class stackEmptyErrorDescription .! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lvg 10/11/2022 20:52:21'!
size

	^stack size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'lvg 10/11/2022 21:17:57'!
top
	stackStatus topWhileStatusFrom: self.
! !

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

!OOStackStatus methodsFor: 'as yet unclassified' stamp: 'lvg 10/13/2022 09:48:17'!
initializeWith: aStack
	
	stack := aStack! !

!OOStackStatus methodsFor: 'as yet unclassified' stamp: 'lvg 10/13/2022 09:47:34'!
with: aStack

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackStatus class' category: 'Stack-Exercise'!
OOStackStatus class
	instanceVariableNames: ''!

!OOStackStatus class methodsFor: 'as yet unclassified' stamp: 'lvg 10/13/2022 10:12:33'!
newWith: aStack
	self subclasses do: [:statusSubclasses |
					(statusSubclasses assignSubclassStatusWith: aStack)
					ifTrue: [^ statusSubclasses new initializeWith: aStack]
					].
				! !


!classDefinition: #OOStackIsEmpty category: 'Stack-Exercise'!
OOStackStatus subclass: #OOStackIsEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackIsEmpty methodsFor: 'as yet unclassified' stamp: 'lvg 10/13/2022 10:02:58'!
popWhileStatusFrom: aStack

	^aStack signalStackIsEmpty.
! !

!OOStackIsEmpty methodsFor: 'as yet unclassified' stamp: 'lvg 10/11/2022 21:22:35'!
topWhileStatusFrom: aStack

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
	instanceVariableNames: 'element'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackIsNotEmpty methodsFor: 'as yet unclassified' stamp: 'lvg 10/13/2022 10:01:58'!
popWhileStatusFrom: aStack

	| anElement |
	
	anElement := aStack removeFirst.	
	OOStackStatus initializeWith: aStack .
	
	^anElement .
! !

!OOStackIsNotEmpty methodsFor: 'as yet unclassified' stamp: 'lvg 10/11/2022 21:16:21'!
topWhileStatusFrom: aStack

	^aStack at: 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackIsNotEmpty class' category: 'Stack-Exercise'!
OOStackIsNotEmpty class
	instanceVariableNames: ''!

!OOStackIsNotEmpty class methodsFor: 'as yet unclassified' stamp: 'lvg 10/13/2022 10:08:17'!
assignSubclassStatusWith: aStack

	^((aStack size) > 0).

	! !

!OOStackIsNotEmpty class methodsFor: 'as yet unclassified' stamp: 'lvg 10/13/2022 09:51:22'!
with: aStack

	"OOStackIsNotEmpty new initializeWith: aStack.
	^ anElement. "! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
