class_name PackLoader extends Resource

@export var built_in_pack_directory := "data/pack"
@export var custom_pack_directory := "data/pack"
@export var manifest_file := "pack.json"

var loaded_packs := {}

# --------------------

func load_packs() -> Dictionary:
	
	# Scan for built-in packs
	var built_in_packs = scan_for_packs( built_in_pack_directory, false )
	loaded_packs.merge( built_in_packs )
	
	# Scan for custom packs
	var custom_packs = scan_for_packs( custom_pack_directory, true )
	loaded_packs.merge( custom_packs )
	
	return loaded_packs

func scan_for_packs( pack_directory: String, is_custom: bool ) -> Dictionary:
	
	var found_packs := {}
	
	var data_directory := "res://" if !is_custom else "user://"
	pack_directory = data_directory.path_join( pack_directory )
	
	var search_directory = DirAccess.open( pack_directory )
	
	# If the directory doesn't actually exist
	if not search_directory:
		DirAccess.open( "user://" ).make_dir_recursive( pack_directory )
		push_warning( "Couldn't access %s, created directory" % pack_directory )
		return {}
	
	# Loop through the directory, searching for
	# any pack directories
	search_directory.list_dir_begin()
	var file_name = search_directory.get_next()
	
	while file_name != "":
		if search_directory.current_is_dir():
			var loaded_pack = load_pack( pack_directory.path_join( file_name ) )
			if loaded_pack: found_packs[ loaded_pack.metadata.id ] = loaded_pack
		
		file_name = search_directory.get_next()
		
	search_directory.list_dir_end()
	
	return found_packs

func load_pack( _pack_directory: String ):
	assert( false, "`load_pack()` must be overridden in the derived script" )
	return {}
