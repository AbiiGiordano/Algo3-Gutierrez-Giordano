!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'lvg 11/10/2022 18:11:11'!
test01CreateEmptyPortfolio
	
	|portfolio|
	portfolio := Portfolio new.
	
	self assert: portfolio balance equals: 0*peso! !

!PortfolioTest methodsFor: 'tests' stamp: 'lvg 11/10/2022 18:11:04'!
test02AddAnAccountToAPortfolio
	
	|portfolio account accounts |
	
	account := ReceptiveAccount new.
	Deposit register: 10*peso on: account.
	accounts := OrderedCollection with: account.
	portfolio := Portfolio with: accounts.
	
	self assert: portfolio balance equals: 10*peso! !

!PortfolioTest methodsFor: 'tests' stamp: 'lvg 11/10/2022 18:10:31'!
test03AddMoreThanOneAccountToAPortfolio
	
	|portfolio account anotherAccount accounts |
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	Deposit register: 10*peso on: account.
	Withdraw register: 5*peso on: anotherAccount.
	
	accounts := OrderedCollection with: account with: anotherAccount.
	portfolio := Portfolio with: accounts.
	
	self assert: portfolio balance equals: 5*peso! !

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

!PortfolioTest methodsFor: 'tests' stamp: 'lvg 11/10/2022 18:09:10'!
test06AddAPortfolioToAnotherPortfolio
	
	| elements portfolio |
	elements := OrderedCollection with: (Portfolio new).
	portfolio := Portfolio with: elements.
	
	self assert: 0*peso equals: portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'lvg 11/10/2022 18:13:09'!
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
	
	self assert: 60*peso equals: portfolio balance.
! !


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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AGH 11/8/2022 20:22:37'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AGH 11/10/2022 19:04:48'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) transactionValue.
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'lvg 11/10/2022 15:58:33'!
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

!TransferenceTest methodsFor: 'tests' stamp: 'lvg 11/10/2022 17:19:55'!
test00TransferenceCannotBeWithZeroAmount

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

!TransferenceTest methodsFor: 'tests' stamp: 'lvg 11/10/2022 17:21:11'!
test00sameaccountTransferenceIna

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

!TransferenceTest methodsFor: 'tests' stamp: 'lvg 11/10/2022 16:05:49'!
test01makeTransference

	| aRecipientAccount aSendersAccount transferenceValue transference |
	
	aRecipientAccount := ReceptiveAccount new.
	aSendersAccount := ReceptiveAccount new.
	transferenceValue := 50 * peso.
	transference :=  Transference register: transferenceValue on: aRecipientAccount off: aSendersAccount.
	
	self assert: transferenceValue  equals: aRecipientAccount balance.
	self assert:  (-50)*peso equals: aSendersAccount  balance.
	"self assert: (aRecipientAccount hasRegistered: (	transference pataExtraccion ) ) "
	
! !

!TransferenceTest methodsFor: 'tests' stamp: 'AGH 11/8/2022 19:49:24'!
test02makeMoreThanOneTransference

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

!TransferenceTest methodsFor: 'tests' stamp: 'AGH 11/8/2022 19:49:57'!
test03registerTransfererenceCorrectly

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

!TransferenceTest methodsFor: 'tests' stamp: 'AGH 11/10/2022 19:32:14'!
test04getTransactionPataExtraccion

	| aRecipientAccount aSendersAccount transferenceValue  transference pataExtraccion pataDeposito |
	
	aRecipientAccount := ReceptiveAccount new.
	aSendersAccount := ReceptiveAccount new.
	transferenceValue := 50 * peso.
	
	transference := Transference register: transferenceValue on: aRecipientAccount off: aSendersAccount.
	pataExtraccion := 	transference transferenceWithdraw.
	pataDeposito  := transference transferenceDeposit.
	
	self assert: (pataExtraccion counterpart) = pataDeposito.
	self deny: (pataExtraccion counterpart ) = pataExtraccion.

	 

! !

!TransferenceTest methodsFor: 'tests' stamp: 'AGH 11/10/2022 19:32:14'!
test07getTransactionPataDeposito

	| aRecipientAccount aSendersAccount transferenceValue  transference pataExtraccion pataDeposito |
	
	aRecipientAccount := ReceptiveAccount new.
	aSendersAccount := ReceptiveAccount new.
	transferenceValue := 50 * peso.
	
	transference := Transference register: transferenceValue on: aRecipientAccount off: aSendersAccount.
	pataExtraccion := 	transference transferenceWithdraw.
	pataDeposito  := transference transferenceDeposit.
	
	self assert: (pataDeposito counterpart) = pataExtraccion .
	self deny: (pataDeposito counterpart ) = pataDeposito .


	 
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


!AccountTransaction methodsFor: 'operation' stamp: 'AGH 11/10/2022 19:19:31'!
makeTransaction: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'AGH 11/10/2022 19:38:12'!
register: aValue on: anAccount

	self subclassResponsibility.! !


!classDefinition: #EgressAmount category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #EgressAmount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!EgressAmount methodsFor: 'operations' stamp: 'AGH 11/10/2022 19:29:17'!
makeTransaction: anAccountBalance

	^ anAccountBalance - transactionValue.! !


!classDefinition: #TransferenceWithdraw category: 'ServiciosFinancieros-Ejercicio'!
EgressAmount subclass: #TransferenceWithdraw
	instanceVariableNames: 'transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceWithdraw methodsFor: 'operation' stamp: 'AGH 11/10/2022 19:32:13'!
counterpart

	^ transference transferenceDeposit.! !


!TransferenceWithdraw methodsFor: 'initialization' stamp: 'lvg 11/10/2022 18:29:53'!
initializeWith: aTransference 

	transference := aTransference.
	transactionValue := aTransference transferenceAmount.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceWithdraw class
	instanceVariableNames: ''!

!TransferenceWithdraw class methodsFor: 'instance creation' stamp: 'lvg 11/10/2022 16:44:30'!
ofTransference: aTransference

	^self new initializeWith: aTransference.! !

!TransferenceWithdraw class methodsFor: 'instance creation' stamp: 'AGH 11/10/2022 19:35:49'!
register: aTransference on: anAccount

	| transaction |
	
	transaction := self ofTransference: aTransference.
	anAccount register: transaction.
		
	^ transaction! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
EgressAmount subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'AGH 11/10/2022 19:28:43'!
initializeFor: aWithdrawAmount

	transactionValue := aWithdrawAmount ! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'lvg 11/10/2022 16:42:27'!
for: aValue

	^ self new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'AGH 11/10/2022 19:37:05'!
register: anAmount on: anAccount

	| transaction |
	
	transaction := self for: anAmount.
	anAccount register: transaction.
		
	^ transaction! !


!classDefinition: #EntryAmount category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #EntryAmount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!EntryAmount methodsFor: 'operations' stamp: 'AGH 11/10/2022 19:29:30'!
makeTransaction: anAccountBalance

	^ anAccountBalance + transactionValue.! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
EntryAmount subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'AGH 11/10/2022 19:28:21'!
initializeFor: aDepositAmount

	transactionValue := aDepositAmount ! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'lvg 11/10/2022 16:42:04'!
for: aValue

	^ self new initializeFor: aValue ! !

!Deposit class methodsFor: 'instance creation' stamp: 'AGH 11/10/2022 19:37:52'!
register: anAmount on: anAccount

	| transaction |
	
	transaction := self for: anAmount.
	anAccount register: transaction.
		
	^ transaction! !


!classDefinition: #TransferenceDeposit category: 'ServiciosFinancieros-Ejercicio'!
EntryAmount subclass: #TransferenceDeposit
	instanceVariableNames: 'transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceDeposit methodsFor: 'initialization' stamp: 'lvg 11/10/2022 18:28:49'!
initializeWith: aTransference 

	transference := aTransference.
	transactionValue :=  aTransference transferenceAmount.! !


!TransferenceDeposit methodsFor: 'operations' stamp: 'AGH 11/10/2022 19:32:13'!
counterpart

	^ transference transferenceWithdraw.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceDeposit class
	instanceVariableNames: ''!

!TransferenceDeposit class methodsFor: 'instance creation' stamp: 'lvg 11/10/2022 16:43:12'!
ofTransference: aTransference

	^self new initializeWith: aTransference.! !

!TransferenceDeposit class methodsFor: 'instance creation' stamp: 'AGH 11/10/2022 19:37:37'!
register: aTransference on: anAccount

	| transaction |
	
	transaction := self ofTransference: aTransference.
	anAccount register: transaction.
		
	^ transaction! !


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

!Portfolio methodsFor: 'initialization' stamp: 'lvg 11/10/2022 17:46:44'!
with: aCollectionOfportfolioElements 

	portfolioElements := aCollectionOfportfolioElements.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'lvg 11/10/2022 18:05:25'!
with: aCollectionOfPorfolioElements 
	^self new with: aCollectionOfPorfolioElements.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
FinancialAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'AGH 11/10/2022 19:19:32'!
balance

	| aBalance |
	
	aBalance := 0.

	transactions do: [ :aTransaction | aBalance := aTransaction makeTransaction: aBalance].
	
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
