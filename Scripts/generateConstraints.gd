extends Node3D

var cV_T: Constraints
var cV_FT: Constraints
var cV_FST: Constraints
var cV_SFDT: Constraints
var cV_F: Constraints
var cV_FS: Constraints
var cV_FSD: Constraints
var cV_FTD: Constraints
var cV_DD: Constraints
var cV_FTDSTDDD: Constraints
var cG: Constraints
var cS: Constraints
var cV: Constraints
var baseConstraints: Array[Constraints]

var V_T: Array[int]
var V_FT: Array[int]
var V_FST: Array[int]
var V_SFDT: Array[int]
var V_F: Array[int]
var V_FS: Array[int]
var V_FSD: Array[int]
var V_FTD: Array[int]
var V_DD: Array[int]
var V_FTDSTDDD: Array[int]
var S: Array[int]
var G: Array[int]
var V: Array[int]
func _ready():
	var meshLibrary = $".".get("mesh_library")
	var itemList = meshLibrary.get_item_list()
	#added the void
	#meshLibrary.create_item(17)
	#meshLibrary.set_item_name(17,"V")
	#ResourceSaver.save(meshLibrary, "res://Assets/IslandTileset.tres")
	# numbers correspond with item ids of the meshlibrary
	V_T = [0,10]
	V_FT = [1,11]
	V_FST = [2,12]
	V_SFDT = [3,13]
	V_F = [4]
	V_FS = [5]
	V_FSD = [6]
	V_FTD = [7,14]
	V_DD = [8,15]
	V_FTDSTDDD = [9,16]
	S = [0,1,2,3,7,8,9]
	G = [10,11,12,13,14,15,16]
	V = [17]
	#This piece of code was used to tell me the ids in the console/debugger
	for item in itemList:
		print(meshLibrary.get_item_name(itemList[item]))
	cV_T = Constraints.new("V_T", [], V+V_F+V_FS+V_FSD, V+V_F+V_FS+V_FSD, V+V_F+V_FS+V_FSD, V+V_F+V_FS+V_FSD, S+G+V_F+V_FS+V_FSD, S+G+V_F+V_FS+V_FSD)
	#cV_FT = Constraints.new("V_FT", [])
	#cV_FST = Constraints.new("V_FST", [])
	#cV_SFDT = Constraints.new("V_SFDT", [])
	#cV_F = Constraints.new("V_F", [])
	#cV_FS = Constraints.new("V_FS", [])
	#cV_FSD = Constraints.new("V_FSD", [])
	#cV_FTD = Constraints.new("V_FTD", [])
	#cV_DD = Constraints.new("V_DD", [])
	#cV_FTDSTDDD = Constraints.new("V_FTDSTDDD")
	cG = Constraints.new("G", [], S, S, S ,S, [], [])
	cS = Constraints.new("S", [], G, G, G ,G, [], [])
	cV = Constraints.new("V", [], [], [], [], [], [], [])
	baseConstraints = [cG, cS]
	for constraint in baseConstraints:
		ResourceSaver.save(constraint, "res://Constraints/" + constraint.idName + ".tres")
