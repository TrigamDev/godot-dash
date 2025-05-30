class_name Pack extends Resource

var pack_format: int
var metadata: PackMetadata

var pack_type := "Pack"

# --------------------

func load_metadata_from_path( pack_directory: String, manifest_file_name: String ) -> int:
	var manifest_path = pack_directory.path_join( manifest_file_name )
	var manifest_file = FileAccess.open( manifest_path, FileAccess.READ )
	
	if not manifest_file:
		push_error( "%s is missing manifest" % pack_type )
		return ERR_FILE_NOT_FOUND
	
	var manifest_data = JSON.parse_string( manifest_file.get_as_text() )
	if not manifest_data:
		push_error( "%s has an invalid manifest" % pack_type )
		return ERR_PARSE_ERROR
	
	# Check for required fields
	if not "pack_format" in manifest_data:
		push_error( "%s is missing `pack_format`" % pack_type )
		return ERR_PARSE_ERROR
	
	if not "metadata" in manifest_data:
		push_error( "%s is missing `metadata`" % pack_type )
		return ERR_PARSE_ERROR
	
	# Try loading metadata
	var new_metadata = PackMetadata.new()
	var load_result = new_metadata.load_from_json( manifest_data.metadata )
	
	if load_result != OK:
		push_error( "%s has a malformed manifest" % pack_type )
		return load_result
	
	self.metadata = new_metadata
	print_rich( "Loaded %s: [bgcolor=#00000050][code]%s[/code][/bgcolor]" % [ pack_type, new_metadata.id ] )
	return OK

func load_pack_from_path( _pack_directory: String, _manifest_file_name: String ) -> int:
	assert( false, "`load_pack_from_path()` must be overridden in the derived script" )
	return ERR_UNAUTHORIZED

func _to_string():
	return "<%s#%s>" % [ pack_type, self.metadata.id ]
