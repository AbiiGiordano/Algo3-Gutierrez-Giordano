!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferenceTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'lvg 11/8/2022 16:55:26'!
test00
"
	| aRecipientAccount aSendersAccount transferenceValue transferenceValue2 transference transference2|
	
	aRecipientAccount := ReceptiveAccount new.
	aSendersAccount := ReceptiveAccount new.
	transferenceValue := 50 * peso.
	transferenceValue2 := 100 * peso.
	transference := Transference register: transferenceValue on: aRecipientAccount off: aSendersAccount.
	transference2 := Transference register: transferenceValue2 on: aRecipientAccount  off: aSendersAccount.
	
	self assert: 2 equals: aRecipientAccount transactionsSize. 
	self assert: 2 equals: aSendersAccount transactionsSize.
	self assert: (aRecipientAccount transactionsIncludes: transference ).
	self assert: (aSendersAccount transactionsIncludes: transference).
	self assert: (aSendersAccount transactionsIncludes: transference2).
	

	self assert: transferenceValue equals: (Transference register: transferenceValue on: aRecipientAccount off: aSendersAccount) value.
	self assert: transferenceValue2 equals: (Transference register: transferenceValue2 on: aRecipientAccount off: aSendersAccount) value"! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'lvg 11/8/2022 17:22:06'!
test01makeTransference

	| aRecipientAccount aSendersAccount transferenceValue  |
	
	aRecipientAccount := ReceptiveAccount new.
	aSendersAccount := ReceptiveAccount new.
	transferenceValue := 50 * peso.
	Transference register: transferenceValue on: aRecipientAccount off: aSendersAccount.
	
	self assert: transferenceValue  equals: aRecipientAccount balance.
	self assert:  (-50)*peso equals: aSendersAccount  balance.
	
	 
! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'lvg 11/8/2022 17:22:50'!
test02

	| aRecipientAccount aSendersAccount transferenceValue anotherTransferenceValue   |
	
	aRecipientAccount := ReceptiveAccount new.
	aSendersAccount := ReceptiveAccount new.
	transferenceValue := 50 * peso.
	anotherTransferenceValue := 100*peso.
	
	Transference register: transferenceValue on: aRecipientAccount off: aSendersAccount.
	Transference register: anotherTransferenceValue on: aRecipientAccount off: aSendersAccount.
	
	self assert: 150*peso  equals: aRecipientAccount balance.
	self assert: (-150)*peso equals: aSendersAccount balance .
	
	 
! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'lvg 11/8/2022 17:24:52'!
test03

	| aRecipientAccount aSendersAccount transferenceValue anotherTransferenceValue transference anotherTransference |
	
	aRecipientAccount := ReceptiveAccount new.
	aSendersAccount := ReceptiveAccount new.
	transferenceValue := 50 * peso.
	anotherTransferenceValue := 100*peso.
	
	transference := Transference register: transferenceValue on: aRecipientAccount off: aSendersAccount.
	anotherTransference := Transference register: anotherTransferenceValue on: aRecipientAccount off: aSendersAccount.
	
	self assert: 2 equals: aRecipientAccount transactionsSize.
	self assert: 2 equals: aSendersAccount transactionsSize.

	 
! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'lvg 11/8/2022 17:33:45'!
test04

	| aRecipientAccount aSendersAccount transferenceValue  transference  |
	
	aRecipientAccount := ReceptiveAccount new.
	aSendersAccount := ReceptiveAccount new.
	transferenceValue := 50 * peso.
	
	transference := Transference register: transferenceValue on: aRecipientAccount off: aSendersAccount.
	
	self assert: (aRecipientAccount contraparte: transference ) = aSendersAccount.
	self deny: (aRecipientAccount contraparte: transference ) = aRecipientAccount.

	 
! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'lvg 11/8/2022 17:34:38'!
test05

	| aRecipientAccount aSendersAccount transferenceValue  transference  |
	
	aRecipientAccount := ReceptiveAccount new.
	aSendersAccount := ReceptiveAccount new.
	transferenceValue := 50 * peso.
	
	transference := Transference register: transferenceValue on: aRecipientAccount off: aSendersAccount.
	
	self assert: (aSendersAccount contraparte: transference ) = aRecipientAccount.
	self deny: (aSendersAccount contraparte: transference ) = aSendersAccount.

	 
! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'lvg 11/4/2022 21:48:48'!
operation: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'operation' stamp: 'lvg 11/4/2022 21:48:48'!
operation: aBalance

	^ aBalance + value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'operation' stamp: 'lvg 11/4/2022 21:48:48'!
operation: aBalance

	^ aBalance - value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'lvg 11/8/2022 14:43:54'!
balance

	| aBalance |
	
	aBalance := 0.

	transactions do: [ :aTransaction |
		
		aBalance := aTransaction operation: aBalance.

		 ].
	
	^aBalance .! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'lvg 11/8/2022 15:32:28'!
transactionsIncludes: aTransaction

	^ transactions includes: aTransaction.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'lvg 11/8/2022 15:35:27'!
transactionsSize

	^ transactions size.! !


!ReceptiveAccount methodsFor: 'validation' stamp: 'lvg 11/8/2022 17:30:39'!
contraparte: aTransference 
	
	^aTransference cualEsLaContraparte: self.! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'amount recipientAccount sendersAccount value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'initialization' stamp: 'lvg 11/8/2022 17:02:57'!
initializeRegister: anAmount on: aRecipientAccount off: aSendersAccount 
	
	value := anAmount.
	recipientAccount := aRecipientAccount.
	sendersAccount := aSendersAccount.! !


!Transference methodsFor: 'op' stamp: 'lvg 11/8/2022 17:33:07'!
cualEsLaContraparte: aReceptiveAccount 

	(aReceptiveAccount = recipientAccount ) ifTrue: [^sendersAccount ].
	(aReceptiveAccount = sendersAccount ) ifTrue: [^recipientAccount ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'instance creation' stamp: 'lvg 11/8/2022 17:10:41'!
register: anAmount on: aRecipientAccount off: aSendersAccount

	| transference |
	transference := self new initializeRegister: anAmount on: aRecipientAccount off: aSendersAccount .
	Withdraw register: anAmount  on: aSendersAccount.
	Deposit register: anAmount on: aRecipientAccount.
	
	^transference .
! !
