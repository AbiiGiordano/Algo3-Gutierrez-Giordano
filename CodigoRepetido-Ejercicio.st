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

!CustomerBookTest methodsFor: 'testing' stamp: 'AGH 9/25/2022 13:35:56'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	|validTime|
	
	self initializeCustomerBook.
	validTime := ValidTime new.
	
	self should: [book addCustomerNamed: 'John Lennon'.] notTakeMoreThan: validTime addingTime.
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AGH 9/25/2022 13:37:13'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| validTime|
	
	self initializeCustomerBookWith: 'Paul McCartney'.
	validTime := ValidTime new.
		
	self should: [book removeCustomerNamed: 'Paul McCartney'.] notTakeMoreThan: validTime removingTime.
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AGH 9/25/2022 13:37:17'!
test03CanNotAddACustomerWithEmptyName 
			
	self initializeCustomerBook.

	[book addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: book  isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AGH 9/25/2022 13:36:20'!
test04CanNotRemoveAnInvalidCustomer
			
	self initializeCustomerBookWith: 'John Lennon'.

	[book removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ self assert: book numberOfCustomers = 1.
			self assert: (book includesCustomerNamed: 'John Lennon') ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AGH 9/25/2022 13:37:27'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	
	self initializeCustomerBookWith: 'Paul McCartney'.
	
	book suspendCustomerNamed: 'Paul McCartney'.
	
	book assertNumberActive: 0 andNumberSuspended: 1.
	self assert: (book includesCustomerNamed: 'Paul McCartney').
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AGH 9/25/2022 13:37:58'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	
	self initializeCustomerBookWith: 'Paul McCartney'.
	
	book suspendCustomerNamed: 'Paul McCartney'.
	book removeCustomerNamed: 'Paul McCartney'.
	
	book assertNumberActive: 0 andNumberSuspended: 0.
	self deny: (book includesCustomerNamed: 'Paul McCartney').


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AGH 9/25/2022 13:36:46'!
test07CanNotSuspendAnInvalidCustomer
	
	self initializeCustomerBookWith: 'John Lennon'.

	[book suspendCustomerNamed: 'Ringo Starr'.
	self fail ]
		on: CantSuspend 
		do: [ self assert: book numberOfCustomers = 1.
			self assert: (book includesCustomerNamed: 'John Lennon') ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AGH 9/25/2022 13:38:07'!
test08CanNotSuspendAnAlreadySuspendedCustomer

	self initializeCustomerBookWith: 'John Lennon'.

	book suspendCustomerNamed: 'John Lennon'.
	
	[book suspendCustomerNamed: 'John Lennon'.
	self fail ]
		on: CantSuspend 
		do: [	self assert: book numberOfCustomers = 1.
			self assert: (book includesCustomerNamed: 'John Lennon') ]
! !


!CustomerBookTest methodsFor: 'private' stamp: 'AGH 9/25/2022 13:35:25'!
initializeCustomerBook
	book := CustomerBook new.! !

!CustomerBookTest methodsFor: 'private' stamp: 'AGH 9/25/2022 13:35:41'!
initializeCustomerBookWith: aCustomer
	
	book := CustomerBook new.
	book addCustomerNamed: aCustomer.


	
	
	! !

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

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
removeCustomerNamed: aName 
 
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'as yet unclassified' stamp: 'lvg 9/25/2022 12:38:30'!
assertNumberActive: numActive  andNumberSuspended: numSuspended

    self assert: (self numberOfActiveCustomers = numActive).
    self assert: (self numberOfSuspendedCustomers = numSuspended).
    self assert: (self numberOfCustomers = (numActive + numSuspended)).! !

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
