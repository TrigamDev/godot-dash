class_name IconPackLoader extends Resource

const BUILT_IN_PACKS := "res://data/icon_packs/"
const CUSTOM_PACKS := "user://data/icon_packs/"
const MANIFEST_FILE := "pack.json"

var loaded_packs := {}

func load_packs() -> Dictionary:
	print( "Loading icon packs..." )
	
	# Load built-in icon packs
	var built_in_packs = scan_directory( BUILT_IN_PACKS )
	loaded_packs.merge( built_in_packs )
	
	# Load custom icon packs
	var custom_packs = scan_directory( CUSTOM_PACKS )
	loaded_packs.merge( custom_packs )
	
	return loaded_packs

func scan_directory( icon_pack_dir: String ) -> Dictionary:
	var found_packs := {}
	var dir = DirAccess.open( icon_pack_dir )
	if not dir:
		print( "\nCouldn't access " + icon_pack_dir )
		
	else:
		dir.list_dir_begin()
		
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print( "\nFound directory! " + file_name )
				var loaded_pack = load_pack( icon_pack_dir.path_join( file_name ) )
				if loaded_pack: found_packs[ loaded_pack.metadata.id ] = loaded_pack
			
			file_name = dir.get_next()
		
		dir.list_dir_end()
	
	return found_packs

func load_pack ( pack_dir: String ) -> IconPack:
	var icon_pack = IconPack.new()
	icon_pack.load_from_path( pack_dir )
	
	return icon_pack
