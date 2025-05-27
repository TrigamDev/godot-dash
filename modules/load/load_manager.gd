class_name LoadManager extends Node

#signal loading_started()
#signal loading_progressed()
#signal loading_completed()

func _ready():
	start_loading()

func start_loading() -> void:
	# Icon packs
	var icon_pack_loader = IconPackLoader.new()
	var icon_packs = icon_pack_loader.load_packs()

	print( "\nLoaded icon packs: " + JSON.stringify( icon_packs ) )
