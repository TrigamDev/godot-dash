class_name IconPack extends Resource

var pack_format: int
var metadata: PackMetadata
var icons: Array[Icon]

# --------------------

func _init():
	self.metadata = PackMetadata.new()

func load_from_path( pack_dir: String, manifest_file: String ) -> int:
	var manifest_path = pack_dir.path_join( manifest_file )
	var manifest = FileAccess.open( manifest_path, FileAccess.READ )
	
	#var assumed_id = pack_dir
	#print( pack_dir.get_file() )
	
	if not manifest:
		push_error( "Icon pack is missing manifest!" )
		return ERR_FILE_NOT_FOUND
	
	var json_data = JSON.parse_string( manifest.get_as_text() )
	if not json_data:
		push_error( "Icon pack has an invalid manifest!" )
		return ERR_PARSE_ERROR
	
	if not "pack_format" in json_data:
		push_error( "Icon pack has no pack version!" )
		return ERR_PARSE_ERROR
	
	if not "metadata" in json_data:
		push_error( "Icon pack is missing metadata!" )
		return ERR_PARSE_ERROR
	
	var load_result = metadata.load_from_json( json_data.metadata )
	if load_result != OK:
		push_error( "Icon pack has a malformed manifest!" )
		return load_result
		
	print( "Loaded icon pack: " + self.metadata.id + "!" )
	return OK

func _to_string():
	return "<IconPack#" + self.metadata.id + ">"
