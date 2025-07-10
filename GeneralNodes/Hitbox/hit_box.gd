class_name HitBox extends Area2D

signal damaged( hurt_box : HurtBox )

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:

	pass

func TakeDamage( hurt_box : HurtBox ) -> void:
	damaged.emit( hurt_box )
	
