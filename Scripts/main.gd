extends Node

var didStartGame: bool = false
var floor_sprite: Sprite2D

@onready var tap_tap: TextureRect = $TapTap
@onready var game_over: TextureRect = $GameOver
@onready var floor: StaticBody2D = $Floor



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	floor_sprite = floor.get_node("%FloorSprite")
	floor_sprite.material.set_shader_parameter("speed", 0.28)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_touch_screen_button_pressed() -> void:
	startGame()


func startGame() -> void:
	if not didStartGame:
		tap_tap.visible = false
		didStartGame = true


func gameover() -> void:
	game_over.visible = true
	floor_sprite.material.set_shader_parameter("speed", 0.0)



func _on_bird_just_died() -> void:
	gameover()
