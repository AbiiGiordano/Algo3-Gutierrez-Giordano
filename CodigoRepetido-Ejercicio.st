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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'lvg 9/25/2022 11:55:03'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook validTime johnLennon|
	
	customerBook := CustomerBook new.
	validTime := ValidTime new.
	johnLennon := 'John Lennon'.
	
	self should: [customerBook addCustomerNamed: johnLennon.] notTakeMoreThan: validTime addingTime.
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'lvg 9/25/2022 12:08:27'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	|customerBook  validTime |
	
	customerBook  := self initializeWith:  'Paul McCartney'.
	validTime := ValidTime new.
		
	self should: [customerBook   removeCustomerNamed: 'Paul McCartney'. ] notTakeMoreThan: validTime removingTime.
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'lvg 9/25/2022 11:56:25'!
test03CanNotAddACustomerWithEmptyName 
			
	|customerBook |
	customerBook  := CustomerBook new.

	[ customerBook  addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook  isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'lvg 9/25/2022 12:11:05'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook |
			
	customerBook  := self initializeWith:  'John Lennon'.

	[ customerBook  removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ self assert: customerBook  numberOfCustomers = 1.
			self assert: (customerBook  includesCustomerNamed: 'John Lennon') ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'lvg 9/25/2022 12:39:07'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook |
	
	customerBook  := self initializeWith:  'Paul McCartney'.
	
	customerBook  suspendCustomerNamed:  'Paul McCartney'.
	customerBook assertNumberActive: 0 andNumberSuspended: 1.
	
	self assert: (customerBook includesCustomerNamed:  'Paul McCartney').
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'lvg 9/25/2022 12:39:59'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook |
	
	customerBook  := self initializeWith:  'Paul McCartney'.
	
	customerBook  suspendCustomerNamed:  'Paul McCartney'.
	customerBook  removeCustomerNamed:  'Paul McCartney'.
	
	customerBook assertNumberActive: 0 andNumberSuspended: 0.
	
	self deny: (customerBook  includesCustomerNamed:  'Paul McCartney').


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'lvg 9/25/2022 12:14:29'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook  |
	customerBook  := self initializeWith:  'John Lennon'.

	[ customerBook suspendCustomerNamed: 'Ringo Starr'.
	self fail ]
		on: CantSuspend 
		do: [ self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: 'John Lennon') ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'lvg 9/25/2022 12:15:23'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook |
			
	customerBook  := self initializeWith:  'John Lennon'.

	customerBook suspendCustomerNamed: 'John Lennon'.
	
	[ customerBook suspendCustomerNamed: 'John Lennon'.
	self fail ]
		on: CantSuspend 
		do: [	self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: 'John Lennon') ]
! !


!CustomerBookTest methodsFor: 'private' stamp: 'lvg 9/25/2022 12:04:07'!
initializeWith: aCustomer

 	| customerBook |
	
	customerBook := CustomerBook new.
	
	customerBook  addCustomerNamed: aCustomer.
	
	^ customerBook. 



	
	
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
