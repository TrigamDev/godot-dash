class_name LoadManager extends Node

#signal loading_started()
#signal loading_progressed()
#signal loading_completed()

@export var icon_pack_loader: IconPackLoader

func _ready():
	start_loading()

func start_loading() -> void:
	if not icon_pack_loader:
		push_error( "Missing icon pack loader!" )
		return
	
	# Icon packs
	var icon_packs = icon_pack_loader.load_packs()

	print( "\nLoaded icon packs: " + JSON.stringify( icon_packs ) )
