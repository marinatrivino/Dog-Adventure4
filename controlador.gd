extends Node2D

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass

func reiniciar_nivel_actual():
	var escena_actual = get_tree().current_scene
	var ruta = escena_actual.filename
	get_tree().change_scene(ruta)
	
