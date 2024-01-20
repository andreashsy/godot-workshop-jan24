class_name NinjaFrog
extends CharacterBody2D

@export var SPEED: float = 150.0
@export var JUMP: float = 250.0
var gravity = ProjectSettings.get("physics/2d/default_gravity")
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var audio_stream_player_2d = $AudioStreamPlayer2D


func _ready() -> void:
    pass

func _physics_process(delta) -> void:
    var dir
    var anim = "idle"
    dir = Input.get_axis("left", "right")
    velocity.x = SPEED * dir
    
    if not is_on_floor():
        velocity.y  += gravity * delta
        anim = "jump" if velocity.y < 0 else "fall"
    else: 
        if dir == 0: anim = "idle"
        else:
            anim = "run"
            animated_sprite_2d.flip_h = dir < 0
        if Input.is_action_just_pressed("jump"):
            velocity.y = -JUMP
            audio_stream_player_2d.play()
    
    velocity.y = min(velocity.y, gravity)
    move_and_slide()
    animated_sprite_2d.play(anim)
