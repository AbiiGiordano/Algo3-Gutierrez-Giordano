!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'book'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'AGH 9/25/2022 16:10:00'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	
	self initializeCustomerBook.
	
	self should: [book addCustomerNamed: 'John Lennon'.] notTakeMoreThan: self addingTime.
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AGH 9/25/2022 16:10:04'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	self initializeCustomerBookWith: 'Paul McCartney'.
	
	self should: [book removeCustomerNamed: 'Paul McCartney'.] notTakeMoreThan: self removingTime.
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AGH 9/25/2022 15:54:14'!
test03CanNotAddACustomerWithEmptyName 
			
	self initializeCustomerBook.

	self assert: [book addCustomerNamed: ''. self fail]
		error: Error
		andVerify: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: book isEmpty].
		
	"[book addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: book  isEmpty ]"! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AGH 9/25/2022 15:59:15'!
test04CanNotRemoveAnInvalidCustomer
			
	self initializeCustomerBookWith: 'John Lennon'.

	self assert: [book removeCustomerNamed: 'Paul McCartney'. self fail]
		error: NotFound
		andVerify: [self assertOneConsumer: 'John Lennon']. 
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AGH 9/25/2022 15:25:14'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	
	self initializeCustomerBookWith: 'Paul McCartney'.
	
	book suspendCustomerNamed: 'Paul McCartney'.
	
	self assertNumberActive: 0 andNumberSuspended: 1.
	self assert: (book includesCustomerNamed: 'Paul McCartney').
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AGH 9/25/2022 15:25:18'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	
	self initializeCustomerBookWith: 'Paul McCartney'.
	
	book suspendCustomerNamed: 'Paul McCartney'.
	book removeCustomerNamed: 'Paul McCartney'.
	
	self assertNumberActive: 0 andNumberSuspended: 0.
	self deny: (book includesCustomerNamed: 'Paul McCartney').


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AGH 9/25/2022 15:58:52'!
test07CanNotSuspendAnInvalidCustomer
	
	self initializeCustomerBookWith: 'John Lennon'.

	self assert: [book suspendCustomerNamed: 'Ringo Starr'.self fail ]
		error: CantSuspend
		andVerify: [self assertOneConsumer: 'John Lennon']! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AGH 9/25/2022 15:59:06'!
test08CanNotSuspendAnAlreadySuspendedCustomer

	self initializeCustomerBookWith: 'John Lennon'.
	book suspendCustomerNamed: 'John Lennon'.
	
	self assert: [book suspendCustomerNamed: 'John Lennon'. self fail]
		error: CantSuspend
		andVerify: [self assertOneConsumer: 'John Lennon'].
	
	"[book suspendCustomerNamed: 'John Lennon'.
	self fail ]
		on: CantSuspend 
		do: [	self assert: book numberOfCustomers = 1.
			self assert: (book includesCustomerNamed: 'John Lennon') ]"
! !


!CustomerBookTest methodsFor: 'assertions' stamp: 'AGH 9/25/2022 16:06:56'!
assert: aBlock error: anError andVerify: anotherBlock

	aBlock on: anError do: anotherBlock.! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'AGH 9/25/2022 16:07:22'!
assertNumberActive: numActive andNumberSuspended: numSuspended

    self assert: (book numberOfActiveCustomers = numActive).
    self assert: (book numberOfSuspendedCustomers = numSuspended).
    self assert: (book numberOfCustomers = (numActive + numSuspended)).! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'AGH 9/25/2022 16:07:12'!
assertOneConsumer: aName

	self assert: (book numberOfCustomers = 1 and: [book includesCustomerNamed: aName]).! !


!CustomerBookTest methodsFor: 'initialize' stamp: 'AGH 9/25/2022 15:40:13'!
initializeCustomerBook

	book := CustomerBook new.! !

!CustomerBookTest methodsFor: 'initialize' stamp: 'AGH 9/25/2022 13:35:41'!
initializeCustomerBookWith: aCustomer
	
	book := CustomerBook new.
	book addCustomerNamed: aCustomer.


	
	
	! !


!CustomerBookTest methodsFor: 'validTime' stamp: 'AGH 9/25/2022 16:02:57'!
addingTime
	^(50 milliSeconds).! !

!CustomerBookTest methodsFor: 'validTime' stamp: 'AGH 9/25/2022 16:03:07'!
removingTime
	^(100 milliSeconds).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBookTest class' category: 'CodigoRepetido-Ejercicio'!
CustomerBookTest class
	instanceVariableNames: 'customerBook1'!


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'AGH 9/25/2022 13:54:37'!
includesCustomerNamed: aName

	^ (active, suspended) includes: aName.! !

!CustomerBook methodsFor: 'testing' stamp: 'AGH 9/25/2022 13:55:41'!
isEmpty
	
	^(active, suspended) isEmpty.! !


!CustomerBook methodsFor: 'initialization' stamp: 'AGH 9/25/2022 14:23:57'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended := OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'AGH 9/25/2022 13:48:23'!
addCustomerNamed: aName

	self validateACustomer: aName.
	active add: aName.! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'AGH 9/25/2022 13:59:54'!
numberOfCustomers
	
	^(self numberOfActiveCustomers  + self numberOfSuspendedCustomers).! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'AGH 9/25/2022 15:18:09'!
removeCustomerNamed: aName 

	|activeIndex|
	
	activeIndex := active indexOf: aName ifAbsent: [ |suspendedIndex| 
		suspendedIndex := suspended indexOf: aName ifAbsent: [^ NotFound signal].

		^ suspended removeAt: suspendedIndex.
		].
	^ active removeAt: activeIndex.! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'AGH 9/25/2022 15:14:04'!
suspendCustomerNamed: aName 
	
	"|activeIndex|
	activeIndex := active indexOf: aName ifAbsent: [^CantSuspend signal].
	active removeAt: activeIndex.
	suspended add: aName."
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	active remove: aName.
	suspended add: aName
! !

!CustomerBook methodsFor: 'customer management' stamp: 'AGH 9/25/2022 15:15:28'!
validateACustomer: aName
	
	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !


!classDefinition: #ValidTime category: 'CodigoRepetido-Ejercicio'!
Object subclass: #ValidTime
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!ValidTime methodsFor: 'as yet unclassified' stamp: 'lvg 9/25/2022 11:29:57'!
addingTime
	^(50 milliSeconds).! !

!ValidTime methodsFor: 'as yet unclassified' stamp: 'lvg 9/25/2022 11:29:53'!
removingTime
	^(100 milliSeconds ).! !
