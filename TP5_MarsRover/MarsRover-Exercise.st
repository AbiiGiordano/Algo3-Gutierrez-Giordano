!classDefinition: #MarsRoverTest category: 'MarsRover-Exercise'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/31/2022 12:18:00'!
test01EmptyCommandLIne

	| coordinates driveString direction marsRover |
	
	coordinates := (0@0).
	direction := 'N'.
	marsRover := MarsRover withACoordinate: coordinates andADirection: direction .
	
	driveString := ''.
	marsRover operate: driveString.
 

	self assert: (marsRover coordinateEquals: (0@0)).
	self assert: (marsRover cardinalDirectionEquals: 'N')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/31/2022 12:32:36'!
test02ReceivesOnlyOneCommandAndIsAbleToMoveForwards

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.

	driveString := 'F'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@1)).
	self assert: (marsRover cardinalDirectionEquals: 'N')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/31/2022 12:32:45'!
test03ReceivesWrongCommandDoNothing

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.
	
	driveString := 'p'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@0)).
	self assert: (marsRover cardinalDirectionEquals: 'N')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/31/2022 12:32:54'!
test04ReceivesOnlyOneCommandAndIsAbleToMoveToTheLeft

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.

	driveString := 'L'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@0)).
	self assert: (marsRover cardinalDirectionEquals: 'W')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/31/2022 12:33:07'!
test05ReceivesOnlyOneCommandAndChangesDirectionToTheRight

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.

	driveString := 'R'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@0)).
	self assert: (marsRover cardinalDirectionEquals: 'E')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/31/2022 12:33:19'!
test06ReceivesOnlyOneCommandAndIsAbleToMoveBackwards

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.

	driveString := 'B'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@-1)).
	self assert: (marsRover cardinalDirectionEquals: 'N')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/31/2022 12:33:33'!
test07ReceivesStringCommandAndIsAbleToMoveAndChangeDirection

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.
	
	driveString := 'FFFFBR'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@3)).
	self assert: (marsRover cardinalDirectionEquals: 'E')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/31/2022 12:33:48'!
test08ReceivesAStringStopsAtTheFirstWrongCommand

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.
	
	driveString := 'LLLLPF'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@0)).
	self assert: (marsRover cardinalDirectionEquals: 'N')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/31/2022 12:42:50'!
test09ChangesDirectionFromNorthToWestUsingLeftCommand

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.

	driveString := 'LFFFBBB'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@0)).
	self assert: (marsRover cardinalDirectionEquals: 'W')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/31/2022 13:15:21'!
test10ChangesDirectionFromWestToEastUsingLeftCommand

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'W'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.

	driveString := 'FBBLBFB'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (1@1)).
	self assert: (marsRover cardinalDirectionEquals: 'S')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/31/2022 13:15:44'!
test11ChangesDirectionFromSouthToEastUsingLeftCommand

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'S'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.
	
	driveString := 'BBFFBBLBF'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@2)).
	self assert: (marsRover cardinalDirectionEquals: 'E')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/31/2022 13:15:55'!
test12ChangesDirectionFromEastToNorthUsingLeftCommand

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'E'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.

	driveString := 'BFLBBFFFF'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@2)).
	self assert: (marsRover cardinalDirectionEquals: 'N')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/31/2022 13:16:11'!
test13ChangesDirectionFromNorthToEastUsingRightCommand

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.
	
	driveString := 'BFRBBBFFF'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@0)).
	self assert: (marsRover cardinalDirectionEquals: 'E')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/31/2022 13:16:35'!
test14ChangesDirectionFromEastToSouthUsingRightCommand

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'E'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.
	
	driveString := 'BFRBFB'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@1)).
	self assert: (marsRover cardinalDirectionEquals: 'S')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/31/2022 13:16:48'!
test15ChangesDirectionFromSouthToWestUsingRightCommand

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'S'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.
	
	driveString := 'BFBRBF'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@1)).
	self assert: (marsRover cardinalDirectionEquals: 'W')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/31/2022 13:17:04'!
test16ChangesDirectionFromWestToNorthByUsingRightCommand

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'W'.
	marsRover := MarsRover withACoordinate: marsRoverCoordinates andADirection: marsRoverDirection.
	
	driveString := 'BFRBFFBB'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinateEquals: (0@-1)).
	self assert: (marsRover cardinalDirectionEquals: 'N')! !


!classDefinition: #MarsRover category: 'MarsRover-Exercise'!
Object subclass: #MarsRover
	instanceVariableNames: 'marsRoverCoordinates marsRoverCardinalDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRover methodsFor: 'accesing' stamp: 'lvg 10/30/2022 16:11:45'!
cardinalDirection

	^marsRoverCardinalDirection .! !

!MarsRover methodsFor: 'accesing' stamp: 'lvg 10/30/2022 19:33:21'!
cardinalDirectionEquals: aCardinalDirection

	^ marsRoverCardinalDirection  = aCardinalDirection.! !

!MarsRover methodsFor: 'accesing' stamp: 'lvg 10/30/2022 19:33:50'!
coordinateEquals: aCoordinate

	^ marsRoverCoordinates = aCoordinate .! !


!MarsRover methodsFor: 'initialization' stamp: 'lvg 10/30/2022 15:47:48'!
initializeWithDirection: aCardinalDirection andWith: aCoordinate

	marsRoverCoordinates :=  aCoordinate .
	marsRoverCardinalDirection := aCardinalDirection .	

! !


!MarsRover methodsFor: 'navigation - private' stamp: 'lvg 10/30/2022 18:34:28'!
moveBackwards 
	
	( self cardinalDirection = 'N') ifTrue: [^marsRoverCoordinates := marsRoverCoordinates + (0@-1) ].
	( self cardinalDirection = 'S') ifTrue: [^ marsRoverCoordinates := marsRoverCoordinates + (0@1)].	
	( self cardinalDirection = 'E') ifTrue: [^ marsRoverCoordinates := marsRoverCoordinates + (-1@0)].
	( self cardinalDirection = 'W') ifTrue: [^ marsRoverCoordinates := marsRoverCoordinates + (1@0)].
	! !

!MarsRover methodsFor: 'navigation - private' stamp: 'lvg 10/30/2022 19:32:31'!
moveForwards
	
	(self cardinalDirection = 'N') ifTrue: [^ marsRoverCoordinates := marsRoverCoordinates + (0@1)].
	(self cardinalDirection = 'S') ifTrue: [^ marsRoverCoordinates := marsRoverCoordinates + (0@-1)].	
	(self cardinalDirection = 'E') ifTrue: [^ marsRoverCoordinates := marsRoverCoordinates + (1@0)].
	(self cardinalDirection = 'W') ifTrue: [^ marsRoverCoordinates := marsRoverCoordinates + (-1@0)].
	! !

!MarsRover methodsFor: 'navigation - private' stamp: 'lvg 10/31/2022 12:57:10'!
turnLeft

	(self cardinalDirection = 'N') ifTrue: [^ marsRoverCardinalDirection := 'W'].
	(self cardinalDirection = 'S') ifTrue: [^ marsRoverCardinalDirection := 'E'].	
	(self cardinalDirection = 'E') ifTrue: [^ marsRoverCardinalDirection := 'N'].
	(self cardinalDirection = 'W') ifTrue: [^ marsRoverCardinalDirection := 'S'].! !

!MarsRover methodsFor: 'navigation - private' stamp: 'lvg 10/31/2022 12:57:28'!
turnRight

	(self cardinalDirection = 'N') ifTrue: [^ marsRoverCardinalDirection := 'E'].
	(self cardinalDirection = 'S') ifTrue: [^ marsRoverCardinalDirection := 'W'].	
	(self cardinalDirection = 'E') ifTrue: [^ marsRoverCardinalDirection := 'S'].
	(self cardinalDirection = 'W') ifTrue: [^ marsRoverCardinalDirection := 'N'].! !


!MarsRover methodsFor: 'navigation - public' stamp: 'lvg 10/31/2022 17:26:47'!
operate: aStearString

	aStearString do: [: aStear | 
		(self isItAValidCommand: aStear) ifTrue: [
			(aStear = $B) ifTrue: [self moveBackwards].
			(aStear = $F) ifTrue: [self moveForwards ].
			(aStear = $R) ifTrue: [self turnRight].
			(aStear = $L) ifTrue: [self turnLeft].
		]ifFalse: [^self].
	]  
! !


!MarsRover methodsFor: 'validation - private' stamp: 'lvg 10/31/2022 17:29:17'!
isItAValidCommand: aCommand

	| validCommands |
	
	validCommands := OrderedCollection newFrom: #($F $B $L $R).	

	^ validCommands includes: aCommand.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Exercise'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'initialization' stamp: 'lvg 10/31/2022 17:25:18'!
withACoordinate: aCoordinate andADirection: aDirection.

	 (self isAValidDirection: aDirection) ifFalse: [ self error: 'aDirection must be N,S,E, or W' ].
	
	^self  new initializeWithDirection: aDirection andWith: aCoordinate.
	! !


!MarsRover class methodsFor: 'validation' stamp: 'lvg 10/31/2022 17:30:02'!
isAValidDirection: aCardinalDirection
 
	| validDirections |
	
	validDirections := OrderedCollection newFrom: #('N' 'S' 'E' 'W').	

	^ validDirections includes: aCardinalDirection.! !
