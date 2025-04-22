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
	#for item in itemList:
	#	print(meshLibrary.get_item_name(itemList[item]+" = "+item))
	
	#V_T
	V_T.setConstraints(V_T.modelIDs,Constraints.Direction.FRONT)
	V_T.setConstraints(V_T.modelIDs,Constraints.Direction.BACK)
	V_T.setConstraints(V_T.modelIDs,Constraints.Direction.LEFT)
	V_T.setConstraints(V_T.modelIDs,Constraints.Direction.RIGHT)
	V_T.setConstraints(V.modelIDs,Constraints.Direction.TOP)
	V_T.setConstraints(V.modelIDs,Constraints.Direction.BOTTOM)
	
	#V_FT
	V_FT.setConstraints(V.modelIDs,Constraints.Direction.FRONT)
	V_FT.setConstraints(V_T.modelIDs,Constraints.Direction.BACK)
	V_FT.setConstraints(V_FT.modelIDs,Constraints.Direction.LEFT)
	V_FT.setConstraints(V_FT.modelIDs,Constraints.Direction.RIGHT)
	V_FT.setConstraints(V.modelIDs,Constraints.Direction.TOP)
	V_FT.setConstraints(V_F.modelIDs,Constraints.Direction.BOTTOM)
	
	#V_FST
	V_FST.setConstraints(V.modelIDs,Constraints.Direction.FRONT)
	V_FST.setConstraints(V_T.modelIDs,Constraints.Direction.BACK)
	V_FST.setConstraints(V_FT.modelIDs,Constraints.Direction.LEFT)
	V_FST.setConstraints(V.modelIDs,Constraints.Direction.RIGHT)
	V_FST.setConstraints(V.modelIDs,Constraints.Direction.TOP)
	V_FST.setConstraints(V_FS.modelIDs,Constraints.Direction.BOTTOM)
	
	#V_SFDT
	V_SFDT.setConstraints(V.modelIDs,Constraints.Direction.FRONT)
	V_SFDT.setConstraints(V_T.modelIDs,Constraints.Direction.BACK)
	V_SFDT.setConstraints(V_FT.modelIDs,Constraints.Direction.LEFT)
	V_SFDT.setConstraints(V_FT.modelIDs,Constraints.Direction.RIGHT)
	V_SFDT.setConstraints(V.modelIDs,Constraints.Direction.TOP)
	V_SFDT.setConstraints(V_F.modelIDs,Constraints.Direction.BOTTOM)
	
	#V_F
	#V_F.setConstraints(V.modelIDs,Constraints.Direction.FRONT)
	#V_F.setConstraints(V_T.modelIDs,Constraints.Direction.BACK)
	#V_F.setConstraints(V_FT.modelIDs,Constraints.Direction.LEFT)
	#V_F.setConstraints(V_FT.modelIDs,Constraints.Direction.RIGHT)
	#V_F.setConstraints(V.modelIDs,Constraints.Direction.TOP)
	#V_F.setConstraints(V_F.modelIDs,Constraints.Direction.BOTTOM)
	
	#V_FS
	#V_SFDT.setConstraints(V.modelIDs,Constraints.Direction.FRONT)
	#V_SFDT.setConstraints(V_T.modelIDs,Constraints.Direction.BACK)
	#V_SFDT.setConstraints(V_FT.modelIDs,Constraints.Direction.LEFT)
	#V_SFDT.setConstraints(V_FT.modelIDs,Constraints.Direction.RIGHT)
	#V_SFDT.setConstraints(V.modelIDs,Constraints.Direction.TOP)
	#V_SFDT.setConstraints(V_F.modelIDs,Constraints.Direction.BOTTOM)
	
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
	V_T.setModelIDs([0,10])
	V_FT.setModelIDs([1,11])
	V_FST.setModelIDs([2,12])
	V_SFDT.setModelIDs([3,13])
	V_F.setModelIDs([4])
	V_FS.setModelIDs([5])
	V_FSD.setModelIDs([6])
	V_FTD.setModelIDs([7,14])
	V_DD.setModelIDs([8,15])
	V_FTDSTDDD.setModelIDs([9,16])
	S.setModelIDs([0,1,2,3,7,8,9])
	G.setModelIDs([10,11,12,13,14,15,16])
	V.setModelIDs([17])
