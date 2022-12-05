!classDefinition: #MarsRoverTest category: 'MarsRover-Exercise'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/23/2022 22:51:07'!
test01EmptyCommandLine

	| coordinates driveString marsRover |
	
	coordinates := (0@0).
	marsRover := MarsRover withACoordinate: coordinates andADirection: 'N' .
	
	driveString := ''.
	marsRover operate: driveString.
 

	self assert: (marsRover isAt: (0@0) facing: 'N' ).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/23/2022 17:27:06'!
test02ReceivesOnlyOneCommandAndIsAbleToMoveForwards

	self
		assertMarsRoverWithCoordinates:  (0@0) andWithDirection: 'W' 
		canDrive: 'F'
	 	endsUpAt: (-1@0) andWithADirection:  'W'.
		
		! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/23/2022 22:41:01'!
test03ReceivesOnlyOneCommandAndIsAbleToMoveBackWards
	
	self
		assertMarsRoverWithCoordinates: (2@2) andWithDirection: 'W' 
		canDrive:  'B' 
	 	endsUpAt: (3@2) andWithADirection: 'W'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/23/2022 22:41:09'!
test04ReceivesOnlyOneCommandAndIsAbleToTurnLeft
	
	self
		assertMarsRoverWithCoordinates: (2@2) andWithDirection: 'W' 
		canDrive: 'L' 
	 	endsUpAt: (2@2) andWithADirection: 'S'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/23/2022 22:41:26'!
test05ReceivesOnlyOneCommandAndIsAbleToTurnRight
	
	self
		assertMarsRoverWithCoordinates: (-1@-1) andWithDirection: 'S' 
		canDrive: 'R' 
	 	endsUpAt: (-1@-1) andWithADirection: 'W'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/23/2022 22:40:42'!
test06ReceivesAWrongCommandRaiseAnError

	| marsRover |
		
	marsRover := MarsRover withACoordinate: (0@0) andADirection: 'N'.
	self 
		should: [ marsRover operate: 'p' . ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException | 
						self assert: anException messageText equals: marsRover invalidCommandErrorDescription.						
						self assert: (marsRover isAt: (0@0) facing: 'N' )]
		! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/23/2022 22:56:33'!
test07ChangesDirectionFromNorthToWestByUsingLeftCommand

	self
		assertMarsRoverWithCoordinates: (1@1) andWithDirection: 'N' 
		canDrive: 'L' 
	 	endsUpAt: 1@1 andWithADirection: 'W'.

! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/23/2022 22:56:19'!
test08ChangesDirectionFromWestToSouthByUsingLeftCommand
	
	self
		assertMarsRoverWithCoordinates: (0@0) andWithDirection:  'W' 
		canDrive: 'L' 
	 	endsUpAt: (0@0) andWithADirection: 'S'.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/23/2022 22:39:33'!
test09ChangesDirectionFromSouthToEastByUsingLeftCommand
	
	self
		assertMarsRoverWithCoordinates:  (0@0) andWithDirection:  'S' 
		canDrive: 'L' 
	 	endsUpAt:  (0@0) andWithADirection:  'E'.
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/23/2022 22:39:42'!
test10ChangesDirectionFromEastToNorthByUsingLeftCommand

	self
		assertMarsRoverWithCoordinates:  (0@2) andWithDirection: 'E' 
		canDrive: 'L' 
	 	endsUpAt: (0@2) andWithADirection: 'N'.
	

! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/23/2022 22:39:49'!
test11ChangesDirectionFromNorthToEastByUsingRightCommand
	
	self
		assertMarsRoverWithCoordinates: (1@0) andWithDirection: 'N' 
		canDrive: 'R' 
	 	endsUpAt: (1@0) andWithADirection: 'E'.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/23/2022 22:39:58'!
test12ChangesDirectionFromEastToSouthByUsingRightCommand

	self
		assertMarsRoverWithCoordinates: (0@0) andWithDirection: 'E' 
		canDrive: 'R' 
	 	endsUpAt: (0@0) andWithADirection:  'S'.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/23/2022 22:40:06'!
test13ChangesDirectionFromSouthToWestByUsingRightCommand
	
	self
		assertMarsRoverWithCoordinates: (0@0) andWithDirection: 'S' 
		canDrive:  'R' 
	 	endsUpAt: (0@0) andWithADirection: 'W'.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/23/2022 22:42:24'!
test14ChangesDirectionFromWestToNorthByUsingRightCommand

	self
		assertMarsRoverWithCoordinates: (0@-1) andWithDirection: 'W' 
		canDrive: 'R' 
	 	endsUpAt: (0@-1) andWithADirection: 'N'.



! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/23/2022 22:53:57'!
test15CanProcessMultipleCommands

	self
		assertMarsRoverWithCoordinates: (0@0) andWithDirection: 'N' 
		canDrive: 'FFBFRFFFFBBRBBFFRBBFFL' 
	 	endsUpAt: (2@2) andWithADirection: 'S'.



! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 11/23/2022 22:38:57'!
test16ReceivesAStringStopsAtTheFirstWrongCommand

	| marsRover |
		
	marsRover := MarsRover withACoordinate: (0@0) andADirection:  'N'.
	self 
		should: [ marsRover operate: 'FP' . ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException | 
						self assert: anException messageText equals: marsRover invalidCommandErrorDescription.						
						self assert: (marsRover isAt: (0@1) facing: 'N')]
		! !


!MarsRoverTest methodsFor: 'asserts' stamp: 'lvg 11/23/2022 18:45:45'!
assertMarsRoverWithCoordinates: anInitialCoordinate andWithDirection: anInitialDirection canDrive: aDriveString  endsUpAt: aFinalCoordinate andWithADirection: aFinalDirection

	| marsRover |
	
	marsRover := MarsRover withACoordinate: anInitialCoordinate andADirection: anInitialDirection.

	marsRover operate: aDriveString .
	
	self assert: (marsRover isAt: aFinalCoordinate facing: aFinalDirection).
! !


!classDefinition: #MarsRover category: 'MarsRover-Exercise'!
Object subclass: #MarsRover
	instanceVariableNames: 'marsRoverCoordinates marsRoverHead'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRover methodsFor: 'testing' stamp: 'lvg 11/23/2022 19:17:03'!
assertCommandIsValid: aStear 

	^ (self isAValidCommand: aStear) ifFalse: [ self error: self invalidCommandErrorDescription ]! !

!MarsRover methodsFor: 'testing' stamp: 'lvg 11/23/2022 18:36:00'!
isAValidCommand: aCommand
	^ #($B $F $L $R ) includes: aCommand.! !

!MarsRover methodsFor: 'testing' stamp: 'lvg 11/23/2022 19:18:23'!
isAt: aCoordinate facing: aCardinalDirection 

	^ (marsRoverCoordinates = aCoordinate) and: [  marsRoverHead  isHeading: aCardinalDirection]! !


!MarsRover methodsFor: 'initialization' stamp: 'lvg 11/23/2022 19:49:11'!
initializeWithDirection: aCardinalDirection andWith: aCoordinate

	marsRoverCoordinates :=  aCoordinate .
	marsRoverHead := MarsRoverCardinalDirection of: self facing: aCardinalDirection.

"
	marsRoverCommands := Dictionary newFrom: { 
						$B -> [marsRoverHead  moveBackwards].
	 					$F -> [marsRoverHead  moveForwards].
	 					$R -> [	marsRoverHead turnRight].
	 					$L -> [marsRoverHead turnLeft].
						}.
"

! !


!MarsRover methodsFor: 'navigation - public' stamp: 'lvg 11/23/2022 19:45:22'!
operate: aStearString

	aStearString do: [: aStear |
		self assertCommandIsValid: aStear.
		self processCommand: aStear.
		] 


"	
	aStearString do: [: aStear |
		| aBlock | 
		aBlock := marsRoverCommands at: aStear ifAbsent: [self error: self invalidCommandErrorDescription ].
		aBlock value.
	]  
"
! !


!MarsRover methodsFor: 'error description' stamp: 'lvg 11/23/2022 13:04:23'!
invalidCommandErrorDescription

	^ 'Invalid command, expected commands are: F,B,R or L'! !


!MarsRover methodsFor: 'DD - moving' stamp: 'lvg 11/23/2022 17:20:54'!
moveDown

	marsRoverCoordinates := marsRoverCoordinates + (0@-1)! !

!MarsRover methodsFor: 'DD - moving' stamp: 'lvg 11/23/2022 17:21:13'!
moveLeft

	marsRoverCoordinates := marsRoverCoordinates + (-1@0)! !

!MarsRover methodsFor: 'DD - moving' stamp: 'lvg 11/23/2022 17:21:18'!
moveRight

	marsRoverCoordinates := marsRoverCoordinates + (1@0)! !

!MarsRover methodsFor: 'DD - moving' stamp: 'lvg 11/23/2022 17:21:23'!
moveUp

	marsRoverCoordinates := marsRoverCoordinates + (0@1)! !


!MarsRover methodsFor: 'DD - heading' stamp: 'lvg 11/23/2022 19:38:47'!
headEast

	marsRoverHead := MarsRoverFacesEast of: self.! !

!MarsRover methodsFor: 'DD - heading' stamp: 'lvg 11/23/2022 19:38:59'!
headNorth

	marsRoverHead := MarsRoverFacesNorth of: self.! !

!MarsRover methodsFor: 'DD - heading' stamp: 'lvg 11/23/2022 19:39:06'!
headSouth

	marsRoverHead := MarsRoverFacesSouth of: self.! !

!MarsRover methodsFor: 'DD - heading' stamp: 'lvg 11/23/2022 19:39:13'!
headWest

	marsRoverHead := MarsRoverFacesWest of: self.! !


!MarsRover methodsFor: 'navigation - private' stamp: 'lvg 11/23/2022 19:12:42'!
processCommand: aStear 

	(aStear = $B) ifTrue: [^ marsRoverHead  moveBackwards].
	(aStear = $F) ifTrue: [^ marsRoverHead  moveForwards].
	(aStear = $R) ifTrue: [^ marsRoverHead  turnRight].
	(aStear = $L) ifTrue: [^ marsRoverHead  turnLeft].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Exercise'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'initialization' stamp: 'lvg 11/1/2022 14:01:55'!
withACoordinate: aCoordinate andADirection: aDirection.
	
	^self  new initializeWithDirection: aDirection andWith: aCoordinate.
	! !


!classDefinition: #MarsRoverCardinalDirection category: 'MarsRover-Exercise'!
Object subclass: #MarsRoverCardinalDirection
	instanceVariableNames: 'cardinalDirection marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverCardinalDirection methodsFor: 'navigation' stamp: 'lvg 11/23/2022 13:56:02'!
moveBackwards

	self subclassResponsibility ! !

!MarsRoverCardinalDirection methodsFor: 'navigation' stamp: 'lvg 11/23/2022 13:34:30'!
moveForwards
	
	self subclassResponsibility.! !

!MarsRoverCardinalDirection methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:15:28'!
turnLeft
	
	self subclassResponsibility.! !

!MarsRoverCardinalDirection methodsFor: 'navigation' stamp: 'lvg 11/1/2022 14:15:33'!
turnRight
	
	self subclassResponsibility.! !


!MarsRoverCardinalDirection methodsFor: 'initialization' stamp: 'lvg 11/23/2022 17:13:45'!
initializeOf: aMarsRover 

	marsRover := aMarsRover.
! !

!MarsRoverCardinalDirection methodsFor: 'initialization' stamp: 'lvg 11/23/2022 17:11:36'!
isHeading: aCardinalPoint

	^self class whenFacing: aCardinalPoint! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCardinalDirection class' category: 'MarsRover-Exercise'!
MarsRoverCardinalDirection class
	instanceVariableNames: ''!

!MarsRoverCardinalDirection class methodsFor: 'instance creation' stamp: 'lvg 11/23/2022 14:04:04'!
of: aMarsRover

	^self new initializeOf: aMarsRover! !

!MarsRoverCardinalDirection class methodsFor: 'instance creation' stamp: 'lvg 11/23/2022 19:07:36'!
of: aMarsRover facing: aCardinalDirection

	| headingSubclass |
	
	headingSubclass := self subclasses detect: [ :aHeadingSubclass | aHeadingSubclass whenFacing: aCardinalDirection ].
	
	^headingSubclass of: aMarsRover.! !

!MarsRoverCardinalDirection class methodsFor: 'instance creation' stamp: 'lvg 11/23/2022 17:11:17'!
whenFacing: aCardinalDirection
	
	self subclassResponsibility.! !


!classDefinition: #MarsRoverFacesEast category: 'MarsRover-Exercise'!
MarsRoverCardinalDirection subclass: #MarsRoverFacesEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverFacesEast methodsFor: 'navigation' stamp: 'lvg 11/23/2022 13:54:06'!
moveBackwards

	^ marsRover moveLeft.
! !

!MarsRoverFacesEast methodsFor: 'navigation' stamp: 'lvg 11/23/2022 13:54:34'!
moveForwards

	^marsRover moveRight.! !

!MarsRoverFacesEast methodsFor: 'navigation' stamp: 'lvg 11/23/2022 13:55:06'!
turnLeft

	^marsRover headNorth.
! !

!MarsRoverFacesEast methodsFor: 'navigation' stamp: 'lvg 11/23/2022 13:55:11'!
turnRight

	^marsRover headSouth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverFacesEast class' category: 'MarsRover-Exercise'!
MarsRoverFacesEast class
	instanceVariableNames: ''!

!MarsRoverFacesEast class methodsFor: 'instace creation' stamp: 'lvg 11/23/2022 17:11:17'!
whenFacing: aCardinalDirection

	^ aCardinalDirection = 'E'.! !


!classDefinition: #MarsRoverFacesNorth category: 'MarsRover-Exercise'!
MarsRoverCardinalDirection subclass: #MarsRoverFacesNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverFacesNorth methodsFor: 'navigation' stamp: 'lvg 11/23/2022 19:48:28'!
moveBackwards

	^marsRover moveDown.! !

!MarsRoverFacesNorth methodsFor: 'navigation' stamp: 'lvg 11/23/2022 19:48:35'!
moveForwards

	^marsRover moveUp.
	! !

!MarsRoverFacesNorth methodsFor: 'navigation' stamp: 'lvg 11/23/2022 13:57:02'!
turnLeft

	^marsRover headWest.! !

!MarsRoverFacesNorth methodsFor: 'navigation' stamp: 'lvg 11/23/2022 13:56:54'!
turnRight

	^marsRover headEast.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverFacesNorth class' category: 'MarsRover-Exercise'!
MarsRoverFacesNorth class
	instanceVariableNames: ''!

!MarsRoverFacesNorth class methodsFor: 'instance creation' stamp: 'lvg 11/23/2022 17:11:17'!
whenFacing: aCardinalDirection

	^ aCardinalDirection = 'N'.! !


!classDefinition: #MarsRoverFacesSouth category: 'MarsRover-Exercise'!
MarsRoverCardinalDirection subclass: #MarsRoverFacesSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverFacesSouth methodsFor: 'navigation' stamp: 'lvg 11/23/2022 13:57:36'!
moveBackwards

	^marsRover moveUp.! !

!MarsRoverFacesSouth methodsFor: 'navigation' stamp: 'lvg 11/23/2022 13:57:53'!
moveForwards
	
	^marsRover moveDown! !

!MarsRoverFacesSouth methodsFor: 'navigation' stamp: 'lvg 11/23/2022 13:58:09'!
turnLeft
	
	^marsRover headEast.! !

!MarsRoverFacesSouth methodsFor: 'navigation' stamp: 'lvg 11/23/2022 13:58:16'!
turnRight

	^marsRover headWest.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverFacesSouth class' category: 'MarsRover-Exercise'!
MarsRoverFacesSouth class
	instanceVariableNames: ''!

!MarsRoverFacesSouth class methodsFor: 'instance creation' stamp: 'lvg 11/23/2022 17:11:17'!
whenFacing: aCardinalDirection

	^ aCardinalDirection = 'S'.! !


!classDefinition: #MarsRoverFacesWest category: 'MarsRover-Exercise'!
MarsRoverCardinalDirection subclass: #MarsRoverFacesWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverFacesWest methodsFor: 'navigation' stamp: 'lvg 11/23/2022 13:58:36'!
moveBackwards
	
	^marsRover moveRight.! !

!MarsRoverFacesWest methodsFor: 'navigation' stamp: 'lvg 11/23/2022 13:58:52'!
moveForwards
	
	^marsRover moveLeft.! !

!MarsRoverFacesWest methodsFor: 'navigation' stamp: 'lvg 11/23/2022 13:59:11'!
turnLeft

	^marsRover headSouth.! !

!MarsRoverFacesWest methodsFor: 'navigation' stamp: 'lvg 11/23/2022 13:59:18'!
turnRight

	^marsRover headNorth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverFacesWest class' category: 'MarsRover-Exercise'!
MarsRoverFacesWest class
	instanceVariableNames: ''!

!MarsRoverFacesWest class methodsFor: 'instance creation' stamp: 'lvg 11/23/2022 17:11:17'!
whenFacing: aCardinalDirection

	^ aCardinalDirection = 'W'.! !
