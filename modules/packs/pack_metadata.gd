class_name PackMetadata extends Resource

var id: String
var name: String
var description: String = ""
var version: String = "1.0.0"
var icon: String = ""

var license: String = ""

var links: PackLinks

var authors: Array[ PackAuthor ]

# --------------------

func load_from_json( json_data: Dictionary ) -> int:
	
	# ID
	if not "id" in json_data:
		push_error( "Icon pack is missing an ID!" )
		return ERR_PARSE_ERROR
	else: self.id = json_data.id
	
	# Name
	if not "name" in json_data: self.name = self.id
	else: self.name = json_data.name
	
	# Everything else
	if "description" in json_data: self.description = json_data.description
	if "version" in json_data: self.version = json_data.version
	if "icon" in json_data: self.icon = json_data.icon
	
	if "license" in json_data: self.license = json_data.license
	
	#self.links = json_data.links
	
	#self.authors = json_data.authors
	
	return OK
