class_name IconPackLoader extends PackLoader

# --------------------

func load_pack ( pack_directory: String ) -> IconPack:
	var icon_pack = IconPack.new()
	var load_result = icon_pack.load_pack_from_path( pack_directory, manifest_file )
	
	if load_result != OK:
		push_error( "Failed to load Icon Pack at %s" % pack_directory )
		return null
	
	return icon_pack
