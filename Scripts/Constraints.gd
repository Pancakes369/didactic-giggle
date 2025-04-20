class_name Constraints
extends Resource

@export var idName: String
@export var globalConstraints: Array

@export_group("Cardinal Directions")
@export var frontConstraints: Array[int]
@export var backConstraints: Array[int]
@export var leftConstraints: Array[int]
@export var rightConstraints: Array[int]
@export var topConstraints: Array[int]
@export var bottomConstraints: Array[int]

enum {ID, GLOBAL, FRONT, BACK, LEFT, RIGHT, TOP, BOTTOM}
func _init(id: String, global, front: Array[int], back: Array[int], left: Array[int], right: Array[int], top: Array[int], bottom: Array[int]):
	idName = id
	globalConstraints = global
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
