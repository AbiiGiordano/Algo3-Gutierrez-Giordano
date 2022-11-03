!classDefinition: #MarsRoverTest category: 'MarsRover-Exercise'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/3/2022 14:31:55'!
test01EmptyCommandLIne

	| coordinates driveString direction marsRover |
	
	coordinates := (0@0).
	direction := MarsRoverCardinalDirections with: 'N'.
	marsRover := MarsRover withACoordinate: coordinates andADirection: direction .
	
	driveString := ''.
	marsRover operate: driveString.
 

	self assert: (marsRover isCoordinateEquals: (0@0)).
	self assert: (marsRover isCardinalDirectionEquals: 	(MarsRoverCardinalDirections with: 'N'))! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/3/2022 14:31:55'!
test02ReceivesOnlyOneCommandAndIsAbleToMoveForwards

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection :=  MarsRoverCardinalDirections with: 'W'.

	driveString := 'F'.

	marsRoverExpectedCoordinates := -1@0.
	marsRoverExpectedDirection := MarsRoverCardinalDirections with: 'W'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection 
		canDrive: driveString 
	 	endsUpAt: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/3/2022 14:31:55'!
test03ReceivesAStringStopsAtTheFirstWrongCommand

	self 
		should: [ 
		| driveString marsRover |
		
		marsRover := MarsRover withACoordinate: (0@0) andADirection: (MarsRoverCardinalDirections with: 'N').
		driveString := 'LLLLPF'.
		marsRover operate: driveString . 
		]
		raise: Error
		withExceptionDo: [ :anError | self assert: MarsRover invalidCommandErrorDescription equals: anError messageText ]! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/3/2022 14:31:55'!
test04ChangesDirectionFromNorthToWestUsingLeftCommandAndIsAbleToMovesBackwardsAndForwards

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (1@1).
	marsRoverDirection := MarsRoverCardinalDirections with: 'N'.

	driveString := 'BBFLBFF'.

	marsRoverExpectedCoordinates := 0@0.
	marsRoverExpectedDirection := MarsRoverCardinalDirections with: 'W'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection 
		canDrive: driveString 
	 	endsUpAt: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.

! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/3/2022 14:31:55'!
test05ChangesDirectionFromWestToSouthUsingLeftCommandAndIsAbleToMovesBackwardsAndForwards

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := MarsRoverCardinalDirections with: 'W'.

	driveString := 'FBBLBFB'.

	marsRoverExpectedCoordinates := 1@1.
	marsRoverExpectedDirection := MarsRoverCardinalDirections with: 'S'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection 
		canDrive: driveString 
	 	endsUpAt: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/3/2022 14:31:55'!
test06ChangesDirectionFromSouthToEastUsingLeftCommandAndIsAbleToMovesBackwardsAndForwards

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := MarsRoverCardinalDirections with: 'S'.

	driveString := 'BBFFBBLBF'.

	marsRoverExpectedCoordinates := 0@2.
	marsRoverExpectedDirection := MarsRoverCardinalDirections with: 'E'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection 
		canDrive: driveString 
	 	endsUpAt: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/3/2022 14:31:55'!
test07ChangesDirectionFromEastToNorthUsingLeftCommandAndIsAbleToMovesBackwardsAndForwards

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := MarsRoverCardinalDirections with: 'E'.

	driveString := 'BFLBBFFFF'.
	
	marsRoverExpectedCoordinates := 0@2.
	marsRoverExpectedDirection := MarsRoverCardinalDirections with: 'N'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection 
		canDrive: driveString 
	 	endsUpAt: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.
	

! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/3/2022 14:44:28'!
test08ChangesDirectionFromNorthToEastUsingRightCommandAndIsAbleToMovesBackwardsAndForwards

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (1@0).
	marsRoverDirection := MarsRoverCardinalDirections with: 'N'.

	driveString := 'BFRBBBFFF'.
	
	marsRoverExpectedCoordinates := 1@0.
	marsRoverExpectedDirection := MarsRoverCardinalDirections with: 'E'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection 
		canDrive: driveString 
	 	endsUpAt: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/3/2022 14:31:55'!
test09ChangesDirectionFromEastToSouthUsingRightCommandAndIsAbleToMovesBackwardsAndForwards

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := MarsRoverCardinalDirections with: 'E'.

	driveString := 'BFRBFB'.
	
	marsRoverExpectedCoordinates := 0@1.
	marsRoverExpectedDirection := MarsRoverCardinalDirections with: 'S'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection 
		canDrive: driveString 
	 	endsUpAt: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/3/2022 14:31:55'!
test10ChangesDirectionFromSouthToWestUsingRightCommandAndIsAbleToMovesBackwardsAndForwards

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := MarsRoverCardinalDirections with: 'S'.

	driveString := 'BFBRBF'.
	
	marsRoverExpectedCoordinates := 0@1.
	marsRoverExpectedDirection := MarsRoverCardinalDirections with: 'W'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection 
		canDrive: driveString 
	 	endsUpAt: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/3/2022 14:31:55'!
test11ChangesDirectionFromWestToNorthByUsingRightCommandAndIsAbleToMovesBackwardsAndForwards

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := MarsRoverCardinalDirections with: 'W'.

	driveString := 'BFRBFFBB'.	
	
	marsRoverExpectedCoordinates := 0@-1.
	marsRoverExpectedDirection := MarsRoverCardinalDirections with: 'N'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection 
		canDrive: driveString 
	 	endsUpAt: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.



! !


!MarsRoverTest methodsFor: 'asserts' stamp: 'lvg 11/2/2022 18:03:02'!
assertMarsRoverWithCoordinates: anInitialCoordinate andWithDirection: anInitialDirection canDrive: aDriveString  endsUpAt: aFinalCoordinate andWithADirection: aFinalDirection

	| marsRover |
	
	marsRover := MarsRover withACoordinate: anInitialCoordinate andADirection: anInitialDirection.

	marsRover operate: aDriveString .
	
	self assert: (marsRover isCoordinateEquals: aFinalCoordinate).
	self assert: (marsRover isCardinalDirectionEquals: aFinalDirection)! !


!classDefinition: #MarsRover category: 'MarsRover-Exercise'!
Object subclass: #MarsRover
	instanceVariableNames: 'marsRoverCoordinates marsRoverCardinalDirection marsRoverCommands'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRover methodsFor: 'testing' stamp: 'lvg 11/1/2022 18:59:24'!
isCardinalDirectionEquals: aCardinalDirection

	^ aCardinalDirection  isKindOf: marsRoverCardinalDirection class.! !

!MarsRover methodsFor: 'testing' stamp: 'lvg 11/1/2022 15:02:04'!
isCoordinateEquals: aCoordinate

	^ marsRoverCoordinates = aCoordinate .! !


!MarsRover methodsFor: 'initialization' stamp: 'lvg 11/3/2022 15:15:12'!
initializeWithDirection: aCardinalDirection andWith: aCoordinate

	marsRoverCoordinates :=  aCoordinate .
	marsRoverCardinalDirection := aCardinalDirection .	
	marsRoverCommands := Dictionary newFrom: { 
						$B -> [marsRoverCoordinates :=  marsRoverCardinalDirection  moveBackwards: marsRoverCoordinates].
	 					$F -> [marsRoverCoordinates :=  marsRoverCardinalDirection  moveForwards: marsRoverCoordinates].
	 					$R -> [marsRoverCardinalDirection := 	marsRoverCardinalDirection turnRight].
	 					$L -> [marsRoverCardinalDirection := marsRoverCardinalDirection turnLeft].
						}.

! !


!MarsRover methodsFor: 'navigation - public' stamp: 'lvg 11/3/2022 15:11:41'!
operate: aStearString
	
	aStearString do: [: aStear |
		| aBlock | 
		aBlock := marsRoverCommands at: aStear ifAbsent: [^ self error: 'Invalid command, expected commands are: F,B,R or L' ].
		aBlock value.
	]  
! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Exercise'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'initialization' stamp: 'lvg 11/1/2022 14:01:55'!
withACoordinate: aCoordinate andADirection: aDirection.
	
	^self  new initializeWithDirection: aDirection andWith: aCoordinate.
	! !


!MarsRover class methodsFor: 'error descriptions' stamp: 'lvg 11/2/2022 17:30:31'!
invalidCommandErrorDescription

	^ 'Invalid command, expected commands are: F,B,R or L'! !


!classDefinition: #MarsRoverCardinalDirections category: 'MarsRover-Exercise'!
Object subclass: #MarsRoverCardinalDirections
	instanceVariableNames: 'cardinalDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverCardinalDirections methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:57:58'!
moveBackwards: aCoordinate
	
	self subclassResponsibility.! !

!MarsRoverCardinalDirections methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:58:52'!
moveForwards: aCoordinate
	
	self subclassResponsibility.! !

!MarsRoverCardinalDirections methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:15:28'!
turnLeft
	
	self subclassResponsibility.! !

!MarsRoverCardinalDirections methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:15:33'!
turnRight
	
	self subclassResponsibility.! !


!MarsRoverCardinalDirections methodsFor: 'initialization' stamp: 'lvg 11/1/2022 14:17:42'!
initializeWith: aCardinalDirection 
	
	cardinalDirection := aCardinalDirection ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCardinalDirections class' category: 'MarsRover-Exercise'!
MarsRoverCardinalDirections class
	instanceVariableNames: ''!

!MarsRoverCardinalDirections class methodsFor: 'instance creation' stamp: 'lvg 11/1/2022 13:49:11'!
assignSubclassWith: aCardinalDirection
	
	self subclassResponsibility.! !

!MarsRoverCardinalDirections class methodsFor: 'instance creation' stamp: 'lvg 11/3/2022 14:31:55'!
with: aCardinalDirection
	
	MarsRoverCardinalDirections subclasses do: [:MarsRoverSubclasses |
					(MarsRoverSubclasses assignSubclassWith: aCardinalDirection)
					ifTrue: [^ MarsRoverSubclasses new initializeWith: aCardinalDirection]
					].! !


!classDefinition: #East category: 'MarsRover-Exercise'!
MarsRoverCardinalDirections subclass: #East
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

!East methodsFor: 'navigation' stamp: 'lvg 11/3/2022 14:31:55'!
turnLeft

	^ MarsRoverCardinalDirections with: 'N'.
! !

!East methodsFor: 'navigation' stamp: 'lvg 11/3/2022 14:31:55'!
turnRight

	^ MarsRoverCardinalDirections with: 'S'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'East class' category: 'MarsRover-Exercise'!
East class
	instanceVariableNames: ''!

!East class methodsFor: 'instace creation' stamp: 'lvg 11/1/2022 13:52:32'!
assignSubclassWith: aCardinalDirection

	^ aCardinalDirection = 'E'.! !


!classDefinition: #North category: 'MarsRover-Exercise'!
MarsRoverCardinalDirections subclass: #North
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

!North methodsFor: 'navigation' stamp: 'lvg 11/3/2022 14:31:55'!
turnLeft

	^ MarsRoverCardinalDirections with: 'W'.! !

!North methodsFor: 'navigation' stamp: 'lvg 11/3/2022 14:31:55'!
turnRight

	^ MarsRoverCardinalDirections with:  'E'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'North class' category: 'MarsRover-Exercise'!
North class
	instanceVariableNames: ''!

!North class methodsFor: 'instance creation' stamp: 'lvg 11/1/2022 13:52:47'!
assignSubclassWith: aCardinalDirection

	^ aCardinalDirection = 'N'.! !


!classDefinition: #South category: 'MarsRover-Exercise'!
MarsRoverCardinalDirections subclass: #South
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

!South methodsFor: 'navigation' stamp: 'lvg 11/3/2022 14:31:55'!
turnLeft
	
	^ MarsRoverCardinalDirections with: 'E'.	! !

!South methodsFor: 'navigation' stamp: 'lvg 11/3/2022 14:31:55'!
turnRight

	^ MarsRoverCardinalDirections with: 'W'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'South class' category: 'MarsRover-Exercise'!
South class
	instanceVariableNames: ''!

!South class methodsFor: 'instance creation' stamp: 'lvg 11/1/2022 13:53:03'!
assignSubclassWith: aCardinalDirection

	^ aCardinalDirection = 'S'.! !


!classDefinition: #West category: 'MarsRover-Exercise'!
MarsRoverCardinalDirections subclass: #West
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

!West methodsFor: 'navigation' stamp: 'lvg 11/3/2022 14:31:55'!
turnLeft

	^ MarsRoverCardinalDirections with: 'S'.! !

!West methodsFor: 'navigation' stamp: 'lvg 11/3/2022 14:31:55'!
turnRight

	^ MarsRoverCardinalDirections with:  'N'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'West class' category: 'MarsRover-Exercise'!
West class
	instanceVariableNames: ''!

!West class methodsFor: 'instance creation' stamp: 'lvg 11/1/2022 13:53:12'!
assignSubclassWith: aCardinalDirection

	^ aCardinalDirection = 'W'.! !
