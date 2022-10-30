!classDefinition: #MarsRoverTest category: 'MarsRover-Exercise'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/29/2022 12:44:19'!
test01

	| marsRoverCoordenates marsRoverDirection |
	marsRoverCoordenates := (0@0).
	marsRoverDirection := $E.

	self assert: 		marsRoverCoordenates = (0@0).
	self assert: 		marsRoverDirection = $E.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/29/2022 13:47:53'!
test02

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	marsRoverCoordinates := (0@0).
	marsRoverDirection := $F.
	marsRover := MarsRover new.
	driveString := ''.
	
	
	self assert: driveString isEmpty.
	self deny: 		marsRoverCoordinates = (1@0).
	self deny: (marsRover isItAValidDirection: marsRoverDirection).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/29/2022 16:51:48'!
test03

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	marsRoverCoordinates := (0@0).
	marsRoverDirection := $N.
	marsRover := MarsRover new.
	driveString := 'P'.
	marsRover navigationMode: driveString.
	
	self assert: (marsRoverCoordinates = (0@0)).
	self assert: (marsRoverDirection  = $N)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/29/2022 17:40:32'!
test04

	| marsRoverCoordinates driveString marsRoverDirection marsRover marsRoverFinalState|
	marsRoverCoordinates := (0@0).
	marsRoverDirection := $N.
	marsRover := MarsRover new.
	driveString := 'F'.
	marsRoverFinalState := marsRover navigationMode: driveString withDirection: marsRoverDirection andCoordanates: marsRoverCoordinates .
	
	self assert: (marsRoverFinalState = (0@1)).
	self assert: (marsRoverDirection  = $N)! !


!classDefinition: #MarsRover category: 'MarsRover-Exercise'!
Object subclass: #MarsRover
	instanceVariableNames: 'marsRover cardinalPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRover methodsFor: 'validation' stamp: 'lvg 10/29/2022 13:44:12'!
isItAValidDirection: aCardinalDirection
	| validDirections |
	validDirections := OrderedCollection newFrom: #($N $S $W $E).	
	
	^ validDirections includes: aCardinalDirection.! !


!MarsRover methodsFor: 'navigation' stamp: 'lvg 10/29/2022 17:38:35'!
moveForwardsFromA: aCoordinate withDirection: aCardinalDirection 

	(aCardinalDirection = $N) ifTrue: [^aCoordinate + (0@1)]! !

!MarsRover methodsFor: 'navigation' stamp: 'lvg 10/29/2022 17:04:33'!
navigationMode: aStearString

	aStearString do: [: aStear | 
		
		(aStear = $B) ifTrue: [^'Backwards'].
		(aStear = $F) ifTrue: [^ self moveForwards].
		(aStear = $R) ifTrue: [^'Right'].
		(aStear = $L) ifTrue: [^'Left'] ifFalse: [^self"self error: 'Caracter no soportado'"]

		]  ! !

!MarsRover methodsFor: 'navigation' stamp: 'lvg 10/29/2022 17:31:16'!
navigationMode: aStearString withDirection: aCardinalDirection andCoordanates: aCoordinate 

	
	aStearString do: [: aStear | 
		
		(aStear = $B) ifTrue: [^'Backwards'].
		(aStear = $F) ifTrue: [^ self moveForwardsFromA: aCoordinate withDirection: aCardinalDirection  ].
		(aStear = $R) ifTrue: [^'Right'].
		(aStear = $L) ifTrue: [^'Left'] ifFalse: [^self"self error: 'Caracter no soportado'"]

		]  ! !


!classDefinition: #MarsRoverCoordinates category: 'MarsRover-Exercise'!
Object subclass: #MarsRoverCoordinates
	instanceVariableNames: 'marsRover cardinalPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverCoordinates methodsFor: 'initialization' stamp: 'lvg 10/29/2022 12:29:47'!
initialize

	marsRover := Point new.
	cardinalPoint := 'N'! !

!MarsRoverCoordinates methodsFor: 'initialization' stamp: 'lvg 10/29/2022 12:25:51'!
initializeWith: aCardinalPoint

	marsRover := Point new.
	cardinalPoint := aCardinalPoint .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCoordinates class' category: 'MarsRover-Exercise'!
MarsRoverCoordinates class
	instanceVariableNames: ''!

!MarsRoverCoordinates class methodsFor: 'as yet unclassified' stamp: 'lvg 10/29/2022 12:28:06'!
newWith: aCardinalPoint

	^self new initializeWith: aCardinalPoint.! !
