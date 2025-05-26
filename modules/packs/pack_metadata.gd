class_name PackMetadata extends Resource

var id: String
var name: String
var description: String
var version: String
var icon: String

var license: String

var links: PackLinks

var authors: Array[ PackAuthor ]

# --------------------

func load_from_json( json_data: Dictionary ) -> void:
	self.id = json_data.id
	self.name = json_data.name
	self.description = json_data.description
	self.version = json_data.version
	self.icon = json_data.icon
	
	self.license = json_data.license
	
	#self.links = json_data.links
	
	#self.authors = json_data.authors
