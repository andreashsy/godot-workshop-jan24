class_name NinjaFrog
extends CharacterBody2D

#@export var gravity: float = 300.0
var gravity = ProjectSettings.get("physics/2d/default_gravity")

func _ready() -> void:
    pass

func _physics_process(delta) -> void:
    if not is_on_floor():
        velocity.y  += gravity * delta
        
    velocity.y = min(velocity.y, gravity)
    move_and_slide()
