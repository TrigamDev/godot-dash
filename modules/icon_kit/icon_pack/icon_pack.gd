class_name IconPack extends Resource

var id: String
var metadata: Dictionary
var icons: Array[Icon]

func _init( data: Dictionary = {} ) -> void:
	id = data.get( "id", "" )
