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

!CustomerBookTest methodsFor: 'testing' stamp: 'AGH 9/26/2022 12:08:06'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	
	self should: [self customerBook addCustomerNamed: 'John Lennon'.] notTakeMoreThan: self expectedAddingCostumerTime.
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AGH 9/26/2022 12:08:42'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	self customerBook addCustomerNamed: 'Paul McCartney'.
	self should: [self customerBook removeCustomerNamed: 'Paul McCartney'.] notTakeMoreThan: self expectedRemovingCustomerTime.
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AGH 9/26/2022 12:13:23'!
test03CanNotAddACustomerWithEmptyName 

	self assertExceptionOf: [self customerBook addCustomerNamed: '']
		raise: Error
		andVerify: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: self customerBook isEmpty].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AGH 9/26/2022 12:12:19'!
test04CanNotRemoveAnInvalidCustomer
			
	self customerBook addCustomerNamed: 'John Lennon'.

	self assertExceptionOf: [self customerBook removeCustomerNamed: 'Paul McCartney']
		raise: NotFound
		andVerify: [self assertOneConsumer: 'John Lennon']. 
		
		"[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: 'John Lennon') ]"
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AGH 9/26/2022 10:23:23'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	self customerBook addAndSuspendCustomerNamed: 'Paul McCartney'.
	
	self assertNumberActive: 0 andNumberSuspended: 1.
	self assert: (self customerBook includesCustomerNamed: 'Paul McCartney').
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AGH 9/26/2022 10:26:32'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	self customerBook addAndSuspendCustomerNamed: 'Paul McCartney'.
	self customerBook removeCustomerNamed: 'Paul McCartney'.
	
	self assertNumberActive: 0 andNumberSuspended: 0.
	self deny: (self customerBook includesCustomerNamed: 'Paul McCartney').


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AGH 9/26/2022 12:12:33'!
test07CanNotSuspendAnInvalidCustomer

	self customerBook addCustomerNamed: 'John Lennon'.

	self assertExceptionOf: [self customerBook suspendCustomerNamed: 'Ringo Starr']
		raise: CantSuspend
		andVerify: [self assertOneConsumer: 'John Lennon']! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AGH 9/26/2022 12:11:43'!
test08CanNotSuspendAnAlreadySuspendedCustomer

	self customerBook addAndSuspendCustomerNamed: 'John Lennon'.
	
	self assertExceptionOf: [self customerBook suspendCustomerNamed: 'John Lennon']
		raise: CantSuspend
		andVerify: [self assertOneConsumer: 'John Lennon'].
! !


!CustomerBookTest methodsFor: 'assertions - private' stamp: 'AGH 9/26/2022 12:13:31'!
assertExceptionOf: aFailureBlock raise: aTypeOfError andVerify: aTestingBlock

	[aFailureBlock value. self fail] on: aTypeOfError do: aTestingBlock.
	! !

!CustomerBookTest methodsFor: 'assertions - private' stamp: 'lvg 9/25/2022 18:22:37'!
assertNumberActive: numActive andNumberSuspended: numSuspended

    self assert: (self customerBook numberOfActiveCustomers = numActive).
    self assert: (self customerBook numberOfSuspendedCustomers = numSuspended).
    self assert: (self customerBook numberOfCustomers = (numActive + numSuspended)).! !

!CustomerBookTest methodsFor: 'assertions - private' stamp: 'lvg 9/25/2022 18:22:26'!
assertOneConsumer: aName

	self assert: (self customerBook numberOfCustomers = 1 and: [self customerBook includesCustomerNamed: aName]).! !


!CustomerBookTest methodsFor: 'validTime - private' stamp: 'AGH 9/26/2022 12:07:59'!
expectedAddingCostumerTime
	^(50 milliSeconds).! !

!CustomerBookTest methodsFor: 'validTime - private' stamp: 'AGH 9/26/2022 12:08:28'!
expectedRemovingCustomerTime
	^(100 milliSeconds).! !


!CustomerBookTest methodsFor: 'customerBookSetUp' stamp: 'AGH 9/25/2022 18:10:51'!
customerBook
	^ customerBook.! !

!CustomerBookTest methodsFor: 'customerBookSetUp' stamp: 'AGH 9/26/2022 10:15:17'!
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

!CustomerBook methodsFor: 'testing' stamp: 'AGH 9/26/2022 10:14:32'!
includesCustomerNamed: aName

	^ (self active, self suspended) includes: aName.! !

!CustomerBook methodsFor: 'testing' stamp: 'AGH 9/26/2022 10:14:38'!
isEmpty

	^(self active, self suspended) isEmpty.! !


!CustomerBook methodsFor: 'initialization' stamp: 'AGH 9/25/2022 14:23:57'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended := OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'AGH 9/26/2022 10:27:39'!
addAndSuspendCustomerNamed: aName

	self addCustomerNamed: aName.
	self suspendCustomerNamed: aName.! !

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

!CustomerBook methodsFor: 'customer management' stamp: 'AGH 9/26/2022 12:49:22'!
removeCustomerNamed: aName
	
	active remove: aName ifAbsent: [suspended remove: aName ifAbsent: [^ NotFound signal]].! !

!CustomerBook methodsFor: 'customer management' stamp: 'AGH 9/26/2022 11:52:09'!
suspendCustomerNamed: aName 
	
	(self active includes: aName) ifFalse: [^CantSuspend signal].
	self active remove: aName.
	self suspended add: aName.
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


!CustomerBook methodsFor: 'customerCollections' stamp: 'AGH 9/26/2022 10:14:17'!
active
	^active.! !

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
