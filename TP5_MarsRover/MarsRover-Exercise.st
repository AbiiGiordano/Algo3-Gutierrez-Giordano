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
