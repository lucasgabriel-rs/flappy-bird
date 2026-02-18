extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

signal justDied

var didStartGame: bool = false
var isDead: bool = false

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	if get_slide_collision_count() != 0:
		die()
	
	# Add the gravity.
	if not is_on_floor() and didStartGame:
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and not isDead:
		velocity.y = JUMP_VELOCITY
		if not didStartGame:
			didStartGame = true
	
	move_and_slide()


func die() -> void:
	if not isDead:
		isDead = true
		anim.stop()
		emit_signal("justDied")
	
