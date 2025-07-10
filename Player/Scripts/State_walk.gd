class_name State_walk extends State

@export var move_speed : float = 100.0
@onready var idle : State = $"../idle"
@onready var attack : State = $"../attack"
# Called when the node enters the scene tree for the first time.

func init() -> void:

	pass
	
func _ready() -> void:
	pass # Replace with function body.

func Enter() -> void:
	player.UpdateAnimation("walk")
	pass
	
	
	
func Exit() -> void:
	pass
	
	
func Process(_delta : float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	
	player.velocity = player.direction * move_speed
	
	if player.SetDirection():
		player.UpdateAnimation("walk")
	
	return null
	
	
func Physics(_delta : float) -> State:
	return null
	
	
func HandleInput(_event: InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	return null
