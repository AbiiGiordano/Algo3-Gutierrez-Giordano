!classDefinition: #MarsRoverTest category: 'NewMarsRover-Exercise'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NewMarsRover-Exercise'!

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/1/2022 18:58:27'!
test01EmptyCommandLIne

	| coordinates driveString direction marsRover |
	
	coordinates := (0@0).
	direction := 'N'.
	marsRover := MarsRover withACoordinate: coordinates andADirection: direction .
	
	driveString := ''.
	marsRover operate: driveString.
 

	self assert: (marsRover isCoordinateEquals: (0@0)).
	self assert: (marsRover isCardinalDirectionEquals: 	(CardinalDirections with: 'N'))! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 18:03:02'!
test02ReceivesOnlyOneCommandAndIsAbleToMoveForwards

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'W'.

	driveString := 'F'.

	marsRoverExpectedCoordinates := -1@0.
	marsRoverExpectedDirection := CardinalDirections with: 'W'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection 
		canDrive: driveString 
	 	endsUpAt: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 17:52:47'!
test03ReceivesAStringStopsAtTheFirstWrongCommand

	self 
		should: [ 
		| driveString marsRover |
		
		marsRover := MarsRover withACoordinate: (0@0) andADirection: 'N'.
		driveString := 'LLLLPF'.
		marsRover operate: driveString . 
		]
		raise: Error
		withExceptionDo: [ :anError | self assert: MarsRover invalidCommandErrorDescription equals: anError messageText ]! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 18:03:02'!
test04ChangesDirectionFromNorthToWestUsingLeftCommandAndIsAbleToMovesBackwardsAndForwards

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (1@1).
	marsRoverDirection := 'N'.

	driveString := 'BBFLBFF'.

	marsRoverExpectedCoordinates := 0@0.
	marsRoverExpectedDirection := CardinalDirections with: 'W'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection 
		canDrive: driveString 
	 	endsUpAt: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.

! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 18:03:02'!
test05ChangesDirectionFromWestToSouthUsingLeftCommandAndIsAbleToMovesBackwardsAndForwards

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'W'.

	driveString := 'FBBLBFB'.

	marsRoverExpectedCoordinates := 1@1.
	marsRoverExpectedDirection := CardinalDirections with: 'S'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection 
		canDrive: driveString 
	 	endsUpAt: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 18:05:48'!
test06ChangesDirectionFromSouthToEastUsingLeftCommandAndIsAbleToMovesBackwardsAndForwards

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'S'.

	driveString := 'BBFFBBLBF'.

	marsRoverExpectedCoordinates := 0@2.
	marsRoverExpectedDirection := CardinalDirections with: 'E'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection 
		canDrive: driveString 
	 	endsUpAt: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 18:07:02'!
test07ChangesDirectionFromEastToNorthUsingLeftCommandAndIsAbleToMovesBackwardsAndForwards

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'E'.

	driveString := 'BFLBBFFFF'.
	
	marsRoverExpectedCoordinates := 0@2.
	marsRoverExpectedDirection := CardinalDirections with: 'N'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection 
		canDrive: driveString 
	 	endsUpAt: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.
	

! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 18:08:24'!
test08ChangesDirectionFromNorthToEastUsingRightCommandAndIsAbleToMovesBackwardsAndForwards

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.

	driveString := 'BFRBBBFFF'.
	
	marsRoverExpectedCoordinates := 0@0.
	marsRoverExpectedDirection := CardinalDirections with: 'E'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection 
		canDrive: driveString 
	 	endsUpAt: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 18:09:14'!
test09ChangesDirectionFromEastToSouthUsingRightCommandAndIsAbleToMovesBackwardsAndForwards

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'E'.

	driveString := 'BFRBFB'.
	
	marsRoverExpectedCoordinates := 0@1.
	marsRoverExpectedDirection := CardinalDirections with: 'S'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection 
		canDrive: driveString 
	 	endsUpAt: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 18:10:12'!
test10ChangesDirectionFromSouthToWestUsingRightCommandAndIsAbleToMovesBackwardsAndForwards

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'S'.

	driveString := 'BFBRBF'.
	
	marsRoverExpectedCoordinates := 0@1.
	marsRoverExpectedDirection := CardinalDirections with: 'W'.
	
	self
		assertMarsRoverWithCoordinates: marsRoverCoordinates andWithDirection: marsRoverDirection 
		canDrive: driveString 
	 	endsUpAt: marsRoverExpectedCoordinates andWithADirection: marsRoverExpectedDirection.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/2/2022 18:11:23'!
test11ChangesDirectionFromWestToNorthByUsingRightCommandAndIsAbleToMovesBackwardsAndForwards

	| marsRoverCoordinates marsRoverDirection driveString marsRoverExpectedCoordinates marsRoverExpectedDirection |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'W'.

	driveString := 'BFRBFFBB'.	
	
	marsRoverExpectedCoordinates := 0@-1.
	marsRoverExpectedDirection := CardinalDirections with: 'N'.
	
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


!classDefinition: #CardinalDirections category: 'NewMarsRover-Exercise'!
Object subclass: #CardinalDirections
	instanceVariableNames: 'cardinalDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NewMarsRover-Exercise'!

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

!classDefinition: 'CardinalDirections class' category: 'NewMarsRover-Exercise'!
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


!classDefinition: #East category: 'NewMarsRover-Exercise'!
CardinalDirections subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NewMarsRover-Exercise'!

!East methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:59:04'!
moveBackwards: aCoordinate

	^ aCoordinate + (-1@0)
! !

!East methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:59:11'!
moveForwards: aCoordinate

	^ aCoordinate  + (1@0).! !

!East methodsFor: 'navigation' stamp: 'lvg 11/2/2022 17:17:17'!
turnLeft

	^ CardinalDirections with: 'N'.
! !

!East methodsFor: 'navigation' stamp: 'lvg 11/2/2022 17:28:34'!
turnRight

	^ CardinalDirections with: 'S'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'East class' category: 'NewMarsRover-Exercise'!
East class
	instanceVariableNames: ''!

!East class methodsFor: 'instace creation' stamp: 'lvg 11/1/2022 13:52:32'!
assignSubclassWith: aCardinalDirection

	^ aCardinalDirection = 'E'.! !


!classDefinition: #North category: 'NewMarsRover-Exercise'!
CardinalDirections subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NewMarsRover-Exercise'!

!North methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:59:18'!
moveBackwards: aCoordinate
	
	^ aCoordinate + (0@-1).! !

!North methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:59:23'!
moveForwards: aCoordinate
	
	^ aCoordinate + (0@1).
! !

!North methodsFor: 'navigation' stamp: 'lvg 11/2/2022 17:17:48'!
turnLeft

	^ CardinalDirections with: 'W'.! !

!North methodsFor: 'navigation' stamp: 'lvg 11/2/2022 17:17:56'!
turnRight

	^ CardinalDirections with:  'E'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'North class' category: 'NewMarsRover-Exercise'!
North class
	instanceVariableNames: ''!

!North class methodsFor: 'instance creation' stamp: 'lvg 11/1/2022 13:52:47'!
assignSubclassWith: aCardinalDirection

	^ aCardinalDirection = 'N'.! !


!classDefinition: #South category: 'NewMarsRover-Exercise'!
CardinalDirections subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NewMarsRover-Exercise'!

!South methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:59:30'!
moveBackwards: aCoordinate
	
	^ aCoordinate + (0@1)! !

!South methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:59:38'!
moveForwards: aCoordinate
	
	^ aCoordinate + (0@-1).	! !

!South methodsFor: 'navigation' stamp: 'lvg 11/2/2022 17:18:04'!
turnLeft
	
	^ CardinalDirections with: 'E'.	! !

!South methodsFor: 'navigation' stamp: 'lvg 11/2/2022 17:18:11'!
turnRight

	^ CardinalDirections with: 'W'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'South class' category: 'NewMarsRover-Exercise'!
South class
	instanceVariableNames: ''!

!South class methodsFor: 'instance creation' stamp: 'lvg 11/1/2022 13:53:03'!
assignSubclassWith: aCardinalDirection

	^ aCardinalDirection = 'S'.! !


!classDefinition: #West category: 'NewMarsRover-Exercise'!
CardinalDirections subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NewMarsRover-Exercise'!

!West methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:59:44'!
moveBackwards: aCoordinate 
	
	^aCoordinate + (1@0).! !

!West methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:59:51'!
moveForwards: aCoordinate
	
	^ aCoordinate + (-1@0).! !

!West methodsFor: 'navigation' stamp: 'lvg 11/2/2022 17:18:19'!
turnLeft

	^ CardinalDirections with: 'S'.! !

!West methodsFor: 'navigation' stamp: 'lvg 11/2/2022 17:18:25'!
turnRight

	^ CardinalDirections with:  'N'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'West class' category: 'NewMarsRover-Exercise'!
West class
	instanceVariableNames: ''!

!West class methodsFor: 'instance creation' stamp: 'lvg 11/1/2022 13:53:12'!
assignSubclassWith: aCardinalDirection

	^ aCardinalDirection = 'W'.! !


!classDefinition: #MarsRover category: 'NewMarsRover-Exercise'!
Object subclass: #MarsRover
	instanceVariableNames: 'marsRoverCoordinates marsRoverCardinalDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NewMarsRover-Exercise'!

!MarsRover methodsFor: 'testing' stamp: 'lvg 11/1/2022 18:59:24'!
isCardinalDirectionEquals: aCardinalDirection

	^ aCardinalDirection  isKindOf: marsRoverCardinalDirection class.! !

!MarsRover methodsFor: 'testing' stamp: 'lvg 11/1/2022 15:02:04'!
isCoordinateEquals: aCoordinate

	^ marsRoverCoordinates = aCoordinate .! !


!MarsRover methodsFor: 'initialization' stamp: 'lvg 11/2/2022 16:54:34'!
initializeWithDirection: aCardinalDirection andWith: aCoordinate

	marsRoverCoordinates :=  aCoordinate .
	marsRoverCardinalDirection := CardinalDirections with: aCardinalDirection .	

! !


!MarsRover methodsFor: 'navigation - public' stamp: 'lvg 11/2/2022 17:32:01'!
operate: aStearString

	
	aStearString do: [: aStear | 
		(self isItAValidCommand: aStear) ifTrue: [
			(aStear = $B) ifTrue: [marsRoverCoordinates :=  marsRoverCardinalDirection  moveBackwards: marsRoverCoordinates ].
			(aStear = $F) ifTrue: [marsRoverCoordinates :=  marsRoverCardinalDirection  moveForwards: marsRoverCoordinates ].
			(aStear = $R) ifTrue: [marsRoverCardinalDirection := 	marsRoverCardinalDirection turnRight ].
			(aStear = $L) ifTrue: [marsRoverCardinalDirection := marsRoverCardinalDirection turnLeft].
		]ifFalse: [^ self error: 'Invalid command, expected commands are: F,B,R or L' ].
	]  
! !


!MarsRover methodsFor: 'validation - private' stamp: 'lvg 10/31/2022 17:29:17'!
isItAValidCommand: aCommand

	| validCommands |
	
	validCommands := OrderedCollection newFrom: #($F $B $L $R).	

	^ validCommands includes: aCommand.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'NewMarsRover-Exercise'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'initialization' stamp: 'lvg 11/1/2022 14:01:55'!
withACoordinate: aCoordinate andADirection: aDirection.
	
	^self  new initializeWithDirection: aDirection andWith: aCoordinate.
	! !


!MarsRover class methodsFor: 'error descriptions' stamp: 'lvg 11/2/2022 17:30:31'!
invalidCommandErrorDescription

	^ 'Invalid command, expected commands are: F,B,R or L'! !
