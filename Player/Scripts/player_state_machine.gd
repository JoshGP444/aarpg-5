class_name PlayerStateMachine extends Node

var states : Array[ State ]
var prev_states : State
var current_states : State
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ChangeState(current_states.Process( delta ))
	pass

func _physics_process(delta: float) -> void:
	ChangeState(current_states.Physics( delta ))
	pass



func _unhandled_input(event):
	ChangeState(current_states.HandleInput(event))
	pass



func Initialize(_player : Player) -> void:
	states = []
	
	for c in get_children():
		if c is State:
			states.append(c)
			
	if states.size() == 0:
		return
	states[0].player = _player
	states[0].state_machine = self
		
	for state in states:
		state.init()
		
	ChangeState(states[0])
	process_mode = Node.PROCESS_MODE_INHERIT
		



func ChangeState( new_states : State ) -> void:
	if new_states == null || new_states == current_states:
		return
	
	if current_states:
		current_states.Exit()
	
	prev_states = current_states
	current_states = new_states
	current_states.Enter()
	
