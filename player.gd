extends CharacterBody2D

class_name Player
@export var speed := 200
@export var jump_force := -400
@export var bones_label: Label
var gravity := 980
var bones = 0
var posicion_inicial: Vector2


func _physics_process(delta):
	var vel = velocity
	vel.x = 0
	
	if Input.is_action_pressed("ui_right"):
		vel.x += speed
	if Input.is_action_pressed("ui_left"):
		vel.x -= speed

	vel.y += gravity * delta

	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		vel.y = jump_force

	velocity = vel
	move_and_slide()

func _ready():
	posicion_inicial = position

func add_bone():
	bones += 1
	var label = get_node("/root/Level1/HUD/BonesLabel")
	bones_label.text = "Bones: " + str(bones)

func die():
	visible = false
	position = posicion_inicial
	visible = true
