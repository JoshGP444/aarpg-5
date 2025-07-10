class_name State_idle extends State

@onready var walk : State = $"../walk"
@onready var attack : State = $"../attack"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func init() -> void:
	pass
	
func Enter() -> void:
	player.UpdateAnimation("idle")
	pass
	
	
	
func Exit() -> void:
	pass
	
	
func Process(_delta : float) -> State:
	if player.direction != Vector2.ZERO:
		return walk
	player.velocity = Vector2.ZERO
	return null
	
	
func Physics(_delta : float) -> State:
	return null
	
	
func HandleInput(_event: InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	return null
