class_name Constraints
extends Resource

@export var idName: String
@export var globalConstraints: Array
@export var modelIDs: Array[int]

@export_group("Cardinal Directions")
@export var frontConstraints: Array[int]
@export var backConstraints: Array[int]
@export var leftConstraints: Array[int]
@export var rightConstraints: Array[int]
@export var topConstraints: Array[int]
@export var bottomConstraints: Array[int]


enum direction {FRONT, BACK, LEFT, RIGHT, TOP, BOTTOM}
enum {ID, GLOBAL, MODELIDS}

func _init(id: String, global, modelids: Array[int],front: Array[int], back: Array[int], left: Array[int], right: Array[int], top: Array[int], bottom: Array[int]):
	idName = id
	globalConstraints = global
	modelIDs = modelids
	frontConstraints = front
	backConstraints = back
	leftConstraints = left
	rightConstraints = right
	topConstraints = top
	bottomConstraints = bottom

func addConstraints(constraints: Constraints):
	print("added")
	#globalConstraints += constraints.globalConstraints
	#frontConstraints += constraints.frontConstraints
	#backConstraints += constraints.backConstraints
	#leftConstraints += constraints.leftConstraints
	#rightConstraints += constraints.rightConstraints
	#topConstraints += constraints.topConstraints
	#bottomConstraints += constraints.bottomConstraints

func rotateConstraints():
	print("rotate")

func setName(id):
	idName = id

func setConstraints(allowedmodelids: Array[int], direction):
	match direction:
		direction.FRONT:
			frontConstraints = allowedmodelids
		direction.BACK:
			backConstraints = allowedmodelids
		direction.LEFT:
			leftConstraints = allowedmodelids
		direction.RIGHT:
			rightConstraints = allowedmodelids
		direction.TOP:
			topConstraints = allowedmodelids
		direction.BOTTOM:
			bottomConstraints = allowedmodelids
		
