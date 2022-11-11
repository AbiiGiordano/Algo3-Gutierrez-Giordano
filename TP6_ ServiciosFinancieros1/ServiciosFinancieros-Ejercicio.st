!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'lvg 11/10/2022 23:41:57'!
test01CreateEmptyPortfolio
	
	|portfolio|
	portfolio := Portfolio new.
	
	self assert: (portfolio isBalance: 0*peso)! !

!PortfolioTest methodsFor: 'tests' stamp: 'lvg 11/10/2022 23:42:25'!
test02AddAnAccountToAPortfolio
	
	|portfolio account accounts |
	
	account := ReceptiveAccount new.
	Deposit register: 10*peso on: account.
	accounts := OrderedCollection with: account.
	portfolio := Portfolio with: accounts.
	
	self assert: (portfolio isBalance: 10*peso).! !

!PortfolioTest methodsFor: 'tests' stamp: 'lvg 11/10/2022 23:42:46'!
test03AddMoreThanOneAccountToAPortfolio
	
	|portfolio account anotherAccount accounts |
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	Deposit register: 10*peso on: account.
	Withdraw register: 5*peso on: anotherAccount.
	
	accounts := OrderedCollection with: account with: anotherAccount.
	portfolio := Portfolio with: accounts.
	
	self assert: (portfolio isBalance: 5*peso)! !

!PortfolioTest methodsFor: 'tests' stamp: 'lvg 11/10/2022 18:07:20'!
test04AskForAParticularTransactionToAPortfolio
	
	|portfolio account anotherAccount accounts transaction |
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	transaction := Deposit register: 10*peso on: account.
	Withdraw register: 5*peso on: anotherAccount.
	
	accounts := OrderedCollection with: account with: anotherAccount.
	portfolio := Portfolio with: accounts.
	
	self assert: (portfolio includesTheTransaction: transaction).! !

!PortfolioTest methodsFor: 'tests' stamp: 'lvg 11/10/2022 18:23:05'!
test05GetAllTransactionsOfAPortfolio
	
	|portfolio account anotherAccount accounts transaction anotherTransaction transactions |
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	transaction := Deposit register: 10*peso on: account.
	anotherTransaction := Withdraw register: 5*peso on: anotherAccount.
	
	transactions := OrderedCollection with: transaction with: anotherTransaction.
	
	accounts := OrderedCollection with: account with: anotherAccount.
	portfolio := Portfolio with: accounts.
	
	self assert: transactions equals: portfolio transactions.! !

!PortfolioTest methodsFor: 'tests' stamp: 'lvg 11/10/2022 23:45:49'!
test06AddAPortfolioToAnotherPortfolio
	
	| elements portfolio |
	elements := OrderedCollection with: (Portfolio new).
	portfolio := Portfolio with: elements.
	
	self assert: (portfolio isBalance: 0*peso) .! !

!PortfolioTest methodsFor: 'tests' stamp: 'lvg 11/10/2022 23:46:12'!
test07AddAPortfolioAndAnAccountToAnotherPortfolio
	
	| elements portfolio account innerPortfolio elementInnerPortfolio anotherAccount |
	
	account := ReceptiveAccount new.
	Deposit register: 50*peso on: account.
	
	elementInnerPortfolio := OrderedCollection with: account.
	innerPortfolio := Portfolio with: elementInnerPortfolio.
	anotherAccount:= ReceptiveAccount new.
	Deposit register: 10*peso  on: anotherAccount. 
	
	elements := OrderedCollection with: innerPortfolio with: anotherAccount.
	portfolio := Portfolio with: elements.
	
	self assert: (portfolio isBalance: 60*peso).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'lvg 11/11/2022 01:26:05'!
test08APortfolioCannotAddTheSameAccountMoreThanOnce

	self
	should:[
		| account elements |
		
		account := ReceptiveAccount new.
		Deposit register: 50*peso on: account.

		elements := OrderedCollection with: account with: account .
		Portfolio with: elements .
	]
	raise: Error
	withExceptionDo: [ :anError | self assert: Portfolio invalidAccountTwiceErrorDescription equals: anError messageText ]
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'lvg 11/11/2022 02:22:01'!
test09APortfolioCannotAddAccountThatItIsAlreadyIncludeInPrevioslyAddedPortfolio
"
	self
	should:[
		| account elements innerElements innerPortfolio |
		
		account := ReceptiveAccount new.
		innerElements := OrderedCollection with: account.
		innerPortfolio := Portfolio with: innerElements.
		elements := OrderedCollection with: innerPortfolio with: account.
		Portfolio with: elements.

	]
	raise: Error
	withExceptionDo: [ :anError | self assert: Portfolio invalidAccountTwiceErrorDescription equals: anError messageText ]
	"! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'lvg 11/11/2022 00:06:17'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: (account isBalance: 0*peso).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'lvg 11/11/2022 00:07:12'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
		
	self assert: (account isBalance: 100*peso).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'lvg 11/11/2022 00:07:42'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: (account isBalance: 50*peso).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'lvg 11/11/2022 00:29:09'!
test04WithdrawValueMustBePositive 

	self
	should:[
		| account withdrawValue |
		
		account := ReceptiveAccount new.
		withdrawValue := (-50) * peso.
		Withdraw register: withdrawValue on: account.
	]
	raise: Error
	withExceptionDo: [ :anError | self assert: Withdraw invalidWithdrawAmountErrorDescription equals: anError messageText ]

	
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'lvg 11/11/2022 00:08:57'!
test07AccountKnowsItsTransactions 

	| account anotherAccount deposit depositToAnotherAccount |
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
	depositToAnotherAccount := Deposit register: 100*peso on: anotherAccount .
	
		
	self assert: (account isTransactionsSize: 1).
	self assert: (account transactions includes: deposit).
	self deny: (account includesTheTransaction: depositToAnotherAccount).

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'lvg 11/11/2022 00:31:12'!
test08DepositValueMustBePositive 

	self
	should:[
		| account depositValue |
		
		account := ReceptiveAccount new.
		depositValue := (-50) * peso.
		Deposit register: depositValue on: account.
	]
	raise: Error
	withExceptionDo: [ :anError | self assert: Deposit invalidDepositAmountErrorDescription equals: anError messageText ]

	
! !


!classDefinition: #TransferenceTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTest methodsFor: 'tests' stamp: 'lvg 11/10/2022 23:28:33'!
test01MoneyCanBeTransferredBetweenAccounts

	| aRecipientAccount aSendersAccount transferenceValue expectedTransferenceWithDrawValue |
	
	aRecipientAccount := ReceptiveAccount new.
	aSendersAccount := ReceptiveAccount new.
	transferenceValue := 50 * peso.
	Transference register: transferenceValue on: aRecipientAccount off: aSendersAccount.
	
	expectedTransferenceWithDrawValue := (-50) * peso. "solo para validar y no romper encapsulamiento"
	
	self assert: (aRecipientAccount isBalance: transferenceValue).
	self assert: (aSendersAccount isBalance: expectedTransferenceWithDrawValue).
	
! !

!TransferenceTest methodsFor: 'tests' stamp: 'lvg 11/10/2022 23:11:12'!
test02TransferenceWithZeroAmountCannotBePosible

	self
	should:[
		| account anotherAccount transferenceValue  |
		
		account := ReceptiveAccount new.
		anotherAccount  := ReceptiveAccount new.
		transferenceValue := 0 * peso.
		Transference register: transferenceValue on: account off: anotherAccount .
	]
	raise: Error
	withExceptionDo: [ :anError | self assert: Transference invalidAmountErrorDescription equals: anError messageText ]
	 
! !

!TransferenceTest methodsFor: 'tests' stamp: 'lvg 11/10/2022 23:11:31'!
test03AnAccountCannotTransferMoneyToItself

	self
	should:[
		| account transferenceValue  |
		
		account := ReceptiveAccount new.
		transferenceValue := 10 * peso.
		Transference register: transferenceValue on: account off: account.
	]
	raise: Error
	withExceptionDo: [ :anError | self assert: Transference invalidAccountErrorDescription equals: anError messageText ]
	 


	 
! !

!TransferenceTest methodsFor: 'tests' stamp: 'lvg 11/10/2022 23:30:05'!
test04AnAccountCanTransferMoneyMoreThanOnce

	| aRecipientAccount aSendersAccount transferenceValue anotherTransferenceValue expectedTransferenceWithdrawValue expectedTotalTransferValue |
	
	aRecipientAccount := ReceptiveAccount new.
	aSendersAccount := ReceptiveAccount new.
	transferenceValue := 50 * peso.
	anotherTransferenceValue := 100*peso.
	
	Transference register: transferenceValue on: aRecipientAccount off: aSendersAccount.
	Transference register: anotherTransferenceValue on: aRecipientAccount off: aSendersAccount.
	
	expectedTransferenceWithdrawValue := (-150)*peso.	
	expectedTotalTransferValue := 150*peso.
	
	self assert: (aRecipientAccount isBalance: expectedTotalTransferValue).
	self assert: (aSendersAccount isBalance: expectedTransferenceWithdrawValue).
	
	 
! !

!TransferenceTest methodsFor: 'tests' stamp: 'lvg 11/11/2022 00:00:13'!
test05AnAccountRegisterTransfererenceCorrectly

	| aRecipientAccount aSendersAccount transferenceValue anotherTransferenceValue transference anotherTransference |
	
	aRecipientAccount := ReceptiveAccount new.
	aSendersAccount := ReceptiveAccount new.
	transferenceValue := 50 * peso.
	anotherTransferenceValue := 100*peso.
	
	transference := Transference register: transferenceValue on: aRecipientAccount off: aSendersAccount.
	anotherTransference := Transference register: anotherTransferenceValue on: aRecipientAccount off: aSendersAccount.
	
	self assert: (aRecipientAccount isTransactionsSize: 2).
	self assert: (aSendersAccount isTransactionsSize: 2).

	 
! !

!TransferenceTest methodsFor: 'tests' stamp: 'lvg 11/10/2022 23:37:50'!
test06TransferenceWithdrawKnowsItsCounterpart

	| aRecipientAccount aSendersAccount transferenceValue  transference transferenceWithdraw transferenceDeposit |
	
	aRecipientAccount := ReceptiveAccount new.
	aSendersAccount := ReceptiveAccount new.
	transferenceValue := 50 * peso.
	
	transference := Transference register: transferenceValue on: aRecipientAccount off: aSendersAccount.
	transferenceWithdraw := 	transference transferenceWithdraw.
	transferenceDeposit  := transference transferenceDeposit.
	
	self assert: (transferenceWithdraw isCounterpartTransaction: transferenceDeposit).
	self deny: (transferenceWithdraw isCounterpartTransaction: transferenceWithdraw).

	 

! !

!TransferenceTest methodsFor: 'tests' stamp: 'lvg 11/11/2022 01:18:39'!
test07TransferenceDepositKnowsItsCounterpart

	| aRecipientAccount aSendersAccount transferenceValue  transference transferenceWithdraw transferenceDeposit |
	
	aRecipientAccount := ReceptiveAccount new.
	aSendersAccount := ReceptiveAccount new.
	transferenceValue := 50 * peso.
	
	transference := Transference register: transferenceValue on: aRecipientAccount off: aSendersAccount.
	transferenceWithdraw := 	transference transferenceWithdraw.
	transferenceDeposit  := transference transferenceDeposit.
	
	self assert: (transferenceDeposit isCounterpartTransaction: transferenceWithdraw ).
	self deny: (transferenceDeposit isCounterpartTransaction: transferenceDeposit ).

	 

! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'transactionValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'AGH 11/10/2022 19:04:16'!
transactionValue
	^transactionValue! !


!AccountTransaction methodsFor: 'operation' stamp: 'lvg 11/10/2022 22:43:29'!
transaction: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'lvg 11/11/2022 00:32:39'!
register: anAmount on: anAccount

	self subclassResponsibility.! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'lvg 11/10/2022 18:29:25'!
initializeFor: aValue

	transactionValue := aValue ! !


!Deposit methodsFor: 'operation' stamp: 'lvg 11/10/2022 22:43:29'!
transaction: aBalance

	^ aBalance + transactionValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'lvg 11/11/2022 00:35:03'!
for: anAmount

	^ self new initializeFor: anAmount ! !

!Deposit class methodsFor: 'instance creation' stamp: 'lvg 11/11/2022 00:33:09'!
register: anAmount on: anAccount

	(self isAValidDepositAmount: anAmount) ifTrue: [
		| transaction |

		transaction := self for: anAmount.
		anAccount register: transaction.
			
		^ transaction
	] ifFalse: [self error: 'Deposit cannot be less than 0*peso']! !


!Deposit class methodsFor: 'validation' stamp: 'lvg 11/11/2022 00:20:07'!
isAValidDepositAmount: anAmount 
	
	^anAmount>0.! !


!Deposit class methodsFor: 'error description' stamp: 'lvg 11/11/2022 00:22:25'!
invalidDepositAmountErrorDescription

	^'Deposit cannot be less than 0*peso'! !


!classDefinition: #TransferenceDeposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferenceDeposit
	instanceVariableNames: 'transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceDeposit methodsFor: 'initialization' stamp: 'lvg 11/10/2022 18:28:49'!
initializeWith: aTransference 

	transference := aTransference.
	transactionValue :=  aTransference transferenceAmount.! !


!TransferenceDeposit methodsFor: 'operations' stamp: 'lvg 11/10/2022 22:49:33'!
counterpartTransaction

	^ transference transferenceWithdraw.! !

!TransferenceDeposit methodsFor: 'operations' stamp: 'lvg 11/10/2022 22:43:29'!
transaction: aBalance

	^ aBalance + transactionValue.! !


!TransferenceDeposit methodsFor: 'accesing' stamp: 'lvg 11/10/2022 23:39:43'!
isCounterpartTransaction: aTransferenceDeposit 
	
	^self counterpartTransaction  = aTransferenceDeposit.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceDeposit class
	instanceVariableNames: ''!

!TransferenceDeposit class methodsFor: 'instance creation' stamp: 'lvg 11/10/2022 16:43:12'!
ofTransference: aTransference

	^self new initializeWith: aTransference.! !

!TransferenceDeposit class methodsFor: 'instance creation' stamp: 'lvg 11/11/2022 00:33:35'!
register: aTransference on: anAccount

	| transaction |
	
	transaction := self ofTransference: aTransference.
	anAccount register: transaction.
		
	^ transaction! !


!classDefinition: #TransferenceWithdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferenceWithdraw
	instanceVariableNames: 'transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceWithdraw methodsFor: 'operation' stamp: 'lvg 11/10/2022 22:49:33'!
counterpartTransaction

	^ transference transferenceDeposit.! !

!TransferenceWithdraw methodsFor: 'operation' stamp: 'lvg 11/10/2022 22:43:29'!
transaction: aBalance

	^ aBalance - transactionValue.! !


!TransferenceWithdraw methodsFor: 'initialization' stamp: 'lvg 11/10/2022 18:29:53'!
initializeWith: aTransference 

	transference := aTransference.
	transactionValue := aTransference transferenceAmount.! !


!TransferenceWithdraw methodsFor: 'accesing' stamp: 'lvg 11/10/2022 23:38:39'!
isCounterpartTransaction: aTransferenceDeposit 
	
	^self counterpartTransaction  = aTransferenceDeposit.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceWithdraw class
	instanceVariableNames: ''!

!TransferenceWithdraw class methodsFor: 'instance creation' stamp: 'lvg 11/10/2022 16:44:30'!
ofTransference: aTransference

	^self new initializeWith: aTransference.! !

!TransferenceWithdraw class methodsFor: 'instance creation' stamp: 'lvg 11/11/2022 00:33:58'!
register: aTransference on: anAccount

	| transaction |
	
	transaction := self ofTransference: aTransference.
	anAccount register: transaction.
		
	^ transaction! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'AGH 11/10/2022 19:02:50'!
initializeFor: aValue

	transactionValue := aValue ! !


!Withdraw methodsFor: 'operation' stamp: 'lvg 11/10/2022 22:43:29'!
transaction: aBalance

	^ aBalance - transactionValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'lvg 11/11/2022 00:34:44'!
for: anAmount

	^ self new initializeFor: anAmount ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'lvg 11/11/2022 00:34:30'!
register: anAmount on: anAccount

	(self isAValidWithdrawAmount: anAmount) ifTrue: [
		| transaction |

		transaction := self for: anAmount.
		anAccount register: transaction.
			
		^ transaction
	] ifFalse: [self error: 'Withdraw cannot be less than 0*peso']! !


!Withdraw class methodsFor: 'validation' stamp: 'lvg 11/11/2022 00:21:59'!
isAValidWithdrawAmount: anAmount 
	
	^anAmount>0.! !


!Withdraw class methodsFor: 'error description' stamp: 'lvg 11/11/2022 00:22:45'!
invalidWithdrawAmountErrorDescription

	^'Withdraw cannot be less than 0*peso'! !


!classDefinition: #FinancialAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #FinancialAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!FinancialAccount methodsFor: 'main protocol' stamp: 'lvg 11/10/2022 18:22:16'!
balance

	self subclassResponsibility.! !

!FinancialAccount methodsFor: 'main protocol' stamp: 'lvg 11/10/2022 18:26:27'!
includesTheTransaction: aTransaction

	self subclassResponsibility.! !

!FinancialAccount methodsFor: 'main protocol' stamp: 'lvg 11/10/2022 18:26:59'!
transactions

	self subclassResponsibility.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
FinancialAccount subclass: #Portfolio
	instanceVariableNames: 'portfolioElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'main protocol' stamp: 'lvg 11/10/2022 18:03:10'!
balance
	
	^portfolioElements sum: [:actualAccount | actualAccount balance] ifEmpty:  [	^ 0*peso].
	! !

!Portfolio methodsFor: 'main protocol' stamp: 'lvg 11/10/2022 18:25:56'!
includesTheTransaction: aTransaction 

	portfolioElements do: [:actualAccount | (actualAccount includesTheTransaction: aTransaction) ifTrue: [^true]].
	^false.! !

!Portfolio methodsFor: 'main protocol' stamp: 'lvg 11/10/2022 18:23:05'!
transactions

	| transactions |
	transactions := OrderedCollection new.
	portfolioElements do: [:actualAccount | transactions addAllLast: (actualAccount transactions)].
	^transactions.! !


!Portfolio methodsFor: 'initialization' stamp: 'lvg 11/10/2022 18:03:48'!
initialize
	
	portfolioElements := OrderedCollection new.
	! !

!Portfolio methodsFor: 'initialization' stamp: 'lvg 11/11/2022 01:21:33'!
with: aCollectionOfportfolioElements 

	portfolioElements := aCollectionOfportfolioElements.
! !


!Portfolio methodsFor: 'accessing' stamp: 'lvg 11/10/2022 23:15:34'!
isBalance: aBalance

	^self balance = aBalance.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'lvg 11/11/2022 01:21:51'!
with: aCollectionOfPorfolioElements 
	(self isACollectionOfPortfoliosValid: aCollectionOfPorfolioElements)ifTrue:[
	^self new with: aCollectionOfPorfolioElements.	].
! !


!Portfolio class methodsFor: 'error description' stamp: 'lvg 11/11/2022 01:20:34'!
invalidAccountTwiceErrorDescription

	^'The financial account already exist'.! !


!Portfolio class methodsFor: 'validation' stamp: 'lvg 11/11/2022 02:21:46'!
isACollectionOfPortfoliosValid: aCollectionOfPortfolios 
		
	aCollectionOfPortfolios ifEmpty: [		^true].
	
	((aCollectionOfPortfolios size) = 1) ifTrue: [
		 (aCollectionOfPortfolios includes: aCollectionOfPortfolios ) ifTrue:[self error: 'The financial account already exist']. 
		^true.
	].
	((aCollectionOfPortfolios size) > 1)ifTrue:[
		aCollectionOfPortfolios do: [: anElementFromACollectionOfPortfolios|
			 (aCollectionOfPortfolios occurrencesOf: anElementFromACollectionOfPortfolios) > 1 ifTrue:[self error: 'The financial account already exist'].
			"		((anElementFromACollectionOfPortfolios size)>1) ifTrue:[anElementFromACollectionOfPortfolios 
				do:[:innerElement| (innerElement = anElementFromACollectionOfPortfolios) ifTrue:[self error: 'The financial account already exist']. ].
			]."
	].
	].
	^true.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
FinancialAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'lvg 11/10/2022 22:43:29'!
balance

	| aBalance |
	
	aBalance := 0.

	transactions do: [ :aTransaction | aBalance := aTransaction transaction: aBalance].
	
	^aBalance .! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'lvg 11/10/2022 18:25:56'!
includesTheTransaction: aTransaction

	^ transactions includes: aTransaction.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'lvg 11/8/2022 15:35:27'!
transactionsSize

	^ transactions size.! !


!ReceptiveAccount methodsFor: 'accessing' stamp: 'lvg 11/10/2022 23:17:19'!
isBalance: aBalance

	^self balance = aBalance .! !

!ReceptiveAccount methodsFor: 'accessing' stamp: 'lvg 11/10/2022 23:35:08'!
isTransactionsSize: aPosibleSIze 
	^self transactionsSize = aPosibleSIze ! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'transferenceAmount transferenceWithdraw transferenceDeposit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'initialization' stamp: 'lvg 11/10/2022 17:42:22'!
initializeFor: aTransferenceAmount 

	transferenceAmount := aTransferenceAmount.! !


!Transference methodsFor: 'accesing' stamp: 'lvg 11/10/2022 17:42:22'!
transferenceAmount

	^transferenceAmount.! !

!Transference methodsFor: 'accesing' stamp: 'lvg 11/10/2022 17:33:46'!
transferenceDeposit

	^transferenceDeposit.! !

!Transference methodsFor: 'accesing' stamp: 'lvg 11/10/2022 17:34:12'!
transferenceWithdraw
	
	^transferenceWithdraw.! !


!Transference methodsFor: 'initiliazation private' stamp: 'lvg 11/10/2022 17:38:24'!
assignTranseferenceWithdraw: aTransferenceWithdraw assignTransferenceDeposit: aTransferenceDeposit.

	transferenceWithdraw := aTransferenceWithdraw.
	transferenceDeposit := aTransferenceDeposit.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'instance creation' stamp: 'lvg 11/10/2022 17:37:00'!
register: anAmount on: aRecipientAccount off: aSendersAccount

	| transference depositTransfer extractionTransfer |
	(self validAmount: anAmount) ifFalse: [self error: 'Transference amount cannot be 0'].
	(aRecipientAccount = aSendersAccount ) ifTrue:[self error: 'Transference cannot be within same account'].
	
	transference := self new initializeFor: anAmount .
	depositTransfer := TransferenceDeposit register: transference on: aRecipientAccount.
	extractionTransfer := TransferenceWithdraw register: transference on: aSendersAccount.
	transference assignTranseferenceWithdraw: extractionTransfer assignTransferenceDeposit: depositTransfer.
		
	^transference .
		
		
! !


!Transference class methodsFor: 'error descriptions' stamp: 'lvg 11/10/2022 17:11:22'!
invalidAccountErrorDescription

	^'Transference cannot be within same account'! !

!Transference class methodsFor: 'error descriptions' stamp: 'lvg 11/10/2022 15:07:56'!
invalidAmountErrorDescription

	^'Transference amount cannot be 0'! !


!Transference class methodsFor: 'validations' stamp: 'lvg 11/10/2022 15:14:46'!
validAmount: anAmount

	^ anAmount > 0.! !
