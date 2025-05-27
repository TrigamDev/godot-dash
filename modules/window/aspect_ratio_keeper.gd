class_name AspectRatioKeeper extends Node

#
# Revisit this later
#

#var window_size: Vector2i

#func _ready():
#	window_size = DisplayServer.window_get_size()

#func _process(delta):
	# Check if the window has changed size
#	var new_window_size = DisplayServer.window_get_size()
#	if new_window_size != window_size:
#		resize_window( new_window_size )

#func resize_window( new_size: Vector2i ):
#	if new_size.x != window_size.x:
#		new_size.y = new_size.x * ( 9.0 / 16.0 )
#	else:
#		new_size.x = new_size.y * ( 16.0 / 9.0 )
	
	# Set new window size
#	window_size = new_size
#	DisplayServer.window_set_size( new_size )
