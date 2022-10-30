!classDefinition: #MarsRoverTest category: 'MarsRover-Exercise'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 17:10:34'!
test01

	| coordinates driveString direction marsRover |
	
	coordinates := (0@0).
	direction := $N.
	marsRover := MarsRover new.
	marsRover initializeWithDirection: direction andWith: coordinates .
	
	driveString := ''.
	marsRover operate: driveString.
 
	
	self assert: (marsRover coordinates = (0@0)).
	self assert: (marsRover cardinalDirection = $N)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'lvg 10/30/2022 17:19:14'!
test02

	| marsRoverCoordinates driveString marsRoverDirection marsRover |
	
	marsRoverCoordinates := (0@0).
	marsRoverDirection := $N.
	marsRover := MarsRover new.
	marsRover initializeWithDirection: marsRoverDirection andWith: marsRoverCoordinates.
	
	driveString := 'F'.
	marsRover operate: driveString .
	
	self assert: (marsRover coordinates = (0@1)).
	"self assert: (marsRover cardinalDirection = $N)"! !


!classDefinition: #MarsRover category: 'MarsRover-Exercise'!
Object subclass: #MarsRover
	instanceVariableNames: 'marsRoverCoordinates marsRoverCardinalDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!


!MarsRover methodsFor: 'navigation' stamp: 'lvg 10/30/2022 17:03:20'!
moveBackwards 

	( self cardinalDirection = $N) ifTrue: [^ self coordinates + (0@-1) ].
	( self cardinalDirection = $S) ifTrue: [^ self coordinates + (0@1)].	
	( self cardinalDirection = $E) ifTrue: [^ self coordinates + (-1@0)].
	( self cardinalDirection = $W) ifTrue: [^ self coordinates + (1@0)].! !

!MarsRover methodsFor: 'navigation' stamp: 'lvg 10/30/2022 17:23:50'!
moveForwards

	marsRoverCoordinates := marsRoverCoordinates + (0@1).
	"
	(self cardinalDirection = $S) ifTrue: [^ self coordinates + (0@-1)].	
	(self cardinalDirection = $E) ifTrue: [^ self coordinates + (1@0)].
	(self cardinalDirection = $W) ifTrue: [^ self coordinates + (-1@0)].
	"! !

!MarsRover methodsFor: 'navigation' stamp: 'lvg 10/30/2022 17:20:26'!
operate: aStearString

	(aStearString = 'F') ifTrue: [self moveForwards ].	
	"^(aStearString do: [: aStear | 
		
		(aStear = $B) ifTrue: [self moveBackwards].
		(aStear = $F) ifTrue: [self moveForwards ].
		(aStear = $R) ifTrue: [self turnRight].
		(aStear = $L) ifTrue: [self turnLeft] ifFalse: [^selfself error: 'Caracter no soportado']

		]  )
	"! !

!MarsRover methodsFor: 'navigation' stamp: 'lvg 10/30/2022 16:24:29'!
turnLeft

	(self cardinalDirection = $N) ifTrue: [^ marsRoverCardinalDirection = $W].
	(self cardinalDirection = $S) ifTrue: [^ marsRoverCardinalDirection = $E].	
	(self cardinalDirection = $E) ifTrue: [^ marsRoverCardinalDirection = $N].
	(self cardinalDirection = $W) ifTrue: [^ marsRoverCardinalDirection = $S].! !

!MarsRover methodsFor: 'navigation' stamp: 'lvg 10/30/2022 16:24:46'!
turnRight

	(self cardinalDirection = $N) ifTrue: [^ marsRoverCardinalDirection = $E].
	(self cardinalDirection = $S) ifTrue: [^ marsRoverCardinalDirection = $W].	
	(self cardinalDirection = $E) ifTrue: [^ marsRoverCardinalDirection = $S].
	(self cardinalDirection = $W) ifTrue: [^ marsRoverCardinalDirection = $N].! !


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
