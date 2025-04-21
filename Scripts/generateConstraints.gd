extends Node3D

var V_T = Constraints.new("V_T",[],[],[],[],[],[],[],[])
var V_FT = Constraints.new("V_FT",[],[],[],[],[],[],[],[])
var V_FST = Constraints.new("V_FST",[],[],[],[],[],[],[],[])
var V_SFDT = Constraints.new("V_SFDT",[],[],[],[],[],[],[],[])
var V_F = Constraints.new("V_F",[],[],[],[],[],[],[],[])
var V_FS = Constraints.new("V_FS",[],[],[],[],[],[],[],[])
var V_FSD = Constraints.new("V_FSD",[],[],[],[],[],[],[],[])
var V_FTD = Constraints.new("V_FTD",[],[],[],[],[],[],[],[])
var V_DD = Constraints.new("V_DD",[],[],[],[],[],[],[],[])
var V_FTDSTDDD = Constraints.new("V_FTDSTDDD",[],[],[],[],[],[],[],[])
var G = Constraints.new("G",[],[],[],[],[],[],[],[])
var S = Constraints.new("S",[],[],[],[],[],[],[],[])
var V = Constraints.new("V",[],[],[],[],[],[],[],[])
var baseConstraints: Array[Constraints]

func _ready():
	var meshLibrary = $".".get("mesh_library")
	var itemList = meshLibrary.get_item_list()
	
	#added the void
	#meshLibrary.create_item(17)
	#meshLibrary.set_item_name(17,"V")
	#ResourceSaver.save(meshLibrary, "res://Assets/IslandTileset.tres")
	
	setModelIDs()
	#This piece of code was used to tell me the ids in the console/debugger
	for item in itemList:
		print(meshLibrary.get_item_name(itemList[item]))
	
	#V_T
	V_T.setConstraints(V_T.ModelIDs,Constraints.direction.FRONT)
	V_T.setConstraints(V_T.ModelIDs,Constraints.direction.BACK)
	V_T.setConstraints(V_T.ModelIDs,Constraints.direction.LEFT)
	V_T.setConstraints(V_T.ModelIDs,Constraints.direction.RIGHT)
	V_T.setConstraints(V.ModelIDs,Constraints.direction.TOP)
	V_T.setConstraints(V.ModelIDs,Constraints.direction.BOTTOM)
	
	#V_FT
	V_FT.setConstraints(V.ModelIDs,Constraints.direction.FRONT)
	V_FT.setConstraints(V_T.ModelIDs,Constraints.direction.BACK)
	V_FT.setConstraints(V_FT.ModelIDs,Constraints.direction.LEFT)
	V_FT.setConstraints(V_FT.ModelIDs,Constraints.direction.RIGHT)
	V_FT.setConstraints(V.ModelIDs,Constraints.direction.TOP)
	V_FT.setConstraints(V_F.ModelIDs,Constraints.direction.BOTTOM)
	
	#V_FST
	V_FST.setConstraints(V.ModelIDs,Constraints.direction.FRONT)
	V_FST.setConstraints(V_T.ModelIDs,Constraints.direction.BACK)
	V_FST.setConstraints(V_FT.ModelIDs,Constraints.direction.LEFT)
	V_FST.setConstraints(V.ModelIDs,Constraints.direction.RIGHT)
	V_FST.setConstraints(V.ModelIDs,Constraints.direction.TOP)
	V_FST.setConstraints(V_FS.ModelIDs,Constraints.direction.BOTTOM)
	
	#V_SFDT
	#V_SFDT.setConstraints(V.ModelIDs,Constraints.direction.FRONT)
	#V_SFDT.setConstraints(V_T.ModelIDs,Constraints.direction.BACK)
	#V_SFDT.setConstraints(V_FT.ModelIDs,Constraints.direction.LEFT)
	#V_SFDT.setConstraints(V_FT.ModelIDs,Constraints.direction.RIGHT)
	#V_SFDT.setConstraints(V.ModelIDs,Constraints.direction.TOP)
	#V_SFDT.setConstraints(V_F.ModelIDs,Constraints.direction.BOTTOM)
	
	#V_F
	#V_SFDT.setConstraints(V.ModelIDs,Constraints.direction.FRONT)
	#V_SFDT.setConstraints(V_T.ModelIDs,Constraints.direction.BACK)
	#V_SFDT.setConstraints(V_FT.ModelIDs,Constraints.direction.LEFT)
	#V_SFDT.setConstraints(V_FT.ModelIDs,Constraints.direction.RIGHT)
	#V_SFDT.setConstraints(V.ModelIDs,Constraints.direction.TOP)
	#V_SFDT.setConstraints(V_F.ModelIDs,Constraints.direction.BOTTOM)
	
	#V_FS
	#V_SFDT.setConstraints(V.ModelIDs,Constraints.direction.FRONT)
	#V_SFDT.setConstraints(V_T.ModelIDs,Constraints.direction.BACK)
	#V_SFDT.setConstraints(V_FT.ModelIDs,Constraints.direction.LEFT)
	#V_SFDT.setConstraints(V_FT.ModelIDs,Constraints.direction.RIGHT)
	#V_SFDT.setConstraints(V.ModelIDs,Constraints.direction.TOP)
	#V_SFDT.setConstraints(V_F.ModelIDs,Constraints.direction.BOTTOM)
	
	#Old Code
	#V_T = Constraints.new("V_T", [], V+V_F+V_FS+V_FSD, V+V_F+V_FS+V_FSD, V+V_F+V_FS+V_FSD, V+V_F+V_FS+V_FSD, S+G+V_F+V_FS+V_FSD, S+G+V_F+V_FS+V_FSD)
	#V_FT = Constraints.new("V_FT", [])
	#V_FST = Constraints.new("V_FST", [])
	#V_SFDT = Constraints.new("V_SFDT", [])
	#V_F = Constraints.new("V_F", [])
	#V_FS = Constraints.new("V_FS", [])
	#V_FSD = Constraints.new("V_FSD", [])
	#V_FTD = Constraints.new("V_FTD", [])
	#V_DD = Constraints.new("V_DD", [])
	#V_FTDSTDDD = Constraints.new("V_FTDSTDDD")
	#G = Constraints.new("G", [], S, S, S ,S, [], [])
	#S = Constraints.new("S", [], G, G, G ,G, [], [])
	#V = Constraints.new("V", [], [], [], [], [], [], [])
	#baseConstraints = [cG, cS]
	for constraint in baseConstraints:
		ResourceSaver.save(constraint, "res://Constraints/" + constraint.idName + ".tres")

func setModelIDs():
	# numbers correspond with item ids of the meshlibrary
	V_T.modelIDs = [0,10]
	V_FT.modelIDs = [1,11]
	V_FST.modelIDs = [2,12]
	V_SFDT.modelIDs = [3,13]
	V_F.modelIDs = [4]
	V_FS.modelIDs = [5]
	V_FSD.modelIDs = [6]
	V_FTD.modelIDs = [7,14]
	V_DD.modelIDs = [8,15]
	V_FTDSTDDD.modelIDs = [9,16]
	S.modelIDs = [0,1,2,3,7,8,9]
	G.modelIDs = [10,11,12,13,14,15,16]
	V.modelIDs = [17]
