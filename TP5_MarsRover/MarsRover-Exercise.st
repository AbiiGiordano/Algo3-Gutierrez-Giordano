!classDefinition: #MarsRoverTest category: 'MarsRover-Exercise'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 19:33:50'!
test01

	| coordinates driveString direction marsRover |
	
	coordinates := (0@0).
	direction := 'N'.
	marsRover := MarsRover withACoordinate: coordinates andADirection: direction .
	
	driveString := ''.
	marsRover operate: driveString.
 

	self assert: (marsRover coordinateEquals: (0@0)).
	self assert: (marsRover cardinalDirectionEquals: 'N')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 19:33:50'!
test02

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.

	driveString := 'F'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@1)).
	self assert: (marsRover cardinalDirectionEquals: 'N')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 19:33:50'!
test03

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.
	
	driveString := 'p'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@0)).
	self assert: (marsRover cardinalDirectionEquals: 'N')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 19:33:50'!
test04

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.

	driveString := 'L'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@0)).
	self assert: (marsRover cardinalDirectionEquals: 'W')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 19:33:50'!
test05

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.

	driveString := 'R'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@0)).
	self assert: (marsRover cardinalDirectionEquals: 'E')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 19:33:50'!
test06

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.

	driveString := 'F'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@1)).
	self assert: (marsRover cardinalDirectionEquals: 'N')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 19:33:50'!
test07

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.
	
	driveString := 'FFFFBR'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@3)).
	self assert: (marsRover cardinalDirectionEquals: 'E')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 19:33:50'!
test08

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.
	
	driveString := 'LLLL'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@0)).
	self assert: (marsRover cardinalDirectionEquals: 'N')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 19:33:50'!
test09

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.

	driveString := 'LFFFBBB'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@0)).
	self assert: (marsRover cardinalDirectionEquals: 'W')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 19:33:50'!
test10

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.

	driveString := 'FRF'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (1@1)).
	self assert: (marsRover cardinalDirectionEquals: 'E')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 19:33:50'!
test11

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.
	
	driveString := 'BBFFFFRR'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@2)).
	self assert: (marsRover cardinalDirectionEquals: 'S')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 19:33:50'!
test12

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.

	driveString := 'LBBFFFF'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (-2@0)).
	self assert: (marsRover cardinalDirectionEquals: 'W')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 19:33:50'!
test13

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.
	
	driveString := 'RBBBFFF'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@0)).
	self assert: (marsRover cardinalDirectionEquals: 'E')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 19:33:50'!
test14

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.
	
	driveString := 'RRB'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@1)).
	self assert: (marsRover cardinalDirectionEquals: 'S')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 19:33:50'!
test15

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'S'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.
	
	driveString := 'BRRRR'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@1)).
	self assert: (marsRover cardinalDirectionEquals: 'S')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 19:33:50'!
test16

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'S'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.
	
	driveString := 'F'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@-1)).
	self assert: (marsRover cardinalDirectionEquals: 'S')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 19:33:50'!
test17

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'E'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.
	
	driveString := 'FLLLL'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (1@0)).
	self assert: (marsRover cardinalDirectionEquals: 'E')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 19:33:50'!
test18

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'E'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.
	
	driveString := 'LLF'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (-1@0)).
	self assert: (marsRover cardinalDirectionEquals: 'W')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 19:33:50'!
test19

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'W'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.
	
	driveString := 'LLLLBRFRRR'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (1@1)).
	self assert: (marsRover cardinalDirectionEquals: 'W')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 19:44:29'!
test20

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'W'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.
	
	driveString := 'LFFFF'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@-4)).
	self assert: (marsRover cardinalDirectionEquals: 'S')! !


!classDefinition: #MarsRover category: 'MarsRover-Exercise'!
Object subclass: #MarsRover
	instanceVariableNames: 'marsRoverCoordinates marsRoverCardinalDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRover methodsFor: 'navigation' stamp: 'lvg 10/30/2022 18:34:28'!
moveBackwards 
	
	( self cardinalDirection = 'N') ifTrue: [^marsRoverCoordinates := marsRoverCoordinates + (0@-1) ].
	( self cardinalDirection = 'S') ifTrue: [^ marsRoverCoordinates := marsRoverCoordinates + (0@1)].	
	( self cardinalDirection = 'E') ifTrue: [^ marsRoverCoordinates := marsRoverCoordinates + (-1@0)].
	( self cardinalDirection = 'W') ifTrue: [^ marsRoverCoordinates := marsRoverCoordinates + (1@0)].
	! !

!MarsRover methodsFor: 'navigation' stamp: 'lvg 10/30/2022 19:32:31'!
moveForwards
	
	(self cardinalDirection = 'N') ifTrue: [^ marsRoverCoordinates := marsRoverCoordinates + (0@1)].
	(self cardinalDirection = 'S') ifTrue: [^ marsRoverCoordinates := marsRoverCoordinates + (0@-1)].	
	(self cardinalDirection = 'E') ifTrue: [^ marsRoverCoordinates := marsRoverCoordinates + (1@0)].
	(self cardinalDirection = 'W') ifTrue: [^ marsRoverCoordinates := marsRoverCoordinates + (-1@0)].
	! !

!MarsRover methodsFor: 'navigation' stamp: 'lvg 10/30/2022 18:34:09'!
operate: aStearString

	aStearString do: [: aStear | 
		
		(aStear = $B) ifTrue: [self moveBackwards].
		(aStear = $F) ifTrue: [self moveForwards ].
		(aStear = $R) ifTrue: [self turnRight].
		(aStear = $L) ifTrue: [self turnLeft].

		]  
! !

!MarsRover methodsFor: 'navigation' stamp: 'lvg 10/30/2022 18:25:54'!
turnLeft

	(self cardinalDirection = 'N') ifTrue: [^ marsRoverCardinalDirection := 'W'].
	(self cardinalDirection = 'S') ifTrue: [^ marsRoverCardinalDirection := 'E'].	
	(self cardinalDirection = 'E') ifTrue: [^ marsRoverCardinalDirection := 'N'].
	(self cardinalDirection = 'W') ifTrue: [^ marsRoverCardinalDirection := 'S'].! !

!MarsRover methodsFor: 'navigation' stamp: 'lvg 10/30/2022 18:25:34'!
turnRight

	(self cardinalDirection = 'N') ifTrue: [^ marsRoverCardinalDirection := 'E'].
	(self cardinalDirection = 'S') ifTrue: [^ marsRoverCardinalDirection := 'W'].	
	(self cardinalDirection = 'E') ifTrue: [^ marsRoverCardinalDirection := 'S'].
	(self cardinalDirection = 'W') ifTrue: [^ marsRoverCardinalDirection := 'N'].! !


!MarsRover methodsFor: 'initialization' stamp: 'lvg 10/30/2022 15:47:48'!
initializeWithDirection: aCardinalDirection andWith: aCoordinate

	marsRoverCoordinates :=  aCoordinate .
	marsRoverCardinalDirection := aCardinalDirection .	

! !


!MarsRover methodsFor: 'accesing' stamp: 'lvg 10/30/2022 16:11:45'!
cardinalDirection

	^marsRoverCardinalDirection .! !

!MarsRover methodsFor: 'accesing' stamp: 'lvg 10/30/2022 19:33:21'!
cardinalDirectionEquals: aCardinalDirection

	^ marsRoverCardinalDirection  = aCardinalDirection.! !

!MarsRover methodsFor: 'accesing' stamp: 'lvg 10/30/2022 19:33:50'!
coordinateEquals: aCoordinate

	^ marsRoverCoordinates = aCoordinate .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Exercise'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'lvg 10/30/2022 18:53:53'!
withACoordinate: aCoordinate andADirection: aDirection.
	
	^self  new initializeWithDirection: aDirection andWith: aCoordinate.
	! !
