!classDefinition: #MarsRoverTest category: 'MarsRover-Exercise'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 11:50:24'!
test01EmptyCommandLIne

	| coordinates driveString direction marsRover |
	
	coordinates := (0@0).
	direction := 'N'.
	marsRover := MarsRover withACoordinate: coordinates andADirection: direction .
	
	driveString := ''.
	marsRover operate: driveString.
 

	self assert: (marsRover isCoordinateEquals: (0@0)).
	self assert: (marsRover isCardinalDirectionEquals: 'N')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 13:05:29'!
test02ReceivesOnlyOneCommandAndIsAbleToMoveForwards

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.

	driveString := 'F'.
	
	marsRoverExpectedCoordinates := 0@1.
	marsRoverExpectedDirection := 'N'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection 
		canDrive: driveString 
	 	endsUpIn: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 14:02:00'!
test03ReceivesWrongCommandDoNothing

	self 
		should: [ 
		| driveString marsRover |
		
		marsRover := MarsRover withACoordinate: (0@0) andADirection: 'N'.
		driveString := 'p'.
		marsRover operate: driveString . 
		]
		raise: Error
		withExceptionDo: [ :anError | self assert: MarsRover invalidCommandErrorDescription equals: anError messageText ]
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 12:43:50'!
test04ReceivesOnlyOneCommandAndIsAbleToMoveToTheLeft

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.

	driveString := 'L'.
	
	marsRoverExpectedCoordinates := 0@0.
	marsRoverExpectedDirection := 'W'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection
		canDrive: driveString 
		endsUpIn: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 12:44:29'!
test05ReceivesOnlyOneCommandAndChangesDirectionToTheRight

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.

	driveString := 'R'.
	
	marsRoverExpectedCoordinates := 0@0.
	marsRoverExpectedDirection := 'E'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection
		canDrive: driveString 
		endsUpIn: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 12:45:41'!
test06ReceivesOnlyOneCommandAndIsAbleToMoveBackwards

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.

	driveString := 'B'.
	
	marsRoverExpectedCoordinates := 0@-1.
	marsRoverExpectedDirection := 'N'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection
		canDrive: driveString 
		endsUpIn: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 12:50:47'!
test07ReceivesStringCommandAndIsAbleToMoveAndChangeDirection

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.

	driveString := 'FFFFBR'.
	
	marsRoverExpectedCoordinates := 0@3.
	marsRoverExpectedDirection := 'E'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection
		canDrive: driveString 
		endsUpIn: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 14:05:21'!
test08ReceivesAStringStopsAtTheFirstWrongCommand
	
	self 
		should: [ 
		| driveString marsRover |
		
		marsRover := MarsRover withACoordinate: (0@0) andADirection: 'N'.
		driveString := 'LLLLPF'.
		marsRover operate: driveString . 
		]
		raise: Error
		withExceptionDo: [ :anError | self assert: MarsRover invalidCommandErrorDescription equals: anError messageText ]
	
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 12:54:15'!
test09ChangesDirectionFromNorthToWestUsingLeftCommand

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.

	driveString := 'LFFFBBB'.
	
	marsRoverExpectedCoordinates := 0@0.
	marsRoverExpectedDirection := 'W'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection
		canDrive: driveString 
		endsUpIn: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 12:56:05'!
test10ChangesDirectionFromWestToSouthUsingLeftCommand

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'W'.

	driveString := 'FBBLFF'.
	
	marsRoverExpectedCoordinates := 1@-2.
	marsRoverExpectedDirection := 'S'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection
		canDrive: driveString 
		endsUpIn: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.
	
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 12:58:00'!
test11ChangesDirectionFromSouthToEastUsingLeftCommand

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'S'.

	driveString := 'BBFFBBLBFF'.
	
	marsRoverExpectedCoordinates := 1@2.
	marsRoverExpectedDirection := 'E'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection
		canDrive: driveString 
		endsUpIn: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.

	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 12:59:52'!
test12ChangesDirectionFromEastToNorthUsingLeftCommand

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'E'.

	driveString := 'BFLBBFFFF'.
	
	marsRoverExpectedCoordinates := 0@2.
	marsRoverExpectedDirection := 'N'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection
		canDrive: driveString 
		endsUpIn: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.

! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 13:00:31'!
test13ChangesDirectionFromNorthToEastUsingRightCommand

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.

	driveString := 'BFRBBBFFF'.
	
	marsRoverExpectedCoordinates := 0@0.
	marsRoverExpectedDirection := 'E'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection
		canDrive: driveString 
		endsUpIn: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.

	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 13:01:22'!
test14ChangesDirectionFromEastToSouthUsingRightCommand

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'E'.

	driveString := 'BFRBFB'.
	
	marsRoverExpectedCoordinates := 0@1.
	marsRoverExpectedDirection := 'S'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection
		canDrive: driveString 
		endsUpIn: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.

! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 13:02:23'!
test15ChangesDirectionFromSouthToWestUsingRightCommand

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'S'.

	driveString := 'BFBRBF'.
	
	marsRoverExpectedCoordinates := 0@1.
	marsRoverExpectedDirection := 'W'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection
		canDrive: driveString 
		endsUpIn: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.

	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 13:05:04'!
test16ChangesDirectionFromWestToNorthByUsingRightCommand

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'W'.

	driveString := 'BFRBFFBB'.
	
	marsRoverExpectedCoordinates := 0@-1.
	marsRoverExpectedDirection := 'N'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection
		canDrive: driveString 
		endsUpIn: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.
! !


!MarsRoverTest methodsFor: 'assert' stamp: 'lvg 11/2/2022 12:41:19'!
assertMarsRoverWithCoordinates: anInitialCoordinate andWithDirection: anInitialDirection canDrive: aDriveString  endsUpIn: aFinalCoordinate andWithADirection: aFinalDirection

	| marsRover |
	
	marsRover := MarsRover withACoordinate: anInitialCoordinate andADirection: anInitialDirection.

	marsRover operate: aDriveString .
	
	self assert: (marsRover isCoordinateEquals: aFinalCoordinate).
	self assert: (marsRover isCardinalDirectionEquals: aFinalDirection)! !


!classDefinition: #CardinalDirections category: 'MarsRover-Exercise'!
Object subclass: #CardinalDirections
	instanceVariableNames: 'cardinalDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!CardinalDirections methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:57:58'!
moveBackwards: aCoordinate
	
	self subclassResponsibility.! !

!CardinalDirections methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:58:52'!
moveForwards: aCoordinate
	
	self subclassResponsibility.! !

!CardinalDirections methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:15:28'!
turnLeft
	
	self subclassResponsibility.! !

!CardinalDirections methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:15:33'!
turnRight
	
	self subclassResponsibility.! !


!CardinalDirections methodsFor: 'initialization' stamp: 'lvg 11/1/2022 14:17:42'!
initializeWith: aCardinalDirection 
	
	cardinalDirection := aCardinalDirection ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CardinalDirections class' category: 'MarsRover-Exercise'!
CardinalDirections class
	instanceVariableNames: ''!

!CardinalDirections class methodsFor: 'instance creation' stamp: 'lvg 11/1/2022 13:49:11'!
assignSubclassWith: aCardinalDirection
	
	self subclassResponsibility.! !

!CardinalDirections class methodsFor: 'instance creation' stamp: 'lvg 11/1/2022 18:56:03'!
with: aCardinalDirection
	
	CardinalDirections subclasses do: [:MarsRoverSubclasses |
					(MarsRoverSubclasses assignSubclassWith: aCardinalDirection)
					ifTrue: [^ MarsRoverSubclasses new initializeWith: aCardinalDirection]
					].! !


!classDefinition: #East category: 'MarsRover-Exercise'!
CardinalDirections subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!East methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:59:04'!
moveBackwards: aCoordinate

	^ aCoordinate + (-1@0)
! !

!East methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:59:11'!
moveForwards: aCoordinate

	^ aCoordinate  + (1@0).! !

!East methodsFor: 'navigation' stamp: 'lvg 11/2/2022 12:22:18'!
turnLeft

	^'N'.
! !

!East methodsFor: 'navigation' stamp: 'lvg 11/2/2022 12:22:28'!
turnRight

	^'S'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'East class' category: 'MarsRover-Exercise'!
East class
	instanceVariableNames: ''!

!East class methodsFor: 'instace creation' stamp: 'lvg 11/1/2022 13:52:32'!
assignSubclassWith: aCardinalDirection

	^ aCardinalDirection = 'E'.! !


!classDefinition: #North category: 'MarsRover-Exercise'!
CardinalDirections subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!North methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:59:18'!
moveBackwards: aCoordinate
	
	^ aCoordinate + (0@-1).! !

!North methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:59:23'!
moveForwards: aCoordinate
	
	^ aCoordinate + (0@1).
! !

!North methodsFor: 'navigation' stamp: 'lvg 11/2/2022 12:22:34'!
turnLeft

	^'W'
! !

!North methodsFor: 'navigation' stamp: 'lvg 11/2/2022 12:22:38'!
turnRight

	^ 'E'.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'North class' category: 'MarsRover-Exercise'!
North class
	instanceVariableNames: ''!

!North class methodsFor: 'instance creation' stamp: 'lvg 11/1/2022 13:52:47'!
assignSubclassWith: aCardinalDirection

	^ aCardinalDirection = 'N'.! !


!classDefinition: #South category: 'MarsRover-Exercise'!
CardinalDirections subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!South methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:59:30'!
moveBackwards: aCoordinate
	
	^ aCoordinate + (0@1)! !

!South methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:59:38'!
moveForwards: aCoordinate
	
	^ aCoordinate + (0@-1).	! !

!South methodsFor: 'navigation' stamp: 'lvg 11/2/2022 12:22:43'!
turnLeft
	
	^'E'
! !

!South methodsFor: 'navigation' stamp: 'lvg 11/2/2022 12:22:48'!
turnRight

	^'W'
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'South class' category: 'MarsRover-Exercise'!
South class
	instanceVariableNames: ''!

!South class methodsFor: 'instance creation' stamp: 'lvg 11/1/2022 13:53:03'!
assignSubclassWith: aCardinalDirection

	^ aCardinalDirection = 'S'.! !


!classDefinition: #West category: 'MarsRover-Exercise'!
CardinalDirections subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!West methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:59:44'!
moveBackwards: aCoordinate 
	
	^aCoordinate + (1@0).! !

!West methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:59:51'!
moveForwards: aCoordinate
	
	^ aCoordinate + (-1@0).! !

!West methodsFor: 'navigation' stamp: 'lvg 11/2/2022 12:22:53'!
turnLeft

	^'S'! !

!West methodsFor: 'navigation' stamp: 'lvg 11/2/2022 12:23:00'!
turnRight

	^ 'N'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'West class' category: 'MarsRover-Exercise'!
West class
	instanceVariableNames: ''!

!West class methodsFor: 'instance creation' stamp: 'lvg 11/1/2022 13:53:12'!
assignSubclassWith: aCardinalDirection

	^ aCardinalDirection = 'W'.! !


!classDefinition: #MarsRover category: 'MarsRover-Exercise'!
Object subclass: #MarsRover
	instanceVariableNames: 'marsRoverCoordinates marsRoverCardinalDirection cardinalDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRover methodsFor: 'testing' stamp: 'lvg 11/2/2022 12:21:38'!
isCardinalDirectionEquals: aCardinalDirection

	^ aCardinalDirection = marsRoverCardinalDirection .
! !

!MarsRover methodsFor: 'testing' stamp: 'lvg 11/1/2022 15:02:04'!
isCoordinateEquals: aCoordinate

	^ marsRoverCoordinates = aCoordinate .! !


!MarsRover methodsFor: 'initialization' stamp: 'lvg 11/2/2022 12:21:57'!
initializeWithDirection: aCardinalDirection andWith: aCoordinate

	marsRoverCoordinates :=  aCoordinate .
	marsRoverCardinalDirection := aCardinalDirection .	
	! !


!MarsRover methodsFor: 'navigation - public' stamp: 'lvg 11/2/2022 14:11:51'!
operate: aStearString

	
	aStearString do: [: aStear | 
		(self isItAValidCommand: aStear) ifTrue: [
			cardinalDirection := CardinalDirections with: marsRoverCardinalDirection .
			(aStear = $B) ifTrue: [marsRoverCoordinates := cardinalDirection moveBackwards: marsRoverCoordinates ].
			(aStear = $F) ifTrue: [marsRoverCoordinates :=	cardinalDirection moveForwards: marsRoverCoordinates ].
			(aStear = $R) ifTrue: [marsRoverCardinalDirection := cardinalDirection turnRight ].
			(aStear = $L) ifTrue: [marsRoverCardinalDirection := cardinalDirection turnLeft].
		]ifFalse: [^ self error: 'Invalid command, expected commands are: F,B,R or L' ].
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

!MarsRover class methodsFor: 'initialization' stamp: 'lvg 11/1/2022 14:01:55'!
withACoordinate: aCoordinate andADirection: aDirection.
	
	^self  new initializeWithDirection: aDirection andWith: aCoordinate.
	! !


!MarsRover class methodsFor: 'error descriptions' stamp: 'lvg 11/2/2022 13:20:50'!
invalidCommandErrorDescription

	^ 'Invalid command, expected commands are: F,B,R or L'! !
