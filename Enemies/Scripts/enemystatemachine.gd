class_name EnemyStateMachine extends Node

var states : Array[EnemyState]
var prev_states : EnemyState
var current_states : EnemyState

func _ready():
	process_mode = Node.PROCESS_MODE_DISABLED
	pass
	
func _process(delta):
	change_state(current_states.process(delta))
	pass
	
func _physics_process(delta):
	change_state(current_states.physics(delta))
	pass
	
func initialize(_enemy : Enemy) -> void:
	states = []
	
	for c in get_children():
		if c is EnemyState:
			states.append(c)
	
	for s in states:
		s.enemy = _enemy
		s.state_machine = self
		s.init()
		
	if states.size() > 0:
		change_state(states[0])
		process_mode = Node.PROCESS_MODE_INHERIT
	
func change_state(new_state : EnemyState) -> void:
	if new_state == null || new_state == current_states:
		return
	if current_states:
		current_states.exit()
		
	prev_states = current_states
	current_states = new_state
	current_states.enter()
	
