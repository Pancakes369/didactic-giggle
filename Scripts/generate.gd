extends Node3D

@export var DIM: int

var grid: Array[Dictionary]

var meshLibrary = $".".get("mesh_library")
var itemList = meshLibrary.get_item_list()
#var meshList = meshLibrary.get_item_mesh()
var tileList: Array[tile]

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

enum States {
V_T_S = 0, 
V_FT_S = 1, 
V_FST_S = 2, 
V_SFDT_S = 3, 
V_F = 4, 
V_FS = 5, 
V_FSD = 6, 
V_FTD_S = 7, 
V_DD_S = 8, 
V_FTDSTDDD_S = 9, 
V_T_G = 10, 
V_FT_G = 11, 
V_FST_G = 12, 
V_SFDT_G = 13, 
V_FTD_G = 14, 
V_DD_G = 15, 
V_FTDSTDDD_G = 16, 
V = 17 
}

enum Connections {VOID = 0, FULL = 1, HALF = 2, LINE = 3, CORNER = 4}

func _ready():
	grid.resize(DIM*DIM*DIM)
	
	tileList[States.V_T_S] = tile.new(0, [1,1,1,1,0,0])
	tileList[States.V_FT_S] = tile.new(1, [0,1,2,2,0,3])
	tileList[States.V_FST_S] = tile.new(2, [0,2,2,0,0,4])
	tileList[States.V_SFDT_S] = tile.new(3, [2,1,1,2,0,4])
	tileList[States.V_F] = tile.new(4, [0,0,3,3,3,3])
	tileList[States.V_FS] = tile.new(5, [0,3,3,0,4,4])
	tileList[States.V_FSD] = tile.new(6, [3,0,0,3,4,4])
	tileList[States.V_FTD_S] = tile.new(7, [1,0,2,2,3,0])
	tileList[States.V_DD_S] = tile.new(8, [2,0,0,2,4,0])
	tileList[States.V_FTDSTDDD_S] = tile.new(9, [1,2,2,1,4,0])
	tileList[States.V_T_G] = tile.new(10, [1,1,1,1,0,0])
	tileList[States.V_FT_G] = tile.new(11, [0,1,2,2,0,3])
	tileList[States.V_FST_G] = tile.new(12, [0,2,2,0,0,4])
	tileList[States.V_SFDT_G] = tile.new(13, [2,1,1,2,0,4])
	tileList[States.V_FTD_G] = tile.new(14, [1,0,2,2,3,0])
	tileList[States.V_DD_G] = tile.new(15, [2,0,0,2,4,0])
	tileList[States.V_FTDSTDDD_G] = tile.new(16, [1,2,2,1,4,0])
	tileList[States.V] = tile.new(17, [0,0,0,0,0,0])
	
	#custom print for adding more tiles
	print("enum states {")
	for item in itemList:
		print(meshLibrary.get_item_name(item)+" = "+ str(item)+", ")
	print("}")
	
	for item in DIM*DIM*DIM:
		grid[item] = {
			"collapsed" : false,
			"options" : States.values()
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

func checkValid(arr, valid):
	var checked = arr.duplicate(true)
	for i in arr:
		for j in valid:
			if arr[i] == valid[j]:
				checked.append(arr[i])
		if checked.size() <= valid.size():
			break
	return checked

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
	
	#good
	var cell = gridCopy.pick_random()
	cell["collapsed"] = true
	var pick = cell["options"].pick_random()
	cell["options"] = [pick]
	
	for item in grid:
		print(item["options"].size())
	print("erm")
	for item in gridCopy:
		print(item["options"].size())
	
	#collapsed tiles will update entropy of nearby tiles which will only update 
	#entropy of nearby tiles if they need updating, until no more tiles need 
	#updating
	var collapsedTiles: Array[Dictionary]
	var prevGen
	var gen
	
	#good
	for i in DIM:
		for j in DIM:
			for n in DIM:
				var item = grid[i + j * DIM + n * DIM * DIM]
				if item["collapsed"]:
					var index = item["options"][0]
					$".".set_cell_item(Vector3i(i,j,n), itemList[index])
					
					collapsedTiles.append(item)
				else:
					$".".set_cell_item(Vector3i(i,j,n),17)
	
	
	
	
	
