!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:39:57'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:10'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:22'!
test07EnteroDividesEnteroCorrectly

	self assert: one equals: two / two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:57'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:20'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:34'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: fiveHalfs equals: oneHalf / oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:58'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: (Entero with: 6) / (Entero with: 5) equals: one + oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:42:29'!
test12FraccionAddsEnteroCorrectly

	self assert: (Entero with: 6) / (Entero with: 5) equals: oneFifth + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:16'!
test13EnteroMultipliesFraccionCorrectly

	self assert: twoFifth equals: two * oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:27'!
test14FraccionMultipliesEnteroCorrectly

	self assert: twoFifth equals: oneFifth * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:40'!
test15EnteroDividesFraccionCorrectly

	self assert: fiveHalfs equals: one / twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:58'!
test16FraccionDividesEnteroCorrectly

	self assert: twoTwentyfifth equals: twoFifth / five! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:44:53'!
test19AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:13'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (two/five) * (five/two)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:27'!
test21DividingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf / oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:40'!
test22DividingEnterosCanReturnAFraccion

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:17'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:32'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:21'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two equals: three - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:36'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: oneFifth equals: twoFifth - oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:50'!
test29EnteroSubstractsFraccionCorrectly

	self assert: oneHalf equals: one - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:11'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: oneFifth equals: sixFifth - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:25'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: one equals: threeHalfs - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:44'!
test32SubstractingSameEnterosReturnsZero

	self assert: zero equals: one - one! !

!NumeroTest methodsFor: 'tests' stamp: 'AGH 10/2/2022 21:42:22'!
test33SubstractingSameFraccionesReturnsZero

	self assert: zero equals: oneHalf - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:16'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: negativeThreeHalfs equals: one - fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:45'!
test35FibonacciZeroIsOne

	self assert: one equals: zero fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:58'!
test36FibonacciOneIsOne

	self assert: one equals: one fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:24'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: five equals: four fibonacci.
	self assert: three equals: three fibonacci. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:40'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:17'!
test39NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated
		! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:53:27'!
test40NegationOfFraccionIsCorrect

	self assert: negativeOne / two equals: oneHalf negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'AGH 10/1/2022 12:26:52'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo).! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de Número Inválido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'AGH 10/2/2022 18:54:38'!
* multiplicand  

	^ multiplicand  multiplyToTheInteger: self.

	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'AGH 10/2/2022 18:54:51'!
+ addend  

	^ addend addToTheInteger: self.
	

	
	
	

	
	  
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'AGH 10/2/2022 18:42:31'!
- aSubtrahend 
	
	^ aSubtrahend substractFromTheInteger: self.
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'AGH 10/2/2022 18:45:38'!
/ aDivisor 

	^ aDivisor divideFromTheInteger: self.
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'AGH 10/2/2022 18:45:59'!
fibonacci
	
	^ self calculateFibonacci.! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'JS 5/5/2022 03:55:37'!
initializeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'AGH 10/1/2022 13:17:37'!
isNegative
	
	^self integerValue < 0! !

!Entero methodsFor: 'testing' stamp: 'AGH 10/1/2022 13:17:28'!
isOne
	
	^self integerValue = 1! !

!Entero methodsFor: 'testing' stamp: 'AGH 10/1/2022 13:17:22'!
isZero
	
	^self integerValue = 0! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'AGH 10/1/2022 13:14:01'!
// aDivisor 
	
	^self class with: self integerValue // aDivisor integerValue.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'AGH 10/1/2022 13:14:19'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (self integerValue gcd: anEntero integerValue)! !


!Entero methodsFor: 'double dispatch' stamp: 'AGH 10/2/2022 18:54:06'!
addToTheFraction: anAugend

	^ (self * anAugend denominator) + anAugend numerator / anAugend denominator. ! !

!Entero methodsFor: 'double dispatch' stamp: 'AGH 10/2/2022 18:54:12'!
addToTheInteger: anAugend
	
	^ self class with: self integerValue + anAugend integerValue.! !

!Entero methodsFor: 'double dispatch' stamp: 'AGH 10/2/2022 18:45:59'!
calculateFibonacci
	
	self subclassResponsibility.! !

!Entero methodsFor: 'double dispatch' stamp: 'AGH 10/2/2022 18:55:27'!
divideFromTheFraction: aDividend

	^ aDividend numerator / (aDividend denominator * self).! !

!Entero methodsFor: 'double dispatch' stamp: 'AGH 10/2/2022 18:55:39'!
divideFromTheInteger: aDividend

	^ Fraccion with: aDividend over: self.! !

!Entero methodsFor: 'double dispatch' stamp: 'AGH 10/2/2022 18:41:28'!
multiplyToTheFraction: aMultiplier

	^ aMultiplier numerator * self / aMultiplier denominator.
! !

!Entero methodsFor: 'double dispatch' stamp: 'AGH 10/2/2022 18:41:43'!
multiplyToTheInteger: aMultiplier

	^ self class with: self integerValue * aMultiplier integerValue.! !

!Entero methodsFor: 'double dispatch' stamp: 'AGH 10/2/2022 18:56:09'!
substractFromTheFraction: aMinuend  

	^ aMinuend numerator - (aMinuend denominator * self) / aMinuend denominator. 

! !

!Entero methodsFor: 'double dispatch' stamp: 'AGH 10/2/2022 18:56:14'!
substractFromTheInteger: aMinuend

	^ self class with: aMinuend integerValue - self integerValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'AGH 10/2/2022 18:47:36'!
assignSubclassWith: valor
	
	self subclassResponsibility.! !

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'AGH 10/2/2022 18:47:37'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [ self error: 'aValue debe ser anInteger' ].
	
	Entero subclasses do: [:EnteroSubclasses |
					(EnteroSubclasses assignSubclassWith: aValue)
					ifTrue: [^ EnteroSubclasses new initializeWith: aValue]
					].! !


!classDefinition: #EnteroCero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroCero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroCero methodsFor: 'double dispatch' stamp: 'AGH 10/2/2022 18:45:59'!
calculateFibonacci

	^ EnteroUno with: 1.! !


!EnteroCero methodsFor: 'verifyValidNumerator&Denominator' stamp: 'lvg 10/4/2022 15:05:48'!
denominatorIsAnIntegerOneWith: numerator and: denominator.
		
	^ Fraccion new initializeWith: numerator over: denominator! !

!EnteroCero methodsFor: 'verifyValidNumerator&Denominator' stamp: 'lvg 10/4/2022 15:06:03'!
denominatorIsAnIntegerZeroWith: numerator and: denominator

	^ Fraccion error: Fraccion canNotDivideByZeroErrorDescription
	! !

!EnteroCero methodsFor: 'verifyValidNumerator&Denominator' stamp: 'lvg 10/4/2022 15:07:20'!
divisorIsANegativeIntegerWith: aNumerator and: aDenominator

	| denominator greatestCommonDivisor numerator |
	
	greatestCommonDivisor := aNumerator greatestCommonDivisorWith: aDenominator. 
	numerator := aNumerator // greatestCommonDivisor.
	denominator := aDenominator // greatestCommonDivisor.
	
	^ denominator denominatorIsAnIntegerOneWith: numerator and: denominator.! !

!EnteroCero methodsFor: 'verifyValidNumerator&Denominator' stamp: 'lvg 10/4/2022 15:07:35'!
numeratorIsAnIntegerZeroWith: numerator and: denominator
	
	^ numerator.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroCero class' category: 'Numeros-Parte2-Ejercicio'!
EnteroCero class
	instanceVariableNames: ''!

!EnteroCero class methodsFor: 'as yet unclassified' stamp: 'AGH 10/2/2022 18:47:36'!
assignSubclassWith: valorAsignado

	^ valorAsignado = 0.! !


!classDefinition: #EnteroNegativo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroNegativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroNegativo methodsFor: 'double dispatch' stamp: 'AGH 10/2/2022 18:45:59'!
calculateFibonacci

	^ self error: Entero negativeFibonacciErrorDescription.! !


!EnteroNegativo methodsFor: 'verifyValidNumerator&Denominator' stamp: 'lvg 10/4/2022 15:07:58'!
denominatorIsAnIntegerOneWith: numerator and: denominator.

	^ Fraccion new initializeWith: numerator over: denominator! !

!EnteroNegativo methodsFor: 'verifyValidNumerator&Denominator' stamp: 'lvg 10/4/2022 15:08:15'!
denominatorIsAnIntegerZeroWith: numerator and: denominator

	^ numerator numeratorIsAnIntegerZeroWith: numerator and: denominator.! !

!EnteroNegativo methodsFor: 'verifyValidNumerator&Denominator' stamp: 'lvg 10/2/2022 22:36:23'!
divisorIsANegativeIntegerWith: numerador and: denominador
	
	^ numerador negated / denominador negated! !

!EnteroNegativo methodsFor: 'verifyValidNumerator&Denominator' stamp: 'lvg 10/4/2022 15:08:30'!
numeratorIsAnIntegerZeroWith: numerator and: denominator

	^ denominator divisorIsANegativeIntegerWith: numerator and: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroNegativo class' category: 'Numeros-Parte2-Ejercicio'!
EnteroNegativo class
	instanceVariableNames: ''!

!EnteroNegativo class methodsFor: 'as yet unclassified' stamp: 'AGH 10/2/2022 18:47:36'!
assignSubclassWith: valorAsignado

	^ valorAsignado < 0.! !


!classDefinition: #EnteroPositivo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroPositivo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroPositivo methodsFor: 'double dispatch' stamp: 'AGH 10/2/2022 18:45:59'!
calculateFibonacci

	|primero segundo|
	
	primero := (self - (Entero with: 1)).
	segundo := (self - (Entero with: 2)).
	
	^ primero fibonacci + segundo fibonacci.! !


!EnteroPositivo methodsFor: 'verifyValidNumerator&Denominator' stamp: 'lvg 10/4/2022 15:08:55'!
denominatorIsAnIntegerOneWith: numerator and: denominator.
	
	^ Fraccion new initializeWith: numerator over: denominator! !

!EnteroPositivo methodsFor: 'verifyValidNumerator&Denominator' stamp: 'lvg 10/4/2022 15:09:13'!
denominatorIsAnIntegerZeroWith: numerator and: denominator

	^ numerator numeratorIsAnIntegerZeroWith: numerator and: denominator.! !

!EnteroPositivo methodsFor: 'verifyValidNumerator&Denominator' stamp: 'lvg 10/4/2022 15:09:44'!
divisorIsANegativeIntegerWith: aNumerator and: aDenominator

	| denominator greatestCommonDivisor numerator |
	
	greatestCommonDivisor := aNumerator greatestCommonDivisorWith: aDenominator. 
	numerator := aNumerator // greatestCommonDivisor.
	denominator := aDenominator // greatestCommonDivisor.
	
	^ denominator denominatorIsAnIntegerOneWith: numerator and: denominator.! !

!EnteroPositivo methodsFor: 'verifyValidNumerator&Denominator' stamp: 'lvg 10/4/2022 15:10:03'!
numeratorIsAnIntegerZeroWith: numerator and: denominator

	^ denominator divisorIsANegativeIntegerWith: numerator and: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroPositivo class' category: 'Numeros-Parte2-Ejercicio'!
EnteroPositivo class
	instanceVariableNames: ''!

!EnteroPositivo class methodsFor: 'as yet unclassified' stamp: 'AGH 10/2/2022 18:47:36'!
assignSubclassWith: valor
	
	^ valor > 1.! !


!classDefinition: #EnteroUno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroUno methodsFor: 'double dispatch' stamp: 'AGH 10/2/2022 18:45:59'!
calculateFibonacci
	^ EnteroUno with: 1! !


!EnteroUno methodsFor: 'verifyValidNumerator&Denominator' stamp: 'lvg 10/4/2022 15:10:12'!
denominatorIsAnIntegerOneWith: numerator and: denominator.

	^ numerator.! !

!EnteroUno methodsFor: 'verifyValidNumerator&Denominator' stamp: 'lvg 10/4/2022 15:10:27'!
denominatorIsAnIntegerZeroWith: numerator and: denominator

	^ numerator numeratorIsAnIntegerZeroWith: numerator and: denominator.! !

!EnteroUno methodsFor: 'verifyValidNumerator&Denominator' stamp: 'lvg 10/4/2022 15:11:02'!
divisorIsANegativeIntegerWith: aNumerator and: aDenominator

	| denominator greatestCommonDivisor numerator |
	
	greatestCommonDivisor := aNumerator greatestCommonDivisorWith: aDenominator. 
	numerator := aNumerator // greatestCommonDivisor.
	denominator := aDenominator // greatestCommonDivisor.
	
	^ denominator denominatorIsAnIntegerOneWith: numerator and: denominator.! !

!EnteroUno methodsFor: 'verifyValidNumerator&Denominator' stamp: 'lvg 10/4/2022 15:11:20'!
numeratorIsAnIntegerZeroWith: numerator and: denominator
	
	^ denominator divisorIsANegativeIntegerWith: numerator and: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroUno class' category: 'Numeros-Parte2-Ejercicio'!
EnteroUno class
	instanceVariableNames: ''!

!EnteroUno class methodsFor: 'as yet unclassified' stamp: 'AGH 10/2/2022 18:47:37'!
assignSubclassWith: valorAsignado

	^ valorAsignado = 1.! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'AGH 10/2/2022 18:41:29'!
* aMultiplier 

	^aMultiplier multiplyToTheFraction: self.

	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'AGH 10/2/2022 18:43:16'!
+ anAdder 

	^anAdder addToTheFraction: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'AGH 10/2/2022 18:42:46'!
- aSubtrahend 

	^aSubtrahend  substractFromTheFraction: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'AGH 10/2/2022 18:45:25'!
/ aDivisor 
	
	^aDivisor divideFromTheFraction: self.! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'double dispatch' stamp: 'AGH 10/2/2022 18:43:16'!
addToTheFraction: anAdder

	|newNumerator newDenominator|
	
	newNumerator := self numerator * anAdder denominator + (self denominator * anAdder numerator).
	newDenominator := self denominator * anAdder denominator.
	
	^ newNumerator / newDenominator.
! !

!Fraccion methodsFor: 'double dispatch' stamp: 'AGH 10/2/2022 18:43:30'!
addToTheInteger: anAdder

	^ self denominator * anAdder + self numerator / self denominator .! !

!Fraccion methodsFor: 'double dispatch' stamp: 'AGH 10/2/2022 18:45:24'!
divideFromTheFraction: aDivisor

	^ self denominator * aDivisor numerator / (self numerator * aDivisor denominator).! !

!Fraccion methodsFor: 'double dispatch' stamp: 'AGH 10/2/2022 18:45:38'!
divideFromTheInteger: aDivisor

	^ aDivisor * self denominator / self numerator.! !

!Fraccion methodsFor: 'double dispatch' stamp: 'AGH 10/2/2022 18:41:29'!
multiplyToTheFraction: aMultiplier

	^ self numerator * aMultiplier numerator / (self denominator * aMultiplier denominator).! !

!Fraccion methodsFor: 'double dispatch' stamp: 'AGH 10/2/2022 18:41:43'!
multiplyToTheInteger: aMultiplier

	^ aMultiplier * self numerator / self denominator.! !

!Fraccion methodsFor: 'double dispatch' stamp: 'AGH 10/2/2022 18:42:46'!
substractFromTheFraction: aSubtrahend

	| newNumerator newDenominator |

	newNumerator := self denominator * aSubtrahend numerator - (self numerator * aSubtrahend denominator) .
	newDenominator := self denominator * aSubtrahend denominator.
	
	^ newNumerator / newDenominator.
! !

!Fraccion methodsFor: 'double dispatch' stamp: 'AGH 10/2/2022 18:42:31'!
substractFromTheInteger: aSubtrahend

	^ aSubtrahend * self denominator - self numerator / self denominator.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'lvg 10/4/2022 14:07:23'!
with: aDividend over: aDivisor

	^ aDivisor denominatorIsAnIntegerZeroWith: aDividend and: aDivisor
	! !
