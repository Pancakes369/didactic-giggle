extends Node3D

var constraints = preload("res://Scripts/3dConstraints.gd")

enum sandModels {V_T_S, V_FT_S, V_FST_S, V_SFDT_S, V_FTD_S, V_DD_S, V_FTDSTDDD_S}
enum rockModels {V_F,V_FS,V_FSD}
enum grassModels {V_T_G, V_FT_G, V_FST_G, V_SFDT_G, V_FTD_G, V_DD_G, V_FTDSTDDD_G}
enum airModel {V}
enum SideConstraints {rockModels, airModel}

func _ready():
	
	var V_T_SConstraints = constraints.new([SideConstraints,grassModels],[SideConstraints,grassModels],[SideConstraints,grassModels],[SideConstraints,grassModels],[!airModel],[!airModel],[])
