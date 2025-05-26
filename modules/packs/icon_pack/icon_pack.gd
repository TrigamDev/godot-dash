class_name IconPack extends Resource

var pack_format: int
var metadata: PackMetadata
var icons: Array[Icon]

# --------------------

func _init():
	self.metadata = PackMetadata.new()

func load_from_path( pack_dir: String ) -> IconPack:
	var manifest_path = pack_dir.path_join( IconPackLoader.MANIFEST_FILE )
	var manifest = FileAccess.open( manifest_path, FileAccess.READ )
	
	if not manifest:
		print( "Icon pack is missing manifest!" )
		return null
	else:
		var json_data = JSON.parse_string( manifest.get_as_text() )
		self.metadata.load_from_json( json_data.metadata )
	
	print( "Loaded icon pack: " + self.metadata.id + "!" )
	return self

func _to_string():
	return "<IconPack#" + self.metadata.id + ">"
