class_name tile
extends Resource

var edges: Array
var number: int
var mesh: Mesh

func _init(itemNumber: int, edge: Array) -> void:
	edges = edge
	number = itemNumber

func rotate(rotations, meshLibrary):
	var rotation = Basis(Vector3(0,1,0), rotations*90)
	#meshLibrary
