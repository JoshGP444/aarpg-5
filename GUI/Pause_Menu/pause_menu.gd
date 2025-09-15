extends CanvasLayer

signal shown
signal hidden

@onready var audio_stream_player: AudioStreamPlayer = $Control/AudioStreamPlayer
@onready var button_save: Button = $Control/VBoxContainer/Button_Save
@onready var button_load: Button = $Control/VBoxContainer/Button_Load
@onready var description_item: Label = $Control/Description_item

var is_paused : bool = false


func _ready() -> void:
	hide_paused_menu()
	button_save.pressed.connect(_on_save_pressed)
	button_load.pressed.connect(_on_load_pressed)
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if is_paused == false:
			show_paused_menu()
		else:
			hide_paused_menu()
		get_viewport().set_input_as_handled()
		
func show_paused_menu() -> void:
	get_tree().paused = true
	visible = true
	is_paused = true
	shown.emit()
	
func hide_paused_menu() -> void:
	get_tree().paused = false
	visible = false
	is_paused = false
	hidden.emit()
	
func _on_save_pressed() -> void:
	if is_paused == false:
		return
	SaveManager.save_game()
	hide_paused_menu()
	pass
func _on_load_pressed() -> void:
	if is_paused == false:
		return
	hide_paused_menu()
	await get_tree().process_frame
	SaveManager.load_game()
	await LevelManager.level_load_started
	pass

func update_item_description(new_text : String) -> void:
	description_item.text = new_text

func play_audio(audio : AudioStream) -> void:
	audio_stream_player.stream = audio
	audio_stream_player.play()
	pass
