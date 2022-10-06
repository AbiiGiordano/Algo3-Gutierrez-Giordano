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

!StackTest methodsFor: 'as yet unclassified' stamp: 'lv 10/6/2022 12:41:59'!
test02AddAnItemIntoTheStack

	| stack anItem |
	
	stack := Stack new.
	anItem := 'Boca'.
	
	stack push: anItem.
	
	self assert:  stack stackSize = 1.! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'lv 10/6/2022 12:50:56'!
test03RemoveAnItemFromTheStackAndVerifyItemRemoved

	| stack anItem itemRemoved |
	
	stack := Stack new.
	anItem := 'Boca'.
	
	stack push: anItem.
	itemRemoved := stack pop.
	
	self assert:  [stack stackSize = 0 and: [itemRemoved = anItem]].! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'lv 10/6/2022 13:05:36'!
test04RemoveAnItemFromAnEmptyStack

	| stack |
	
	
	stack := Stack new.

	[ stack pop. self fail] on: Error do: [self assert: stack isEmpty].! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'lv 10/6/2022 13:06:09'!
test05StackVerifiedLIFO

	| stack anItem anotherItem itemRemoved |
	
	stack := Stack new.
	anItem := 'Boca'.
	anotherItem := 'River'.
	
	stack push: anItem.
	stack push: anotherItem .
	itemRemoved := stack pop.
	
	self assert:  itemRemoved = anotherItem.! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'lv 10/6/2022 13:17:33'!
test06GetFirstItemWithoutRemove

	| stack anItem anotherItem  |
	
	stack := Stack new.
	anItem := 'Boca'.
	anotherItem := 'River'.
	
	stack push: anItem.
	stack push: anotherItem .
	self assert:  [stack stackSize = 2 and: [anotherItem = stack top]].! !


!classDefinition: #Stack category: 'StackPrimeraParte'!
Object subclass: #Stack
	instanceVariableNames: 'stack stackSize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!Stack methodsFor: 'basics' stamp: 'lv 10/6/2022 12:36:49'!
isEmpty

	^ stackSize =  0.! !

!Stack methodsFor: 'basics' stamp: 'lv 10/6/2022 13:03:40'!
pop 
	| item |
	 
	stack isEmpty ifTrue: [^self signalStackIsEmpty].
	item := stack removeFirst.
	self decreaseSizeOfStack.
	
	^item.
	! !

!Stack methodsFor: 'basics' stamp: 'lv 10/6/2022 12:38:33'!
push: item 
	 self increaseSizeOfStack.
        ^stack addFirst: item.
        ! !


!Stack methodsFor: 'private' stamp: 'lv 10/6/2022 12:39:21'!
decreaseSizeOfStack

	stackSize := stackSize - 1.
! !

!Stack methodsFor: 'private' stamp: 'lv 10/6/2022 12:38:45'!
increaseSizeOfStack

	stackSize := stackSize + 1.
! !


!Stack methodsFor: 'error' stamp: 'lv 10/6/2022 13:02:49'!
signalStackIsEmpty

	self error: self class itemCannotBeRemoveFromAnEmptyStack.! !


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

!Stack class methodsFor: 'as yet unclassified' stamp: 'lv 10/6/2022 13:02:17'!
itemCannotBeRemoveFromAnEmptyStack

	^'No se puede eliminar un item de un stack vacio'.! !

!Stack class methodsFor: 'as yet unclassified' stamp: 'lv 10/6/2022 12:09:50'!
with: aCollection
	"este no creo q lo usemos. solo es un opcional
	^ Stack new initializeWith: aCollection."! !
