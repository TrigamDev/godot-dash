class_name IconPack extends Pack

var icons: Array[Icon]

# --------------------

func _init():
	pack_type = "Icon Pack"

func load_pack_from_path( pack_directory: String, manifest_file_name: String ) -> int:
	var metadata_load_result = load_metadata_from_path( pack_directory, manifest_file_name )
	return metadata_load_result
