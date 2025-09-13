class_name Plant extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HitBox.damaged.connect(TakeDamage) #<-- HIT! = tAKE Damage
	pass # Replace with function body.
	
func TakeDamage( _TakeDamage ) -> void: #DAMAGED = GONE
	queue_free() #MAKE BUSH GONE
	pass
	
