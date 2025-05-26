class_name IconPackLoader extends Node

const BUILT_IN_PACKS := "res://data/icon_packs/"
const CUSTOM_PACKS := "user://data/icon_packs/"
const MANIFEST_FILE := "pack.json"

func load_packs() -> Dictionary:
	var loaded_packs := {}
	
	# Load built-in icon packs
	
	# Load custom icon packs
	
	return loaded_packs

func scan_directory( icon_pack_dir: String ) -> Dictionary:
	var found_packs := {}
	var dir = DirAccess.open( icon_pack_dir )
	
	return found_packs
