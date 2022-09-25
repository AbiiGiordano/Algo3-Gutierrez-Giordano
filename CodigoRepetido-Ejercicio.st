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
	instanceVariableNames: 'customerBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'lvg 9/25/2022 18:18:27'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	
	self should: [self customerBook addCustomerNamed: 'John Lennon'.] notTakeMoreThan: self addingTime.
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'lvg 9/25/2022 18:18:44'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	self customerBook addCustomerNamed: 'Paul McCartney'.
	self should: [self customerBook removeCustomerNamed: 'Paul McCartney'.] notTakeMoreThan: self removingTime.
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'lvg 9/25/2022 18:19:04'!
test03CanNotAddACustomerWithEmptyName 

	self assertFailure: [self customerBook addCustomerNamed: '']
		withError: Error
		andVerify: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: self customerBook isEmpty].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'lvg 9/25/2022 18:19:16'!
test04CanNotRemoveAnInvalidCustomer
			
	self customerBook addCustomerNamed: 'John Lennon'.

	self assertFailure: [self customerBook removeCustomerNamed: 'Paul McCartney']
		withError: NotFound
		andVerify: [self assertOneConsumer: 'John Lennon']. 
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'lvg 9/25/2022 18:19:32'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	self customerBook addCustomerNamed: 'Paul McCartney'.
	self customerBook suspendCustomerNamed: 'Paul McCartney'.
	
	self assertNumberActive: 0 andNumberSuspended: 1.
	self assert: (self customerBook includesCustomerNamed: 'Paul McCartney').
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'lvg 9/25/2022 18:19:51'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	self customerBook addCustomerNamed: 'Paul McCartney'.
	self customerBook suspendCustomerNamed: 'Paul McCartney'.
	self customerBook removeCustomerNamed: 'Paul McCartney'.
	
	self assertNumberActive: 0 andNumberSuspended: 0.
	self deny: (self customerBook includesCustomerNamed: 'Paul McCartney').


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'lvg 9/25/2022 18:20:02'!
test07CanNotSuspendAnInvalidCustomer

	self customerBook addCustomerNamed: 'John Lennon'.

	self assertFailure: [self customerBook suspendCustomerNamed: 'Ringo Starr']
		withError: CantSuspend
		andVerify: [self assertOneConsumer: 'John Lennon']! !

!CustomerBookTest methodsFor: 'testing' stamp: 'lvg 9/25/2022 18:20:14'!
test08CanNotSuspendAnAlreadySuspendedCustomer

	self customerBook addCustomerNamed: 'John Lennon'.
	self customerBook suspendCustomerNamed: 'John Lennon'.
	
	self assertFailure: [self customerBook suspendCustomerNamed: 'John Lennon']
		withError: CantSuspend
		andVerify: [self assertOneConsumer: 'John Lennon'].
! !


!CustomerBookTest methodsFor: 'assertions' stamp: 'AGH 9/25/2022 18:04:30'!
assertFailure: aBlock withError: anError andVerify: anotherBlock

	[aBlock. [self fail]] on: anError do: anotherBlock.
	! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'lvg 9/25/2022 18:22:37'!
assertNumberActive: numActive andNumberSuspended: numSuspended

    self assert: (self customerBook numberOfActiveCustomers = numActive).
    self assert: (self customerBook numberOfSuspendedCustomers = numSuspended).
    self assert: (self customerBook numberOfCustomers = (numActive + numSuspended)).! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'lvg 9/25/2022 18:22:26'!
assertOneConsumer: aName

	self assert: (self customerBook numberOfCustomers = 1 and: [self customerBook includesCustomerNamed: aName]).! !


!CustomerBookTest methodsFor: 'validTime' stamp: 'AGH 9/25/2022 16:02:57'!
addingTime
	^(50 milliSeconds).! !

!CustomerBookTest methodsFor: 'validTime' stamp: 'AGH 9/25/2022 16:03:07'!
removingTime
	^(100 milliSeconds).! !


!CustomerBookTest methodsFor: 'customerBookSetUp' stamp: 'AGH 9/25/2022 18:10:51'!
customerBook
	^ customerBook.! !

!CustomerBookTest methodsFor: 'customerBookSetUp' stamp: 'lvg 9/25/2022 18:25:22'!
setUp
	customerBook := CustomerBook new.! !

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

!CustomerBook methodsFor: 'testing' stamp: 'lvg 9/25/2022 18:34:27'!
includesCustomerNamed: aName

	^ (self active, self suspended) includes: aName.! !

!CustomerBook methodsFor: 'testing' stamp: 'lvg 9/25/2022 18:34:37'!
isEmpty
	
	^(self active, self suspended) isEmpty.! !


!CustomerBook methodsFor: 'initialization' stamp: 'AGH 9/25/2022 14:23:57'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended := OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'lvg 9/25/2022 18:33:32'!
addCustomerNamed: aName

	self validateACustomer: aName.
	self active add: aName.! !

!CustomerBook methodsFor: 'customer management' stamp: 'lvg 9/25/2022 18:34:48'!
numberOfActiveCustomers
	
	^ self active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'AGH 9/25/2022 13:59:54'!
numberOfCustomers
	
	^(self numberOfActiveCustomers  + self numberOfSuspendedCustomers).! !

!CustomerBook methodsFor: 'customer management' stamp: 'lvg 9/25/2022 18:35:02'!
numberOfSuspendedCustomers
	
	^self suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'lvg 9/25/2022 18:35:28'!
removeCustomerNamed: aName 

	|activeIndex|
	
	activeIndex := self active indexOf: aName ifAbsent: [ |suspendedIndex| 
		suspendedIndex := self suspended indexOf: aName ifAbsent: [^ NotFound signal].

		^ self suspended removeAt: suspendedIndex.
		].
	^ self active removeAt: activeIndex.! !

!CustomerBook methodsFor: 'customer management' stamp: 'lvg 9/25/2022 18:35:56'!
suspendCustomerNamed: aName 
	
	(self active includes: aName) ifFalse: [^CantSuspend signal].
	self active remove: aName.
	self suspended add: aName
! !

!CustomerBook methodsFor: 'customer management' stamp: 'AGH 9/25/2022 15:15:28'!
validateACustomer: aName
	
	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists].! !


!CustomerBook methodsFor: 'signals' stamp: 'lvg 9/25/2022 18:28:41'!
signalCustomerAlreadyExists

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signals' stamp: 'lvg 9/25/2022 18:28:46'!
signalCustomerNameCannotBeEmpty

	self error: self class customerCanNotBeEmptyErrorMessage ! !


!CustomerBook methodsFor: 'customerCollections' stamp: 'lvg 9/25/2022 18:33:18'!
active
	^active.! !

!CustomerBook methodsFor: 'customerCollections' stamp: 'lvg 9/25/2022 18:33:07'!
supended
	^suspended.! !

!CustomerBook methodsFor: 'customerCollections' stamp: 'lvg 9/25/2022 18:34:13'!
suspended
	^suspended.! !

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
