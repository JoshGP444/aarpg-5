@tool 
class_name LevelTransition extends Area2D

enum SIDE {LEFT, RIGHT, TOP, BOTTOM}

@export_file("*.tscn") var level
@export var target_transition_area : String = "LevelTransition"

@export_category("Collision Area Settings")

func _ready() -> void:
	pass
