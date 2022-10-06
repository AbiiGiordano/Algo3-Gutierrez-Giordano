!classDefinition: #StackTest category: 'StackPrimeraParte'!
TestCase subclass: #StackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!StackTest methodsFor: 'as yet unclassified' stamp: 'IL 10/1/2022 19:24:17'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := Stack new.
	
	self assert: stack isEmpty! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'lv 10/6/2022 15:46:48'!
test02AddsAnElementIntoTheStack

	| stack anElement |
	
	stack := Stack new.
	anElement := 'Boca'.
	
	stack push: anElement.
	
	self assert:  stack stackSize = 1.! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'lv 10/6/2022 15:53:02'!
test03RemoveAnElementFromTheStackAndVerifyIfElementIsRemoved

	| stack anElement  elementRemoved |
	
	stack := Stack new.
	anElement := 'Boca'.
	
	stack push: anElement.
	elementRemoved := stack pop.
	
	self assert:  [stack stackSize = 0 and: [elementRemoved = anElement]].! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'lv 10/6/2022 15:48:11'!
test04CanNotRemoveAnElementFromAnEmptyStack

	| stack |
	
	
	stack := Stack new.

	[ stack pop. self fail] on: Error do: [self assert: stack isEmpty].! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'lv 10/6/2022 15:51:57'!
test05StackIsALIFO

	| stack anElement anotherElement itemRemoved |
	
	stack := Stack new.
	anElement := 'Boca'.
	anotherElement := 'River'.
	
	stack push: anElement.
	stack push: anotherElement.
	itemRemoved := stack pop.
	
	self assert:  itemRemoved = anotherElement.! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'lv 10/6/2022 15:49:18'!
test06GetFirstItemWithoutRemovingIt

	| stack anElement anotherElement  |
	
	stack := Stack new.
	anElement := 'Boca'.
	anotherElement := 'River'.
	
	stack push: anElement.
	stack push: anotherElement .
	self assert:  [stack stackSize = 2 and: [anotherElement = stack top]].! !


!classDefinition: #Stack category: 'StackPrimeraParte'!
Object subclass: #Stack
	instanceVariableNames: 'stack stackSize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!Stack methodsFor: 'basicsStackOperations' stamp: 'lv 10/6/2022 12:36:49'!
isEmpty

	^ stackSize =  0.! !

!Stack methodsFor: 'basicsStackOperations' stamp: 'lv 10/6/2022 15:50:36'!
pop 
	| element |
	 
	stack isEmpty ifTrue: [^self signalStackIsEmpty].
	element := stack removeFirst.
	self decreaseSizeOfStack.
	
	^element.
	! !

!Stack methodsFor: 'basicsStackOperations' stamp: 'lv 10/6/2022 15:49:49'!
push: element 
	 self increaseSizeOfStack.
        ^stack addFirst: element.
        ! !


!Stack methodsFor: 'private' stamp: 'lv 10/6/2022 12:39:21'!
decreaseSizeOfStack

	stackSize := stackSize - 1.
! !

!Stack methodsFor: 'private' stamp: 'lv 10/6/2022 12:38:45'!
increaseSizeOfStack

	stackSize := stackSize + 1.
! !


!Stack methodsFor: 'error' stamp: 'lv 10/6/2022 15:51:23'!
signalStackIsEmpty

	self error: self class elementCannotBeRemoveFromAnEmptyStack.! !


!Stack methodsFor: 'inizialization' stamp: 'lv 10/6/2022 12:36:33'!
initialize
	
	stack := OrderedCollection new.
	stackSize  := 0.! !


!Stack methodsFor: 'accesing' stamp: 'lv 10/6/2022 12:40:56'!
stackSize

	^ stackSize.
! !

!Stack methodsFor: 'accesing' stamp: 'lv 10/6/2022 12:17:13'!
top

	^stack at: 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Stack class' category: 'StackPrimeraParte'!
Stack class
	instanceVariableNames: ''!

!Stack class methodsFor: 'as yet unclassified' stamp: 'lv 10/6/2022 15:51:23'!
elementCannotBeRemoveFromAnEmptyStack

	^'No se puede eliminar un item de un stack vacio'.! !
