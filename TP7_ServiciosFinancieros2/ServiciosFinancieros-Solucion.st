!classDefinition: #Test01ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #Test01ReceptiveAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Test01ReceptiveAccount methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!Test01ReceptiveAccount methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!Test01ReceptiveAccount methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!Test01ReceptiveAccount methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!Test01ReceptiveAccount methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!Test01ReceptiveAccount methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!Test01ReceptiveAccount methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #Test02Transfer category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #Test02Transfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Test02Transfer methodsFor: 'tests' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!Test02Transfer methodsFor: 'tests' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!Test02Transfer methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!Test02Transfer methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!Test02Transfer methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!Test02Transfer methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Test03Portfolio category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #Test03Portfolio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Test03Portfolio methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!Test03Portfolio methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!Test03Portfolio methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!Test03Portfolio methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!Test03Portfolio methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!Test03Portfolio methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!Test03Portfolio methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!Test03Portfolio methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!Test03Portfolio methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!Test03Portfolio methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!Test03Portfolio methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!Test03Portfolio methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!Test03Portfolio methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!Test03Portfolio methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!Test03Portfolio methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #Test04SummaryReport category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #Test04SummaryReport
	instanceVariableNames: 'anAccount anotherAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Test04SummaryReport methodsFor: 'tests' stamp: 'lvg 11/18/2022 15:13:53'!
test01SummaryWithNoTransactionsReport

	| expectedSummary report |

	report := SummaryReport of: anAccount.	
	report createReport.

	expectedSummary := OrderedCollection  with:  'Balance = 0 * pesos'.

	self assert: expectedSummary equals: report summaryReport.
	! !

!Test04SummaryReport methodsFor: 'tests' stamp: 'lvg 11/18/2022 15:13:32'!
test02SummaryReportIncludesDeposit

	| expectedSummary report |
	
	Deposit register: 100*peso  on: anAccount .
	
	expectedSummary := OrderedCollection with: 'Depósito por 100 * pesos' with: 'Balance = 100 * pesos'.
	report := SummaryReport of: anAccount .
	
	report createReport.
	 
	self assert: expectedSummary  equals: report summaryReport.
	! !

!Test04SummaryReport methodsFor: 'tests' stamp: 'lvg 11/18/2022 15:13:02'!
test03SummaryReportIncludesAWitdraw

	| expectedSummary report |
	
	Withdraw register: 50*peso on: anAccount .
	
	report := SummaryReport of: anAccount.	
	report createReport.
	
	expectedSummary := OrderedCollection with: 'Extracción por 50 * pesos' with: 'Balance = -50 * pesos' .
	 
	self assert: expectedSummary equals: report summaryReport.
	
	! !

!Test04SummaryReport methodsFor: 'tests' stamp: 'lvg 11/18/2022 15:12:35'!
test04SummaryReportIncludesATransferWithdraw

	| expectedSummary report |
		
	Transfer amount: 20*peso from: anAccount to: anotherAccount.

	report := SummaryReport of: anAccount.
	report createReport.
	
	expectedSummary := OrderedCollection with: 'Salida por transferencia de 20 * pesos' with: 'Balance = -20 * pesos'.
	 
	self assert: expectedSummary  equals: report summaryReport.
	
	! !

!Test04SummaryReport methodsFor: 'tests' stamp: 'lvg 11/18/2022 15:12:18'!
test05SummaryReportIncludesATransferDeposit

	| expectedSummary report |
		
	Transfer amount: 30*peso from: anotherAccount  to: anAccount .
	
	report := SummaryReport of: anAccount.	
	report createReport.

	expectedSummary := OrderedCollection with: 'Entrada por transferencia de 30 * pesos' with: 'Balance = 30 * pesos'.
	 
	self assert: expectedSummary  equals: report summaryReport.
	! !

!Test04SummaryReport methodsFor: 'tests' stamp: 'lvg 11/18/2022 15:11:59'!
test06SummaryReportWithSeveralTransactions

	| expectedSummary report |
	
	Deposit register: 100*peso  on: anAccount.
	Withdraw register: 50*peso on: anAccount.
	Transfer amount: 20*peso from: 	anAccount to: anotherAccount.
	Transfer amount: 30*peso from: anotherAccount to: anAccount.
	
	expectedSummary := OrderedCollection with: 'Depósito por 100 * pesos' with: 'Extracción por 50 * pesos' with: 'Salida por transferencia de 20 * pesos' 	
								 with: 'Entrada por transferencia de 30 * pesos' with: 'Balance = 60 * pesos'.
								
	report := SummaryReport of: anAccount.
	report createReport.
	 
	self assert: expectedSummary  equals: report summaryReport.
	
	! !

!Test04SummaryReport methodsFor: 'tests' stamp: 'lvg 11/18/2022 15:11:38'!
test07SummaryReportOfAPortfolio

	| portfolio report expectedSummary |
	
	Deposit register: 100 * peso on: anAccount.
	
	portfolio := Portfolio with: anAccount.
	
	report := SummaryReport of: portfolio.
	report createReport.
	
	expectedSummary := OrderedCollection with: 'Depósito por 100 * pesos' with: 'Balance = 100 * pesos'.
	 
	self assert: expectedSummary equals: report summaryReport.
	! !

!Test04SummaryReport methodsFor: 'tests' stamp: 'lvg 11/18/2022 15:11:03'!
test08SummaryReportOfAComposedPortfolio

	| simplePortfolio composedPortofolio report expectedSummary |
	
	Deposit register: 100 * peso on: anAccount.
	Withdraw register: 50 * peso on: anotherAccount.

	simplePortfolio := Portfolio with: anAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: anotherAccount.
	
	report := SummaryReport of: composedPortofolio.
	report createReport.
	 
	expectedSummary := OrderedCollection with: 'Depósito por 100 * pesos' with: 'Extracción por 50 * pesos'  with: 'Balance = 50 * pesos'.

	self assert: expectedSummary equals: report summaryReport.
	! !


!Test04SummaryReport methodsFor: 'setUp' stamp: 'lvg 11/18/2022 15:10:28'!
setUp

	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
! !


!classDefinition: #Test05TransferNetReport category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #Test05TransferNetReport
	instanceVariableNames: 'anAccount anotherAccount composedPortfolioAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Test05TransferNetReport methodsFor: 'tests' stamp: 'lvg 11/18/2022 15:21:52'!
test01NetTransferReportZeroTransferences

	| transactionReport |
	
	transactionReport := TransferNetReport of: anAccount.
	transactionReport createReport.
	 
	self assert: 0*peso  equals: transactionReport transferNetReport.! !

!Test05TransferNetReport methodsFor: 'tests' stamp: 'lvg 11/18/2022 15:22:03'!
test02NetTransferenceReportWithTransferDeposit

	| transactionReport |
		
	Transfer amount: 53*peso from: anotherAccount to: anAccount. 
	
	transactionReport := TransferNetReport of: anAccount.
	transactionReport createReport.

	self assert: 53*peso  equals: transactionReport transferNetReport.! !

!Test05TransferNetReport methodsFor: 'tests' stamp: 'lvg 11/18/2022 15:22:14'!
test03NetTransferenceReportWithTransferWithdraw

	| transactionReport |
	
	Transfer amount: 53*peso from: anAccount  to: anotherAccount. 
	
	transactionReport := TransferNetReport of: anAccount.
	transactionReport createReport.
	 
	self assert: (-53*peso)  equals: transactionReport transferNetReport.! !

!Test05TransferNetReport methodsFor: 'tests' stamp: 'lvg 11/18/2022 15:21:32'!
test04NetTransferReportWithSeveralTransactions

	| transactionReport |
		
	Deposit register: 100*peso  on: anAccount.
	Withdraw register: 50*peso on: anAccount.
	Transfer amount: 20*peso from: anAccount to: anotherAccount.
	Transfer amount: 30*peso from: anotherAccount  to: anAccount.	
	
	transactionReport := TransferNetReport of: anAccount.
	transactionReport createReport.
	 
	self assert: 10*peso  equals: transactionReport transferNetReport.
	! !

!Test05TransferNetReport methodsFor: 'tests' stamp: 'lvg 11/18/2022 15:21:32'!
test05NetTransferReportOfAPortfolio

	| portfolio transactionReport |

	Transfer amount: 100*peso from: anAccount to: anotherAccount.
	
	portfolio := Portfolio with: anAccount.
	
	transactionReport := TransferNetReport of: portfolio.
	transactionReport createReport.
	 
	self assert: -100*peso equals: transactionReport transferNetReport.! !

!Test05TransferNetReport methodsFor: 'tests' stamp: 'lvg 11/18/2022 15:21:32'!
test06NetTransferReportOfAComposedPortfolio

	| simplePortfolio composedPortofolio transactionReport |
	
	Transfer amount: 80*peso from: anotherAccount to: anAccount.
	simplePortfolio := Portfolio with: anAccount.
	
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	transactionReport := TransferNetReport of: composedPortofolio.
	transactionReport createReport.
	 
	self assert: 80*peso equals: transactionReport transferNetReport.! !


!Test05TransferNetReport methodsFor: 'setUp' stamp: 'lvg 11/18/2022 15:21:32'!
setUp

	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	composedPortfolioAccount := ReceptiveAccount new.
! !


!classDefinition: #Test06PortfolioTreeStructureReport category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #Test06PortfolioTreeStructureReport
	instanceVariableNames: 'fPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Test06PortfolioTreeStructureReport methodsFor: 'tests' stamp: 'lvg 11/18/2022 16:11:13'!
test01EmptyPortfolioTreeReport
	
	| familiyPortfolio portfolioTreeReport expectedTreeReport |
		
	familiyPortfolio  := Portfolio named: 'Portfolio de la familia'.
	portfolioTreeReport := PortfolioTreePrinter of: familiyPortfolio.
	portfolioTreeReport createReport.

	expectedTreeReport := OrderedCollection with: 'Portfolio de la familia'.
	
	self assert: expectedTreeReport equals: portfolioTreeReport portfolioTreeReport.
	! !

!Test06PortfolioTreeStructureReport methodsFor: 'tests' stamp: 'lvg 11/18/2022 16:11:13'!
test02PortfolioTreeReportWithAnAccount
	
	| familiyPortfolio myAccount portfolioTreeReport expectedTreeReport |
	
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	familiyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount.
	
	portfolioTreeReport := PortfolioTreePrinter of: familiyPortfolio.
	portfolioTreeReport createReport.
	
	expectedTreeReport := OrderedCollection with: 'Portfolio de la familia' with: ' Cuenta mia'.

	self assert: expectedTreeReport equals: portfolioTreeReport portfolioTreeReport.
! !

!Test06PortfolioTreeStructureReport methodsFor: 'tests' stamp: 'lvg 11/18/2022 16:11:13'!
test03PortfolioTreeReportWithAnAccountAndAnEmptyPortfolio
	
	| familyPortfolio myAccount portfolioTreeReport expectedTree childrensPortfolio |
	
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	childrensPortfolio := Portfolio named: 'Portfolio de hijos'.
	familyPortfolio := Portfolio named: 'Portfolio de la familia'  with: myAccount with: childrensPortfolio.
	
	portfolioTreeReport := PortfolioTreePrinter of: familyPortfolio	.
	portfolioTreeReport createReport.
	
	expectedTree := OrderedCollection with: 'Portfolio de la familia' with: ' Cuenta mia' with: (OrderedCollection with: ' Portfolio de hijos').
	
	self assert: expectedTree equals: portfolioTreeReport portfolioTreeReport.
	! !

!Test06PortfolioTreeStructureReport methodsFor: 'tests' stamp: 'lvg 11/18/2022 16:11:13'!
test04PortfolioTreeReportWithAnAccountAndAPortfolioWithAccounts
	
	| familyPortfolio myAccount portfolioTreeReport expectedTree childrensPortfolio angiesAccount johnsAccount |
	
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'.
	
	childrensPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount.
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrensPortfolio .
	
	portfolioTreeReport := PortfolioTreePrinter of: familyPortfolio.
	portfolioTreeReport createReport.
	
	expectedTree := OrderedCollection with: 'Portfolio de la familia' with: ' Cuenta mia' with: (
								OrderedCollection with: ' Portfolio de hijos' with: '  Cuenta de Juan' with: '  Cuenta de Angeles').
	
	self assert: expectedTree equals: portfolioTreeReport portfolioTreeReport.
	! !


!classDefinition: #Test07PortfolioDetailedTreeStructureReport category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #Test07PortfolioDetailedTreeStructureReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Test07PortfolioDetailedTreeStructureReport methodsFor: 'tests' stamp: 'lvg 11/18/2022 14:38:07'!
test01EmptyPortfolioDetailedReport
	
	| portfolio portfolioTreeDetailedReport tree |
	
	portfolio := Portfolio named: 'Portfolio de la familia'.
	
	portfolioTreeDetailedReport := PortfolioDetailedTreeReport of: portfolio.
	portfolioTreeDetailedReport createReport.

	tree := OrderedCollection with: 'Portfolio de la familia' with: 'Balance = 0 * pesos'.
	
	self assert: tree equals: portfolioTreeDetailedReport portfolioTreeDetailedReport.
	
	! !

!Test07PortfolioDetailedTreeStructureReport methodsFor: 'tests' stamp: 'AGH 11/18/2022 17:27:19'!
test02PortfolioDetailedReportWithAnAccountWithoutTransactions
	
	| portfolio portfolioTreeDetailedReport tree myAccount summaryReport |
	
	portfolio := Portfolio named: 'Portfolio de la familia'.
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	portfolio add: myAccount.
	
	portfolioTreeDetailedReport := PortfolioDetailedTreeReport of: portfolio.
	portfolioTreeDetailedReport createReport.
	
	summaryReport := SummaryReport of: myAccount.
	summaryReport createReport .
	 
	tree := OrderedCollection with: 'Portfolio de la familia' with: 'Cuenta mia' with: 	summaryReport summaryReport with: 'Balance = 0 * pesos'.
	
	self assert: tree equals: portfolioTreeDetailedReport portfolioTreeDetailedReport.
	
	! !

!Test07PortfolioDetailedTreeStructureReport methodsFor: 'tests' stamp: 'AGH 11/18/2022 17:27:44'!
test03PortfolioDetailedReportWithAnAccountWithTransactions
	
	| portfolio portfolioTreeDetailedReport tree myAccount summaryReport |
	
	portfolio := Portfolio named: 'Portfolio de la familia'.
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	Deposit register: (100*peso) on: myAccount.
	portfolio add: myAccount.
	
	portfolioTreeDetailedReport := PortfolioDetailedTreeReport of: portfolio.
	portfolioTreeDetailedReport createReport.
	
	summaryReport := SummaryReport of: myAccount.
	summaryReport createReport .
	 
	tree := OrderedCollection with: 'Portfolio de la familia' with: 'Cuenta mia' with: summaryReport summaryReport with: 'Balance = 100 * pesos'.
	
	self assert: tree equals: portfolioTreeDetailedReport portfolioTreeDetailedReport.
	
	! !

!Test07PortfolioDetailedTreeStructureReport methodsFor: 'tests' stamp: 'AGH 11/18/2022 17:32:02'!
test04PortfolioDetailedReportWithAnEmptyPortfolio
	
	| portfolio portfolioTreeDetailedReport tree innerPortfolio |
	
	portfolio := Portfolio named: 'Portfolio de la familia'.
	innerPortfolio := Portfolio named: 'Portfolio de hijos'.
	portfolio add: innerPortfolio.

	portfolioTreeDetailedReport := PortfolioDetailedTreeReport of: portfolio.
	portfolioTreeDetailedReport createReport.

	tree := OrderedCollection with: 'Portfolio de la familia' with: (OrderedCollection with: 'Portfolio de hijos' with: 'Balance = 0 * pesos') with: 'Balance = 0 * pesos'.
	
	self assert: tree equals: portfolioTreeDetailedReport portfolioTreeDetailedReport.
	
	! !

!Test07PortfolioDetailedTreeStructureReport methodsFor: 'tests' stamp: 'AGH 11/18/2022 17:34:13'!
test05PortfolioDetailedReportWithAnAccountAndEmptyPortfolio
	
	| familyPortfolio portfolioTreeDetailedReport tree childrenPortfolio myAccount summaryReport |
	
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	Withdraw register: (50*peso) on: myAccount.
	
	childrenPortfolio := Portfolio named: 'Portfolio de hijos'.	
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.

	portfolioTreeDetailedReport := PortfolioDetailedTreeReport of: familyPortfolio.
	portfolioTreeDetailedReport createReport.
	
	summaryReport := SummaryReport of: myAccount.
	summaryReport createReport .
	  
	tree := OrderedCollection with: 'Portfolio de la familia' with: 'Cuenta mia' with: (summaryReport summaryReport) with: (OrderedCollection with: 'Portfolio de hijos' with: 'Balance = 0 * pesos') with: 'Balance = -50 * pesos'.
	
	self assert: tree equals: portfolioTreeDetailedReport portfolioTreeDetailedReport.
	
	! !

!Test07PortfolioDetailedTreeStructureReport methodsFor: 'tests' stamp: 'lvg 11/18/2022 14:51:50'!
test06PortfolioDetailedReportWithAnAccountAndAPortfolioWithAccounts
	
	| familyPortfolio portfolioTreeDetailedReport tree childrenPortfolio myAccount summaryReport johnsAccount angiesAccount angiesAccountSummaryReport johnsAccountSummaryReport |
	
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'. 
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'. 
	myAccount := ReceptiveAccount named: 'Cuenta mia'. 
	
	Deposit  register: (100*peso) on: myAccount. 
	Withdraw register: (50*peso) on: myAccount.
	
	Deposit  register: (100*peso) on: johnsAccount. 
	Withdraw register: (50*peso) on: johnsAccount.
	
	Deposit  register: (100*peso) on: angiesAccount. 
	Withdraw register: (50*peso) on: angiesAccount.

	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount. 
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.

	portfolioTreeDetailedReport := PortfolioDetailedTreeReport of: familyPortfolio.
	portfolioTreeDetailedReport createReport.
	
	summaryReport := SummaryReport of: myAccount.
	summaryReport createReport.
	
	johnsAccountSummaryReport := SummaryReport of: johnsAccount.
	johnsAccountSummaryReport createReport.

	angiesAccountSummaryReport := SummaryReport of: angiesAccount.
	angiesAccountSummaryReport createReport.
	 
	tree := OrderedCollection with: 'Portfolio de la familia' with:  'Cuenta mia' with: (summaryReport summaryReport ) with:  (OrderedCollection with: 'Portfolio de hijos' with: 'Cuenta de Juan' with: (johnsAccountSummaryReport summaryReport) with: 'Cuenta de Angeles' with: (angiesAccountSummaryReport summaryReport )  with:  'Balance = 100 * pesos') with: 'Balance = 150 * pesos'.
	
	self assert: tree equals: portfolioTreeDetailedReport portfolioTreeDetailedReport.
	
	! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!Account methodsFor: 'visitor' stamp: 'AGH 11/18/2022 12:18:01'!
visitAccountFromPortfolioReport: aVisitor
	
	self subclassResponsibility.! !

!Account methodsFor: 'visitor' stamp: 'AGH 11/18/2022 12:17:47'!
visitAccountFromReport: aVisitor
 
	(self transactions) do: [:actualTransaction | aVisitor operateTransaction: actualTransaction].! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents portfolioName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'AGH 11/18/2022 11:22:20'!
initializeNamed: aPortfolioName 
	
	portfolioName := aPortfolioName.
	accounts := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'AGH 11/18/2022 11:21:53'!
initializeNamed: aPortfolioName with: anAccount 

	portfolioName := aPortfolioName.
	accounts := OrderedCollection with: anAccount.! !

!Portfolio methodsFor: 'initialization' stamp: 'lvg 11/18/2022 14:28:22'!
initializeNamed: anAccountNamed with: anAccount with: anotherAccount 

	portfolioName := anAccountNamed.
	accounts := OrderedCollection with: anAccount with: anotherAccount.! !


!Portfolio methodsFor: 'main protocol' stamp: 'lvg 11/11/2022 20:17:23'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0*peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'accesing' stamp: 'AGH 11/17/2022 16:29:13'!
accounts
	
	^accounts! !

!Portfolio methodsFor: 'accesing' stamp: 'AGH 11/17/2022 16:13:35'!
portfolioName
	^ portfolioName.! !


!Portfolio methodsFor: 'visitor' stamp: 'AGH 11/18/2022 12:18:01'!
visitAccountFromPortfolioReport: aVisitor
	
	aVisitor portfolioVisited: self.! !

!Portfolio methodsFor: 'visitor' stamp: 'AGH 11/18/2022 12:18:01'!
visitPortfolio: aVisitor

	accounts do: [:actualAccount | actualAccount visitAccountFromPortfolioReport: aVisitor].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!Portfolio class methodsFor: 'instance creation' stamp: 'AGH 11/17/2022 16:05:01'!
named: aPortfolioName 

	^self new initializeNamed: aPortfolioName. ! !

!Portfolio class methodsFor: 'instance creation' stamp: 'AGH 11/17/2022 16:20:12'!
named: aPortfolioName with: anAccount 

	^self new initializeNamed: aPortfolioName with: anAccount ! !

!Portfolio class methodsFor: 'instance creation' stamp: 'lvg 11/18/2022 14:24:38'!
named: anAccountNamed with: anAccount with: anotherAccount 

	^self new initializeNamed: anAccountNamed with: anAccount with: anotherAccount.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions accountName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'AGH 11/17/2022 16:19:39'!
initializeNamed: anAccountName 
	
	accountName := anAccountName.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'lvg 11/11/2022 20:16:23'!
balance

	^transactions 
		inject: 0*peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
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


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'accesing' stamp: 'AGH 11/17/2022 16:21:45'!
accountName

	^accountName.! !


!ReceptiveAccount methodsFor: 'visitor' stamp: 'AGH 11/18/2022 12:18:01'!
visitAccountFromPortfolioReport: aVisitor
	
	aVisitor receptiveAccountVisited: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Solucion'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'instance creation' stamp: 'AGH 11/17/2022 16:19:29'!
named: anAccountName 

	^self new initializeNamed: anAccountName ! !


!classDefinition: #AccountReport category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountReport
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountReport methodsFor: 'transactions - visitor' stamp: 'AGH 11/17/2022 15:01:26'!
depositLegVisited: aDepositLeg

	self subclassResponsibility ! !

!AccountReport methodsFor: 'transactions - visitor' stamp: 'AGH 11/17/2022 15:01:39'!
depositVisited: aDepositLeg

	self subclassResponsibility ! !

!AccountReport methodsFor: 'transactions - visitor' stamp: 'AGH 11/17/2022 15:01:32'!
withdrawLegVisited: aDepositLeg

	self subclassResponsibility ! !

!AccountReport methodsFor: 'transactions - visitor' stamp: 'AGH 11/17/2022 15:01:35'!
withdrawVisited: aDepositLeg

	self subclassResponsibility ! !


!AccountReport methodsFor: 'private' stamp: 'AGH 11/17/2022 15:57:43'!
createReport

	self subclassResponsibility.! !

!AccountReport methodsFor: 'private' stamp: 'AGH 11/17/2022 15:01:57'!
operateTransaction: actualTransaction

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountReport class' category: 'ServiciosFinancieros-Solucion'!
AccountReport class
	instanceVariableNames: ''!

!AccountReport class methodsFor: 'as yet unclassified' stamp: 'lvg 11/14/2022 19:04:59'!
of: anAccount

	^self new of: anAccount.! !


!classDefinition: #PortfolioDetailedTreeReport category: 'ServiciosFinancieros-Solucion'!
AccountReport subclass: #PortfolioDetailedTreeReport
	instanceVariableNames: 'portfolio treeStructureDetailed identation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioDetailedTreeReport methodsFor: 'initialization' stamp: 'AGH 11/18/2022 17:22:13'!
initializeOf: aPortfolio 

	portfolio := aPortfolio.
	treeStructureDetailed := OrderedCollection new.
! !


!PortfolioDetailedTreeReport methodsFor: 'report' stamp: 'AGH 11/18/2022 17:22:04'!
createReport

	treeStructureDetailed add: (portfolio portfolioName).
	portfolio visitPortfolio: self.
	treeStructureDetailed add: ('Balance = ', (portfolio balance) asString).	
! !

!PortfolioDetailedTreeReport methodsFor: 'report' stamp: 'lvg 11/18/2022 13:29:19'!
portfolioTreeDetailedReport

	^treeStructureDetailed.! !


!PortfolioDetailedTreeReport methodsFor: 'account - visitor' stamp: 'AGH 11/18/2022 17:22:24'!
portfolioVisited: aPortfolio 

	
	| innerReport |
	innerReport := (PortfolioDetailedTreeReport of: aPortfolio) createReport.
	treeStructureDetailed add: (innerReport portfolioTreeDetailedReport).
! !

!PortfolioDetailedTreeReport methodsFor: 'account - visitor' stamp: 'AGH 11/18/2022 17:22:51'!
receptiveAccountVisited: aReceptiveAccount 

	| summaryReport |
	
	treeStructureDetailed add: (aReceptiveAccount accountName).
	
	summaryReport := SummaryReport of: aReceptiveAccount.
	summaryReport createReport.
	
	treeStructureDetailed  add: (	summaryReport summaryReport).
	
	! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioDetailedTreeReport class' category: 'ServiciosFinancieros-Solucion'!
PortfolioDetailedTreeReport class
	instanceVariableNames: ''!

!PortfolioDetailedTreeReport class methodsFor: 'instance creation' stamp: 'lvg 11/18/2022 12:45:54'!
of: aPortfolio 

	^self new initializeOf: aPortfolio ! !

!PortfolioDetailedTreeReport class methodsFor: 'instance creation' stamp: 'lvg 11/18/2022 16:48:59'!
of: aPortfolio with: aIndentation

	^self new initializeOf: aPortfolio with: aIndentation.! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Solucion'!
AccountReport subclass: #PortfolioTreePrinter
	instanceVariableNames: 'portfolio treeStructure identation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinter methodsFor: 'report' stamp: 'lvg 11/18/2022 16:32:41'!
createReport

	treeStructure add: ( self indent, (portfolio portfolioName)).
	identation := identation +1.
	portfolio visitPortfolio: self.! !

!PortfolioTreePrinter methodsFor: 'report' stamp: 'AGH 11/18/2022 11:59:42'!
portfolioTreeReport

	^ treeStructure.! !


!PortfolioTreePrinter methodsFor: 'initialization' stamp: 'lvg 11/18/2022 16:30:16'!
initializeOf: aPortfolio

	portfolio := aPortfolio.
	treeStructure := OrderedCollection new.
	identation :=  0.
! !

!PortfolioTreePrinter methodsFor: 'initialization' stamp: 'lvg 11/18/2022 16:23:06'!
initializeOf: aPortfolio with: indentation

	portfolio := aPortfolio.
	treeStructure := OrderedCollection new.
	identation := indentation.
! !


!PortfolioTreePrinter methodsFor: 'accounts - visitor' stamp: 'lvg 11/18/2022 16:29:18'!
indent
	
	| space |
	
	space := ''.
	
	1 to: identation do: [: a | space := (space , ' ')]. 
	
	^space.! !

!PortfolioTreePrinter methodsFor: 'accounts - visitor' stamp: 'lvg 11/18/2022 16:35:15'!
portfolioVisited: aPortfolio
	
	| innerReport |

	innerReport := (PortfolioTreePrinter of: aPortfolio with: identation ) createReport.
	
	treeStructure add: innerReport portfolioTreeReport.! !

!PortfolioTreePrinter methodsFor: 'accounts - visitor' stamp: 'lvg 11/18/2022 16:17:06'!
receptiveAccountVisited: aReceptiveAccount
	
	treeStructure add: (self indent , (aReceptiveAccount accountName)).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTreePrinter class' category: 'ServiciosFinancieros-Solucion'!
PortfolioTreePrinter class
	instanceVariableNames: ''!

!PortfolioTreePrinter class methodsFor: 'instance creation' stamp: 'AGH 11/17/2022 16:05:49'!
of: aPortfolio 

	^self new initializeOf: aPortfolio ! !

!PortfolioTreePrinter class methodsFor: 'instance creation' stamp: 'lvg 11/18/2022 16:26:09'!
of: aPortfolio with: aIndentation

	^self new initializeOf: aPortfolio with: aIndentation.! !


!classDefinition: #SummaryReport category: 'ServiciosFinancieros-Solucion'!
AccountReport subclass: #SummaryReport
	instanceVariableNames: 'summary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!SummaryReport methodsFor: 'initialization' stamp: 'AGH 11/18/2022 10:55:51'!
of: anAccount

	account := anAccount .
	summary := OrderedCollection new.! !


!SummaryReport methodsFor: 'private' stamp: 'AGH 11/17/2022 15:00:32'!
operateTransaction: actualTransaction
	
	summary add: (actualTransaction visitTransaction: self).! !


!SummaryReport methodsFor: 'transactions - visitor' stamp: 'AGH 11/17/2022 14:46:16'!
depositLegVisited: aDepositLeg
	
	^('Entrada por transferencia de ',(aDepositLeg value) asString)
! !

!SummaryReport methodsFor: 'transactions - visitor' stamp: 'AGH 11/17/2022 14:45:24'!
depositVisited: aDeposit
	
	^ ('Depósito por ' , (aDeposit value) asString).! !

!SummaryReport methodsFor: 'transactions - visitor' stamp: 'AGH 11/17/2022 14:46:36'!
withdrawLegVisited: aWithdrawLeg
	
	^('Salida por transferencia de ',(aWithdrawLeg value) asString)
! !

!SummaryReport methodsFor: 'transactions - visitor' stamp: 'AGH 11/17/2022 14:45:55'!
withdrawVisited: aWithdraw
	
	^ ('Extracción por ', (aWithdraw value) asString)! !


!SummaryReport methodsFor: 'report' stamp: 'AGH 11/18/2022 12:17:47'!
createReport

	account visitAccountFromReport: self.
	summary add: ('Balance = ', (account balance) asString).	! !

!SummaryReport methodsFor: 'report' stamp: 'AGH 11/17/2022 15:54:01'!
summaryReport
	
	^summary.! !


!classDefinition: #TransferNetReport category: 'ServiciosFinancieros-Solucion'!
AccountReport subclass: #TransferNetReport
	instanceVariableNames: 'transferNet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNetReport methodsFor: 'report' stamp: 'AGH 11/18/2022 12:17:47'!
createReport

	account visitAccountFromReport: self.
! !

!TransferNetReport methodsFor: 'report' stamp: 'AGH 11/17/2022 15:55:57'!
transferNetReport

	^transferNet.
! !


!TransferNetReport methodsFor: 'initialization' stamp: 'AGH 11/18/2022 10:55:56'!
of: anAccount

	account := anAccount.
	transferNet :=  0*peso.! !


!TransferNetReport methodsFor: 'private' stamp: 'AGH 11/17/2022 14:54:47'!
operateTransaction: actualTransaction
	
	transferNet := actualTransaction visitTransaction: self.! !


!TransferNetReport methodsFor: 'transactions - visitor' stamp: 'AGH 11/17/2022 14:47:41'!
depositLegVisited: aLeg
	
	^ aLeg affectBalance: transferNet.! !

!TransferNetReport methodsFor: 'transactions - visitor' stamp: 'AGH 11/17/2022 14:49:04'!
depositVisited: aLeg
	
	^ transferNet.
! !

!TransferNetReport methodsFor: 'transactions - visitor' stamp: 'AGH 11/17/2022 14:50:05'!
withdrawLegVisited: aLeg
	
	^ aLeg affectBalance: transferNet.! !

!TransferNetReport methodsFor: 'transactions - visitor' stamp: 'AGH 11/17/2022 14:49:58'!
withdrawVisited: aLeg
	
	^ transferNet.
! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'AGH 11/15/2022 21:08:29'!
transferenceNetValue: transferenceNetAmount.

	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'AGH 11/17/2022 14:54:47'!
visitTransaction: anAccountReport

	self subclassResponsibility.! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'AGH 11/17/2022 14:54:47'!
visitTransaction: anAccountReport

	^ anAccountReport depositVisited: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'as yet unclassified' stamp: 'AGH 11/17/2022 14:54:47'!
visitTransaction: anAccountReport
	
	^ anAccountReport depositLegVisited: self.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'as yet unclassified' stamp: 'AGH 11/17/2022 14:54:47'!
visitTransaction: anAccountSumary
	 
	^ anAccountSumary withdrawLegVisited: self.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'AGH 11/17/2022 14:54:47'!
visitTransaction: anAccountReport

	^ anAccountReport withdrawVisited: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
