!classDefinition: #MarsRoverTest category: 'MarsRover-Exercise'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 18:20:48'!
test01

	| coordinates driveString direction marsRover |
	
	coordinates := (0@0).
	direction := 'N'.
	marsRover := MarsRover new.
	marsRover initializeWithDirection: direction andWith: coordinates .
	
	driveString := ''.
	marsRover operate: driveString.
 
	
	self assert: (marsRover coordinates = (0@0)).
	self assert: (marsRover cardinalDirection = 'N')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 18:21:10'!
test02

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover new.
	marsRover initializeWithDirection: marsRoverDirection andWith: marsRoverCoordinates.
	
	driveString := 'F'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinates = (0@1)).
	self assert: (marsRover cardinalDirection = 'N')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 18:21:23'!
test03

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover new.
	marsRover initializeWithDirection: marsRoverDirection andWith: marsRoverCoordinates.
	
	driveString := 'p'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinates = (0@0)).
	self assert: (marsRover cardinalDirection = 'N')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 18:19:42'!
test04

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover new.
	marsRover initializeWithDirection: marsRoverDirection andWith: marsRoverCoordinates.
	
	driveString := 'L'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinates = (0@0)).
	self assert: (marsRover cardinalDirection = 'W')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 18:21:39'!
test05

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover new.
	marsRover initializeWithDirection: marsRoverDirection andWith: marsRoverCoordinates.
	
	driveString := 'R'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinates = (0@0)).
	self assert: (marsRover cardinalDirection = 'E')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 18:22:05'!
test06

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover new.
	marsRover initializeWithDirection: marsRoverDirection andWith: marsRoverCoordinates.
	
	driveString := 'FFF'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinates = (0@3)).
	self assert: (marsRover cardinalDirection = 'N')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 18:22:19'!
test07

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover new.
	marsRover initializeWithDirection: marsRoverDirection andWith: marsRoverCoordinates.
	
	driveString := 'FFpF'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinates = (0@3)).
	self assert: (marsRover cardinalDirection = 'N')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 18:22:28'!
test08

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover new.
	marsRover initializeWithDirection: marsRoverDirection andWith: marsRoverCoordinates.
	
	driveString := 'LLLL'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinates = (0@0)).
	self assert: (marsRover cardinalDirection = 'N')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 18:26:22'!
test09

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover new.
	marsRover initializeWithDirection: marsRoverDirection andWith: marsRoverCoordinates.
	
	driveString := 'LLL'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinates = (0@0)).
	self assert: (marsRover cardinalDirection = 'E')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 18:27:10'!
test10

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover new.
	marsRover initializeWithDirection: marsRoverDirection andWith: marsRoverCoordinates.
	
	driveString := 'FRF'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinates = (1@1)).
	self assert: (marsRover cardinalDirection = 'E')! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 18:33:01'!
test11

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := 'N'.
	marsRover := MarsRover new.
	marsRover initializeWithDirection: marsRoverDirection andWith: marsRoverCoordinates.
	
	driveString := 'BBFFFF'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinates = (0@2)).
	self assert: (marsRover cardinalDirection = 'N')! !


!classDefinition: #MarsRover category: 'MarsRover-Exercise'!
Object subclass: #MarsRover
	instanceVariableNames: 'marsRoverCoordinates marsRoverCardinalDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!


!MarsRover methodsFor: 'navigation' stamp: 'lvg 10/30/2022 18:32:24'!
moveBackwards 

	"marsRoverCoordinates := marsRoverCoordinates + (0@-1) ."
	
	( self cardinalDirection = 'N') ifTrue: [^marsRoverCoordinates := marsRoverCoordinates + (0@-1) ].
	( self cardinalDirection = 'S') ifTrue: [^ marsRoverCoordinates := marsRoverCoordinates + (0@1)].	
	( self cardinalDirection = 'E') ifTrue: [^ marsRoverCoordinates := marsRoverCoordinates + (-1@0)].
	( self cardinalDirection = 'W') ifTrue: [^ marsRoverCoordinates := marsRoverCoordinates + (1@0)].
	! !

!MarsRover methodsFor: 'navigation' stamp: 'lvg 10/30/2022 18:29:56'!
moveForwards

	"marsRoverCoordinates := marsRoverCoordinates + (0@1)."
	
	(self cardinalDirection = 'N') ifTrue: [^ marsRoverCoordinates := marsRoverCoordinates + (0@1)].
	(self cardinalDirection = 'S') ifTrue: [^ marsRoverCoordinates := marsRoverCoordinates + (0@-1)].	
	(self cardinalDirection = 'E') ifTrue: [^ marsRoverCoordinates := marsRoverCoordinates + (1@0)].
	(self cardinalDirection = 'W') ifTrue: [^ marsRoverCoordinates := marsRoverCoordinates + (-1@0)].
	! !

!MarsRover methodsFor: 'navigation' stamp: 'lvg 10/30/2022 18:11:07'!
operate: aStearString
"
		(aStearString = 'F') ifTrue: [self moveForwards ].
		(aStearString = 'B') ifTrue: [self moveBackwards].
		(aStearString = 'L') ifTrue: [self turnLeft].
		(aStearString = 'R') ifTrue: [self turnRight].
"
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

!MarsRover methodsFor: 'accesing' stamp: 'lvg 10/30/2022 16:11:16'!
coordinates

	^marsRoverCoordinates.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Exercise'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'lvg 10/30/2022 17:04:10'!
with: aCoordinate and: aDirection.
	
	^self  new initializeWithDirection: aDirection andWith: aCoordinate.
	! !
