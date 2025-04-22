extends Node3D

@export var DIM: int

var grid: Array[Dictionary]

var meshLibrary = $".".get("mesh_library")
var itemList = meshLibrary.get_item_list()

#enum states {V_T = [0,10],
#	V_FT = [1,11],
#	V_FST = [2,12],
#	V_SFDT = [3,13],
#	V_F = [4],
#	V_FS = [5],
#	V_FSD = [6],
#	V_FTD = [7,14],
#	V_DD = [8,15],
#	V_FTDSTDDD = [9,16],
#	S = [0,1,2,3,7,8,9],
#	G = [10,11,12,13,14,15,16],
#	V = [17]}
enum states {V_T_S = 0,V_T_G = 10, V_FT_S = 1,V_FT_G = 11, V_FST_S = 2,
V_FST_G = 12,V_SFDT_S = 3,V_SFDT_G = 13, V_F = 4, V_FS = 5, V_FSD = 6, 
V_FTD_S = 7, V_FTD_G = 14, V_DD_S = 8, V_DD_G = 15, V_FTDSTDDD_S = 9, 
V_SFTDSTDDD = 16, V = 17}

func _ready():
	grid.resize(DIM*DIM*DIM)
	
	
	for item in DIM*DIM*DIM:
		grid[item] = {
			"collapsed" : false,
			"options" : states.values()
		}
		grid[item]["options"].sort()
	#for item in itemList:
	#	draw(Vector3i(item,0,0), item,0)
	#grid[5]["options"] = [0]
	#grid[5]["collapsed"] = true
	#grid[6]["options"] = [0]
	#grid[6]["collapsed"] = true
	draw()

func sortOptions(a,b):
	if a["options"].size() < b["options"].size():
		return true
	else:
		return false

func draw():
	#itemPos: Vector3i,item:int,orientation:int):
	
	#good
	var gridCopy = grid.duplicate(false)
	gridCopy.sort_custom(sortOptions)
	
	#good
	var len = gridCopy[0]["options"].size()
	var stopIndex = 0
	for i in gridCopy.size()-1:
		if gridCopy[i+1]["options"].size() > len:
			stopIndex = i+1
			break
	
	#good
	if stopIndex > 0:
		gridCopy = gridCopy.slice(0, stopIndex)
	
	
	var cell = gridCopy.pick_random()
	cell["collapsed"] = true
	var pick = cell["options"].pick_random()
	cell["options"] = [pick]
	
	for item in grid:
		print(item["options"].size())
	print("erm")
	for item in gridCopy:
		print(item["options"].size())
	
	for i in DIM:
		for j in DIM:
			for n in DIM:
				var item = grid[i + j * DIM + n * DIM * DIM]
				if item["collapsed"]:
					var index = item["options"][0]
					$".".set_cell_item(Vector3i(i,j,n), itemList[index])
				else:
					$".".set_cell_item(Vector3i(i,j,n),17)
